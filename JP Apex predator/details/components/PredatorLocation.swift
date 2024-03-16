//
//  PredatorLocation.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 02/03/2024.
//

import SwiftUI
import MapKit

struct PredatorLocation: View {
    var location: CLLocationCoordinate2D
    var name: String
        
    var body: some View {
        Map(initialPosition:
                .camera(MapCamera(centerCoordinate: location,
                                  distance: 30000))) {
            Annotation(name, coordinate: location) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .symbolEffect(.pulse)
            }
            .annotationTitles(.hidden)
        }
        .frame(height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .overlay(alignment: .topLeading) {
            Text("Predator location")
                .foregroundStyle(.cyan)
                .padding(.horizontal)
                .padding(.vertical, 2)
                .background(Color.black.opacity(0.5))
                .clipShape(.rect(bottomTrailingRadius: 25.0))
        }
        .overlay(alignment: .trailing) {
            Image(systemName: "arrowshape.forward.fill")
                .opacity(0.5)
                .imageScale(.large)
                .font(.title3)
                .padding(.trailing, 10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PredatorLocation(location: CLLocationCoordinate2D(latitude: 20, longitude: 30), name: "trex")
}
