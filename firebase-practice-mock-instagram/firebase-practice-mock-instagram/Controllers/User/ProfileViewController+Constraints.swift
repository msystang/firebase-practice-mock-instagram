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
        view.addSubview(profileImageView)
        view.addSubview(displayNameLabel)
        view.addSubview(editDisplayNameButton)
        view.addSubview(signOutButton)
        view.addSubview(infoTextView)
        view.addSubview(editProfileImageButton)
        
    }
    
    func addConstraints() {
        setProfileImageConstraints()
        setDisplayNameConstraints()
        setEditDisplayNameButtonConstraints()
        setSignOutButtonConstraints()
        setInfoTextViewConstraints()
        setEditPhotoButtonConstraints()
        
    }
        
    private func setProfileImageConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            profileImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor)
        ])
    }
    
    private func setDisplayNameConstraints() {
        displayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            displayNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            displayNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            displayNameLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            displayNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setEditDisplayNameButtonConstraints() {
        editDisplayNameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editDisplayNameButton.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 5),
            editDisplayNameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            editDisplayNameButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            editDisplayNameButton.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func setSignOutButtonConstraints() {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signOutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signOutButton.heightAnchor.constraint(equalToConstant: 30),
            signOutButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func setInfoTextViewConstraints() {
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoTextView.topAnchor.constraint(equalTo: editDisplayNameButton.bottomAnchor, constant: 25),
            infoTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            infoTextView.bottomAnchor.constraint(equalTo: signOutButton.topAnchor, constant: -20)
        ])
    }
    
    private func setEditPhotoButtonConstraints() {
        editProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editProfileImageButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            editProfileImageButton.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: -15),
            editProfileImageButton.heightAnchor.constraint(equalToConstant: 100),
            editProfileImageButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
}


