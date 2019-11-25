//
//  FeedCollectionViewCell.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "displayName"
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        //TODO: Add constraints
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(postImageView)
        postImageView.addSubview(displayNameLabel)
    }
    
    func addConstraints() {
        setPostImageViewConstraints()
        setDisplayNameLabelConstraints()
    }
    
    func setPostImageViewConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setDisplayNameLabelConstraints() {
        displayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            displayNameLabel.bottomAnchor.constraint(equalTo: postImageView.bottomAnchor),
            displayNameLabel.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor),
            displayNameLabel.widthAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 0.8),
            displayNameLabel.heightAnchor.constraint(equalTo: postImageView.heightAnchor, multiplier: 0.2)

        ])
    }
    
    
}
