//
//  ProfileViewController+ImagePicker.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/24/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

// TODO: Add permissions for photo library

//MARK: - ImagePicker Methods
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            //MARK: TODO - handle couldn't get image :(
            return
        }
        
        self.profileImageView.image = image
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            //MARK: TODO - gracefully fail out without interrupting UX
            return
        }
        
        FirebaseStorageService.profileImageManager.storeImage(image: imageData, completion: { [weak self] (result) in
            switch result{
            case .success(let url):
                self?.profileImageURL = url
                FirebaseAuthService.manager.updateUserFields(userName: nil, photoURL: url) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(()):
                        //TODO: showAlert - saved
                        print("Photo saved in FirebaseAuth.")
                    }
                }
            case .failure(let error):
                print(error)
            }
        })
        dismiss(animated: true, completion: nil)
    }
    
}
