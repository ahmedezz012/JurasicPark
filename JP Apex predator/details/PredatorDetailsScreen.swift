//
//  PredatorDetailsScreen.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 02/03/2024.
//

import SwiftUI
import MapKit

struct PredatorDetailsScreen: View {
    var predator: Predator
    var body: some View {
        ScrollView() {
            PredatorImage(predator: predator)
                
            VStack(alignment: .leading) {
                PredatorName(name: predator.name)
                    .padding(.bottom, 10)
                
                NavigationLink {
                    MapScreen(position: .camera(MapCamera(centerCoordinate: predator.location, distance: 1000, heading: 250, pitch: 80)))
                } label: {
                    PredatorLocation(location: predator.location, name: predator.name)
                }
      
                PredatorAppearsIn(movies: predator.movies)
                    .padding(.bottom, 10)
                PredatorMovieScene(movieScenes: predator.movieScenes)
                
                ExternalWebLinkView(predatorName: predator.name, predatorUrl: predator.link,style: getColor(type: predator.predatorType))
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
        }
    }
    
    
    func getColor(type: Predator.PredatorType) -> Color {
        if type == .sea {
            return Color.cyan
        } else if type == .air {
            return Color.gray
        } else {
            return Color.brown
        }
    }
}

#Preview {
    PredatorDetailsScreen(predator: PredatorCreator().predatorsList[10])
}
