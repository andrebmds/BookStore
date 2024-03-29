//
//  BookCollectionViewModel.swift
//  BookStore
//
//  Created by André  Bortoli  on 09/12/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit

class BookCollectionViewModel: NSObject {
    var isWating: Bool = false
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?()}
    }
    var bookList: Book? {
        didSet {
            guard bookList != nil else { return }
            
            self.didFinishFetch?()
        }
    }
    
    var didFinishFetch: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    
    //MARK: Call
    func populateBookList(_ startItem: String = "0", _ individualID: String = "") {
        let call = BookApiParser()
        call.URLRequest(startItem, individualID) { (book, error) in
            if error != nil {
                print("Error \(String(describing: error))")
            }
            
            self.isWating = false
            
            guard let newBook = book else { return }
            
            if self.bookList == nil {
                self.bookList = newBook
            } else {
                self.bookList? += newBook
            }
        }
        
    }
}
