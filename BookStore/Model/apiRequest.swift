//
//  apiRequest.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import Foundation
import Alamofire
//import JSON

//public enum
class apiRequest {

    let urlName = "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=0"

    func URLRequest() {
        AF.request(self.urlName).responseJSON { response in
            print(response.request!)   // original url request
            print(response.response!) // http url response
            print(response.result)  // response serialization result
        }
    }

}
