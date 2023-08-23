//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-22.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var restaurantName = ""
    @State private var restaurantType = ""
    @State private var restaurantAddress = ""
    @State private var restaurantPhone = ""
    @State private var restaurantDescription = ""
    @State private var restaurantImage = UIImage(named: "newphoto")!
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(uiImage: restaurantImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding(.bottom)
                        .onTapGesture {
                            showPhotoOptions = true
                        }
                    
                    FormTextField(label: "NAME", placeHolder: "Fill in the restaurant name", value: $restaurantName)
                    
                    FormTextField(label: "TYPE", placeHolder: "Fill in the restaurant type", value: $restaurantType)
                    
                    FormTextField(label: "ADDRESS", placeHolder: "Fill in the restaurant address", value: $restaurantAddress)
                    
                    FormTextField(label: "PHONE", placeHolder: "Fill in the restaurant phone", value: $restaurantPhone)
                    
                    FormTextView(label: "DESCRIPTION", value: $restaurantDescription)
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
            .confirmationDialog("Selct a photo source", isPresented: $showPhotoOptions) {
                Button {
                    photoSource = .camera
                } label: {
                    Text("Camera")
                }

                Button {
                    photoSource = .photoLibrary
                } label: {
                    Text("Photo Library")
                }
            }
            .fullScreenCover(item: $photoSource) { source in
                switch source {
                case .camera:
                    ImagePicker(sourceType: .camera, selectedImage: $restaurantImage)
                case .photoLibrary:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantImage)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(Color(uiColor: .systemRed))
                    }
                }
            }
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
    }
}

extension NewRestaurantView {
    enum PhotoSource: Identifiable {
        case photoLibrary
        case camera
        var id: Int {
            hashValue
        }
    }
}
