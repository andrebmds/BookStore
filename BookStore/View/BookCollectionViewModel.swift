//
//  BookCollectionViewModel.swift
//  BookStore
//
//  Created by André  Bortoli  on 09/12/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit

class BookCollectionViewModel: NSObject {
    func populateBookList() {
        //Call endpoint
        let call = BookApiParser()
        call.URLRequest()
        
    }
}
