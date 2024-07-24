//
//  SetsInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class SetsInputViewModel: ObservableObject {
    @Published var selectedSets: String {
        didSet {
            isEdited = true
        }
    }
    var isEdited: Bool = false
    
    init(selectedSets: String = "") {
        self.selectedSets = selectedSets
    }
    
    func updateSelectedSets(_ sets: String) {
        selectedSets = sets
    }
}
