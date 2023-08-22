//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-22.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @State private var restaurantName = ""
    @State private var restaurantType = ""
    @State private var restaurantAddress = ""
    @State private var restaurantPhone = ""
    @State private var restaurantDescription = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    FormTextField(label: "NAME", placeHolder: "Fill in the restaurant name", value: $restaurantName)
                    
                    FormTextField(label: "TYPE", placeHolder: "Fill in the restaurant type", value: $restaurantType)
                    
                    FormTextField(label: "ADDRESS", placeHolder: "Fill in the restaurant address", value: $restaurantAddress)
                    
                    FormTextField(label: "PHONE", placeHolder: "Fill in the restaurant phone", value: $restaurantPhone)
                    
                    FormTextView(label: "DESCRIPTION", value: $restaurantDescription)
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
    }
}
