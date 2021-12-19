//
//  Networking.swift
//  JangKit
//
//  Created by 장효원 on 2021/12/19.
//

import UIKit

/*
 https://www.swiftbysundell.com/posts/the-power-of-result-types-in-swift
 */
enum Result<Value: Decodable> {
    case success(Value)
    case failure(Bool)
}

typealias Handler = (Result<Data>) -> Void

public enum Method {
    case get
    case post
}

protocol Networking {}

extension Networking {
    internal func request(method: Method, url: String, params: [NSString: Any]? = nil, callback: @escaping Handler) {
        //Create URL Object
        guard let url = URL(string: url) else {
            return
        }
        
        //TODO: 1. Need to divide as Method
        
        //TODO: 2. Need to include Header
        
        //TODO: 3. Need to put Params
        
        
        //Default
        let task = URLSession.shared.dataTask(with: url,  completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        callback(.success(data!))
                    } else {
                        callback(.failure(true))
                    }
                }
            }
        })
        task.resume()
    }
}
