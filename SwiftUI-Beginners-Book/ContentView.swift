//
//  ContentView.swift
//  SwiftUI-Beginners-Book
//
//  Created by Simran Preet Narang on 2023-06-14.
//

import SwiftUI

struct ContentView: View {
    
    var views = [
        HearthAnimationChapter03Program01()
    ]
    
    var body: some View {
        NavigationStack {
            List(views, id: \.self) { view in
                NavigationLink(view.programTitle) {
                    view
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
