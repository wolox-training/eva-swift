//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class AddBookViewController: UIViewController {
    
    func setup() -> Void {
       self.tabBarItem = UITabBarItem(title: "Add Book", image: UIImage(named: "ic_add new.png"), selectedImage: UIImage(named: "ic_add new.png"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting color.
        self.view.backgroundColor = UIColor.cyan
        self.title = "AddBook"
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
