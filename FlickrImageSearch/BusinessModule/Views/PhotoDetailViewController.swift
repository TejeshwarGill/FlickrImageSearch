//
//  PhotoDetailViewController.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 05/02/20.
//  Copyright © 2020 Tejeshwar Gill. All rights reserved.
//

import UIKit
import SDWebImage

final class PhotoDetailViewController: UIViewController {

    /// Outlet
    @IBOutlet private weak var photoImage: UIImageView!

    /// Local
    var photoURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPhotoImage()
    }
    
    //MARK: - Private
    private func showPhotoImage() {
        if let url = photoURL {
            photoImage.sd_imageTransition = SDWebImageTransition.fade
            photoImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "img_placeholder"))
        }
    }
}
