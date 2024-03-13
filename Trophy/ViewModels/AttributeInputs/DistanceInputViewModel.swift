//
//  DistanceInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class DistanceInputViewModel: ObservableObject {
    //Properties to hold the State
    @Published var selectedDistance: String = ""
    @Published var selectedDistanceUnitIndex: Int = 0
    
    //Computed property to get the selected distance unit
    var selectedDistanceUnit: DistanceUnit.Symbol {
        return DistanceUnit.Symbol.allCases[selectedDistanceUnitIndex]
    }
    
    //Function to update the selected distance
    func updateDistance(_ distance: String) {
        selectedDistance = distance
    }
    
    //Function to update the selected distance unit index
    func updateDistanceUnitIndes(_ index: Int) {
        selectedDistanceUnitIndex = index
    }
}
