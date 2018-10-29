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
        let libraryTabBarItem =  UITabBarItem(title: "Library", image: UIImage(named:"ic_library.png"), selectedImage: UIImage(named: "ic_library"))
        
        libraryTab.tabBarItem = libraryTabBarItem
        // Create WishList
        let wishlistTab = WishListViewController()
        let wishlistTabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(named: "ic_wishlist.png"), selectedImage: UIImage(named: "ic_wishlist.png"))
        
        wishlistTab.tabBarItem = wishlistTabBarItem
        
        // Create AddBook
        let addBookTab = AddBookViewController()
        let addBookTabBarItem = UITabBarItem(title: "Add Book", image: UIImage(named: "ic_add new.png"), selectedImage: UIImage(named: "ic_add new.png"))
        
        addBookTab.tabBarItem = addBookTabBarItem
        
        // Create Rentals
        let rentalsTab = RentalsViewController()
        let rentalsTabBarItem = UITabBarItem(title: "Rentals", image: UIImage(named: "ic_myrentals.png"), selectedImage: UIImage(named: "ic_myrentals.png"))
        
        rentalsTab.tabBarItem = rentalsTabBarItem
        
        
        // Create Settings
        let settingsTab = SettingsViewController()
        let settingsTabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "ic_settings.png"), selectedImage: UIImage(named: "ic_settings.png"))
        
        settingsTab.tabBarItem = settingsTabBarItem
        
        
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




