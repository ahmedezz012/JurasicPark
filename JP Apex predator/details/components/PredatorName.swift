//
//  PredatorName.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 02/03/2024.
//

import SwiftUI

struct PredatorName: View {
    var name: String
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

#Preview {
    PredatorName(name: "TRex")
}
