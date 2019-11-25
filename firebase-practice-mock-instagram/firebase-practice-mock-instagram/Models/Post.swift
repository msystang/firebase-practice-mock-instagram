//
//  Post.swift
//  firebase-practice-mock-instagram
//
//  Created by Sunni Tang on 11/19/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Post {
    let id: String
    let creatorID: String
    let photoURL: String?
    let dateCreated: Date?
    
    var formattedDate: String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ssZ"

        let dateFormatterSet = DateFormatter()
        dateFormatterSet.dateFormat = "MMM d yyyy, h:mm a"
        
        guard let dateStr = dateCreated?.description else { return "N/A" }
        guard let unformattedDate = dateFormatterGet.date(from: dateStr) else { return "N/A" }
        return dateFormatterSet.string(from: unformattedDate)
    }
    
    init(creatorID: String, photoURL: String? = nil, dateCreated: Date? = nil) {
        self.id = UUID().description
        self.creatorID = creatorID
        self.photoURL = photoURL
        self.dateCreated = dateCreated
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let userID = dict["creatorID"] as? String,
            let photoURL = dict["photoURL"] as? String else { return nil }
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue()
        
        self.id = id
        self.creatorID = userID
        self.photoURL = photoURL
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "creatorID": self.creatorID,
            "photoURL": self.photoURL
        ]
    }
}
