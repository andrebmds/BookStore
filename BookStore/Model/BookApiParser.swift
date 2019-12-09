//
//  BookApiParser.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import Foundation
import Alamofire

public class BookApiParser {

    let urlName = "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=0"
    
    public init() {
        
    }
    
//    public var book : Book?
    
    public func URLRequest() {
        AF.request(self.urlName, encoding: JSONEncoding.default).validate(statusCode:200..<300).responseJSON { response in
            print("⬇︎ Response from: GET::\(self.urlName)")
            switch response.result {
                case .failure(let error):
                    print("From rest 🔴:")
                    print("Error \(error)")
                    
                    guard let httpStatusCode = response.response?.statusCode else { return }
                    print("Error Code: \(httpStatusCode)")
                case .success(let JSON):
                    print("From rest 🍏:")
                    print(JSON)
                    let responseJSON =  JSON as! NSDictionary
                    self.apiParser(JSON: responseJSON)
            }
        }
    }
    
    private func apiParser(JSON: NSDictionary) {
        print(JSON)
        
//        let items = JSON["items"] as! Array<NSDictionary>
        
    }
    
    public func parserBookList(items: NSDictionary) {
        
    }
}
