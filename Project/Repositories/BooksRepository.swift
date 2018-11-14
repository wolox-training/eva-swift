//
//  BooksRepository.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/6/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import Result
import Argo

protocol BooksRepositoryType {
    func fetchBooks(page:Int) -> SignalProducer<[Book],RepositoryError>
}

class BooksRepository: AbstractRepository, BooksRepositoryType {
    static let fetchPath = "books"
    static let pageSize = 10
    static let pageKey = "page"
    func fetchBooks(page: Int) -> SignalProducer<[Book],  RepositoryError> {
        let path = BooksRepository.fetchPath
        let parameters = [BooksRepository.pageKey: page, "amount": BooksRepository.pageSize]
        return performRequest(method: .get, path: path,parameters: parameters) {
            decode($0).toResult()
        }
    }
    
    func fetchBookComments(bookId : Int) -> SignalProducer<[Comment],  RepositoryError> {
        let path = BooksRepository.fetchPath
        return performRequest(method: .get, path:  path+"/"+String(bookId)+"/comments") {
            decode($0).toResult()
        }
    }
}
