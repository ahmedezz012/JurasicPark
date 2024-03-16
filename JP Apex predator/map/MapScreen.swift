//
//  MapScreen.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 16/03/2024.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    @State var position: MapCameraPosition
    @State var satellite: Bool = false
    
    var body: some View {
        Map(position: $position) {
            ForEach(PredatorCreator().fullList) { predator in
                Annotation("", coordinate: predator.location, content: {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1, y: 1)
                })
            }
           }.mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
            .overlay(alignment: .bottomTrailing) {
                Button(action: {
                    withAnimation(.spring) {
                        satellite.toggle()
                    }
                }, label: {
                    Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                        .font(.largeTitle)
                        .imageScale(.large)
                        .padding(5)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.trailing, 5)
                    
                })
            }
    }
}

#Preview {
    MapScreen(position: .camera(MapCamera(centerCoordinate: PredatorCreator().fullList[5].location, distance: 500, heading: 250, pitch: 80) ))
}
