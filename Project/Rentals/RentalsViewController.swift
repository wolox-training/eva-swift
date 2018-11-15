//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class RentalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    private let _suggestionsController :SuggestionsViewController
    private let _viewModel : LibraryViewModel = LibraryViewModel()

    private let _view: RentalsView = RentalsView.loadFromNib()!
    init() {
        self._suggestionsController =
            SuggestionsViewController()
        super.init(nibName:nil, bundle:nil)
        //tabbar name and style setup
        tabBarItem = UITabBarItem(title: "Rentals", image: UIImage(named: "ic_myrentals.png"), selectedImage: UIImage(named: "ic_myrentals.png"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rentals"
        load(childViewController: _suggestionsController,
             into: _view.suggestionsContainer)
        view.backgroundColor = .backgroundColor
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(cell: BooksCellView.self)
        _view.booksTable.separatorStyle = .none
        //loading the books from the source
        _viewModel.books.producer.startWithValues { [unowned self] _ in
            self._view.booksTable.reloadData()
        }
        _viewModel.loadBooks()
    }
    
    override func loadView() {
        view = _view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeue(cell: BooksCellView.self, for: indexPath)!
        let book = _viewModel.getBookByIndex(index: indexPath.row)
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        if(!book.isLoad){// prevent re fetching the book image
            book.fetchImage(URL(string:book.image)!).producer.startWithResult { (result) in
                switch result {
                case let .success(img):
                    DispatchQueue.main.async { //to execute on main thread
                        cell.portraitImg.image = img
                        book.isLoad = true
                        book.imageLoad = img
                    }
                case let .failure(error):
                    print("Error Finding Image",error)
                }
            }
        }else{
            cell.portraitImg.image = book.imageLoad
        }
        
        cell.backgroundColor = .backgroundColor
        return cell
    }
    
}
