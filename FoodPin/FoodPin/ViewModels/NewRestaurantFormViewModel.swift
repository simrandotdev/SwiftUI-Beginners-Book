//
//  NewRestaurantFormViewModel.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-23.
//

import Foundation
import Combine
import UIKit
import CoreData

class NewRestaurantFormViewModel: ObservableObject {
    // Input
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var location: String = ""
    @Published var phone: String = ""
    @Published var description: String = ""
    @Published var image: UIImage = UIImage()
    
    
    init(restaurant: Restaurant? = nil) {
        if let restaurant = restaurant {
            self.name = restaurant.name
            self.type = restaurant.type
            self.location = restaurant.location
            self.phone = restaurant.phone
            self.description = restaurant.summary
            self.image = UIImage(data: restaurant.image) ?? UIImage()
        }
    }
    
    func saveRestaurant(with context: NSManagedObjectContext) {
        let restaurant = Restaurant(context: context)
        restaurant.name = name
        restaurant.type = type
        restaurant.location = location
        restaurant.phone = phone
        restaurant.image = image.pngData()!
        restaurant.summary = description
        restaurant.isFavorite = false
        do {
            try context.save()
        } catch {
            print("Failed to save the record...")
            print(error.localizedDescription)
        }
    }
}
