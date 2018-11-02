//
//  ViewController.swift
//  Project
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

final class ViewController:  UITabBarController, UITabBarControllerDelegate,UINavigationControllerDelegate {
    //Custom navbar
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = .backgroundColor
        
    }
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        title = "Library" //default title
        //adding the header image style
        let headerImage = UIImageView(image: UIImage(named: "bc_nav bar"))
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //setup of all controllers'
        viewControllers = [
            LibraryViewController(),
            WishListViewController(),
            AddBookViewController(),
            RentalsViewController(),
            SettingsViewController()]
        
    }
    
    // UITabBarControllerDelegate method
    //when the user hits a tab this methods is called
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //setting up the title on navbar when the user navigate
        title = viewController.title ?? "Main"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

