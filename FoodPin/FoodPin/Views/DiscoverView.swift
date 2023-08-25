//
//  DiscoverView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-25.
//

import SwiftUI
import CloudKit

struct DiscoverView: View {
    
    @StateObject private var cloudStore: RestaurantCloudStore = RestaurantCloudStore()
    
    var body: some View {
        NavigationStack {
            List(cloudStore.restaurants, id: \.recordID) { restaurant in
                HStack {
                    AsyncImage(url: getImageURL(restaurant: restaurant)){ image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.purple.opacity(0.1)
                    }
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    Text(restaurant.object(forKey: "name") as! String)
                }
            }
            .listStyle(PlainListStyle())
            .task {
                do {
                    try await cloudStore.fetchRestaurants()
                } catch {
                    print(error)
                }
            }
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func getImageURL(restaurant: CKRecord) -> URL? {
        guard let image = restaurant.object(forKey: "image"),
              let imageAsset = image as? CKAsset else {
            return nil
        }
        return imageAsset.fileURL
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
