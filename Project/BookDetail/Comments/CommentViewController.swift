//
//  CommentListViewController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class CommentViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    private var _view: CommentListView = CommentListView.loadFromNib()!
    private let _viewModel: CommentListViewModel = CommentListViewModel()
    private var bookId :Int
    init(bookId: Int) {
        self.bookId = bookId
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
        
        _view.commentTable.delegate = self
        _view.commentTable.rowHeight = 120
        _view.commentTable.dataSource = self
        _view.commentTable.register(cell: CommentView.self)
        _view.commentTable.separatorStyle = .none

        _viewModel.loadComments(bookId: bookId)
        _viewModel.comments.producer.startWithValues { [unowned self] _ in
            self._view.commentTable.reloadData()
        }
    }
    //table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(_viewModel.getCount())
        return _viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeue(cell: CommentView.self, for: indexPath)!
        let comment = _viewModel.getByIndex(index: indexPath.row)
        print(comment.content)
        cell.commentLabel.text = comment.content
        cell.nameLabel.text = comment.user.firstName
        if(!comment.isLoad){// prevent re fetching the book image
            comment.fetchImage(URL(string:comment.user.imageUrl)!).producer.startWithResult { (result) in
                switch result {
                case let .success(img):
                    DispatchQueue.main.async { //to execute on main thread
                        cell.avatar.image = img
                        comment.isLoad = true
                        comment.imageLoad = img
                    }
                case let .failure(error):
                    print("Error Finding Image",error)
                }
            }
        }else{
            cell.avatar.image = comment.imageLoad
        }
        return cell
    }
}
