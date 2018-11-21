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
    private let _viewModel : RentalsViewModel
    private let user : User
    private let _view: RentalsView = RentalsView.loadFromNib()!
    private let bookId: Int =  1// default recommendations
    
    init(user:User) {
        self.user = user
        _viewModel = RentalsViewModel(user: user)
        _suggestionsController =
            SuggestionsViewController(viewModel :_viewModel)
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
        _viewModel.rentals.producer.startWithValues { [unowned self] _ in
            self._view.booksTable.reloadData()
        }
        _viewModel.loadRents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _view.booksTable.reloadData()
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
        let cell = tableView.dequeue(cell: BooksCellView.self, for: indexPath)!
        let book = BookViewModel(book: _viewModel.getByIndex(index: indexPath.row).book)
        print(book.title)
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.portraitImg.load(url: book.image, fetcher: book)
        cell.backgroundColor = .backgroundColor
        return cell
    }
    
}
