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
import Curry
import Runes

struct Status {
    static let available: String = "Avalaible"
    static let unavailable: String = "Unavalaible"

}

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
        let path = BooksRepository.fetchPath+"/"+String(bookId)+"/comments"
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
    func fetchBookStatus(bookId: Int) -> SignalProducer<Bool, RepositoryError> {
        let path = BooksRepository.fetchPath+"/"+String(bookId)+"/rents"
        let result: SignalProducer<[Rent], RepositoryError> = performRequest(method: .get, path: path) { decode($0).toResult() }
        
        let resultRents: SignalProducer<Bool, RepositoryError> = result.map({ rents in
            let rent = rents.filter({ (rent) in
                rent.returnedAt != .none
            }).first
            return rent != nil
        })
        return resultRents
    }
    
    func fetchSuggestions(bookId : Int) -> SignalProducer<[Book],  RepositoryError> {
        let path = BooksRepository.fetchPath+"/"+String(bookId)+"/suggestions"
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    func saveBook(book:Book) ->  SignalProducer<[Book],  RepositoryError> {
        let path = BooksRepository.fetchPath
        //serialize the book
        return performRequest(method: .post, path:path) {
            decode($0).toResult()
        }
        
    }
    
}
