//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WishList"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        let headerImage = UIImageView(image: UIImage(named: "bc_nav bar"))
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerImage)
        navigationBar.isTranslucent = true
        navigationBar.tintColor = UIColor.white
        // background color
        navigationBar.barTintColor = UIColor(hex: "#00a5f2")
        //remove shadow from navbar
        navigationBar.shadowImage = UIImage()
        tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(named: "ic_wishlist"), selectedImage: UIImage(named: "ic_wishlist"))
    }
    
}
