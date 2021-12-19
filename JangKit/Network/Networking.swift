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

public enum Method: String {
    case GET = "GET"
    case POST = "POST"
}

public enum ContentType: String {
    case APPLICATION_FORM_URLENCODED = "application/x-www-form-urlencoded"
    case APPLICATION_JSON = "application/json"
}

protocol Networking {}

extension Networking {
    internal func request(method: Method, url: String, params: [String: Any] = [:], headers:[String:String] = [:], callback: @escaping Handler) {
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = method.rawValue
        
        let paramString = (params.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }) as Array).joined(separator: "&")
        let bodyData = paramString.data(using: .utf8)
        
        request.httpBody = bodyData
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
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
        
        //TODO: 2. Need to include Header
        
        
        //TODO: 3. Need to put Params
        
        
        //TODO: Default
        //Create URL Object
//        guard let url = URL(string: url) else {
//            return
//        }
        
//        let task = URLSession.shared.dataTask(with: url,  completionHandler: { (data, response, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    print(error.localizedDescription)
//                } else if let httpResponse = response as? HTTPURLResponse {
//                    if httpResponse.statusCode == 200 {
//                        callback(.success(data!))
//                    } else {
//                        callback(.failure(true))
//                    }
//                }
//            }
//        })
//        task.resume()
    }
}
