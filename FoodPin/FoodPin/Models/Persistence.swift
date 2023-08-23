//
//  Persistence.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-23.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FoodPin")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
    }
}
