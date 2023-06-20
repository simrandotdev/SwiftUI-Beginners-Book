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
                speak(text:"Hello World")
            }, label: {
                Text("Hello World")
                    .font(.system(.title, design: .rounded, weight: .heavy))
            })
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button(action: {
                speak(text:"Happy Programming")
            }, label: {
                Text("Happy Programming")
                    .font(.system(.title, design: .rounded, weight: .heavy))
            })
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        synthesizer.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    func navigationStack(withTitle title: String) -> some View {
        return NavigationStack {
            self
                .navigationTitle(title)
        }
    }
    
    
    func navigationStack(withTitle title: String, path: Binding<NavigationPath>) -> some View {
        return NavigationStack(path: path) {
            self
                .navigationTitle(title)
        }
    }
    
    func embedInZStack() -> some View {
        return ZStack {
            self
        }
    }
    
    func embedInHStack() -> some View {
        return HStack {
            self
        }
    }
    
    func embedInVStack() -> some View {
        return VStack {
            self
        }
    }
    
    func embedIn(stack: Stack) -> some View {
        switch stack {
        case .HStack:
            return AnyView(embedInHStack())
        case .VStack:
            return AnyView(embedInVStack())
        case .ZStack:
            return AnyView(embedInZStack())
        }
    }
    
    func backgroundColor(_ color: Color) -> some View {
        return ZStack {
            color
            self
        }
    }
    
    func navigationLink(destination: () -> some View) -> some View {
        return NavigationLink(destination: destination) {
            self
        }
    }
}

enum Stack {
    case HStack
    case VStack
    case ZStack
}
