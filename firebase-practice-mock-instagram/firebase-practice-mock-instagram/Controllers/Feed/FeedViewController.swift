//
//  FeedViewController.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - UI Objects
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Pursuitgram"
        label.font = UIFont(name: "Zapfino", size: 25)
        label.textAlignment = .center
        return label
    }()
    
    lazy var feedCollectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: "feedCell")
        return collectionView
    }()
    
    //MARK: - Internal Properties
    var posts = [Post]() {
        didSet {
            feedCollectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        getPostsFromFirestore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getPostsFromFirestore()
    }
    
    //MARK: - Private Methods
    private func getPostsFromFirestore() {
        FirestoreService.manager.getAllPosts(sortingCriteria: .fromNewestToOldest) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let postsFromFirestore):
                self.posts = postsFromFirestore
            }
        }
    }
    
}


