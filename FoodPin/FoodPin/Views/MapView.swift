//
//  MapView.swift
//  FoodPin
//
//  Created by Simran Preet Narang on 2023-08-07.
//

import SwiftUI
import MapKit

struct MapView: View {
    var location: String = ""
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 51.510357,
            longitude: -0.116773
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 1.0,
            longitudeDelta: 1.0
        )
    )
    @State private var annotatedItems: [AnnotatedItem] = [
    ]
    
    init(location: String) {
        self.location = location
    }
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [], annotationItems: annotatedItems) { item in
            MapMarker(coordinate: item.coordinates, tint: .red)
        }
        .onAppear {
            convertAddress(location: location)
        }
    }
    
    private func convertAddress(location: String) {
        Task {
            do {
                let geoCoder = CLGeocoder()
                let placemarks = try await geoCoder.geocodeAddressString(location)
                guard let location = placemarks.first?.location else {
                    return
                }
                
                self.region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 1.0,
                        longitudeDelta: 1.0
                    )
                )
                self.annotatedItems.append(AnnotatedItem(coordinates: location.coordinate))
            } catch {
                print("❌ Error in \(#function) ", error)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: "")
    }
}
