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
        return imageView
    }()
    
    lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
}
