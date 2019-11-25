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
        view.addSubview(headerLabel)
        view.addSubview(feedCollectionView)
    }
    
    func addConstraints() {
        setHeaderLabelConstraints()
        setFeedCollectionViewConstraints()
    }
    
    private func setHeaderLabelConstraints() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            headerLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    private func setFeedCollectionViewConstraints() {
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
}
