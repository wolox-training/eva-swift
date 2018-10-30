//
//  ViewController.swift
//  Project
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

final class ViewController:  UITabBarController, UITabBarControllerDelegate {
    
    var navBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0,
                                                                        y: 0,
                                                                        width: UIScreen.main.bounds.width,
                                                                        height: 50))
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        navBar.setBackgroundImage(UIImage(named: "bc_nav bar")?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
        view.addSubview(navBar)
        setTitleToNavBar(title:"Library")
        // for default navigation bar title color
        navBar.titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.white]
    }
    
    func setTitleToNavBar(title:String) -> Void {
        let navItem = UINavigationItem(title:title)
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: nil, action: nil)
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = UIColor(red:0.92, green:0.96, blue:0.98, alpha:1.0)
        // navigation bar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //setup of all controllers
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
        print("Selected \(viewController.title!)")
        setTitleToNavBar(title: viewController.title ?? "Main")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

