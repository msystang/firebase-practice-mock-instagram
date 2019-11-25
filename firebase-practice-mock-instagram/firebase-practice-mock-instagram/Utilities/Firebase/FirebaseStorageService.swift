//
//  File.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/24/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

class FirebaseStorageService {
    enum ImageType {
        case profileImage
        case post
    }
    
    static var profileImageManager = FirebaseStorageService(type: .profileImage)
    static var postManager = FirebaseStorageService(type: .post)
    
    private let storage: Storage!
    private let storageReference: StorageReference
    private let imagesFolderReference: StorageReference
    
    init(type: ImageType) {
        storage = Storage.storage()
        storageReference = storage.reference()
        
        switch type {
        case .profileImage:
            imagesFolderReference = storageReference.child("profileImages")
        case .post:
            imagesFolderReference = storageReference.child("posts")
        }
        
    }
    
    func storeImage(image: Data,  completion: @escaping (Result<URL,Error>) -> ()) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let uuid = UUID()
        let imageLocation = imagesFolderReference.child(uuid.description)
        imageLocation.putData(image, metadata: metadata) { (responseMetadata, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                imageLocation.downloadURL { (url, error) in
                    guard error == nil else {completion(.failure(error!));return}
                    guard let url = url else {completion(.failure(error!));return}
                    completion(.success(url))
                }
            }
        }
    }
    
    func getImage(photoUrl: URL? = nil, photoUrlStr: String? = nil, completion: @escaping (Result<UIImage,Error>) -> ()) {
        
        if let photoUrl = photoUrl {
            imagesFolderReference.storage.reference(forURL: photoUrl.absoluteString).getData(maxSize: 400000) { (data, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data, let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
        
        if let photoUrlStr = photoUrlStr {
            imagesFolderReference.storage.reference(forURL: photoUrlStr).getData(maxSize: 400000) { (data, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data, let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
    }
    
}
