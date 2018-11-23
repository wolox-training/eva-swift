//
//  DetailsViewController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore
import ReactiveSwift
import ReactiveCocoa
class DetailsViewController: UIViewController {
    private var _view: DetailsView = DetailsView.loadFromNib()!
    private var _viewModel : BookViewModel
    private var _detailsViewModel : DetailsViewModel
    
    init(_ viewModel : BookViewModel) {
        _viewModel = viewModel
        _detailsViewModel = DetailsViewModel()
        super.init(nibName:nil, bundle:nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //subscribe to a ui component with async action
        _view.rent.reactive.pressed = CocoaAction(_detailsViewModel.action)
        _detailsViewModel.action.values.observeValues { value  in
            
        }
        
        //subscribe to a button event
        _view.rent.reactive.controlEvents(.touchUpInside).observeValues { [unowned self] _ in
            //self.navigationController?.popViewController(animated: true)
        }
        
        _view.title.text = _viewModel.title
        _view.author.text = _viewModel.author
        _view.portrait.image = _viewModel.imageLoad
        _view.genre.text = _viewModel.genre
        _view.year.text = _viewModel.year
        if (_viewModel.status == Book.available){
            setupAvailableBook()
        } else {
            setupUnavailableBook()
        }
    }
    
    func setupAvailableBook(){
        _view.avaleible.text = _viewModel.status
        _view.avaleible.textColor = UIColor.green
        _view.rent.enable()
        _view.rent.layer.cornerRadius = 15
    }
    
    func setupUnavailableBook() {
        _view.avaleible.text = _viewModel.status
        _view.avaleible.textColor = UIColor.red
    }
}
