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
    
    
    
    //MARK: Getters - ID
    
    func getExerciseID(_ exercise: Exercise) -> UUID {
        return exercise.id
    }
    
    func getExerciseIDAsString(_ exercise: Exercise) -> String {
        return exercise.id.uuidString
    }
    
    //MARK: Getters - Name
    
    func getExerciseName(_ exercise: Exercise) -> String {
        return exercise.name
    }
    
    //MARK: Getters - Exercise Type
    
    func getExerciseType(_ exercise: Exercise) -> ExerciseType {
        return exercise.type
    }
    
    func getExerciseTypeAsString(_ exercise: Exercise) -> String {
        return exercise.type.asString
    }
    
    //MARK: Getters - Exercise Attributes
    
    func getExerciseAttributes(_ exercise: Exercise) -> [Exercise.AttributeName: ExerciseAttribute] {
        return exercise.attributes
    }
    
    func getExerciseAttributesAsString(_ exercise: Exercise) -> [String: String] {
        var attributesString: [String: String] = [:]
        for item in exercise.attributes {
            attributesString[item.key.rawValue] = item.value.name
        }
        return attributesString
    }
    
    //MARK: Getters - Date
    
    func getExerciseDate(_ exercise: Exercise) -> Date {
        return exercise.date
    }
    
    func getExerciseDateFormatted(_ exercise: Exercise) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM YYYY"
        
        let formattedDate = dateFormatter.string(from: exercise.date)
        return formattedDate
    }
    
    //MARK: Getters - Duration
    
    func getExerciseDuration(_ exercise: Exercise) -> TimeInterval {
        return exercise.duration ?? 0
    }
    
    func getExerciseDuration_HHMMSS(_ exercise: Exercise) -> String? {
        let timeInterval: TimeInterval = exercise.duration ?? 0 // Example time interval in seconds

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        if let formattedString = formatter.string(from: timeInterval) {
            return formattedString
        } else {
            return nil
        }
    }
    
    func getExerciseDuration_HHMM(_ exercise: Exercise) -> String? {
        let timeInterval: TimeInterval = exercise.duration ?? 0 // Example time interval in seconds

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        if let formattedString = formatter.string(from: timeInterval) {
            return formattedString
        } else {
            return nil
        }
    }
    
    func getExerciseDuration_MMSS(_ exercise: Exercise) -> String? {
        let timeInterval: TimeInterval = exercise.duration ?? 0 // Example time interval in seconds

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        if let formattedString = formatter.string(from: timeInterval) {
            return formattedString
        } else {
            return nil
        }
    }
    
    //MARK: Getters - Notes
    
    func getExerciseNotes(_ exercise: Exercise) -> String {
        return exercise.notes ?? ""
    }    
    
}
