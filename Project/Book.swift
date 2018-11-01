//
//  Book.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
class Book : BaseModel {
    
    init(_ id: Int,_ title: String , _ img:String) {
        self.id = id
        self.title = title
        self.img = img
    }
    var id : Int?
    var title : String = ""
    var img : String = ""
    var description : String = ""
    var authors : String = ""
    
}
