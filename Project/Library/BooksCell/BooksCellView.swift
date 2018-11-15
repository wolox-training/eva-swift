//
//  BooksCellView.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 31/10/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

import ReactiveSwift
import Result

class BooksCellView: UITableViewCell, NibLoadable {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var portraitImg: UIImageView!
    @IBOutlet weak var container: UIView!
    
}
