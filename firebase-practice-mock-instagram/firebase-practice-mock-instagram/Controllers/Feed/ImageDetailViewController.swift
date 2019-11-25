//
//  ImageDetailViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {

    // MARK: - UI Objects
    
    lazy var imageDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Post Details"
        label.textAlignment = .center
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Submitted by: displayName
        Date: dateCreated
        """
        return label
    }()
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9009202719, blue: 0.7107562423, alpha: 1)
        
        addSubviews()
        addConstraints()
        

    }
    

   

}
