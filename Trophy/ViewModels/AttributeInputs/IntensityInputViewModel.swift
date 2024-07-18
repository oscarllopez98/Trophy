//
//  IntensityInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class IntensityInputViewModel: ObservableObject {
    @Published var selectedIntensityUnitIndex: Int = 0
    
    var selectedIntensity: IntensityAttribute.Intensity {
        return IntensityAttribute.Intensity.allCases[selectedIntensityUnitIndex]
    }
}
