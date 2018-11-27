//
//  Rent.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/16/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import Result
import Argo
import Curry
import Runes
struct Rent {
    public var id: Int
    public var from: String
    public var to: String
    public var book : Book
    public var returnedAt: String?
}

extension Rent: Argo.Decodable {
    public static func decode(_ json: JSON) -> Decoded<Rent> {
        return curry(Rent.init)
            <^> json <| "id"
            <*> json <| "from"
            <*> json <| "to"
            <*> json <| "book"
            <*> json <|? "returned_at"
        
    }
}
