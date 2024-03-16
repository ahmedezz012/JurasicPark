//
//  PredatorImage.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 02/03/2024.
//

import SwiftUI

struct PredatorImage: View {
    var predator: Predator
    var body: some View {
            ZStack(alignment: .bottomTrailing) {
                Image(getImage(type: predator.predatorType))
                    .resizable()
                    .frame(height: 250)
                    .overlay {
                        LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.0),
                                               Gradient.Stop(color: .black.opacity(0.5), location: 1.0)],
                                       startPoint: .top, endPoint: .bottom)
                    }
        
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 250)
                    .scaleEffect(x: -1)
                    .shadow(color: Color.white, radius: 10)
                    .offset(y: 30)
            }.background(Color.red)
    }
    
    private func getImage(type: Predator.PredatorType) -> ImageResource {
        if type == .sea {
            return .sea
        } else if type == .air {
            return .air
        } else {
            return .land
        }
    }
}

#Preview {
    PredatorImage(predator: PredatorCreator().predatorsList[6])
}
