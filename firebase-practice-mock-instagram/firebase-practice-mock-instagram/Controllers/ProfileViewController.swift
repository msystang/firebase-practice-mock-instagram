//
//  ProfileViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI Objects
    
    //TODO: Add edit profile pic image
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "displayName"
        label.textAlignment = .center
        return label
    }()
    
    lazy var editNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "email"
        return label
    }()
    
    lazy var postCountLabel: UILabel = {
        let label = UILabel()
        label.text = "postCount"
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, postCountLabel])
        stackView.alignment = .top
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        addSubviews()
        addConstraints()
    }
    
    func addSubviews() {
        view.addSubview(profileLabel)
        view.addSubview(profileImageView)
        view.addSubview(displayNameLabel)
        view.addSubview(editNameButton)
        view.addSubview(labelStackView)
        
    }
    
    func addConstraints() {
        setProfileLabelConstraints()
        setProfileImageConstraints()
        setDisplayNameConstraints()
        setEditButtonConstraints()
        setLabelStackViewConstraints()
        
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
    
    func setEditButtonConstraints() {
        editNameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editNameButton.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 5),
            editNameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            editNameButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            editNameButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setLabelStackViewConstraints() {
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: editNameButton.bottomAnchor, constant: 20),
            labelStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            labelStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    
}
