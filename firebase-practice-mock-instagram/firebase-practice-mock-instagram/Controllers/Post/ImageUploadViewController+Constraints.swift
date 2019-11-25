//
//  ImageUploadViewController+Constraints.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/25/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension ImageUploadViewController {
    
    //MARK: - UI Constraint Methods
    func addSubviews() {
        view.addSubview(imageToUploadImageView)
        view.addSubview(uploadImageLabel)
        view.addSubview(buttonStackView)
    }
    
    func addConstraints() {
        setImageToUploadImageViewConstraints()
        setUploadImageLabelConstraints()
        setButtonStackViewConstraints()
    }
    
    private func setUploadImageLabelConstraints() {
        uploadImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            uploadImageLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            uploadImageLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            uploadImageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            uploadImageLabel.bottomAnchor.constraint(equalTo: imageToUploadImageView.topAnchor, constant: 15)
        ])
    }
    
    private func setImageToUploadImageViewConstraints() {
        imageToUploadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageToUploadImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageToUploadImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageToUploadImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageToUploadImageView.heightAnchor.constraint(equalTo: imageToUploadImageView.widthAnchor)
        ])
    }
    
    private func setButtonStackViewConstraints() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: imageToUploadImageView.bottomAnchor, constant: 20),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
        ])
    }


}
