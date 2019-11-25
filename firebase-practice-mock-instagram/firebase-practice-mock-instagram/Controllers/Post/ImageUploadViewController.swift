//
//  ImageUploadViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ImageUploadViewController: UIViewController {
    
    //MARK: - UI Objects
    lazy var uploadImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Upload New Image"
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageToUploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()

    lazy var selectImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Image", for: .normal)
        button.addTarget(self, action: #selector(selectImageButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload", for: .normal)
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
                //TODO: add alert - could not create post
                //TODO: segue to FeedVC
            case .success:
                print("Post created in Firestore")
                //TODO: add alert - post created!
            }
        }
    }
}
