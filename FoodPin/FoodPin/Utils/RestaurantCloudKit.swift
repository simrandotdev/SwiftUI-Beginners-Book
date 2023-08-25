//
//  RestaurantCloudKit.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-25.
//

import Foundation
import CloudKit

class RestaurantCloudStore: ObservableObject {
    
    @Published var restaurants: [CKRecord] =  []
    
    func fetchRestaurants() async throws {
        
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        let results = try await publicDatabase.records(matching: query)
        
        self.restaurants = []
        for records in results.matchResults {
            self.restaurants.append(try records.1.get())
        }
    }
}
