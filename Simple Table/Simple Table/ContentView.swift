//
//  ContentView.swift
//  Simple Table
//
//  Created by Simran Preet Narang on 2023-06-25.
//

import SwiftUI

struct ContentView: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var body: some View {
        List(restaurantNames, id: \.self) { restaurantName in
            HStack {
                Image(restaurantName)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(restaurantName)
            }
        }
        .listStyle(.plain   )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
