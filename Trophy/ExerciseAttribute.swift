//
//  ExerciseAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

// Define a typealias for attribute names
typealias AttributeName = String

let userDefine: AttributeName = "custom"
let distance: AttributeName = "distance"
let time: AttributeName = "time"
let sets: AttributeName = "sets"
let reps: AttributeName = "reps"
let weight: AttributeName = "weight"
let intensity: AttributeName = "intensity"
let level: AttributeName = "level"

class ExerciseAttribute: Identifiable, Equatable {
    var id: UUID?
    var name: String
    var value: AttributeValue
    var unit: Unit?
    
    var systemName: String {
        return "" // Default system name, can be overridden by subclasses
    }

    init(id: UUID? = nil, name: String, value: AttributeValue, unit: Unit? = nil) {
        self.id = id
        self.name = name
        self.value = value
        self.unit = unit
    }

    static func == (lhs: ExerciseAttribute, rhs: ExerciseAttribute) -> Bool {
        return lhs.name == rhs.name &&
               lhs.value == rhs.value &&
               lhs.unit == rhs.unit
    }
    
}
