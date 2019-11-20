//
//  SignUpViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/20/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Email"
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Password"
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var createAccountStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, createButton])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        addSubviews()
        addConstraints()
    }
    

    //MARK: -Obj-C Methods
    
    @objc func validateFields() {
        guard emailTextField.hasText, passwordTextField.hasText else {
            //TODO: Change color of button when enabled/disabled
            createButton.isEnabled = false
            return
        }
        createButton.isEnabled = true
    }
    
    // MARK: - Constraint Methods
    func addSubviews() {
        view.addSubview(headerLabel)
        view.addSubview(createAccountStackView)
    }
    
    func addConstraints() {
        setHeaderLabelConstraints()
        setCreateAccountStackViewConstraints()
    }
    
    func setHeaderLabelConstraints() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerLabel.bottomAnchor.constraint(equalTo: createAccountStackView.topAnchor, constant: 30),
            headerLabel.leadingAnchor.constraint(equalTo: createAccountStackView.leadingAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    func setCreateAccountStackViewConstraints() {
        createAccountStackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createAccountStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            createAccountStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
        ])
    }

}
