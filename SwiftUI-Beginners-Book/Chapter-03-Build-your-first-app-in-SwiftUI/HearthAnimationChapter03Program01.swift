//
//  HearthAnimationChapter03Program01.swift
//  SwiftUI-Beginners-Book
//
//  Created by Simran Preet Narang on 2023-06-14.
//

import SwiftUI

struct HearthAnimationChapter03Program01: View, Hashable {
    var programTitle = "Chapter 03 - Program - 1: HearthAnimation"
    static func == (lhs: HearthAnimationChapter03Program01, rhs: HearthAnimationChapter03Program01) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    @State private var sizeChange: Bool = false
    @State private var colorChange: Bool = false
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 200))
            .foregroundStyle(colorChange ? .yellow : .red)
            .scaleEffect(sizeChange ? 1.5 : 1.0)
            .animation(.default, value: colorChange)
            .animation(.spring, value: sizeChange)
            .onTapGesture {
                colorChange.toggle()
            }
            .onLongPressGesture {
                sizeChange.toggle()
            }
    }
}

#Preview {
    HearthAnimationChapter03Program01()
}
