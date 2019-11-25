//
//  ImageUploadViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ImageUploadViewController: UIViewController {

    // MARK: - UI Objects
    
    lazy var uploadImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Upload Image"
        return label
    }()
    
    lazy var imageToUploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        
    }
    
    private func addConstraints() {
        
        
    }

}
