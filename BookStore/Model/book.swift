//
//  book.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import Foundation

// MARK: - Book
class BookElement: Codable {
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
class VolumeInfo: Codable {
    let title, subtitle: String?
    let authors: [String]?
    let volumeInfoDescription: String?
    let imageLinks: ImageLinks?

    enum CodingKeys: String, CodingKey {
        case title, subtitle, authors
        case volumeInfoDescription
        case imageLinks
    }

    init(title: String, subtitle: String, authors: [String], volumeInfoDescription: String, imageLinks: ImageLinks) {
        self.title = title
        self.subtitle = subtitle
        self.authors = authors
        self.volumeInfoDescription = volumeInfoDescription
        self.imageLinks = imageLinks
    }
}

// MARK: - ImageLinks
class ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?

    init(smallThumbnail: String, thumbnail: String) {
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
}

typealias Book = [BookElement]
