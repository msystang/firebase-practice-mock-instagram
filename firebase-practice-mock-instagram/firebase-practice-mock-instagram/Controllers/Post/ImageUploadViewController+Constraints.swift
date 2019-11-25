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
        view.addSubview(uploadImageLabel)
        view.addSubview(imageToUploadImageView)
        view.addSubview(buttonStackView)
    }
    
    func addConstraints() {
        setUploadImageLabelConstraints()
        setImageToUploadImageViewConstraints()
        setButtonStackViewConstraints()
    }
    
    private func setUploadImageLabelConstraints() {
        uploadImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            uploadImageLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            uploadImageLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            uploadImageLabel.heightAnchor.constraint(equalToConstant: 100),
            uploadImageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
    }
    
    private func setImageToUploadImageViewConstraints() {
        imageToUploadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageToUploadImageView.topAnchor.constraint(equalTo: uploadImageLabel.bottomAnchor, constant: 20),
            imageToUploadImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageToUploadImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
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
