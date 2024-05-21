//
//  WorkoutValidationHelper.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class WorkoutValidationHelper {
    
    //Validate Workout Name
    static func validateName(_ name: String) -> Bool {
        return !name.isEmpty && !(name.count > 20)
    }
    
    //Validate Workout Exercises meet Workout requirements
    static func validateExercises(_ exercises: [Exercise]) -> Bool {
        //Invalid if list is empty
        if (exercises.isEmpty) {
            return false
        }
        
        //Invalid if list contains 1+ references to the same Exercise
        var exerciseIDSet: Set<UUID> = []
        for exercise in exercises {
            if (exerciseIDSet.contains(exercise.id!)) {
                return false
            } else {
                exerciseIDSet.insert(exercise.id!)
            }
        }
        
        //Invalid if list contains more than 10 Exercises
        if (exercises.count > 10) {
            return false
        }
        
        //If none other are false, then we return true
        return true
    }
}
