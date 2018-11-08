//
//  DetailsViewController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core
class DetailsViewController: UIViewController {
    private var _view: DetailsView = DetailsView.loadFromNib()!
    private var _viewModel : BookViewModel
    init(_ viewModel : BookViewModel) {
        _viewModel = viewModel
        super.init(nibName:nil, bundle:nil)
    }
    
    override func loadView() {
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _view.title.text = _viewModel.title
        _view.author.text = _viewModel.author
        _view.genre.text = _viewModel.genre
        _view.year.text = _viewModel.year


        //view.backgroundColor = .backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
