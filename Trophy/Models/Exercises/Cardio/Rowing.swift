//
//  Rowing.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Rowing: Exercise {
    
    //Members
    
    init(id: UUID, level: LevelAttribute.Level? = nil ,date: Date, duration: TimeInterval? = nil, notes: String? = nil) {
        let attributes: [AttributeName: ExerciseAttribute] = [.level: LevelAttribute(value: level ?? .NA), .time: TimeAttribute(time: duration ?? 0)]
        
        super.init(id: id, name: "Basketball", type: .sport, attributes: attributes, date: Date(), notes: notes)

    }
    
}
