//
//  DetailsViewController.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var isFavorite: UISwitch!
    @IBOutlet weak var buyButton: UIButton!
    
    var buyLink: String = ""
    
    @IBAction func isFavorite(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buy(_ sender: Any) {
        //Redirect to the safari app
        guard let url = URL(string: self.buyLink) else { return }
        UIApplication.shared.open(url)
    }
    
    public func configure(with cover: BookElement) {
        print("is in the correct view")
        print("\(cover)")
        self.authorLabel.text = cover.volumeInfo.authors?.joined(separator: ", ")
        self.titleLabel.text = cover.volumeInfo.title
        self.descriptionText.text = cover.volumeInfo.volumeInfoDescription
        self.buyLink = cover.buyLink
        
        self.buyButton.isHidden = self.buyLink.isEmpty
        self.isFavorite.isOn = cover.isFavorite

    }
    
    func saveToCoreDataIsFavorite() {
        //TODO: terminar o save 
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
    }


}
