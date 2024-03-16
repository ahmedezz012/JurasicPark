//
//  PredatorItem.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 01/03/2024.
//

import SwiftUI

struct PredatorItem: View {

    let predator: Predator
    
    var body: some View {
        HStack() {
            Image(predator.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .black, radius: 10)
            
            VStack(alignment: .leading) {
                Text(predator.name)
                    .fontWeight(.bold)
                
                Text(predator.type)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 2)
                    .background(getColor(type: predator.predatorType))
                    .clipShape(Capsule())
                
            }
            Spacer()
        }.frame(maxWidth: .infinity)
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
    PredatorItem(predator: PredatorCreator().predatorsList[0])
}
