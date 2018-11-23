//
//  ImagePickerService.swift
//  Utils
//
//  Created by Nahuel Gladstein on 6/13/17.
//  Copyright © 2017 Wolox. All rights reserved.
//
import ReactiveSwift
import UIKit
import MobileCoreServices

public enum MediaPickerServiceError: Error {
    
    case sourceTypeNotAvailable
    
}

/**
 Enum to represent all media types an UIImagePickerController can get.
 For full details, please visit: https://developer.apple.com/documentation/mobilecoreservices/uttype
 */
public enum MediaPickerMediaType {
    case image
    case video
    case other(CFString)
}

/**
 Enum to represent all possible medias an UIImagePickerController can get.
 Some types are particularly identified, for others you can use its dictionary to get information.
 For more information refer to `func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])`.
 */
public enum MediaPickerMedia {
    case image(UIImage)
    case video(URL)
    case other([String : Any])
}

/**
 Service that provides a way to get media.
 */
public protocol MediaPickerServiceType {
    /**
     Observe imageSignal to get the ImagePickerMedia selected by the user
     */
    var mediaSignal: Signal<MediaPickerMedia, MediaPickerServiceError> { get }
    
    /**
     Presents the picker to the user so it can take or select a picture or other media.
     If the user didn't give permission to the app to use the source type selected a prompt asking it will be shown.
     - parameter source: Source type for the picker to show. Can be .camera or .photoLibrary.
     - parameter media: Media types that should be shown in the picker for the user to choose from.
     - parameter onPermissionNotGranted: Block called if the user denies permission. If the user gives permission the camera will be shown.
     */
    func presentImagePickerController(from source: UIImagePickerControllerSourceType,
                                      for media: [MediaPickerMediaType],
                                      _ onPermissionNotGranted: @escaping () -> Void)
    
    func presentImagePickerController(from source: [UIImagePickerControllerSourceType],
                                      for media: [MediaPickerMediaType],
                                      _ onPermissionNotGranted: @escaping () -> Void)
    
    /**
     Tells if the device has a camera.
     */
    var cameraIsAvailable: Bool { get }
}

@objc
public final class MediaPickerService: NSObject, MediaPickerServiceType {
    
    public let mediaSignal: Signal<MediaPickerMedia, MediaPickerServiceError>
    private let _mediaObserver: Signal<MediaPickerMedia, MediaPickerServiceError>.Observer
    private weak var _viewController: UIViewController?
    private let _allowsEditing: Bool
    
    /**
     Initializes a MediaPickerService ready to use.
     - parameter viewController: UIViewController where to present the UIImagePickerViewController
     - parameter allowsEditing: Indicates whether the UIImagePickerViewController allows editing like cropping and zooming.
     */
    public init(viewController: UIViewController, allowsEditing: Bool = false) {
        _viewController = viewController
        _allowsEditing = allowsEditing
        (mediaSignal, _mediaObserver) = Signal<MediaPickerMedia, MediaPickerServiceError>.pipe()
    }
    
    public func presentImagePickerController(from source: UIImagePickerControllerSourceType,
                                             for media: [MediaPickerMediaType],
                                             _ onPermissionNotGranted: @escaping () -> Void) {
        source.isPermitted().startWithResult { [unowned self] in
            switch $0 {
            case .success(let permitted):
                if permitted {
                    self.presentImagePickerController(source: source, media: media) }
                else { onPermissionNotGranted() }
            case .failure(let error):
                self._mediaObserver.send(error: error)
            }
        }
    }
    
    public func presentImagePickerController(from source: [UIImagePickerControllerSourceType],
                                             for media: [MediaPickerMediaType],
                                             _ onPermissionNotGranted: @escaping () -> Void) {
        guard source.count > 1 else {
            presentImagePickerController(from: source[0], for: media, onPermissionNotGranted)
            return
        }
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for option in source {
            let button = UIAlertAction(title: option.menuTitle, style: .default, handler: { [unowned self] (action) -> Void in
                option.isPermitted().startWithResult { [unowned self] in
                    switch $0 {
                    case .success(let permitted):
                        if permitted { self.presentImagePickerController(source: option, media: media) }
                        else { onPermissionNotGranted() }
                    case .failure(let error): self._mediaObserver.send(error: error)
                    }
                }
                
            })
            actionSheet.addAction(button)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelButton)
        
        _viewController?.present(actionSheet, animated: true, completion: nil)
    }
    
    public var cameraIsAvailable: Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    deinit {
        _mediaObserver.sendCompleted()
    }
}

extension MediaPickerService: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        _viewController?.dismiss(animated: true) { [unowned self] in
            let type = info[UIImagePickerControllerMediaType] as! CFString //swiftlint:disable:this force_cast
            
            if UTTypeConformsTo(type, MediaPickerMediaType.image.mediaTypeString) {
                self._mediaObserver.send(value: .image(self.getImage(from: info)!))
            } else if UTTypeConformsTo(type, MediaPickerMediaType.video.mediaTypeString) {
                self._mediaObserver.send(value: .video(info[UIImagePickerControllerMediaURL] as! URL)) //swiftlint:disable:this force_cast
            } else {
                self._mediaObserver.send(value: .other(info))
            }
        }
    }
    
    private func getImage(from info: [String : Any]) -> UIImage? {
        if let image = (info[UIImagePickerControllerEditedImage] as? UIImage) {
            return image
        }
        return info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        _viewController?.dismiss(animated: true, completion: .none)
    }
    
}

fileprivate extension MediaPickerService {
    
    fileprivate func presentImagePickerController(source sourceType: UIImagePickerControllerSourceType, media mediaTypes: [MediaPickerMediaType]) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = _allowsEditing
        imagePickerController.sourceType = sourceType
        imagePickerController.mediaTypes = mediaTypes.map { ($0.mediaTypeString as NSString) as String }
        
        _viewController?.present(imagePickerController, animated: true, completion: .none)
    }
    
}

fileprivate extension MediaPickerMediaType {
    
    fileprivate var mediaTypeString: CFString {
        switch self {
        case .image: return kUTTypeImage
        case .video: return kUTTypeMovie
        case .other(let typeString): return typeString
        }
    }
    
}
