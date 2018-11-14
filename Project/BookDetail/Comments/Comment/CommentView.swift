//
//  CommentView.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 6/11/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core
class CommentView: UITableViewCell ,NibLoadable{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!{
        didSet{
            avatar.layer.cornerRadius = 15
        }
    }
}
