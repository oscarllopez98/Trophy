//
//  ExerciseViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class ExerciseViewModel {
    
    
    //Use Factory for creating the Test Exercise
    func getTestExercise() -> Exercise {
        return ExerciseFactory.shared.createTestExercise()
    }
    
    //Use Factory for creating the desired Exercise
    func createExercise(name: String,
                        type: ExerciseType,
                        attributes: [Exercise.AttributeName: ExerciseAttribute],
                        date: Date,
                        duration: TimeInterval? = nil,
                        notes: String? = nil) -> Exercise {
        
        return ExerciseFactory.shared.createNewExercise(name: name,
                                                        type: type,
                                                        attributes: attributes,
                                                        date: date,
                                                        duration: duration,
                                                        notes: notes)
    }
    
    
    
    //MARK: Getters
    
    func getExerciseID(_ exercise: Exercise) -> UUID {
        return exercise.id
    }
    
    func getExerciseName(_ exercise: Exercise) -> String {
        return exercise.name
    }
    
    func getExerciseType(_ exercise: Exercise) -> ExerciseType {
        return exercise.type
    }
    
    func getExerciseAttributes(_ exercise: Exercise) -> [Exercise.AttributeName: ExerciseAttribute] {
        return exercise.attributes
    }
    
    func getExerciseDate(_ exercise: Exercise) -> Date {
        return exercise.date
    }
    
    func getExerciseDuration(_ exercise: Exercise) -> TimeInterval {
        return exercise.duration ?? 0
    }
    
    func getExerciseNotes(_ exercise: Exercise) -> String {
        return exercise.notes ?? ""
    }
    
    
}
