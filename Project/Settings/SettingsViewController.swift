//
//  TabOneViewController.swift
//  autolayout
//
//  Created by Emmanuel Velez Agudelo on 29/10/18.
//  Copyright © 2018 Emmanuel Velez Agudelo. All rights reserved.
//

import Foundation
import UIKit
class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting color.
        self.view.backgroundColor = UIColor.black
        self.title = "Settings"
    }
    func setup() -> Void {
        self.tabBarItem UITabBarItem(title: "Settings", image: UIImage(named: "ic_settings.png"), selectedImage: UIImage(named: "ic_settings.png"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
