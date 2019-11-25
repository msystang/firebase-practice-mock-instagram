//
//  User.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct AppUser {
    let email: String?
    let uid: String
    let displayName: String?
    let dateCreated: Date?
    let photoURL: String?
    
    init(from user: User) {
        self.displayName = user.displayName
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
        self.photoURL = user.photoURL?.absoluteString
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let displayName = dict["displayName"] as? String,
            let email = dict["email"] as? String,
            let photoURL = dict["photoURL"] as? String,
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        
        self.displayName = displayName
        self.email = email
        self.uid = id
        self.dateCreated = dateCreated
        self.photoURL = photoURL
    }
    
    var fieldsDict: [String: Any] {
        return [
            "displayName": self.displayName ?? "",
            "email": self.email ?? ""
        ]
    }
}
