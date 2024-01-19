//
//  Running.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Running: Exercise {
    
    //Members
    
    init(id: UUID, date: Date, duration: TimeInterval? = nil, distance: Double, unit: DistanceUnit, notes: String? = nil) {
        
        let attributes: [AttributeName: ExerciseAttribute] = [.time: TimeAttribute(time: duration ?? -1), .distance: DistanceAttribute(distance: distance, unit: unit)]
                
        super.init(id: id, name: "Running", type: .cardio, attributes: attributes, date: Date(), notes: notes)
    }

    
}
