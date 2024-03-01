//
//  ExerciseViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class ExerciseViewModel {
    
    let id: UUID
    let name: String
    let type: ExerciseType
    let attributes: [Exercise.AttributeName: ExerciseAttribute]
    let date: Date
    let duration: TimeInterval? = nil
    let notes: String? = nil
    
    init(id: UUID, name: String, type: ExerciseType, attributes: [Exercise.AttributeName : ExerciseAttribute], date: Date) {
        self.id = id
        self.name = name
        self.type = type
        self.attributes = attributes
        self.date = date
    }
    
    //MARK: Getters - ID
    
    func getExerciseID() -> UUID {
        id
    }
    
    func getExerciseIDAsString() -> String {
        id.uuidString
    }
    
    //MARK: Getters - Name
    
    func getExerciseName() -> String {
        name
    }
    
    //MARK: Getters - Exercise Type
    
    func getExerciseType() -> ExerciseType {
        type
    }
    
    func getExerciseTypeAsString() -> String {
        type.asString
    }
    
    //MARK: Getters - Exercise Attributes
    
    func getExerciseAttributes() -> [Exercise.AttributeName: ExerciseAttribute] {
        attributes
    }
    
    func getExerciseAttributesAsString() -> [String: String] {
        var attributesString: [String: String] = [:]
        for item in attributes {
            attributesString[item.key.rawValue] = item.value.name
        }
        return attributesString
    }
    
    //MARK: Getters - Date
    
    func getExerciseDate() -> Date {
        date
    }
    
    func getExerciseDateFormatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM YYYY"
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    //MARK: Getters - Duration
    
    func getExerciseDuration() -> TimeInterval {
        return duration ?? 0
    }
    
    func getExerciseDuration_HHMMSS() -> String? {
        let timeInterval: TimeInterval = duration ?? 0 // Example time interval in seconds

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
    
    func getExerciseDuration_HHMM() -> String? {
        let timeInterval: TimeInterval = duration ?? 0 // Example time interval in seconds

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
    
    func getExerciseDuration_MMSS() -> String? {
        let timeInterval: TimeInterval = duration ?? 0 // Example time interval in seconds

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
    
    func getExerciseNotes() -> String {
        return notes ?? ""
    }    
    
}
