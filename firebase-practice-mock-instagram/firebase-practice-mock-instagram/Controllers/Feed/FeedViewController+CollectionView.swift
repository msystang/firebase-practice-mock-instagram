//
//  FeedViewController+CollectionView.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/25/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

// TODO: Fix bug -> Display Name in Collection View does not update to new user

//MARK: - CollectionView Methods
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
        let creatorID = post.creatorID
        
        FirestoreService.manager.getDisplayNameForUser(creatorID: creatorID) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let displayNameFromFB):
                cell.displayNameLabel.text = displayNameFromFB
            }
        }
        
        return cell
    }
    

}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    //TODO: Edit size and configuration of cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
            layout.minimumInteritemSpacing = 03
            layout.minimumLineSpacing = 03
            layout.invalidateLayout()

            return CGSize(width: ((self.view.frame.width/3) - 4), height:((self.view.frame.width / 3) - 4));
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FeedCollectionViewCell
        let post = posts[indexPath.row]
        let imageDetailVC = ImageDetailViewController()
        
        imageDetailVC.post = post
        
        if let cellImage = cell.postImageView.image {
            imageDetailVC.postImage = cellImage
        } else {
            //TODO: Add default image
        }
        
        if let cellName = cell.displayNameLabel.text {
            imageDetailVC.displayName = cellName
        } else {
            //TODO: handle no displayName
        }
        
        present(imageDetailVC, animated: true, completion: nil)
    }
}
