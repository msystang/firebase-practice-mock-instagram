//
//  ProfileViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //TODO: Add collection view to show only currentUser posts
    
    //MARK: - UI Objects
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
        label.textAlignment = .center
        return label
    }()
    
    lazy var editDisplayNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 10)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(editDisplayNameButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var editProfileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
        button.addTarget(self, action: #selector(editProfileImageButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Internal Properties
    var profileImageURL: URL? = nil
    
    var email = String()
    
    var postCount = 0 {
        didSet {
            updateInfoLabel()
        }
    }
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserInfo()
        
        addSubviews()
        addConstraints()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getUserInfo()
        updateInfoLabel()
    }
    
    //MARK: - Objc Functions
    @objc func editDisplayNameButtonPressed(){
        let alertController = UIAlertController(title: "Edit Display Name", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak alertController, weak self] _ in
            
            guard let newDisplayName = alertController?.textFields?[0].text, newDisplayName != "" else {
                //TODO: showAlert to enter a display name
                return }
            
            FirebaseAuthService.manager.updateUserFields(userName: newDisplayName) { (result) in
                switch result {
                case .success:
                    //TODO: showAlert for success
                    self?.displayNameLabel.text = newDisplayName
                    self?.updateDisplayNameInFirestore(newDisplayName: newDisplayName)
                case .failure(let error):
                    print(error)
                }
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel" , style: .cancel)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
       
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func editProfileImageButtonPressed() {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        imagePickerViewController.sourceType = .photoLibrary
        imagePickerViewController.allowsEditing = true
        imagePickerViewController.mediaTypes = ["public.image"]
        self.present(imagePickerViewController, animated: true, completion: nil)
    }
    
    //MARK: - Private Methods
    private func getUserInfo() {
        getEmail()
        getPostCount()
        getDisplayName()
        getProfileImage()
    }
    
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
    
    private func getDisplayName() {
        if let displayName = FirebaseAuthService.manager.currentUser?.displayName {
            self.displayNameLabel.text = displayName
        } else {
            self.displayNameLabel.text = "No display name set"
        }
    
    }
    
    private func getProfileImage() {
        if let profileImageUrlFromFB = FirebaseAuthService.manager.currentUser?.photoURL {
            FirebaseStorageService.profileImageManager.getImage(photoUrl: profileImageUrlFromFB, photoUrlStr: nil) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                    //TODO: showAlert - could not update photo
                case .success(let image):
                    //TODO: Add activity indicator
                    self.profileImageView.image = image
                }
            }
        } else {
            profileImageView.image = UIImage(named: "no-profile-image")
        }
    }
    
    private func updateInfoLabel() {
        infoLabel.text = """
        Email: \(email)
        Total posts: \(postCount)
        """
    }
    
    private func updateDisplayNameInFirestore(newDisplayName: String) {
        FirestoreService.manager.updateCurrentUser(displayName: newDisplayName, photoURL: nil) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success:
                print("Updated displayName for user in Firestore")
            }
        }
    }
}
