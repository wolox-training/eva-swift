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
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: nil, action: nil);
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
         let userRepository : UserRepository = NetworkingBootstrapper.shared.createUserRepository()
        userRepository.fetchUser().startWithResult { result in
            switch result {
            case .success(let userResponse) :
                self.viewControllers = [
                    LibraryViewController(),
                    WishListViewController(),
                    AddBookViewController(),
                    RentalsViewController(user: userResponse),
                    SettingsViewController()]
            case .failure(let error) :
                print(error)
                
            }
            
        }
        
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

