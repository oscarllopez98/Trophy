//
//  RepsAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class RepsAttribute: ExerciseAttribute {
    private var reps: Int

    init(reps: Int) {
        self.reps = reps
        super.init(name: "Reps", value: .integer(reps), unit: nil)
    }
}
