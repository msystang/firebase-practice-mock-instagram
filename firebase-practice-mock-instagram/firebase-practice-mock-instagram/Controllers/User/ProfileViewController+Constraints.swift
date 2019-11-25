//
//  ProfileViewController+Constraints.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/24/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewController {
    
    //MARK: - UI Constraint Methods
    func addSubviews() {
        view.addSubview(profileLabel)
        view.addSubview(profileImageView)
        view.addSubview(displayNameLabel)
        view.addSubview(editDisplayNameButton)
        view.addSubview(infoLabel)
        view.addSubview(editProfileImageButton)
        
    }
    
    func addConstraints() {
        setProfileLabelConstraints()
        setProfileImageConstraints()
        setDisplayNameConstraints()
        setEditDisplayNameButtonConstraints()
        setInfoLabelConstraints()
        setEditPhotoButtonConstraints()
        
    }
    
    func setProfileLabelConstraints() {
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            profileLabel.heightAnchor.constraint(equalToConstant: 100),
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
            
        ])
    }
    
    func setProfileImageConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor)
        ])
    }
    
    func setDisplayNameConstraints() {
        displayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            displayNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5),
            displayNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            displayNameLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            displayNameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setEditDisplayNameButtonConstraints() {
        editDisplayNameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editDisplayNameButton.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor),
            editDisplayNameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            editDisplayNameButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            editDisplayNameButton.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func setInfoLabelConstraints() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: editDisplayNameButton.bottomAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            infoLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func setEditPhotoButtonConstraints() {
        editProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editProfileImageButton.centerXAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            editProfileImageButton.centerYAnchor.constraint(equalTo: profileImageView.topAnchor),
            editProfileImageButton.heightAnchor.constraint(equalToConstant: 100),
            editProfileImageButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
}


