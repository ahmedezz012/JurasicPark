//
//  PredatorAppearsIn.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 02/03/2024.
//

import SwiftUI

struct PredatorAppearsIn: View {
    var movies: [String]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Appears in:")
                .font(.title)
            
            ForEach(movies.indices) { index in
                Text("* \(movies[index])")
                    .padding(.horizontal, 5)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    PredatorAppearsIn(movies: [])
}
