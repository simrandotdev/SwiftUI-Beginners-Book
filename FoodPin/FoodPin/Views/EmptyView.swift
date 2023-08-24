//
//  EmptyView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-23.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "questionmark")
                .font(.system(size: 62, weight: .bold, design: .rounded))
                .foregroundColor(Color(uiColor: .systemRed))
            Text("Your place seems really empty. Start by adding a few restaurants")
                .multilineTextAlignment(.center)
                .padding()
                .padding(.horizontal, 20)
                .foregroundColor(Color(uiColor: .systemGray))
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
