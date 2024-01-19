//
//  Pilates.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Pilates: Exercise {
    
    //Members
    
    init(id: UUID, attributes: [ExerciseAttribute], date: Date, duration: TimeInterval? = nil, notes: String? = nil) {
        
        super.init(id: id, name: "Pilates", type: .cardio, attributes: attributes, date: Date(), duration: duration, notes: notes)
    }

    
}
