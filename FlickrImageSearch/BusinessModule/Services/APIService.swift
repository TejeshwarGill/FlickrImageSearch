//
//  APIService.swift
//  FlickrImageSearch
//
//  Created by Tejeshwar Gill on 15/05/2021.
//  Copyright © 2021 Tejeshwar Gill. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func getDataFromURL(_ endPoint: EndPoint, completion: @escaping (Result<Data, APIError>) -> ())
}

final class APIService: APIServiceProtocol {
        
    func getDataFromURL(_ endPoint: EndPoint, completion: @escaping (Result<Data, APIError>) -> ()) {
        
        guard let url = endPoint.url else {
            return completion(.failure(APIError.invalidURL))
        }
        /// Check is internet available
        if !Utilities.isInternetAvailable() {
            completion(.failure(APIError.noNetwork))
            return
        }
        /// Set URLRequest and type
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let data = endPoint.data {
            request.httpBody = data
        }
        /// Make request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard error == nil else {
                completion(.failure(.invalidURL))
                return
            }
            guard data != nil else {
                completion(.failure(APIError.noData))
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                completion(.failure(APIError.checkErrorCode((response as? HTTPURLResponse)!.statusCode)))
                return
            }
            completion(.success(data!))
        }
        task.resume()
    }
    
}
