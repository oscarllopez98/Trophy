//
//  ExerciseConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/18/24.
//

import Foundation

class ExerciseConverter {
    
    func convertExerciseJSONResponseToExercise(_ exerciseJSONResponse: [String: Any]) throws -> Exercise {
        // Access the main dictionary
        if let exercise = exerciseJSONResponse["exercise"] as? [String: Any] {
            
            var exerciseId: String? = nil
            var exerciseName: String = ""
            var exerciseType: ExerciseType = .other
            var exerciseDate: Date = .now
            var exerciseAttributes: [Exercise.AttributeName : ExerciseAttribute] = [:]
            var exerciseNotes: String? = nil
            
            print("'exercise' property found in response, converting to JSON")
            
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
                print("Exercise Type Converted: \(exerciseType.asString)")
            }
            
            // Access the 'date'
            if let date = exercise["date"] as? String {
                let dateString = date
                let dateFormatter = DateFormatter()

                // Define the date format string matching the input date string
                dateFormatter.dateFormat = "EEE MMM dd yyyy HH:mm:ss 'GMT'Z (zzzz)"
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Ensure locale is set to en_US_POSIX
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0) // Ensure time zone is set to GMT
                
                print("Date: \(date)")
                if let dateConverted = dateFormatter.date(from: dateString) {
                    print("Date Converted: \(dateConverted)")
                    exerciseDate = dateConverted
                }
            }
            
            // Access the 'notes'
            if let notes = exercise["notes"] as? String {
                print("Notes: \(notes)")
                exerciseNotes = notes
            }
            
            // Access the 'attributes' dictionary
            if let attributes = exercise["attributes"] as? [String: Any] {
                // Access each attribute
                
                // If we have a distance attribute, append a new DistanceAttribute object to exerciseAttributes
                if let distance = attributes["distance"] as? [String: Any] {
                    if let distanceValue = distance["value"] as? Double,
                       let distanceUnit = distance["unit"] as? String {
                        print("Distance: \(distanceValue) \(distanceUnit)")
                        exerciseAttributes[.distance] = DistanceAttribute(
                            distance: distanceValue, unit: DistanceUnit(distanceSymbol: distanceUnit))
                        print("Distance Converted: \(exerciseAttributes[.distance]!.value) \(exerciseAttributes[.distance]!.unit!.symbolAsString)")
                    }
                }
                
                // If we have an intensity attribute, append a new IntensityAttribute object to exerciseAttributes
                if let intensity = attributes["intensity"] as? [String: Any] {
                    if let intensityValue = intensity["value"] as? String {
                        print("Intensity: \(intensityValue)")
                        exerciseAttributes[.intensity] = IntensityAttribute(intensityString: intensityValue)
                        print("Intensity Converted: \(exerciseAttributes[.intensity]!.value)")
                    }
                }
                
                // If we have a level attribute, append a new LevelAttribute object to exerciseAttributes
                if let level = attributes["level"] as? [String: Any] {
                    if let levelValue = level["value"] as? Int {
                        print("Level: \(levelValue)")
                        exerciseAttributes[.level] = LevelAttribute(levelInt: levelValue)
                        print("Level Converted: \(exerciseAttributes[.level]!.value)")
                    }
                }
                
                // If we have a reps attribute, append a new RepsAttribute object to exerciseAttributes
                if let reps = attributes["reps"] as? [String: Any] {
                    if let repsValue = reps["value"] as? Int {
                        print("Reps: \(repsValue)")
                        exerciseAttributes[.reps] = RepsAttribute(reps: repsValue)
                    }
                }
                
                // If we have a sets attribute, append a new SetsAttribute object to exerciseAttributes
                if let sets = attributes["sets"] as? [String: Any] {
                    if let setsValue = sets["value"] as? Int {
                        print("Sets: \(setsValue)")
                        exerciseAttributes[.sets] = SetsAttribute(sets: setsValue)
                    }
                }
                
                // If we have a time attribute, append a new TimeAttribute object to exerciseAttributes
                if let time = attributes["time"] as? [String: Any] {
                    if let timeValue = time["value"] as? TimeInterval {
                        print("Time: \(timeValue)")
                        exerciseAttributes[.time] = TimeAttribute(time: timeValue)
                    }
                }
                
                // If we have a weight attribute, append a new WeightAttribute object to exerciseAttributes
                if let weight = attributes["weight"] as? [String: Any] {
                    if let weightValue = weight["value"] as? Double,
                       let weightUnit = weight["unit"] as? String {
                        print("Weight: \(weightValue) \(weightUnit)")
                        exerciseAttributes[.weight] = WeightAttribute(
                            weight: weightValue, unit: WeightUnit(weightString: weightUnit)!)
                        print("Weight Converted: \(exerciseAttributes[.weight]!.value) \(exerciseAttributes[.weight]!.unit!.symbolAsString)")
                    }
                }
            }
            
            return Exercise(id: UUID(uuidString: exerciseId!),
                     name: exerciseName,
                     type: exerciseType,
                     attributes: exerciseAttributes,
                     date: exerciseDate,
                     notes: exerciseNotes)
        } else {
            print("Exercise not found in response")
        }
        throw APIError.GETUserExerciseFailedConversion
    }
    
}
