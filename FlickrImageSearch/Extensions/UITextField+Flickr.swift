//
//  UITextField+Flickr.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 16/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setIcon(_ image: UIImage?) {
        guard let ic = image else {return}
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = ic
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
