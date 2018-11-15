//
//  User.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/13/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Argo
import Runes
import Curry

struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let imageUrl: String
    let rentsCounter: Int
    let commentsCounter: Int
    let unreadNotifications: Int
    
    init(id: Int, firstName: String, lastName: String, email: String, imageUrl: String?, rentsCounter: Int, commentsCounter: Int, unreadNotifications: Int) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.imageUrl = imageUrl ?? "https://cdn.onlinewebfonts.com/svg/img_264570.png"
        self.rentsCounter = rentsCounter
        self.commentsCounter = commentsCounter
        self.unreadNotifications = unreadNotifications
    }
}

extension User: Argo.Decodable {
    public static func decode(_ json: JSON) -> Decoded<User> {
        return curry(User.init)
            <^> json <| "id"
            <*> json <| "first_name"
            <*> json <| "last_name"
            <*> json <| "email"
            <*> json <|? "image_url"
            <*> json <| "rents_counter"
            <*> json <| "comments_counter"
            <*> json <| "unread_notifications_count"
    }
}
