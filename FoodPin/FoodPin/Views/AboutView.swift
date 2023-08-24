//
//  AboutView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            List {
                Image("about")
                    .resizable()
                    .scaledToFit()
                Section {
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!, label: {
                        Label("Rate us on App Store", image: "store")
                            .foregroundColor(.primary)
                    })
                    Link(destination: URL(string: WebLink.feedback.rawValue)!, label: {
                        Label("Tell us your feedback", image: "chat")
                            .foregroundColor(.primary)
                    })
                }
                Section {
                    Link(destination: URL(string: WebLink.twitter.rawValue)!, label: {
                        Label("Twitter", image: "twitter")
                            .foregroundColor(.primary)
                    })
                    Link(destination: URL(string: WebLink.facebook.rawValue)!, label: {
                        Label("Facebook", image: "facebook")
                            .foregroundColor(.primary)
                    })
                    Link(destination: URL(string: WebLink.instagram.rawValue)!, label: {
                        Label("Instagram", image: "instagram")
                            .foregroundColor(.primary)
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

enum WebLink: String {
    case rateUs = "https://www.apple.com/ios/app-store"
    case feedback = "https://www.appcoda.com/contact"
    case twitter = "https://www.twitter.com/appcodamobile"
    case facebook = "https://www.facebook.com/appcodamobile"
    case instagram = "https://www.instagram.com/appcodadotcom"
}
