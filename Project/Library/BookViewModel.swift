//
//  BookViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 31/10/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core
class BookViewModel {
    private var books : [Book] = []
    
    func loadBooks(){
        books = [
            Book(1,"Titulo 1","img_book_1"),
            Book(2,"Titulo 2","img_book2"),
            Book(3,"Titulo 3","img_book3"),
            Book(3,"Titulo 4","img_book4"),
            Book(3,"Titulo 5","img_book5"),
        ]
    }
    
    func getBooks() -> [Book] {
        return books
    }
    func getCount() -> Int {
        return books.count
    }
}
