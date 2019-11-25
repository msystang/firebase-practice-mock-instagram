//
//  SignUpViewController+Constraints.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/25/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension SignUpViewController {
    // MARK: - Constraint Methods
    func addSubviews() {
        view.addSubview(headerLabel)
        view.addSubview(createAccountStackView)
    }
    
    func addConstraints() {
        setHeaderLabelConstraints()
        setCreateAccountStackViewConstraints()
    }
    
    private func setHeaderLabelConstraints() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerLabel.bottomAnchor.constraint(equalTo: createAccountStackView.topAnchor, constant: 30),
            headerLabel.leadingAnchor.constraint(equalTo: createAccountStackView.leadingAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setCreateAccountStackViewConstraints() {
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
