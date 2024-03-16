//
//  ContentView.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 01/03/2024.
//

import SwiftUI

struct PredatorsListScreen: View {
    private let predatorCreator = PredatorCreator()
    
    @State var searchText = ""
    @State var alphapitical = false
    
    @State var selectedType: Predator.PredatorType = .all
    

    
    var body: some View {
        NavigationStack {
            List(predatorCreator.filterableList(selectedType: selectedType, alphapitical: alphapitical, searchText: searchText)) { predator in
                NavigationLink {
                    PredatorDetailsScreen(predator: predator)
                } label:{ 
                    PredatorItem(predator: predator)
                }
            }
            .navigationTitle("Jurassic")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    SortButton(onClick: {
                        alphapitical.toggle()
                    }, alphapitical: alphapitical)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    FilterButton(selectedType: $selectedType)
                }
            }
        }
        .searchable(text: $searchText)
        .autocorrectionDisabled()
        .animation(.default, value: searchText)
    }
}

#Preview {
    PredatorsListScreen()
}
