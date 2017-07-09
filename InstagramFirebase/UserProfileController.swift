//
//  UserProfileController.swift
//  InstagramFirebase
//
//  Created by Christopher Paterson on 09/07/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit
import Firebase

class UserProfileController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        navigationItem.title = Auth.auth().currentUser?.uid
        
        fetchUser()
    }
    
    fileprivate func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (data) in
            print(data.value ?? "")
            guard let dictionary = data.value as? [String: Any] else { return }
            let username = dictionary["username"]
            self.navigationItem.title = username as? String
            
        }) { (error) in
            print("Failed to fetch user: \(error)")
        }
    }
}
