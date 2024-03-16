//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Ahmed Ezz on 07/10/2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    var predatorName: String
    var predatorUrl: String
    var style: Color
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Read more")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(predatorName,
                         destination: (URL(string: predatorUrl) ??
                    URL(string: "https://wikipedia.org"))!)
                }
                .foregroundStyle(style)
            }
        }
    }
}

#Preview {
    ExternalWebLinkView(predatorName: "TREx", predatorUrl: "www.googl.com",style: Color.red)
}
