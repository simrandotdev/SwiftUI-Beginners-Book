//
//  ReviewView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-21.
//

import SwiftUI

struct ReviewView: View {
    
    var restaurant: Restaurant
    @Binding var isDisplayed: Bool
    @State private var showRatings = false
    
    var body: some View {
        ZStack {
            
//            Image(restaurant.image)
//                .resizable()
//                .scaledToFill()
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .ignoresSafeArea()
            
            Color.black
                .opacity(0.6)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack {
                    Button {
                        withAnimation(.easeOut) {
                            isDisplayed = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                }
            }
            
            
            VStack(alignment: .leading) {
                ForEach(Rating.allCases, id: \.self) { rating in
                    Button(action: {
                        restaurant.rating = rating
                        isDisplayed = false
                    }, label: {
                        HStack {
                            Image(rating.image)
                            Text(rating.rawValue.capitalized)
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    })
                    .opacity(showRatings ? 1.0 : 0)
                    .offset(x: showRatings ? 0 : 1000)
                    .animation(
                        .spring(response: 0.75,
                                dampingFraction: 0.6,
                                blendDuration: 0.0)
                        .delay( (Double(Rating.allCases.firstIndex(of: rating)!) + 0.2) * 0.75),
                        value: showRatings
                    )
                }
            }
        }
        .onAppear {
            showRatings.toggle()
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(restaurant: Restaurant(name: "Cafe Deadend",
                                          type: "Coffee & Tea Shop",
                                          location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong",
                                          phone: "232-923423",
                                          description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.",
                                          image: "cafedeadend",
                                          isFavorite: true),
                   isDisplayed: .constant(false))
    }
}
