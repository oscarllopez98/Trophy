//
//  Yoga.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Yoga: Exercise {
    
    //Members
    
    init(id: UUID, attributes: [ExerciseAttribute], date: Date, duration: TimeInterval, notes: String? = nil) {
        
        let attributes: [AttributeName: ExerciseAttribute] = [.time: TimeAttribute(time: duration)]
        
        super.init(id: id, name: "Yoga", type: .cardio, attributes: attributes, date: Date(), duration: duration, notes: notes)
    }

    
}
