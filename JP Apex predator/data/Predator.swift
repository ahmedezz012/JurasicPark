//
//  Predator.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 01/03/2024.
//

import Foundation
import MapKit

struct Predator: Decodable, Identifiable {
    let id: Int
    let name, type: String
    let latitude, longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        self.name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
        
    enum PredatorType: String, CaseIterable  {
        
        case all
        case land
        case air
        case sea
    }
    
    var predatorType: PredatorType {
        switch self.type {
        case "air":
            .air
        case "sea":
            .sea
        default:
           .land
        }
    }

    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie, sceneDescription: String
    }
}
