//
//  AddBookViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
class AddBookViewModel { 
    private var booksRepository:BooksRepository
    init(booksRepository : BooksRepository = NetworkingBootstrapper.shared.createBooksRepository()) {
       
        self.booksRepository = booksRepository
    }
}
