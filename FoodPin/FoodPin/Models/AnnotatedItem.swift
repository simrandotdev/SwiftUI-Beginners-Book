//
//  AnnotatedItem.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-21.
//

import Foundation
import CoreLocation

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinates: CLLocationCoordinate2D
}
