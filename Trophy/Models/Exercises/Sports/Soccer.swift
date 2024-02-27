//
//  Soccer.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Soccer: Exercise {
    
    //Members
    
    init(id: UUID, attributes: [Exercise.AttributeName: ExerciseAttribute], duration: TimeInterval? = nil, notes: String? = nil) {
        super.init(id: id,
                   name: "Soccer",
                   type: .sport,
                   attributes: attributes,
                   date: Date())
    }

    
}
