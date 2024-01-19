//
//  Workout.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class Workout {
    
    //Members
    var id: UUID
    var name: String
    var exercises: [Exercise]
    var date: Date
    var duration: TimeInterval?
    var notes: String?
    
    init(id: UUID, name: String, exercises: [Exercise], date: Date, duration: TimeInterval? = nil, notes: String? = nil) {
        self.id = id
        self.name = name
        self.exercises = exercises
        self.date = date
        self.duration = sumExercisesDurations(exercises: exercises)
        self.notes = notes
    }
    
    private func sumExercisesDurations(exercises: [Exercise]) -> TimeInterval {
        exercises.reduce(0.0) { $0 + ($1.duration ?? 0) }
    }
    
    
}
