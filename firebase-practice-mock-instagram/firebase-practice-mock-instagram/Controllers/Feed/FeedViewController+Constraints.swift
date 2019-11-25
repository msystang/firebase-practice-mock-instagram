//
//  FeedViewController+Constraints.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/25/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController {
    
    //MARK: - UI Constraint Methods
    func addSubviews() {
        view.addSubview(feedCollectionView)
    }
    
    func addConstraints() {
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
