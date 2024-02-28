//
//  ExerciseFactory.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class ExerciseFactory {
    // Singleton instance
    static let shared = ExerciseFactory()
    
    private init() {}
    
    func createTestExercise() -> Exercise {
        let id = UUID()
        return Exercise(id: id,
                        name: "Test Exercise!",
                        type: .other,
                        attributes: [.level: LevelAttribute(value: .five)],
                        date: Date(),
                        duration: 10,
                        notes: "These are the notes of my Test Exercise :)")
    }
    
    func createNewExercise(name: String, type: ExerciseType, attributes: [Exercise.AttributeName: ExerciseAttribute], date: Date, duration: TimeInterval? = nil, notes: String? = nil) -> Exercise {
        let id = UUID()
        return Exercise(id: id,
                        name: name,
                        type: type,
                        attributes: attributes,
                        date: date,
                        duration: duration,
                        notes: notes)
    }
}
