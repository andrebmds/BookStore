//
//  ThumbnailCollectionViewModel.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/10/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit

class ThumbnailCollectionViewModel: NSObject {
    var thumbNailImage: UIImage? {
        didSet {
            guard thumbNailImage != nil else { return }
            
            self.didFinishFetch?()
        }
    }
    
    var didFinishFetch: (() -> ())?
    
    func fetchImage(urlName: String) {
        let call = BookApiParser()
//        call.
        call.parserImage(urlName: urlName) { (image, error) in
            self.thumbNailImage = image
        }
    }
}
