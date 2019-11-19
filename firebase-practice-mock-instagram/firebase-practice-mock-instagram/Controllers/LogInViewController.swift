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
    
    lazy var emailTextField: UITextField = {
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
    
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        addSubviews()
        addConstraints()
        
    }
    
    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(textFieldStackView)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        
    }
    
    func addConstraints() {
        setTitleLabelConstraints()
        setTextFieldStackViewConstraints()
        setLoginButtonConstraints()
        setCreateAccountButtonConstraints()
    }
    
    func setTitleLabelConstraints() {}
    func setTextFieldStackViewConstraints() {}
    func setLoginButtonConstraints() {}
    func setCreateAccountButtonConstraints() {}
    
    
}

