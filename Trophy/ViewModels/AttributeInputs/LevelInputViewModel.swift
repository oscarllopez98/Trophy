//
//  LevelInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class LevelInputViewModel: ObservableObject {
    @Published var selectedLevelUnitIndex: Int {
        didSet {
            isEdited = true
        }
    }
    var isEdited: Bool = false
    
    init(selectedLevelUnitIndex: Int = 0) {
        self.selectedLevelUnitIndex = selectedLevelUnitIndex
    }
    
    func updateSelectedLevelUnitIndex(_ levelUnitIndex: Int) {
        selectedLevelUnitIndex = levelUnitIndex
    }
}
