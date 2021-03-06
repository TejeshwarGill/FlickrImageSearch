//
//  Photo.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 15/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    let id, title, server, secret: String
    let farm: Int
    
}

struct SearchPhotosResponse: Decodable {
    let page, pages: Int
    let photoList: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case pages = "pages"
        case photoList = "photo"
        case photos = "photos"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .photos)
        page = try response.decode(Int.self, forKey: .page)
        pages = try response.decode(Int.self, forKey: .pages)
        photoList = try response.decode([Photo].self, forKey: .photoList)
        
    }
}

struct SearchPhotoRequest: Encodable {
    let method = "flickr.photos.search"
    let api_key = AppConstants.Keys.flickrAPIKey
    let format = AppConstants.APIParams.format
    let nojsoncallback = AppConstants.APIParams.nojsoncallback
    let per_page = AppConstants.APIParams.perPageLimit
    
    let text: String
    let page: Int
}
