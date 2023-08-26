//
//  RestaurantCloudKit.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-25.
//

import Foundation
import CloudKit
import UIKit

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
    
    func saveRecordToCloud(restaurant: Restaurant) {
        
        let record = CKRecord(recordType: "Restaurant")
        record.setValuesForKeys([
            "name": restaurant.name,
            "type": restaurant.type,
            "location": restaurant.location,
            "phone": restaurant.phone,
            "description": restaurant.summary,
        ])
        
        let imageData = restaurant.image
        // Resize the image
        let originalImage = UIImage(data: imageData)!
        let scalingFactor = (originalImage.size.width > 1024) ? 1024 / originalImage.size.width : 1
        let scaledImage = UIImage(data: imageData, scale: scalingFactor)!
        
        // Create image asset for upload
        let imageAsset = CKAsset(uiImage: scaledImage)
        record.setValue(imageAsset, forKey: "image")
        
        // Get the public icloud database
        let publicDatabase = CKContainer.default().publicCloudDatabase
        
        // Save the record to iCloud
        publicDatabase.save(record) { record, error in
            if error != nil {
                print("❌ Failed to save record in iCloud:", error.debugDescription)
            }
//            try? FileManager.default.removeItem(at: imageFileUrl)
        }
    }
}


extension CKAsset {
    convenience init(uiImage: UIImage) {
        // Write the image to local file for temporary use
        let imageFilePath = NSTemporaryDirectory() + UUID().uuidString
        let imageFileUrl = URL(filePath: imageFilePath)
        try? uiImage.jpegData(compressionQuality: 0.8)?.write(to: imageFileUrl)
        
        // Create image asset for upload
        self.init(fileURL: imageFileUrl)
    }
}
