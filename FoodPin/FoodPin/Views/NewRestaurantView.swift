//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-22.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) var context
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    
    @ObservedObject var restaurantViewModel: NewRestaurantFormViewModel
    
    init() {
        let viewModel = NewRestaurantFormViewModel()
        viewModel.image = UIImage(named: "newphoto")!
        restaurantViewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(uiImage: restaurantViewModel.image)
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
                    
                    FormTextField(label: "NAME", placeHolder: "Fill in the restaurant name", value: $restaurantViewModel.name)
                    
                    FormTextField(label: "TYPE", placeHolder: "Fill in the restaurant type", value: $restaurantViewModel.type)
                    
                    FormTextField(label: "ADDRESS", placeHolder: "Fill in the restaurant address", value: $restaurantViewModel.location)
                    
                    FormTextField(label: "PHONE", placeHolder: "Fill in the restaurant phone", value: $restaurantViewModel.phone)
                    
                    FormTextView(label: "DESCRIPTION", value: $restaurantViewModel.description)
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
                    ImagePicker(sourceType: .camera, selectedImage: $restaurantViewModel.image)
                case .photoLibrary:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantViewModel.image)
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
                        restaurantViewModel.saveRestaurant(with: context)
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
