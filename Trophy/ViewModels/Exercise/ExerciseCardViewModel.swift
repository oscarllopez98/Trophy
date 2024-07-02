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
    
    // Computed properties for UI
    var displayedAttributes: [ExerciseAttribute] {
        return Array(exercise.attributes.values.prefix(3))
    }
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    // Sample method to provide mock data
    static func sample() -> ExerciseCardViewModel {
        // Create sample attributes
        let attribute1 = DistanceAttribute(distance: 20.0, unit: DistanceUnit(distanceSymbol: .km))
        let attribute2 = WeightAttribute(weight: 100.50, unit: WeightUnit(weightSymbol: .lb))
        let attribute3 = RepsAttribute(reps: 10)
        
        // Create a sample exercise
        let sampleExercise = Exercise(
            id: UUID(uuidString: "1111AAAA0000BBBB"),
            name: "Sample Exercise",
            type: .strength,
            attributes: [
                .distance: attribute1,
                .weight: attribute2,
                .reps: attribute3
            ],
            date: Date(),
            duration: 1800,
            notes: "Sample notes for the exercise."
        )
        
        // Return a ViewModel with the sample exercise
        return ExerciseCardViewModel(exercise: sampleExercise)
    }
}
