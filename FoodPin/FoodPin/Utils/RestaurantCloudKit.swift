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
    
    func fetchRestaurantsWithOperational() {
        self.restaurants = []
        
        // Fetch data using Operational API
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        // Create the query operation with the query
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["name", "image"]
        queryOperation.queuePriority = .veryHigh
        queryOperation.resultsLimit = 50
        queryOperation.recordMatchedBlock = { (recordID, result) -> Void in
            if let restaurant = try? result.get() {
                DispatchQueue.main.async {
                    self.restaurants.append(restaurant)
                }
            }
        }
        
        queryOperation.queryResultBlock = { result -> Void in
            switch result {
            case .success(let cursor):print("Successfully retrieve the data from iCloud.")
            case .failure(let error): print("Failed to get data from iCloud - \(error.localizedDescription)")
            }
        }
        
        // Execute the query
        publicDatabase.add(queryOperation)
    }
}
