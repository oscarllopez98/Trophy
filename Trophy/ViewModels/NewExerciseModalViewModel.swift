//
//  NewExerciseModalViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class NewExerciseModalViewModel: ObservableObject {
    // State values for Custom Input Views
    @Published var newExerciseTitle: String = ""
    
    // View models for input views
    @Published var distanceInputViewModel = DistanceInputViewModel()
    @Published var timeInputViewModel = TimeInputViewModel()
    @Published var setsInputViewModel = SetsInputViewModel()
    @Published var repsInputViewModel = RepsInputViewModel()
    @Published var weightInputViewModel = WeightInputViewModel()
    @Published var intensityInputViewModel = IntensityInputViewModel()
    @Published var levelInputViewModel = LevelInputViewModel()
    
    // State trackers for expanded animation
    @Published var isExpandedDistance = false
    @Published var isExpandedTime = false
    @Published var isExpandedSets = false
    @Published var isExpandedReps = false
    @Published var isExpandedWeight = false
    @Published var isExpandedIntensity = false
    @Published var isExpandedLevel = false
    
    // Submit function
    func submit() {
        // Log all the current values where isExpanded == true
        print("Submit!")
        
        // Print Distance
        print("Distance: \(distanceInputViewModel.selectedDistance)")
        // Print Time
        print("Time (HH:MM:SS): \(timeInputViewModel.selectedHours):\(timeInputViewModel.selectedMinutes):\(timeInputViewModel.selectedSeconds)")
        // Print Sets
        print("Sets: \(setsInputViewModel.selectedSets)")
        // Print Reps
        print("Reps: \(repsInputViewModel.selectedReps)")
        // Print Weight
        print("Weight: \(weightInputViewModel.selectedWeight)")
        // Print Intensity
        print("Intensity: \(intensityInputViewModel.selectedIntensity)")
        // Print Level
        print("Level Index: \(levelInputViewModel.selectedLevelUnitIndex)")
    }
}

