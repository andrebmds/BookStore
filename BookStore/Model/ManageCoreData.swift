//
//  manageCoreData.swift
//  BookStore
//
//  Created by Andre Bortoli on 12/10/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit
import CoreData

public class ManageCoreData: NSObject {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BookFavorite")

    public func managerCoreData(id: String, isToSave: Bool) -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "BookFavorite", in: context)
        let coverBook = NSManagedObject(entity: entity!, insertInto: context)
        
        if isToSave {
            coverBook.setValue(id, forKey: "id")
            coverBook.setValue(true, forKey: "isFavorite")
    
            do {
                try
                    context.save()
                    return true
            } catch {
                print("Fail to save")
                return false
            }
        } else {
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    context.delete(data)
                }
            } catch {
                print("Fail to delete")
            }
            return false
        }
    }
    public func checkIfIdIsFavorite(id: String) -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            
            for data in result {
                if data.value(forKey: "id") as! String == id {
                    return true
                }
            }
        } catch {
            print("Failed")
        }
        return false
    }
}
