//
//  BookCollectionViewModel.swift
//  BookStore
//
//  Created by André  Bortoli  on 09/12/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit

class BookCollectionViewModel: NSObject {
    
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
    func populateBookList() {
        //Call endpoint
        let call = BookApiParser()
        call.URLRequest { (book, error) in
            if error != nil {
                self.isLoading = false
            }
            
            self.isLoading = false
            self.bookList = book
        }
        
    }
    
    private func setupView() {
//        if let title = book
    }
}
