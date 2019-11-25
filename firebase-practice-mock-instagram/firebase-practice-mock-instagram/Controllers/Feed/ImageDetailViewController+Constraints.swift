//
//  ImageDetailViewController+Constraints.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/25/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension ImageDetailViewController {
    
    //MARK: - UI Constraint Methods
    func addSubviews() {
        view.addSubview(postImageView)
        view.addSubview(infoTextView)
    }
    
    func addConstraints() {
        setPostImageViewConstraints()
        setInfoTextViewConstraints()
    }
    
    private func setPostImageViewConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            postImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            postImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor)
        ])
    }
    
    private func setInfoTextViewConstraints() {
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoTextView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 20),
            infoTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            infoTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    
}


