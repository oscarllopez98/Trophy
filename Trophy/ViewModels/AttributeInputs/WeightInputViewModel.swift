//
//  WeightInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class WeightInputViewModel: ObservableObject {
    @Published var selectedWeight: String {
        didSet {
            isEdited = true
        }
    }
    @Published var selectedWeightUnitIndex: Int {
        didSet {
            isEdited = true
        }
    }
    var isEdited: Bool = false
    
    init(selectedWeight: String = "", selectedWeightUnitIndex: Int = 0) {
        self.selectedWeight = selectedWeight
        self.selectedWeightUnitIndex = selectedWeightUnitIndex
    }
    
    var selectedWeightUnit: WeightUnit.Symbol {
        return WeightUnit.Symbol.allCases[selectedWeightUnitIndex]
    }
    
    func updateSelectedWeight(_ weight: String) {
        selectedWeight = weight
    }
    
    func updateSelectedWeightUnitIndex(_ weightUnitIndex: Int) {
        selectedWeightUnitIndex = weightUnitIndex
    }
}
