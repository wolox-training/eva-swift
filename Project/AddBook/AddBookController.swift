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
import Result


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
    }
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        title = "AddBook"
        
        //send post petition to send suggestion
        _view.submitButton.reactive.controlEvents(.touchUpInside).observeValues { [unowned self] _ in
            self.sendSuggestion()
        }
        
        //tap for uploading image
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(AddBookController.getImage))
        _view.bookImage.isUserInteractionEnabled = true
        _view.bookImage.addGestureRecognizer(singleTap)
    }
    
    //Action
    @objc public  func getImage() {
        _imagePicker.presentImagePickerController(from: [.photoLibrary,.camera], for: [.image]) {
            
        }
        _imagePicker.mediaSignal.take(during: self.reactive.lifetime).observeResult { [unowned self] (result) in
            switch result {
            case let .success(imageMedia):
                switch imageMedia {
                case .image(let image):
                    self._view.bookImage.image = image
                default:
                    print("error no image")
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func validateBookSuggestion() -> Bool {
        if(_viewModel.title.value == "" || _viewModel.author.value == ""){
            return false
        }
        return true 
    }
    
    func sendSuggestion(){
        if(validateBookSuggestion()){
            _viewModel.postSuggestion()
            notifySuccess()
            _view.clearTextfields()
            return
        }
        notifyValidations()
        
    }
    
    func notifySuccess(){
        
        let alert = UIAlertController(title: "Alert", message: "The post suggestion was sended succesfully",
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return
        
    }
    
    func notifyValidations() {
        let alert = UIAlertController(title: "Error", message: "Title and author are mandatory",
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return
        
    }
}

// MARK: - VM binding
private extension AddBookController {
    
    private func bindViewModel() {
        _viewModel.title <~ _view.bookNameTextField.reactive.continuousTextValues.skipNil()
        _viewModel.author <~ _view.authorTextField.reactive.continuousTextValues.skipNil()
        _viewModel.topic <~ _view.topicTextField.reactive.continuousTextValues.skipNil()
        _viewModel.year <~ _view.yearTextField.reactive.continuousTextValues.skipNil()
        _viewModel.description <~ _view.descriptionTextField.reactive.continuousTextValues.skipNil()
    }
    
}
