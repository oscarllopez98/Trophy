//
//  Tennis.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Tennis: Exercise {
    
    //Members
    
    init(id: UUID, attributes: [ExerciseAttribute], duration: TimeInterval? = nil, notes: String? = nil) {
        
        super.init(id: id, name: "Tennis", type: .cardio, attributes: attributes, date: Date(), duration: duration, notes: notes)
    }

    
}
