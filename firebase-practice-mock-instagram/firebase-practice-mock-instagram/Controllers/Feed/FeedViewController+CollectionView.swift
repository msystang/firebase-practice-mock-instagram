//
//  FeedViewController+CollectionView.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/25/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
        let post = posts[indexPath.row]

        
        //TODO: Make separate func?
        if let postImageUrlStr = post.photoURL {
            FirebaseStorageService.postManager.getImage(photoUrl: nil, photoUrlStr: postImageUrlStr, completion: { (result) in
                switch result {
                    case .failure(let error):
                    print(error)
                    //TODO: Add default image
                case .success(let imageFromFB):
                    cell.postImageView.image = imageFromFB
                }
            })
        } else {
            //TODO: add default image
        }
    
        //TODO: load displayName
        
        
        return cell
    }
    

}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: view.frame.width / 3 , height: view.frame.width / 3 )
    }
    
    
}
