//
//  ContentView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-06-26.
//

import SwiftUI
import CoreData

struct RestaurantListView: View {

    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Restaurant.entity(),
                  sortDescriptors: [])
    var restaurants: FetchedResults<Restaurant>

    @State private var showNewRestaurantView = false
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    var body: some View {
        NavigationStack {
            List {
                if restaurants.isEmpty {
                    EmptyView()
                } else {
                    ForEach(restaurants.indices, id: \.self) { index in
                        ZStack {
                            NavigationLink(destination: {
                                RestaurantDetailView(restaurant: restaurants[index])
                            }, label: {
                                EmptyView()
                            }).opacity(0)
                            
                            BasicTextImageView(restaurant: restaurants[index])
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button(action: {}, label: {
                                Image(systemName: "heart")
                            })
                            .tint(.green)
                            
                            Button(action: {}, label: {
                                Image(systemName: "square.and.arrow.up")
                            })
                            .tint(.orange)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteRecord(indexSet: indexSet)
                    })
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("🥙 Food Pin")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewRestaurantView = true
                    } label: {
                        Image(systemName: "plus")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color(uiColor: .systemRed))
                }
            }
            .sheet(isPresented: $showNewRestaurantView) {
                NewRestaurantView()
            }
        }
        .tint(Color.white)
    }
    
    private func deleteRecord(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = restaurants[index]
            context.delete(itemToDelete)
        }
        
        DispatchQueue.main.async {
            do {
                try context.save()
            } catch {
                print("❌ Error in \(#function) ", error)
            }
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
        RestaurantListView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Restaurant List View (Dark)")
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
        BasicTextImageView(restaurant: (PersistenceController.testData?.first)!)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("BasicTextImageRow")

        FullImageRow(restaurant: (PersistenceController.testData?.first)!)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("FullImageRow")
    }
}

struct BasicTextImageView: View {
    
    @ObservedObject var restaurant: Restaurant
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20)
        {
            Image(uiImage: UIImage(data: restaurant.image) ?? UIImage())
                .resizable()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .lineLimit(2)
                    .font(.custom("Nunito-Bold", size: 24, relativeTo: .title2))
                    
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
                
            }
            
            
            Spacer()
            
            Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.red)
        }
        .contentShape(Rectangle())
        .contextMenu(menuItems: {
            Button("Reserve a table") {
                self.showError.toggle()
            }
            
            Button( restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite") {
                self.restaurant.isFavorite.toggle()
            }
            
            Button {
                self.showOptions.toggle()
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.up.arrow")
                }
            }

        })
        .alert("Not yet available", isPresented: $showError)
        {
            Button("OK") { }
        } message:
        {
            Text("Sorry, this feature is not yet available. Please try again later.")
        }
        .sheet(isPresented: $showOptions) {
            let defaultText = "Just checking in at \(restaurant.name)"
            if let imageToShare = UIImage(data: restaurant.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
        
    }
}


struct FullImageRow: View {
    
    @ObservedObject var restaurant: Restaurant
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(uiImage: UIImage(data: restaurant.image) ?? UIImage())
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
                
                Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
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
