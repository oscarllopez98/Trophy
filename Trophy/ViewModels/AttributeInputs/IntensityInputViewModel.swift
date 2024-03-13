//
//  IntensityInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class IntensityInputViewModel: ObservableObject {
    //State variables for tracking:
    @Published var selectedIntensity: String    //Intensity Value
    @Published var selectedIntensityUnitIndex: Int   //Intensity Value (by index)
    
    init(selectedIntensity: String = "", selectedIntensityUnitIndex: Int = 0) {
        self.selectedIntensity = selectedIntensity
        self.selectedIntensityUnitIndex = selectedIntensityUnitIndex
    }
    
    func updateSelectedIntensity(_ intensity: String) {
        selectedIntensity = intensity
    }
    
    func updateSelectedIntensityUnitIndex(_ intensityUnitIndex: Int) {
        selectedIntensityUnitIndex = intensityUnitIndex
    }
}
