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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Stay Hungry, Stay Foolish")
//                .fontWeight(.bold)
//                .fontWeight(.heavy)
                .fontWeight(.black)
                .font(.largeTitle)
                .fontDesign(.rounded)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
