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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIBind()
        // Do any additional setup after loading the view.
    }
    
    func UIBind() {
        AF.request("https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=0").responseJSON { response in
            
            print(response.request!)   // original url request
            print(response.response!) // http url response
            print(response.result)  // response serialization result

        }

    }
    
    @IBAction func buy(_ sender: Any) {
        //Redirect to the safari app
        guard let url = URL(string: "https://stackoverflow.com") else { return }
        UIApplication.shared.open(url)
    }

}
