//
//  Restaurant.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-06-29.
//

import Foundation

class Restaurant: ObservableObject {
    @Published var name: String
    @Published var type: String
    @Published var location: String
    @Published var phone: String
    @Published var description: String
    @Published var image: String
    @Published var isFavorite: Bool
    @Published var rating: Rating?
    
    init(name: String,
         type: String,
         location: String,
         phone: String,
         description: String,
         image: String,
         isFavorite: Bool,
         rating: Rating? = nil) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isFavorite = isFavorite
        self.rating = rating
    }
}
