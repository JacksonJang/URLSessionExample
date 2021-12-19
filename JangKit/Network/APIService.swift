//
//  APIService.swift
//  JangKit
//
//  Created by 장효원 on 2021/12/19.
//

import UIKit

class APIService: Networking {
    
    static let shared = APIService()

    func request(callback: @escaping Handler) {
        request(method: .get, url: "https://gist.githubusercontent.com/hyo961015/12c792ac5856900ea4fb5640f8c5d4e4/raw/299ec4b301973eef7dc3bff4031507dbefa6629f/example.json") { (result) in
           callback(result)
        }
    }
}
