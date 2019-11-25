//
//  AppTabBar.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/24/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController {
    
    lazy var feedVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: FeedViewController())
        navController.view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        navController.isNavigationBarHidden = true
        return navController
    }()
    
    lazy var imageUploadVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: ImageUploadViewController())
        navController.view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        navController.isNavigationBarHidden = true
        return navController
    }()
    
    lazy var profileVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: ProfileViewController())
        //navController.user = AppUser(from: FirebaseAuthService.manager.currentUser!)
        //navController.isCurrentUser = true
        navController.view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        navController.isNavigationBarHidden = true
        return navController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "list.dash"), tag: 0)
        imageUploadVC.tabBarItem = UITabBarItem(title: "Upload", image: UIImage(systemName: "person.3"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.square"), tag: 2)
        self.viewControllers = [feedVC, imageUploadVC,profileVC]
    }
    
}
