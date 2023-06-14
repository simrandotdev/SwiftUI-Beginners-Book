//
//  ContentView.swift
//  HelloWorld
//
//  Created by Simran Preet Narang on 2023-06-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text("Tap me!")
                    .font(.system(.title, design: .rounded, weight: .heavy))
            })
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
