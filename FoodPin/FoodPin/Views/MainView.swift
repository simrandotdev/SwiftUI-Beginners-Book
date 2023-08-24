//
//  MainView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            RestaurantListView()
                .tabItem {
                    Label("Favorites", systemImage: "tag.fill")
                }
                .tag(0)
            Text("Discover")
                .tabItem {
                    Label("Discover", systemImage: "wand.and.rays")
                }
                .tag(1)
            Text("About")
                .tabItem {
                    Label("About", systemImage: "square.stack")
                }
                .tag(2)
        }
        .accentColor(Color(uiColor: .red))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
