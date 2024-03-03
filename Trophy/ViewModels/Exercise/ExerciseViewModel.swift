//
//  ExerciseViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    
    let id: UUID
    let name: String
    let type: ExerciseType
    let attributes: [Exercise.AttributeName: ExerciseAttribute]
    let date: Date
    var duration: TimeInterval? = nil
    var notes: String? = nil
    
    init(id: UUID, name: String, type: ExerciseType, attributes: [Exercise.AttributeName : ExerciseAttribute], date: Date, duration: TimeInterval? = nil, notes: String? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.attributes = attributes
        self.date = date
        self.duration = duration
        self.notes = notes
    }
    
    //MARK: Getters - ID
    
    func getID() -> UUID {
        id
    }
    
    func getIDAsString() -> String {
        id.uuidString
    }
    
    //MARK: Getters - Name
    
    func getName() -> String {
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
    
    func getDate() -> Date {
        date
    }
    
    func getDateFormatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM YYYY"
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    //MARK: Getters - Duration
    
    //MARK: Getters Duration
    func getDuration() -> TimeInterval? {
        duration ?? nil
    }
    
    func getDuration_HHMMSS() -> String? {
        //Check if our duration is set
        if let timeInterval = duration {
            
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
        
        //Else, duration is nil, so return nil
        else {
            return nil
        }
    }
    
    func getDuration_HHMM() -> String? {
        //Check if our duration is set
        if let timeInterval = duration {
            
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
        
        //Else, duration is nil, so return nil
        else {
            return nil
        }
    }
    
    func getDuration_MMSS() -> String? {
        //Check if our duration is set
        if let timeInterval = duration {
            
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
        
        //Else, duration is nil, so return nil
        else {
            return nil
        }
    }
    
    //MARK: Getters - Notes
    
    func getNotes() -> String? {
        return notes ?? nil
    }
    
}

//Extension for SwiftUI Previews
extension ExerciseViewModel {
    static func sample() -> ExerciseViewModel {
        let id = UUID()
        let name = "Sample Preview Exercise"
        let type = ExerciseType.sport
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [:]
        let date = Date()
        let duration: TimeInterval? = 60*60
        let notes: String? = "Sample Preview Notes"
        
        return ExerciseViewModel(id: id,
                                 name: name,
                                 type: type,
                                 attributes: attributes,
                                 date: date,
                                 duration: duration,
                                 notes: notes)
    }
}
