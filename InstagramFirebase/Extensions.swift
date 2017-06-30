//
//  Extensions.swift
//  InstagramFirebase
//
//  Created by Christopher Paterson on 30/06/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: format,
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary))
    }
}
