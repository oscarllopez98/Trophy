//
//  Squat.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/26/23.
//

import Foundation

class Squat: Exercise {
    
    init(id: UUID, sets: Int, reps: Int, weight: Double, unit: WeightUnit, duration: TimeInterval? = nil, notes: String? = nil) {
    
        let attributes: [AttributeName: ExerciseAttribute] = [.sets: SetsAttribute(sets: sets), .reps: RepsAttribute(reps: reps), .weight: WeightAttribute(weight: weight, unit: unit)]

        super.init(id: id, name: "Squat", type: .strength, attributes: attributes, date: Date(), duration: duration, notes: notes)
    }

    
}
