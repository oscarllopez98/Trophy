//
//  ExerciseCardViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/2/24.
//

import Foundation
import SwiftUI

class ExerciseCardViewModel: ObservableObject {
    @Published var exercise: Exercise
    
    // Computed property for UI
    var displayedAttributes: [Exercise.AttributeName: ExerciseAttribute] {
        let prefixAttributes = Array(exercise.attributes.prefix(3))
        return Dictionary(uniqueKeysWithValues: prefixAttributes)
    }
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    // Sample method to provide mock data
    static func sample() -> ExerciseCardViewModel {
        // Create sample attributes
        let attribute1 = DistanceAttribute(distance: 9999.99, unit: DistanceUnit(distanceSymbol: .km))
        let attribute2 = WeightAttribute(weight: 9999.99, unit: WeightUnit(weightSymbol: .lb))
        let attribute3 = RepsAttribute(reps: 999)
        let attribute4 = SetsAttribute(sets: 999)
        let attribute5 = LevelAttribute(value: .nine)
        let attribute6 = IntensityAttribute(value: .high)
        let attribute7 = TimeAttribute(time: 86399)
        
        // Create a sample exercise
        let sampleExercise = Exercise(
            id: UUID(uuidString: "1111AAAA0000BBBB"),
            name: "Sample Exercise",
            type: .strength,
            attributes: [
                .distance: attribute1,
                .weight: attribute2,
                .reps: attribute3,
                .sets: attribute4,
                .level: attribute5,
                .intensity: attribute6,
                .time: attribute7
            ],
            date: Date(),
            duration: nil,
            notes: "Sample notes for the exercise."
        )
        
        // Return a ViewModel with the sample exercise
        return ExerciseCardViewModel(exercise: sampleExercise)
    }
}
