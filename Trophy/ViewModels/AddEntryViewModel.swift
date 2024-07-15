//
//  AddEntryViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI
import Combine

class AddEntryViewModel: ObservableObject {
    
    // Input fields
    @Published var exerciseName: String = ""
    @Published var distanceViewModel: DistanceInputViewModel
    @Published var timeViewModel: TimeInputViewModel
    @Published var setsViewModel: SetsInputViewModel
    @Published var repsViewModel: RepsInputViewModel
    @Published var weightViewModel: WeightInputViewModel
    @Published var intensityViewModel: IntensityInputViewModel
    @Published var levelViewModel: LevelInputViewModel
    
    // Initialization
    init() {
        self.distanceViewModel = DistanceInputViewModel()
        self.timeViewModel = TimeInputViewModel()
        self.setsViewModel = SetsInputViewModel()
        self.repsViewModel = RepsInputViewModel()
        self.weightViewModel = WeightInputViewModel()
        self.intensityViewModel = IntensityInputViewModel()
        self.levelViewModel = LevelInputViewModel()
    }
    
    // Save exercise method
    func saveExercise() {
        // Validate inputs
        guard !exerciseName.isEmpty else {
            // Handle error: Exercise name is required
            return
        }
        
        // Example: Construct Exercise object
        let exercise = Exercise(name: exerciseName, type: .other, attributes: [
            .distance: DistanceAttribute(distance: Double(distanceViewModel.selectedDistance) ?? 0.0, 
                                         unit: DistanceUnit(distanceSymbol: distanceViewModel.selectedDistanceUnit)),
            .time: TimeAttribute(time: TimeInterval(
                timeViewModel.selectedHours * 3600 +
                timeViewModel.selectedMinutes * 60 +
                timeViewModel.selectedSeconds)),
            .sets: SetsAttribute(sets: Int(setsViewModel.selectedSets) ?? 0),
            .reps: RepsAttribute(reps: Int(repsViewModel.selectedReps) ?? 0),
            .weight: WeightAttribute(weight: Double(weightViewModel.selectedWeight) ?? 0.0, 
                                     unit: WeightUnit(weightString: weightViewModel.selectedWeight)!),
            .intensity: IntensityAttribute(value: IntensityAttribute.Intensity(rawValue: intensityViewModel.selectedIntensity)!),
            .level: LevelAttribute(value: LevelAttribute.Level(rawValue: levelViewModel.selectedLevelUnitIndex)!)
        ], date: Date())
        
        // Example: Save exercise to database or perform further actions
        print("Saving exercise:", exercise)
    }
}
