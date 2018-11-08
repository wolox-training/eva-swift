//
//  DetailsView.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 6/11/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core
class DetailsView: UIView, NibLoadable {
    
    @IBOutlet weak var title: UILabel!{
        didSet{
            
        }
    }
    @IBOutlet weak var avaleible: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var rent: UIButton!{
        didSet{
            rent.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var addWish: UIButton!{
        didSet{
            addWish.layer.cornerRadius = 5
        }
    }
}
