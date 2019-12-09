//
//  book.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import Foundation

// MARK: - BookElement
class BookElement: Codable {
    let kind: Kind
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo

    init(kind: Kind, id: String, etag: String, selfLink: String, volumeInfo: VolumeInfo, saleInfo: SaleInfo, accessInfo: AccessInfo, searchInfo: SearchInfo) {
        self.kind = kind
        self.id = id
        self.etag = etag
        self.selfLink = selfLink
        self.volumeInfo = volumeInfo
        self.saleInfo = saleInfo
        self.accessInfo = accessInfo
        self.searchInfo = searchInfo
    }
}

// MARK: - AccessInfo
class AccessInfo: Codable {
    let country: Country
    let viewability: Viewability
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: TextToSpeechPermission
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: AccessViewStatus
    let quoteSharingAllowed: Bool

    init(country: Country, viewability: Viewability, embeddable: Bool, publicDomain: Bool, textToSpeechPermission: TextToSpeechPermission, epub: Epub, pdf: Epub, webReaderLink: String, accessViewStatus: AccessViewStatus, quoteSharingAllowed: Bool) {
        self.country = country
        self.viewability = viewability
        self.embeddable = embeddable
        self.publicDomain = publicDomain
        self.textToSpeechPermission = textToSpeechPermission
        self.epub = epub
        self.pdf = pdf
        self.webReaderLink = webReaderLink
        self.accessViewStatus = accessViewStatus
        self.quoteSharingAllowed = quoteSharingAllowed
    }
}

enum AccessViewStatus: String, Codable {
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case br = "BR"
}

// MARK: - Epub
class Epub: Codable {
    let isAvailable: Bool
    let acsTokenLink: String?

    init(isAvailable: Bool, acsTokenLink: String?) {
        self.isAvailable = isAvailable
        self.acsTokenLink = acsTokenLink
    }
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
    case allowedForAccessibility = "ALLOWED_FOR_ACCESSIBILITY"
}

enum Viewability: String, Codable {
    case partial = "PARTIAL"
}

enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
class SaleInfo: Codable {
    let country: Country
    let saleability: Saleability
    let isEbook: Bool
    let listPrice, retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?

    init(country: Country, saleability: Saleability, isEbook: Bool, listPrice: SaleInfoListPrice?, retailPrice: SaleInfoListPrice?, buyLink: String?, offers: [Offer]?) {
        self.country = country
        self.saleability = saleability
        self.isEbook = isEbook
        self.listPrice = listPrice
        self.retailPrice = retailPrice
        self.buyLink = buyLink
        self.offers = offers
    }
}

// MARK: - SaleInfoListPrice
class SaleInfoListPrice: Codable {
    let amount: Double
    let currencyCode: CurrencyCode

    init(amount: Double, currencyCode: CurrencyCode) {
        self.amount = amount
        self.currencyCode = currencyCode
    }
}

enum CurrencyCode: String, Codable {
    case brl = "BRL"
}

// MARK: - Offer
class Offer: Codable {
    let finskyOfferType: Int
    let listPrice, retailPrice: OfferListPrice
    let giftable: Bool

    init(finskyOfferType: Int, listPrice: OfferListPrice, retailPrice: OfferListPrice, giftable: Bool) {
        self.finskyOfferType = finskyOfferType
        self.listPrice = listPrice
        self.retailPrice = retailPrice
        self.giftable = giftable
    }
}

// MARK: - OfferListPrice
class OfferListPrice: Codable {
    let amountInMicros: Int
    let currencyCode: CurrencyCode

    init(amountInMicros: Int, currencyCode: CurrencyCode) {
        self.amountInMicros = amountInMicros
        self.currencyCode = currencyCode
    }
}

enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
class SearchInfo: Codable {
    let textSnippet: String

    init(textSnippet: String) {
        self.textSnippet = textSnippet
    }
}

// MARK: - VolumeInfo
class VolumeInfo: Codable {
    let title: String
    let subtitle: String?
    let authors: [String]?
    let publisher, publishedDate: String
    let volumeInfoDescription: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let readingModes: ReadingModes
    let pageCount: Int?
    let printType: PrintType
    let categories: [Category]
    let maturityRating: MaturityRating
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary
    let imageLinks: ImageLinks
    let language: Language
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let averageRating, ratingsCount: Int?

    enum CodingKeys: String, CodingKey {
        case title, subtitle, authors, publisher, publishedDate
        case volumeInfoDescription = "description"
        case industryIdentifiers, readingModes, pageCount, printType, categories, maturityRating, allowAnonLogging, contentVersion, panelizationSummary, imageLinks, language, previewLink, infoLink, canonicalVolumeLink, averageRating, ratingsCount
    }

    init(title: String, subtitle: String?, authors: [String]?, publisher: String, publishedDate: String, volumeInfoDescription: String?, industryIdentifiers: [IndustryIdentifier]?, readingModes: ReadingModes, pageCount: Int?, printType: PrintType, categories: [Category], maturityRating: MaturityRating, allowAnonLogging: Bool, contentVersion: String, panelizationSummary: PanelizationSummary, imageLinks: ImageLinks, language: Language, previewLink: String, infoLink: String, canonicalVolumeLink: String, averageRating: Int?, ratingsCount: Int?) {
        self.title = title
        self.subtitle = subtitle
        self.authors = authors
        self.publisher = publisher
        self.publishedDate = publishedDate
        self.volumeInfoDescription = volumeInfoDescription
        self.industryIdentifiers = industryIdentifiers
        self.readingModes = readingModes
        self.pageCount = pageCount
        self.printType = printType
        self.categories = categories
        self.maturityRating = maturityRating
        self.allowAnonLogging = allowAnonLogging
        self.contentVersion = contentVersion
        self.panelizationSummary = panelizationSummary
        self.imageLinks = imageLinks
        self.language = language
        self.previewLink = previewLink
        self.infoLink = infoLink
        self.canonicalVolumeLink = canonicalVolumeLink
        self.averageRating = averageRating
        self.ratingsCount = ratingsCount
    }
}

enum Category: String, Codable {
    case computers = "Computers"
}

// MARK: - ImageLinks
class ImageLinks: Codable {
    let smallThumbnail, thumbnail: String

    init(smallThumbnail: String, thumbnail: String) {
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
}

// MARK: - IndustryIdentifier
class IndustryIdentifier: Codable {
    let type: TypeEnum
    let identifier: String

    init(type: TypeEnum, identifier: String) {
        self.type = type
        self.identifier = identifier
    }
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
}

enum Language: String, Codable {
    case en = "en"
    case pt = "pt"
}

enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
class PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool

    init(containsEpubBubbles: Bool, containsImageBubbles: Bool) {
        self.containsEpubBubbles = containsEpubBubbles
        self.containsImageBubbles = containsImageBubbles
    }
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
class ReadingModes: Codable {
    let text, image: Bool

    init(text: Bool, image: Bool) {
        self.text = text
        self.image = image
    }
}

typealias Book = [BookElement]
