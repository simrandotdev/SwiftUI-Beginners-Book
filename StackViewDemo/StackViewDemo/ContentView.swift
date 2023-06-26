//
//  ContentView.swift
//  StackViewDemo
//
//  Created by Simran Preet Narang on 2023-06-20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Instance Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                Text("Get help from experts in 15 minutes")
            }
            
            HStack(alignment: .bottom, spacing: 10) {
                Image("user1")
                    .resizable()
                    .scaledToFit()
                Image("user2")
                    .resizable()
                    .scaledToFit()
                Image("user3")
                    .resizable()
                    .scaledToFit()
            }
            .horizontalPadding()
            
            Text("Need help with coding problems? Register?")
            
            Spacer()
            
            if verticalSizeClass == .compact {
                HSignupButtonGroup()
            } else {
                VSignupButtonGroup()
            }
        }
        .padding(.top, 30)
    }
}

#Preview {
    ContentView()
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
    
    func horizontalPadding(length: CGFloat? = nil) -> some View {
        return padding(.horizontal, length)
    }
    
    func verticalPadding(length: CGFloat? = nil) -> some View {
        return padding(.vertical, length)
    }
}

enum Stack {
    case HStack
    case VStack
    case ZStack
}

struct VSignupButtonGroup: View {
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text("Sign Up")
            })
            .frame(width: 200)
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.indigo)
            .cornerRadius(10)
            
            Button(action: {}, label: {
                Text("Login")
            })
            .frame(width: 200)
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}

struct HSignupButtonGroup: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Text("Sign Up")
            })
            .frame(width: 200)
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.indigo)
            .cornerRadius(10)
            
            Button(action: {}, label: {
                Text("Login")
            })
            .frame(width: 200)
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}
