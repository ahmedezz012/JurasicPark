//
//  SortButton.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 09/03/2024.
//

import SwiftUI

struct SortButton: View {
    
    var onClick: () -> Void
    var alphapitical: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.default, {
                onClick()
            })
        }, label: {
            Image(systemName: alphapitical ? "film" : "textformat")
                .symbolEffect(.bounce, value: alphapitical)
        })
    }
}

#Preview {
    SortButton(onClick: { }, alphapitical: true)
}
