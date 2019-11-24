//
//  AppTabBar.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/24/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController {
    
    lazy var feedVC = UINavigationController(rootViewController: FeedViewController())
    
    lazy var imageUploadVC = UINavigationController(rootViewController: ImageUploadViewController())
    
    lazy var profileVC: UINavigationController = {
        let profileVC = ProfileViewController()
        //profileVC.user = AppUser(from: FirebaseAuthService.manager.currentUser!)
        //profileVC.isCurrentUser = true
        return UINavigationController(rootViewController: profileVC)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "list.dash"), tag: 0)
        imageUploadVC.tabBarItem = UITabBarItem(title: "Upload", image: UIImage(systemName: "person.3"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.square"), tag: 2)
        self.viewControllers = [feedVC, imageUploadVC,profileVC]
    }
    
}
