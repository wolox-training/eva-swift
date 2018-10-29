//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class WishListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting color.
        self.title = "WishList"
    }
    func setup() -> Void {
        self.tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(named: "ic_wishlist"), selectedImage: UIImage(named: "ic_wishlist"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
