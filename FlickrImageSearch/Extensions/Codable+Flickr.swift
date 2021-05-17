//
//  Codable+Flickr.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 16/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?,value:Any) -> (String,Any)? in
            guard label != nil else { return nil }
            return (label!,value)
        }).compactMap{ $0 })
        return dict
    }
}
