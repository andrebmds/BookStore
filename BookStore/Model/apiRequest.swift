//
//  apiRequest.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import Foundation
import Alamofire

public class BookApiParser {

    let urlName = "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=0"
    let book = Book()
    
    func URLRequest() -> Any {
        AF.request(self.urlName, encoding: JSONEncoding.default).validate(statusCode:200..<300).responseJSON { response in
           // response serialization resul
            print("⬇︎ Response from: GET::\(self.urlName)")
            switch response.result {
            case .success(let JSON):
                print("From rest 🍏:")
                print(JSON)
                let responseJSON =  JSON as! NSDictionary
                self.apiParser(JSON: responseJSON)
                
            case .failure(let error):
                print("From rest 🔴:")
                print("Error \(error)")
                
                guard let httpStatusCode = response.response?.statusCode else { return }
                print("Error Code: \(httpStatusCode)")
            }
        }
    }
    func apiParser(JSON: NSDictionary) {
        print(JSON)
    }

}
