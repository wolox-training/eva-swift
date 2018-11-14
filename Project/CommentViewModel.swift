//
//  CommentViewModel.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/13/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core
class CommentViewModel: ImageFetcher {
    private let comment : Comment
    public var isLoad :Bool = false
    public var imageLoad : UIImage = UIImage()
    
    init(comment :Comment) {
        self.comment = comment
    }
    
    var id: Int{
        return comment.id
    }
    
    var content: String {
        return comment.content
    }
    
    var user: User {
        return comment.user
    }
    
}
