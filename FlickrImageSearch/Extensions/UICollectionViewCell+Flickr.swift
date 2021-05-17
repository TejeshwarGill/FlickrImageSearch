//
//  UICollectionViewCell+Flickr.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 15/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import UIKit

extension UICollectionViewCell {

    static func register(for collectionView: UICollectionView)  {
        let cellName = String(describing: self)
        let identifier = cellName
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: identifier)
    }
}
