//
//  DetailsViewModel.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/10/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit

class DetailsViewModel: NSObject {
    
    var buyLink: String = ""
    var mainLink: String = ""
    var id: String = ""
    var isFavorite: Bool = false
    
    func selectedIsFavorite(_ isFavorite: Bool) {
        let coreData = ManageCoreData()
        self.isFavorite = coreData.managerCoreData(id: self.id, isToSave: isFavorite)
    }
}
