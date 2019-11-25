//
//  LoginViewController+Constraints.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/25/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension LogInViewController {
    //MARK: - UI Constraint Methods
     func addSubviews() {
         view.addSubview(logInStackView)
         view.addSubview(titleLabel)
         view.addSubview(createAccountButton)
     }
     
     func addConstraints() {
         setLogInStackViewConstraints()
         setTitleLabelConstraints()
         setCreateAccountButtonConstraints()
     }
     
     private func setLogInStackViewConstraints() {
         logInStackView.translatesAutoresizingMaskIntoConstraints = false
         emailTextField.translatesAutoresizingMaskIntoConstraints = false
         passwordTextField.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             logInStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             logInStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             logInStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
             emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
             passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
         ])
     }
     
    private func setTitleLabelConstraints() {
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
             titleLabel.bottomAnchor.constraint(equalTo: logInStackView.topAnchor, constant: 30),
             titleLabel.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
             titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
         ])
     }
     
     private func setCreateAccountButtonConstraints() {
         createAccountButton.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             createAccountButton.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
             createAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
             createAccountButton.heightAnchor.constraint(equalToConstant: 100)
         ])
     }

}
