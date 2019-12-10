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
    public init() {}
    
    
    public func URLRequest(completion: @escaping(Book? , Error?) -> ()) {
        AF.request(self.urlName, encoding: JSONEncoding.default).validate(statusCode:200..<300).responseJSON { response in
            print("⬇︎ Response from: GET::\(self.urlName)")
            switch response.result {
                case .failure(let error):
                    print("From rest 🔴:")
                    print("Error \(error)")
            
                    guard let httpStatusCode = response.response?.statusCode else { return }
                    print("Error Code: \(httpStatusCode)")
                    completion(nil, error)
                    return
                case .success(let JSON):
                    print("From rest 🍏:")
                    print(JSON)
                    let responseJSON =  JSON as! NSDictionary
                    let book = self.apiParser(JSON: responseJSON)
                    completion(book, nil)
                    return
            }
        }
    }
    
    private func apiParser(JSON: NSDictionary) -> Book {
        print(JSON)
        let items = JSON["items"] as! Array<NSDictionary>
        return items.map{ parseBookStatement(bookItem: $0)! }
//        return Book.shared.bookList
    }
    
    
    func parseBookStatement(bookItem: NSDictionary) -> BookElement? {
        
        guard let id = bookItem["id"] as? String else { return nil }
        
        guard let volume = bookItem["volumeInfo"] as? NSDictionary else { return nil }
        guard let volumeInfo =  parseVolumeInfo(volume: volume) else { return nil}
        
        guard let saleInfo = bookItem["saleInfo"] as? NSDictionary else { return nil }
        
        let buyLink =  saleInfo["buyLink"] as? String ?? ""
        let bookElement = BookElement(id: id, volumeInfo: volumeInfo, buyLink: buyLink)
        
        return bookElement
    }
    
    func parseVolumeInfo(volume: NSDictionary) -> VolumeInfo? {
        let title = volume["title"] as? String ?? ""
        let subtitle = volume["subtitle"] as? String ?? ""
        let authors = volume["authors"] as? [String] ?? [""]
        let volumeInfoDescription = volume["description"] as? String ?? ""
        
        guard let imageLinks = volume["imageLinks"] as? NSDictionary else { return nil }
        guard let links = paserImageLinks(imageLinks: imageLinks) else { return nil }

        
        return VolumeInfo(title: title, subtitle: subtitle, authors: authors, volumeInfoDescription: volumeInfoDescription, imageLinks: links)

    }
    
    func paserImageLinks(imageLinks: NSDictionary) -> ImageLinks? {
        guard let smallThumbnail = imageLinks["smallThumbnail"] as? String else { return nil }
        guard let thumbnail = imageLinks["thumbnail"] as? String else { return nil }
        
        let links = ImageLinks(smallThumbnail: smallThumbnail, thumbnail: thumbnail)
        
        return links
    }
}
