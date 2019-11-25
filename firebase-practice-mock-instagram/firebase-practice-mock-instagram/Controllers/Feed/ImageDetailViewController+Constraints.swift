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
        view.addSubview(imageDetailLabel)
        view.addSubview(postImageView)
        view.addSubview(infoLabel)
    }
    
    func addConstraints() {
        setImageDetailLabelConstraints()
        setPostImageViewConstraints()
        setInfoLabelConstraints()
    }
    
    private func setImageDetailLabelConstraints() {
        imageDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageDetailLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageDetailLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            imageDetailLabel.heightAnchor.constraint(equalToConstant: 100),
            imageDetailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
            
        ])
    }
    
    private func setPostImageViewConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: imageDetailLabel.bottomAnchor, constant: 20),
            postImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            postImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor)
        ])
    }
    
    private func setInfoLabelConstraints() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            infoLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    
}


