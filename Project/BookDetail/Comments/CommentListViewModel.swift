//
//  CommentListViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/13/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import WolmoCore

import ReactiveSwift
import Result
class CommentListViewModel  {
    private let _comments = MutableProperty<[CommentViewModel]>([])
    private var currentPage : Int  = 1

    public let comments:Property<[CommentViewModel]>
    public let booksRepository : BooksRepository
    
    init(booksRepository : BooksRepository = NetworkingBootstrapper.shared.createBooksRepository() ) {
        comments = Property(_comments)
        self.booksRepository = booksRepository
    }
    
    public func loadComments(bookId: Int){
        booksRepository.fetchBookComments(bookId: bookId)
            .map { $0.map {CommentViewModel(comment: $0) } }
            .startWithResult {
                [unowned self] result in
                switch result {
                case .success(let commentViewModels) :
                    self._comments.value += commentViewModels
                    if(commentViewModels.count > 0){
                        self.currentPage += 1
                    }
                case .failure(let error) :
                    print(error)
                }
            }
    }
    
    func getByIndex(index:Int) -> CommentViewModel {
        return comments.value[index]
    }
    
    func getCount() -> Int {
        return comments.value.count
    }
}
