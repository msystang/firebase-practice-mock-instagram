//
//  ProfileViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // TODO: Add permissions for photo library
    
    //MARK: - UI Objects
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 120
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        return label
    }()
    
    lazy var editDisplayNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.showsTouchWhenHighlighted = true
        button.setTitleColor(.brown, for: .normal)
        button.addTarget(self, action: #selector(editDisplayNameButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var infoTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
        textView.isEditable = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    lazy var editProfileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
        button.addTarget(self, action: #selector(editProfileImageButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.showsTouchWhenHighlighted = true
        button.setTitleColor(.brown, for: .normal)
        button.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
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
    
    @objc func signOutButtonPressed() {
        FirebaseAuthService.manager.signOutUser { (result) in
            switch result {
            case .failure(let error):
                print("Could not sign out:\(error)")
            case .success(()):
                print("Signed out")
                self.goToLogInVC()
            }
        }
        
    }
    
    //MARK: - Public Functions
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        dismiss(animated: true)
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
            self.displayNameLabel.text = "Set display name"
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
        infoTextView.text = """
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
    
    private func goToLogInVC() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else { return }
        
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromTop, animations: {
                window.rootViewController = LogInViewController()
        })
    }

}
