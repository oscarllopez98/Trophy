//
//  SetsInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class SetsInputViewModel: ObservableObject {
    //State variables for tracking:
    @Published var selectedSets: String    //Sets value
    
    init(selectedSets: String = "") {
        self.selectedSets = selectedSets
    }
    
    func updateSelectedSets(_ sets: String) {
        selectedSets = sets
    }
}
