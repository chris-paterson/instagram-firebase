//
//  MainTabBarController.swift
//  InstagramFirebase
//
//  Created by Christopher Paterson on 09/07/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: userProfileController)
        
        navController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        navController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        tabBar.tintColor = .black
            
        
        viewControllers = [navController, UIViewController()]
    }
}
