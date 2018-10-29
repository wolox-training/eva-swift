//
//  Book.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
class Book : BaseModel {
    
    override init() {
        
    }
    var id : Int?
    var title : String = ""
    var description : String = ""
    var authors : [Author]?
    
}
