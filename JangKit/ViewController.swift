//
//  ViewController.swift
//  JangKit
//
//  Created by 장효원 on 2021/12/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService.shared.request{ (result) in
            switch result {
                case .success(let data):
                    print("data : ", data)
                    print("dataString : ", String(decoding: data, as: UTF8.self))
                    break
                case .failure(let error):
                    print(error.description)
                    break
                }
        }
    }

}

