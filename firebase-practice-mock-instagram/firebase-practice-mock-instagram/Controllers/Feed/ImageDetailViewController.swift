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
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var submittedByLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
