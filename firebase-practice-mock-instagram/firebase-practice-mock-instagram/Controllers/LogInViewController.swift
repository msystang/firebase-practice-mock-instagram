//
//  ViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - UI Objects
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pursuitgram"
        return label
    }()
    
    lazy var mailTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

