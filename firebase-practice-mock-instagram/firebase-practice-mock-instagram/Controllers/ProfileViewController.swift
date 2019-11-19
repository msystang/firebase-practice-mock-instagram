//
//  ProfileViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI Objects
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var postCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
