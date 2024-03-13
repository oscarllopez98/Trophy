//
//  LevelInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class LevelInputViewModel: ObservableObject {
    //State variables for tracking:
    @Published var selectedLevelUnitIndex: Int   //Level Unit Value (by index)
    
    init(selectedLevelUnitIndex: Int = 0) {
        self.selectedLevelUnitIndex = selectedLevelUnitIndex
    }
    
    func updateSelectedLevelUnitIndex(_ levelUnitIndex: Int) {
        selectedLevelUnitIndex = levelUnitIndex
    }
}
