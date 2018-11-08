//
//  BookDetailsViewController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 6/11/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core
class BookDetailsViewController: UIViewController {
    private var _viewModelbook: BookViewModel
    private let _detailsViewController: DetailsViewController
    private let _commentsViewController: CommentViewController

    
    private let _view : BookDetailsView = BookDetailsView.loadFromNib()!
    
    init(_ viewModel : BookViewModel) {
        self._viewModelbook = viewModel
        self._detailsViewController = DetailsViewController(viewModel)
        self._commentsViewController = CommentViewController()
        super.init(nibName:nil, bundle:nil)
        let headerImage = UIImageView(image: UIImage(named: "bc_nav bar"))
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerImage)
        title = _viewModelbook.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        load(childViewController: _detailsViewController,
             into: _view.containerDetails)
        
        load(childViewController: _commentsViewController,
             into: _view.containerComments)
    }
    override func loadView() {
        view = _view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
