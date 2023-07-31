//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-07-27.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var restaurant: Restaurant
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text(restaurant.name)
                Text(restaurant.type)
                Text(restaurant.location)
            }
            .padding()
            .padding(.horizontal, 20)
            .background(Color.black.opacity(0.85))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                }
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: .init(name: "Name", type: "Type", location: "Location", phone: "222-222-2222", description: "Some long format description here for the restaurant", image: "royaload", isFavorite: false))
    }
}
