//
//  AddBookController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import MobileCoreServices
import WolmoCore

final class AddBookController: UIViewController {
    
    private let _viewModel: AddBookViewModel
    private let _view: AddBookView = AddBookView.loadFromNib()!
    private lazy var _imagePicker : MediaPickerService = MediaPickerService(viewController: self)
    
    @available(*, unavailable, message: "use init(viewModel:) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable, message: "use init(viewModel:) instead")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    init(viewModel: AddBookViewModel) {
        _viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
        self.tabBarItem = UITabBarItem(title: "Add Book", image: UIImage(named: "ic_add new.png"), selectedImage: UIImage(named: "ic_add new.png"))
        //subscribe to a button event
    }
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        title = "AddBook"
        
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(AddBookController.getImage))
        _view.bookImage.isUserInteractionEnabled = true
        _view.bookImage.addGestureRecognizer(singleTap)
        //singleTap.reactive
        
    }
    //Action
    @objc public  func getImage() {
        _imagePicker.presentImagePickerController(from: .photoLibrary, for: [.image]) {
            
        }
        _imagePicker.mediaSignal.take(during: self.reactive.lifetime).observeResult { [weak self] (result) in
            switch result {
            case let .success(imageMedia):
                switch imageMedia {
                case .image(let image):
                    self?._view.bookImage.image = image
                default:
                    print("error no image")
                }
            case let .failure(error):
                //error case
                print(error)
            }
        }
    }
}


// MARK: - VM binding
private extension AddBookController {
    
    private func bindViewModel() {
    }
    
}
