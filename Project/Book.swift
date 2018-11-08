//
//  Book.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes
struct Book {
    
    var id: Int
    var title: String
    var author: String
    var image: URL?
    var year: String
    var genre: String
    
    init(id: Int, title: String, author: String, imageURL: String?, year: String, genre: String) {
        self.id = id
        self.title = title
        self.author = author
        self.image = imageURL.map { URL(string: $0)! }
        self.year = year
        self.genre = genre
    }
    
}

extension Book: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
            <^> json <| "id"
            <*> json <| "title"
            <*> json <| "author"
            <*> json <|? "image_url"
            <*> json <| "year"
            <*> json <| "genre"
    }
    
}
