//
//  Basketball.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Basketball: Exercise {
    
    //Members
    
    init(id: UUID, duration: TimeInterval? = nil, notes: String? = nil) {
        
        let attributes: [AttributeName: ExerciseAttribute] = [.time: TimeAttribute(time: duration ?? -1)]
        
        super.init(id: id, name: "Basketball", type: .sport, attributes: attributes, date: Date(), notes: notes)

    }

    
}
