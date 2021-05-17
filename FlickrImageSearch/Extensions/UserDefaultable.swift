//
//  UserDefaultable.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 16/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import Foundation


extension UserDefaults {
    /// Check key exists
    static func exists(key: String) -> Bool {
        return self.standard.object(forKey: key) != nil
    }
    /// Save
    static func save(object: AnyObject?, key: String) {
        if (object != nil) {
            self.standard.set(object, forKey: key)
        }
        self.standard.synchronize()
    }
    /// Get
    static func retrive(key : String) -> AnyObject? {
        if let name = self.standard.value(forKey: key) {
            return name as AnyObject
        }
        return nil
    }
}
