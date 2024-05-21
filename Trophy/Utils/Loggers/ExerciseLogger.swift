//
//  ExerciseLogger.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/20/24.
//

import Foundation

class ExerciseLogger {
    
    func logExercise(_ exercise: Exercise) {
        print("- - - - - Exercise Log - - - - -")
        print("Exercise ID: \(exercise.id?.uuidString ?? "No Exercise ID Detected")")
        print("Exercise Name: \(exercise.name)")
        print("Exercise Type: \(exercise.type.asString)")
        logExerciseAttributes(exercise)
        print("Exercise Date: \(exercise.date)")
        print("Exercise Notes: \(exercise.notes ?? "No Notes Detected")")
        print("- - - - - - - - - - - - - - - - ")
    }
    
    func logExerciseAttributes(_ exercise: Exercise) {
        logExerciseAttributes(exercise.attributes)
    }
    
    func logExerciseAttributes(_ exerciseAttributes: [Exercise.AttributeName: ExerciseAttribute]) {
        for att in exerciseAttributes {
            print("Attribute name'\(att.value.name)' with value '\(att.value.value)' and unit '\(att.value.unit?.symbolAsString ?? "No Unit Detected")'")
        }
    }
    
}
