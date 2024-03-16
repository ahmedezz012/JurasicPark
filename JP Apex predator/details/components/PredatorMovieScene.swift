//
//  PredatorMovieScene.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 02/03/2024.
//

import SwiftUI

struct PredatorMovieScene: View {
    var movieScenes: [Predator.MovieScene]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Movie moments:")
                .font(.title)
            
            ForEach(movieScenes) { scene in
                Text(scene.movie)
                    .font(.title2)
                    .padding(.vertical, 1)
                Text(scene.sceneDescription)
                    .padding(.bottom, 30)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    PredatorMovieScene(movieScenes: [])
}
