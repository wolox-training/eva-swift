//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class RentalsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting color.
        view.backgroundColor = UIColor.orange
        title = "Rentals"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        //tabbar name and style setup
        tabBarItem = UITabBarItem(title: "Rentals", image: UIImage(named: "ic_myrentals.png"), selectedImage: UIImage(named: "ic_myrentals.png"))
    }
    
    
}
