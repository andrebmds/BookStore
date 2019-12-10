//
//  ThumbnailCollectionViewCell.swift
//  BookStore
//
//  Created by André  Bortoli  on 10/12/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit
import Foundation

class ThumbnailCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var favorite: UIImageView!
    @IBOutlet weak var title: UITextView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: BookElement) {
        self.thumbnail.image = UIImage(named: "bookPreload")
        self.title.text = model.volumeInfo.title
        
        let isFavoriteName = model.isFavorite ? "favorite" : "unfavorite"
        self.favorite.image = UIImage(named: isFavoriteName)
        
    }
}
