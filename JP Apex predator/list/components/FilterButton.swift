//
//  FilterButton.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 09/03/2024.
//

import SwiftUI

struct FilterButton: View {
    @Binding var selectedType: Predator.PredatorType 
    
    var body: some View {
        Menu {
            Picker("Filter", selection: $selectedType.animation(.easeIn)) {
                ForEach(Predator.PredatorType.allCases,id: \.self) { type in
                    Label {
                        Text(type.rawValue)
                    } icon: {
                        Image(systemName: getIcon(ofType: type))
                    }
                }
            }
        } label: {
            Image(systemName: "slider.horizontal.3")
        }
    }
    
    func getIcon(ofType type: Predator.PredatorType) -> String {
        if type == .sea {
            return "drop.fill"
        } else if type == .air {
            return "wind.circle.fill"
        } else if type == .land{
            return "leaf.fill"
        } else {
            return "square.stack.3d.up.fill"
        }
    }
}

#Preview {
    FilterButton(selectedType: .constant(.air))
}
