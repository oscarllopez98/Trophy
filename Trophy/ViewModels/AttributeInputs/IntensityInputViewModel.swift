//
//  IntensityInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class IntensityInputViewModel: ObservableObject {
    @Published var selectedIntensity: String {
        didSet {
            isEdited = true
        }
    }
    @Published var selectedIntensityUnitIndex: Int {
        didSet {
            isEdited = true
        }
    }
    var isEdited: Bool = false
    
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
