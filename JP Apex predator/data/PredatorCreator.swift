//
//  Predator.swift
//  JP Apex predator
//
//  Created by Ahmed Ezz on 01/03/2024.
//

import Foundation


class PredatorCreator {
    var fullList: [Predator] = []
    var predatorsList: [Predator] = []
    
    init() {
        decode()
    }
    
    func decode() {
        let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json")
        
        if let nonNilUrl = url {
            do {
                let data = try Data(contentsOf: nonNilUrl)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                fullList = try decoder.decode([Predator].self, from: data)
                predatorsList = fullList
            } catch {
                print("error is \(error)")
            }
        }
    }
    
    func filterableList(selectedType: Predator.PredatorType, alphapitical: Bool, searchText: String) -> [Predator] {
         filter(by: selectedType)
         sort(by: alphapitical)
         return search(searchText: searchText)
    }
    
    private func search(searchText: String) -> [Predator] {
        if searchText.isEmpty {
            return predatorsList
        } else {
            return predatorsList.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private func sort(by alphapitical: Bool) {
        predatorsList.sort { p1, p2 in
            if alphapitical {
                p1.name < p2.name
            } else {
                p1.id < p2.id
            }
        }
    }
    
    private func filter(by selectedType: Predator.PredatorType) {
        if selectedType == .all {
            predatorsList = fullList
        } else {
            predatorsList = fullList.filter { predator in
                predator.predatorType == selectedType
            }
        }
    }
}
