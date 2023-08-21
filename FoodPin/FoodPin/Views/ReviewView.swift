//
//  ReviewView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-21.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack {
                    Button {
                        
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
                    HStack {
                        Image(rating.image)
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
