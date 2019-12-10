//
//  ThumbnailCollectionViewCell.swift
//  BookStore
//
//  Created by André  Bortoli  on 10/12/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit

class ThumbnailCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var favorite: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    public var coverBook: BookElement!
////    {
////        ditSet {
////            self.titleLabel.text = ""
//////            self.favoriteView
////
////        }
////    }
//
    public func configure(with model: String) {
        title.text = model
//        guard let titlelabel = titleLabel else { return }
//        titleLabel.text. = "André"
//        self.titleLabel.text = "André"
//        titlelabel.text = "André"
        
//        thumbnailView.backgroundColor = .red
    }
}
