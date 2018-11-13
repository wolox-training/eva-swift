//
//  BookViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 31/10/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core
import ReactiveSwift
import Result
class LibraryViewModel {
    private let _books = MutableProperty<[BookViewModel]>([])
    private var currentPage : Int  = 1
    
    public let books:Property<[BookViewModel]>
    public let booksRepository : BooksRepository
    
    init(booksRepository : BooksRepository = NetworkingBootstrapper.shared.createBooksRepository() ) {
        books = Property(_books)
        self.booksRepository = booksRepository
    }
    
    public func loadBooks(){
        booksRepository.fetchBooks(page: currentPage)
            .map {
                $0.map {
                    BookViewModel(book: $0)
                }
            }
            .startWithResult {
                [unowned self] result in
                switch result {
                case .success(let bookViewModels) :
                     self._books.value += bookViewModels
                     if(bookViewModels.count > 0){
                        self.currentPage += 1
                    }
                case .failure(let error) :
                    print(error)
                }
            }
    }
    
    func getBookByIndex(index : Int) -> BookViewModel {
        return books.value[index]
    }
    
    func getCount() -> Int {
        return books.value.count
    }
}
