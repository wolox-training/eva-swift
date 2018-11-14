//
//  BookViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/7/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core
class BookViewModel : ImageFetcher {
    private let book : Book
    public var isLoad :Bool = false
    public var imageLoad : UIImage = UIImage()
    public var status : String = Book.unavailable
    public var statusColor : UIColor = UIColor.red

    init(book : Book) {
        self.book = book
    }
    
    var id: Int {
        return book.id
    }
    
    var title: String {
        return book.title
    }
    
    var author: String {
        return book.author
    }
    
    var genre: String {
        return book.genre
    }
    
    var year: String {
        return book.year
    }
    
    var image: String {
        return book.image
    }
}
