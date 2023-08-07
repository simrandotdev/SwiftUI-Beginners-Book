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
        ScrollView {
            VStack(alignment: .leading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 445)
                    .overlay {
                        VStack {
                            Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                .font(.system(size: 30))
                                .foregroundColor(.red)
                                .padding(.top, 70)
                                .padding(.trailing, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(restaurant.name)
                                .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                                .bold()
                            
                            Text(restaurant.type)
                                .font(.system(.headline, design: .rounded))
                                .padding(.all, 5)
                                .background(Color.black)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.bottom, 24)
                    }
                
                Text(restaurant.description)
                    .padding()
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("ADDRESS")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.location)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("PHONE")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.phone)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                MapView(location: restaurant.location)
                    .frame(maxWidth: .infinity, minHeight: 200)
                    .padding(.bottom, 100)
            }
            .padding(.vertical, -30)
        }
        .ignoresSafeArea()
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
