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

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Library
        let libraryTab = LibraryViewController()
        let libraryTabBarItem =  UITabBarItem(tabBarSystemItem: .bookmarks, tag: 7)
        
        libraryTab.tabBarItem = libraryTabBarItem
        
        
        
        // Create WishList
        let wishlistTab = WishListViewController()
        let wishlistTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        wishlistTab.tabBarItem = wishlistTabBarItem
        
        // Create AddBook
        let addBookTab = AddBookViewController()
        let addBookTabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 10)
        
        addBookTab.tabBarItem = addBookTabBarItem
        
        // Create Rentals
        let rentalsTab = RentalsViewController()
        let rentalsTabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 6)
        
        rentalsTab.tabBarItem = rentalsTabBarItem
        
        
        // Create Settings
        let settingsTab = SettingsViewController()
        let settingsTabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 11)
        
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




