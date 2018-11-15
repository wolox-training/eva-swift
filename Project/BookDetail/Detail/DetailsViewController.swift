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

class DetailsViewController: UIViewController {
    private var _view: DetailsView = DetailsView.loadFromNib()!
    private var _viewModel : BookViewModel
    
    init(_ viewModel : BookViewModel) {
        _viewModel = viewModel
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
