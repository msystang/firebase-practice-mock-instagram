//
//  ImageUploadViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ImageUploadViewController: UIViewController {
    
    //TODO: Set bool property to indicate profile completion, add alert if profile is not completed, add condition for userName too
    
    //MARK: - UI Objects
    lazy var uploadImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Create New Post"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageToUploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.image = UIImage(named: "no-photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    lazy var selectImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Image", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.setTitleColor(.brown, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(selectImageButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.setTitleColor(.brown, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(uploadButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [selectImageButton,uploadButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    //MARK: - Internal Properties
    var postImageURL: String? = nil
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
    }
    
    //MARK: - Objc Functions
    @objc func selectImageButtonPressed() {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        imagePickerViewController.sourceType = .photoLibrary
        imagePickerViewController.allowsEditing = true
        imagePickerViewController.mediaTypes = ["public.image"]
        self.present(imagePickerViewController, animated: true, completion: nil)
    }
    
    @objc func uploadButtonPressed() {
        guard let user = FirebaseAuthService.manager.currentUser else {return}
        guard let photoURL = postImageURL else {return}
        let newPost = Post(creatorID: user.uid, photoURL: photoURL, dateCreated: Date())
        FirestoreService.manager.createPost(post: newPost) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                self.showAlert(title: "Error", message: "Could not upload post: \(error)")
            case .success:
                self.showAlert(title: "Success", message: "Image posted successfully!")
            }
        }
    }
    
    //MARK: - Private Methods
    private func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        dismiss(animated: true) {
            self.goToFeed()
        }
    }
    
    private func goToFeed() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else { return }
        
        UIView.transition(with: window, duration: 0.2, options: .transitionFlipFromLeft, animations: {
                window.rootViewController = {
                    let feedVC = AppTabBarViewController()
                    feedVC.selectedIndex = 0
                    return feedVC
                }()
        })
    }
}
