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
        print("Exercise ID: \(exercise.id?.uuidString ?? "!{no_exercise_id_set}!")")
        print("Exercise Name: \(exercise.name)")
        print("Exercise Type: \(exercise.type.asString)")
        logExerciseAttributes(exercise)
        print("Exercise Date: \(exercise.date)")
        print("Exercise Notes: \(exercise.notes ?? "!{notes_not_set}!")")
        print("- - - - - - - - - - - - - - - - ")
    }
    
    func logExerciseAttributes(_ exercise: Exercise) {
        logExerciseAttributes(exercise.attributes)
    }
    
    func logExerciseAttributes(_ exerciseAttributes: [Exercise.AttributeName: ExerciseAttribute]) {
        for att in exerciseAttributes {
            print("Attribute '\(att.value.name)' with value '\(att.value.value)' and unit '\(att.value.unit?.symbolAsString ?? "NONE")'")
        }
    }
    
}
