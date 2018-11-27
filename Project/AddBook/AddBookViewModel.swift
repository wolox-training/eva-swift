//
//  AddBookViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import Networking
import Result
class AddBookViewModel { 
    private var booksRepository:BooksRepository
    public var title = MutableProperty<String>("")
    public var author = MutableProperty<String>("")
    init(booksRepository : BooksRepository = NetworkingBootstrapper.shared.createBooksRepository()) {
       
        self.booksRepository = booksRepository
    }
    
    public private(set) lazy var action = Action { (book:[String:Any]) in
        return self.booksRepository.saveBook(book: book)
    }
    
    func postSuggestion(book : [String:Any]) -> SignalProducer<[Book],  RepositoryError> {
        return booksRepository.saveBook(book: book)
    }
    
}
