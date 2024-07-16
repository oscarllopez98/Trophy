//
//  AddEntryViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI
import Combine

class AddEntryViewModel: ObservableObject {
    @Published var exerciseName: String
    @Published var distanceViewModel: DistanceInputViewModel
    @Published var timeViewModel: TimeInputViewModel
    @Published var setsViewModel: SetsInputViewModel
    @Published var repsViewModel: RepsInputViewModel
    @Published var weightViewModel: WeightInputViewModel
    @Published var intensityViewModel: IntensityInputViewModel
    @Published var levelViewModel: LevelInputViewModel
    
    init() {
        self.exerciseName = getDefaultTitle() // Initialize with default title
        self.distanceViewModel = DistanceInputViewModel()
        self.timeViewModel = TimeInputViewModel()
        self.setsViewModel = SetsInputViewModel()
        self.repsViewModel = RepsInputViewModel()
        self.weightViewModel = WeightInputViewModel()
        self.intensityViewModel = IntensityInputViewModel()
        self.levelViewModel = LevelInputViewModel()
    }
    
    struct ValidationResult {
        let isValid: Bool
        let message: String
    }
    
    func validateInputs(exerciseName: String) -> ValidationResult {
        var messages: [String] = []
        
        if exerciseName.isEmpty {
            messages.append("You need to have an exercise name to continue.")
        }
        
        var validAttribute = false
        
        if let distance = Double(distanceViewModel.selectedDistance), distance > 0 {
            validAttribute = true
        }
        
        let time = TimeInterval(timeViewModel.selectedHours * 3600 +
                                timeViewModel.selectedMinutes * 60 +
                                timeViewModel.selectedSeconds)
        if time > 0 {
            validAttribute = true
        }
        
        if let sets = Int(setsViewModel.selectedSets), sets > 0 {
            validAttribute = true
        }
        
        if let reps = Int(repsViewModel.selectedReps), reps > 0 {
            validAttribute = true
        }
        
        if let weight = Double(weightViewModel.selectedWeight), weight > 0 {
            validAttribute = true
        }
        
        if !intensityViewModel.selectedIntensity.isEmpty {
            validAttribute = true
        }
        
        if levelViewModel.selectedLevelUnitIndex > 0 {
            validAttribute = true
        }
        
        if !validAttribute {
            messages.append("You need to fill out at least 1 exercise attribute.")
        }
        
        return ValidationResult(isValid: messages.isEmpty, message: messages.joined(separator: "\n"))
    }
}

private func getDefaultTitle() -> String {
    let date = Date()
    let calendar = Calendar.current
    
    // Get time of day from the current date
    let hour = calendar.component(.hour, from: date)
    
    // Get the weekday component from the current date
    let weekday = calendar.component(.weekday, from: date)

    // Convert the weekday component (1-7) to a weekday name (Sunday-Saturday)
    let weekdaySymbols = calendar.weekdaySymbols
    let dayOfWeek = weekdaySymbols[weekday - 1]
    
    // Check if Morning
    if (hour >= 4 && hour < 12) {
        return "\(dayOfWeek) Morning Exercise"
    }
    // Else, Check if Afternoon
    else if (hour >= 12 && hour < 18){
        return "\(dayOfWeek) Afternoon Exercise"
    }
    // Else, Check if Evening
    else if (hour >= 18 && hour < 21) {
        return "\(dayOfWeek) Evening Exercise"
    }
    // Else, Set Night
    else {
        return "\(dayOfWeek) Night Exercise"
    }
}
