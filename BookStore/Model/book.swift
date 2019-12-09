//
//  book.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/8/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import Foundation
import UIKit

public struct Book {
    var author: String = ""
    var title: String = ""
    var description: String = ""
    var link: String = ""
}

enum BookList {
    static let title: [String] = {
        return [
            "red", "blue", "green",
            "black", "orange", "test",
            "blact", "trim", "car"
        ].shuffled()

    }()
    static let colors: [UIColor] = {
              return [
               .systemGray, .systemRed, .systemBlue,
               .systemPink, .systemGreen, .systemIndigo,
               .systemTeal, .systemYellow, .systemPurple,
               .systemGray, .systemRed, .systemBlue,
               .systemPink, .systemGreen, .systemIndigo,
               .systemTeal, .systemYellow, .systemPurple
               ].shuffled()
          }()
}
