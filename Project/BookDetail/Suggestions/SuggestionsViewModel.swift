//
//  SuggestionsViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/16/18.
//  Copyright © 2018 Wolox. All rights reserved.
//
import Foundation
import WolmoCore
import Networking
import ReactiveSwift
import Result

class SuggestionsViewModel: ImageFetcher {
    private let _suggestions = MutableProperty<[BookViewModel]>([])
    public let suggestions:Property<[BookViewModel]>
    public let booksRepository : BooksRepository
    
    init(booksRepository : BooksRepository = NetworkingBootstrapper.shared.createBooksRepository() ) {
        suggestions = Property(_suggestions)
        self.booksRepository = booksRepository
    }
    
    public func loadSuggestions(bookId:Int){
        booksRepository.fetchSuggestions(bookId: bookId)
            .map {$0.map {BookViewModel(book: $0)}}
            .startWithResult {
                [unowned self] result in
                switch result {
                case .success(let bookViewModels) :
                    self._suggestions.value = bookViewModels
                    //self.fetchBookImages()
                case .failure(let error) :
                    print(error)
                }
        }
    }
    
    public func fetchBookImages() {
        //print("images")
        _suggestions.value.forEach({book in book.fetchImage(URL(string:book.image)!).producer.startWithResult { (result) in
            switch result {
            case let .success(img):
                DispatchQueue.main.async { //to execute on main thread
                    book.imageLoad = img
                }
                print("the image")
            case let .failure(error):
                print("Error Finding Image",error)
            }
            
            }})
    }
    
    func getByIndex(index:Int) -> BookViewModel {
        return suggestions.value[index]
    }
    
    func getCount() -> Int {
        return suggestions.value.count
    }
}
