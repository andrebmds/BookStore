//
//  DetailsViewController.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class DetailsViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var isFavorite: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    let viewModel = ThumbnailCollectionViewModel()
    let detailsViewModel = DetailsViewModel()
    var callbackRefresh: (() -> ())?

    @IBAction func isFavorite(_ sender: Any) {
        self.isFavorite.isSelected = !self.isFavorite.isSelected
        detailsViewModel.selectedIsFavorite(self.isFavorite.isSelected)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isFavorite.setImage(UIImage(named: "favorite"), for: .selected)
        self.isFavorite.setImage(UIImage(named: "unfavorite"), for: .normal)
        
        viewModel.didFinishFetch = {
            self.bookCover.image = self.viewModel.thumbNailImage
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Bortoli")
        self.callbackRefresh?()
    }
    
    @IBAction func buy(_ sender: Any) {
        guard let url = URL(string: detailsViewModel.buyLink) else { return }
        UIApplication.shared.open(url)
    }
    
    public func configure(with cover: BookElement) {
        print("is in the correct view")
        print("\(cover)")
        detailsViewModel.id = cover.id
        self.authorLabel.text = cover.volumeInfo.authors?.joined(separator: ", ")
        self.titleLabel.text = cover.volumeInfo.title
        self.descriptionText.text = cover.volumeInfo.volumeInfoDescription
        detailsViewModel.buyLink = cover.buyLink
        
        self.buyButton.isHidden = detailsViewModel.buyLink.isEmpty
        self.isFavorite.isSelected = cover.isFavorite
        detailsViewModel.isFavorite = cover.isFavorite
        if let smallThumbnail = cover.volumeInfo.imageLinks?.thumbnail {
            viewModel.fetchImage(urlName: smallThumbnail)
        }
    }
    
}
