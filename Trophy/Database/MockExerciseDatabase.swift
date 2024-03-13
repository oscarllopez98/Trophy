//
//  MockExerciseDatabase.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class MockExerciseDatabase: ExerciseDatabase {
    private var exercises: [Exercise] = []
    
    func saveExercise(_ exercise: Exercise) {
        exercises.append(exercise)
        print("Saved New Exercise: \(exercise.name)")
    }
}
