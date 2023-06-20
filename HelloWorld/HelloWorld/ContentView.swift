//
//  ContentView.swift
//  HelloWorld
//
//  Created by Simran Preet Narang on 2023-06-14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Button(action: {
                let utterance = AVSpeechUtterance(string: "Hello World")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                
                synthesizer.speak(utterance)
            }, label: {
                Text("Hello World")
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
