//
//  DistanceInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class DistanceInputViewModel: ObservableObject {
    @Published var selectedDistance: String {
        didSet {
            isEdited = true
        }
    }
    @Published var selectedDistanceUnitIndex: Int {
        didSet {
            isEdited = true
        }
    }
    var isEdited: Bool = false
    
    init(selectedDistance: String = "", selectedDistanceUnitIndex: Int = 0) {
        self.selectedDistance = selectedDistance
        self.selectedDistanceUnitIndex = selectedDistanceUnitIndex
    }
    
    var selectedDistanceUnit: DistanceUnit.Symbol {
        return DistanceUnit.Symbol.allCases[selectedDistanceUnitIndex]
    }
    
    func updateDistance(_ distance: String) {
        selectedDistance = distance
    }
    
    func updateDistanceUnitIndex(_ index: Int) {
        selectedDistanceUnitIndex = index
    }
}
