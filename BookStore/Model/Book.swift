//
//  book.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import Foundation

// MARK: - Book
public class BookElement: NSObject {
    let id: String
    let volumeInfo: VolumeInfo
    let buyLink: String
    
    init(id: String, volumeInfo: VolumeInfo, buyLink: String) {
        self.id = id
        self.volumeInfo = volumeInfo
        self.buyLink = buyLink
    }
}

// MARK: - VolumeInfo
public class VolumeInfo: NSObject {
    let title, subtitle: String?
    let authors: [String]?
    let volumeInfoDescription: String?
    let imageLinks: ImageLinks?

    init(title: String, subtitle: String, authors: [String], volumeInfoDescription: String, imageLinks: ImageLinks) {
        self.title = title
        self.subtitle = subtitle
        self.authors = authors
        self.volumeInfoDescription = volumeInfoDescription
        self.imageLinks = imageLinks
    }
}

// MARK: - ImageLinks
public class ImageLinks: NSObject {
    let smallThumbnail, thumbnail: String?

    init(smallThumbnail: String, thumbnail: String) {
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
}

//typealias Book = [BookElement]
class Book {
    var bookList: [BookElement]?
    
    static let shared = Book()
    init(){}
    
}

class LocationManager{
    
    static let shared = LocationManager()
    
    init(){}
    
    func requestForLocation(){
        //Code Process
        print("Location granted")
    }
    
}
//Access class function with Singleton Pattern 🚀
//LocationManager.shared.requestForLocation()  //"Location granted"
//Still you can use your class like this
//let location = LocationManager()
//location.requestForLocation()
