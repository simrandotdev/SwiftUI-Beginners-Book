//
//  ContentView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-06-26.
//

import SwiftUI

struct RestaurantListView: View {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney",
    "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/ Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)
    ]
    
    var body: some View {
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                BasicTextImageView(restaurant: $restaurants[index])
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        
        RestaurantListView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Restaurant List View (Dark)")
        
        BasicTextImageView(restaurant: .constant(.init(name: "Name", type: "Type", location: "Location", image: "royaload", isFavorite: false)))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("BasicTextImageRow")
        
        FullImageRow(restaurant: .constant(.init(name: "Name", type: "Type", location: "Location", image: "royaload", isFavorite: false)))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("FullImageRow")
    }
}

struct BasicTextImageView: View {
    
    @Binding var restaurant: Restaurant
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20)
        {
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
                
            }
            
            
            Spacer()
            
            if restaurant.isFavorite
            {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture
        {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do?",
                            isPresented: $showOptions,
                            titleVisibility: .visible)
        {
            Button("Reserve a table") {
                self.showError.toggle()
            }
            
            Button( restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite") {
                self.restaurant.isFavorite.toggle()
            }
        }
        .alert("Not yet available", isPresented: $showError)
        {
            Button("OK") { }
        } message:
        {
            Text("Sorry, this feature is not yet available. Please try again later.")
        }
        
        
    }
}


struct FullImageRow: View {
    
    @Binding var restaurant: Restaurant
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(restaurant.type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(restaurant.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Spacer()
                
                if restaurant.isFavorite
                {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
            }
            
        }
        .contentShape(Rectangle())
        .onTapGesture
        {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do?",
                            isPresented: $showOptions,
                            titleVisibility: .visible)
        {
            Button("Reserve a table") {
                self.showError.toggle()
            }
            
            Button( restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite") {
                self.restaurant.isFavorite.toggle()
            }
        }
        .alert("Not yet available", isPresented: $showError)
        {
            Button("OK") { }
        } message:
        {
            Text("Sorry, this feature is not yet available. Please try again later.")
        }
    }
}
