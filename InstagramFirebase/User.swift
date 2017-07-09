//
//  User.swift
//  InstagramFirebase
//
//  Created by Christopher Paterson on 09/07/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

struct User {
    let username: String
    let profileImageUrl: String
    
    init(dictionary: [String: Any]) {
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
