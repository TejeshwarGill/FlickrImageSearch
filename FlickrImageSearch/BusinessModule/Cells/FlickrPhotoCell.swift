//
//  FlickrPhotoCell.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 15/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import UIKit
import SDWebImage

final class FlickrPhotoCell: UICollectionViewCell {
    
    /// Outlet
    @IBOutlet weak var imageView: UIImageView!
    
    /// Local
    public static let reusableId: String = "FlickrPhotoCell"
    var dataCellViewModel : DataCellViewModel? {
        didSet {
            if let url = dataCellViewModel?.photoURL {
                imageView.sd_imageTransition = SDWebImageTransition.fade
                imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "img_placeholder"))
            }
        }
    }
}
