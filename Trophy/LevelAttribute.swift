//
//  LevelAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/25/23.
//

import Foundation

class LevelAttribute: ExerciseAttribute {
    private var level: Level
    
    enum Level: Int, CaseIterable, Hashable {
        // Add other units as needed
        case NA = 0
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
    }

    init(value: Level) {
        self.level = value
        super.init(name: "Level", value: .integer(value.rawValue), unit: nil)
    }
    
    convenience init?(levelInt: Int) {
        if let levelValue = Level(rawValue: levelInt) {
            self.init(value: levelValue)
        } else {
            return nil // Return nil if the integer does not match any Level case
        }
    }
    
    override var systemName: String {
        return "chart.bar.xaxis"
    }
    
    
}

extension LevelAttribute.Level {
    var description: String {
        switch self {
        case .NA:
            return "N/A"
        default:
            return "\(self.rawValue)"
        }
    }
}

