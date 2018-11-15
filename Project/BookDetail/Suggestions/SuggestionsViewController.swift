//
//  SuggestionsViewController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import WolmoCore

class SuggestionsViewController : UIViewController{
    private let _view:SuggestionsCollectionView = SuggestionsCollectionView.loadFromNib()!
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
    }
    override func viewDidLoad() {
        _view.backgroundColor = .backgroundColor
        _view.suggestionsCollection.backgroundColor = .backgroundColor
    }
}
