//
//  AddEntryViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI
import Combine

class AddEntryViewModel: ObservableObject {
    @Published var exerciseName: String = ""
    @Published var distanceViewModel = DistanceInputViewModel()
    @Published var timeViewModel = TimeInputViewModel()
    @Published var setsViewModel = SetsInputViewModel()
    @Published var repsViewModel = RepsInputViewModel()
    @Published var weightViewModel = WeightInputViewModel()
    @Published var intensityViewModel = IntensityInputViewModel()
    @Published var levelViewModel = LevelInputViewModel()
    
    func hasValidAttributes() -> Bool {
        if !exerciseName.isEmpty {
            return true
        }
        if let distance = Double(distanceViewModel.selectedDistance), distance > 0 {
            return true
        }
        let time = TimeInterval(timeViewModel.selectedHours * 3600 +
                                timeViewModel.selectedMinutes * 60 +
                                timeViewModel.selectedSeconds)
        if time > 0 {
            return true
        }
        if let sets = Int(setsViewModel.selectedSets), sets > 0 {
            return true
        }
        if let reps = Int(repsViewModel.selectedReps), reps > 0 {
            return true
        }
        if let weight = Double(weightViewModel.selectedWeight), weight > 0 {
            return true
        }
        if intensityViewModel.selectedIntensity != .unset {
            return true
        }
        if levelViewModel.selectedLevelUnitIndex > 0 {
            return true
        }
        return false
    }
}
