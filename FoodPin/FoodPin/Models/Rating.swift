//
//  Rating.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-21.
//

import Foundation

enum Rating: String, CaseIterable {
    case awesome
    case good
    case okay
    case bad
    case terrible
    
    var image: String {
        switch self {
        case .awesome: return "love"
        case .good: return "cool"
        case .okay: return "happy"
        case .bad: return "sad"
        case .terrible: return "angry"
        }
    }
}
