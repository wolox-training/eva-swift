//
//  ViewController.swift
//  Project
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

final class ViewController:  UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.view.backgroundColor = UIColor(red:0.92, green:0.96, blue:0.98, alpha:1.0)
        // navigation bar
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Library
        let libraryTab = LibraryViewController()
        libraryTab.setup()
        // Create WishList
        let wishlistTab = WishListViewController()
        wishlistTab.setup()
        // Create AddBook
        let addBookTab = AddBookViewController()
        addBookTab.setup()
        // Create Rentals
        let rentalsTab = RentalsViewController()
        rentalsTab.setup()
        // Create Settings
        let settingsTab = SettingsViewController()
        settingsTab.setup()
        self.viewControllers = [libraryTab, wishlistTab,addBookTab,rentalsTab,settingsTab]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}




