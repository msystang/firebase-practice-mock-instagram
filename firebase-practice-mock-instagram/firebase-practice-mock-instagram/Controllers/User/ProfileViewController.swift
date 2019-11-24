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
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        //TODO: Figure out why corners are not rounding
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "displayName"
        label.textAlignment = .center
        return label
    }()
    
    lazy var editDisplayNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 10)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var editPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
        return button
    }()
    
    //MARK: - Internal Properties
    var profileImage = UIImage() {
        didSet {
            self.profileImageView.image = profileImage
        }
    }
    var profileImageURL: String? = nil
    
    var email = String()
    
    var postCount = 0 {
        didSet {
            updateInfoLabel()
        }
    }
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        
        getUserInfo()
        
        addSubviews()
        addConstraints()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getUserInfo()
        updateInfoLabel()
    }
    
    //MARK: - Private Methods
    
    private func getEmail() {
        if let email = FirebaseAuthService.manager.currentUser?.email {
            self.email = email
        } else {
            self.email = "Could not get email for this user."
        }
    }
    
    private func getPostCount() {
        if let userUID = FirebaseAuthService.manager.currentUser?.uid {
            FirestoreService.manager.getPosts(forUserID: userUID) { (result) in
                switch result {
                case .failure(let error):
                    self.postCount = 0
                    print(error)
                case .success(let posts):
                    self.postCount = posts.count
                }
            }
        }
    }
    
    private func getUserInfo() {
        getEmail()
        getPostCount()
    }
    
    private func updateInfoLabel() {
        infoLabel.text = """
        Email: \(email)
        Total posts: \(postCount)
        """
    }
    
    
    //MARK: - UI Constraint Methods
    func addSubviews() {
        view.addSubview(profileLabel)
        view.addSubview(profileImageView)
        view.addSubview(displayNameLabel)
        view.addSubview(editDisplayNameButton)
        view.addSubview(infoLabel)
        view.addSubview(editPhotoButton)
        
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
        editPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editPhotoButton.centerXAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            editPhotoButton.centerYAnchor.constraint(equalTo: profileImageView.topAnchor),
            editPhotoButton.heightAnchor.constraint(equalToConstant: 100),
            editPhotoButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
}
