//
//  UserProfileHeader.swift
//  InstagramFirebase
//
//  Created by Christopher Paterson on 09/07/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit
import Firebase

class UserProfileHeader: UICollectionViewCell {
    
    var user: User? {
        didSet {
            setupProfileImage()
        }
    }

    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 80 / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, right: nil, bottom: nil, left: leftAnchor,
                                paddingTop: 12, paddingRight: 0, paddingBottom: 0, paddingLeft: 12,
                                width: 80, height: 80)
    }
    
    fileprivate func setupProfileImage() {
        guard let profileImageUrl = user?.profileImageUrl else { return }
        guard let url = URL(string: profileImageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch profile image: \(error)")
                return
            }
            
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
        }.resume()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
