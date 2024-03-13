//
//  WeightInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class WeightInputViewModel: ObservableObject {
    
    //State variables for tracking:
    @Published var selectedWeight: String    //Weight Value
    @Published var selectedWeightUnitIndex: Int   //Weight Unit Value (by index)
    
    init(selectedWeight: String = "", selectedWeightUnitIndex: Int = 0) {
        self.selectedWeight = selectedWeight
        self.selectedWeightUnitIndex = selectedWeightUnitIndex
    }
    
    func updateSelectedWeight(_ weight: String) {
        selectedWeight = weight
    }
    
    func updateSelectedWeightUnitIndex(_ weightUnitIndex: Int) {
        selectedWeightUnitIndex = weightUnitIndex
    }
    
}
