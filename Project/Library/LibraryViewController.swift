//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let _viewModel : LibraryViewModel = LibraryViewModel()
    private let _view: BooksTableView = BooksTableView.loadFromNib()!
    
    init() {
        super.init(nibName:nil, bundle:nil)
        tabBarItem =  UITabBarItem(title: "Library", image: UIImage(named:"ic_library.png"), selectedImage: UIImage(named: "ic_library"))
        //loading the books from the source
        view.backgroundColor = .backgroundColor

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Library"
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(cell: BooksCellView.self)
        _view.booksTable.separatorStyle = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        view = _view
        
    }
    
    
    // table delegate functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return _viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeue(cell: BooksCellView.self, for: indexPath)!
        //indexpat.row
        let book = _viewModel.getBookByIndex(index: indexPath.row)
        cell.titleLabel.text = book.title
        cell.authorLabel.text = "Author"
        //cell.portraitImg.image = UIImage(named: book.img)
        cell.backgroundColor = .backgroundColor
        return cell
    }
   
    
}
