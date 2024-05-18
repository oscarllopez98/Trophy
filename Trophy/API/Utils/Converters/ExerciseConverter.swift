//
//  ExerciseConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/18/24.
//

import Foundation

class ExerciseConverter {
    
    func convertExerciseJSONResponseToExercise(_ exerciseJSONResponse: [String: Any]) -> Exercise {
        // Access the main dictionary
        if let exercise = exerciseJSONResponse["exercise"] as? [String: Any] {
            
            var exerciseId: String? = nil
            var exerciseName: String = ""
            var exerciseType: ExerciseType = .other
            var exerciseDate: Date = .now
            var exerciseAttributes: [Exercise.AttributeName : ExerciseAttribute] = [:]
            var exerciseNotes: String? = nil
            
            // Access the 'id'
            if let id = exercise["id"] as? String {
                print("Exercise ID: \(id)")
                exerciseId = id
            }
            
            // Access the 'name'
            if let name = exercise["name"] as? String {
                print("Exercise Name: \(name)")
                exerciseName = name
            }
            
            // Access the 'exerciseType'
            if let type = exercise["exerciseType"] as? String {
                print("Exercise Type: \(type)")
                exerciseType = ExerciseType(from: type)!
            }
            
            // Access the 'date'
            if let date = exercise["date"] as? String {
                print("Date: \(date)")
            }
            
            // Access the 'notes'
            if let notes = exercise["notes"] as? String {
                print("Notes: \(notes)")
            }
            
            // Access the 'attributes' dictionary
            if let attributes = exercise["attributes"] as? [String: Any] {
                // Access each attribute
                if let distance = attributes["distance"] as? [String: Any] {
                    if let distanceValue = distance["value"] as? Double,
                       let distanceUnit = distance["unit"] as? String {
                        print("Distance: \(distanceValue) \(distanceUnit)")
                    }
                }
                
                if let intensity = attributes["intensity"] as? [String: Any] {
                    if let intensityValue = intensity["value"] as? String {
                        print("Intensity: \(intensityValue)")
                    }
                }
                
                if let level = attributes["level"] as? [String: Any] {
                    if let levelValue = level["value"] as? Int {
                        print("Level: \(levelValue)")
                    }
                }
                
                if let reps = attributes["reps"] as? [String: Any] {
                    if let repsValue = reps["value"] as? Int {
                        print("Reps: \(repsValue)")
                    }
                }
                
                if let sets = attributes["sets"] as? [String: Any] {
                    if let setsValue = sets["value"] as? Int {
                        print("Sets: \(setsValue)")
                    }
                }
                
                if let time = attributes["time"] as? [String: Any] {
                    if let timeValue = time["value"] as? Double {
                        print("Time: \(timeValue)")
                    }
                }
                
                if let weight = attributes["weight"] as? [String: Any] {
                    if let weightValue = weight["value"] as? Double,
                       let weightUnit = weight["unit"] as? String {
                        print("Weight: \(weightValue) \(weightUnit)")
                    }
                }
            }
            
            // Create the Exercise Object
            return ExerciseFactory.shared.createTestExerciseV2()
        } else {
            print("Exercise not found in response")
        }
        return ExerciseFactory.shared.createTestExerciseV2()
    }
    
}
