//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class LibraryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Library"
    }
    func setup() -> Void {
        self.tabBarItem =  UITabBarItem(title: "Library", image: UIImage(named:"ic_library.png"), selectedImage: UIImage(named: "ic_library"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
