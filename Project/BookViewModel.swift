//
//  BookViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/7/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
class BookViewModel {
    private let book : Book
    init(book : Book) {
        self.book = book
    }
    var title: String {
        return book.title
    }
}
