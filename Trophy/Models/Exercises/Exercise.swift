//
//  Exercise.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class Exercise: Equatable {
    
    // Enum to represent possible attribute names
    enum AttributeName: String {
        case userDefined
        case distance
        case time
        case sets
        case reps
        case weight
        case intensity
        case level
        // Add other attribute names as needed
    }
    
    //Members
    var id: UUID
    var name: String
    var type: ExerciseType
    var attributes: [AttributeName: ExerciseAttribute]
    var date: Date
    var duration: TimeInterval?
    var notes: String?
    
    init(id: UUID, name: String, type: ExerciseType, attributes: [AttributeName: ExerciseAttribute], date: Date, duration: TimeInterval? = nil, notes: String? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.attributes = attributes
        self.date = date
        self.duration = duration
        self.notes = notes
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        lhs.id == rhs.id
    }
 
    
    subscript(attributeName: AttributeName) -> ExerciseAttribute? {
        return attributes[attributeName]
    }
}

enum ExerciseType {
    case running
    case strength
    case flexibility
    case other
    case cardio
    case sport
    // Add other exercise types as needed
}

extension ExerciseType {
    var asString: String {
        switch self {
        case .running: return "running"
        case .strength: return "strength"
        case .flexibility: return "flexibility"
        case .other: return "other"
        case .cardio: return "cardio"
        case .sport: return "sport"
        }
    }
}

