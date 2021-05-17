//
//  FlickrImageSearchTest.swift
//  FlickrImageSearchTests
//
//  Created by Tejeshwar Gill on 15/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import XCTest
@testable import FlickrImageSearch

class FlickrImageSearchTest: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testIsInternetAvailable() {
        if Utilities.isInternetAvailable() {
            XCTAssertTrue(Utilities.isInternetAvailable())
        } else {
            XCTAssertFalse(Utilities.isInternetAvailable())
        }
    }
    
    func testDataCellViewModel() {
        let photo = Photo(id: "1", title: "Photo title", server: "123", secret: "456", farm: 1)
        let photoTestUrl = "https://farm1.staticflickr.com/123/1_456_m.jpg"
        let dataCellViewModel = DataCellViewModel(photo: photo)
        
        XCTAssertEqual(photo.title, dataCellViewModel.title)
        XCTAssertEqual(photoTestUrl, dataCellViewModel.photoURL)
    }
    
    func testSearchInvalidRequest() {
        let requestParam = SearchPhotoRequest(text: "", page: 1)
        XCTAssertTrue(requestParam.text.isEmpty)
    }
}
