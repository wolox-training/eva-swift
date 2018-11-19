//
//  AddBookController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

final class AddBookController: UIViewController {

  private let _viewModel: AddBookViewModel
  private let _view: AddBookView = AddBookView.loadFromNib()!

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
    
  }

}

// MARK: - VM binding
private extension AddBookController {

  private func bindViewModel() {
  }

}
