//
//  MockExerciseDatabase.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import SwiftUI
import Combine

class MockExerciseDatabase {
    
    static let shared = MockExerciseDatabase()
    @Published var exercises: [Exercise] = []

    func putExercise(_ exercise: Exercise) {
        exercises.insert(exercise, at: 0)
    }
}
