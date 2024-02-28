//
//  WorkoutFactory.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class WorkoutFactory {
    // Singleton instance
    static let shared = WorkoutFactory()
    
    private init() {}

    func createTestWorkout() -> Workout {
        let firstExercise = ExerciseFactory.shared.createTestExerciseWithName("First Exercise")
        let secondExercise = ExerciseFactory.shared.createTestExerciseWithName("Second Exercise")
        let thirdExercise = ExerciseFactory.shared.createTestExerciseWithName("Third Exercise")
        
        let workout = createWorkout(exerciseList: [firstExercise, secondExercise, thirdExercise])
        return workout
    }
    
    func createTestWorkoutWithName(_ name: String) -> Workout {
        let firstExercise = ExerciseFactory.shared.createTestExerciseWithName("First Exercise")
        let secondExercise = ExerciseFactory.shared.createTestExerciseWithName("Second Exercise")
        let thirdExercise = ExerciseFactory.shared.createTestExerciseWithName("Third Exercise")
        
        let workout = createWorkoutWithName(exerciseList: [firstExercise, secondExercise, thirdExercise], name: name)
        return workout
    }
    
    func createWorkout(exerciseList: [Exercise]) -> Workout {
        let id = UUID()
        let name = "My Workout"
        let date = Date()
        
        let workout = Workout(id: id, name: name, exercises: exerciseList, date: date)
        return workout
    }
    
    func createWorkout(exercise: Exercise) -> Workout {
        createWorkout(exerciseList: [exercise])
    }
    
    func createWorkoutWithName(exerciseList: [Exercise], name: String) -> Workout {
        let id = UUID()
        let date = Date()
        
        let workout = Workout(id: id, name: name, exercises: exerciseList, date: date)
        return workout
    }
    
}
