//
//  SetsAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class SetsAttribute: ExerciseAttribute {
    private var sets: Int

    init(sets: Int) {
        self.sets = sets
        super.init(name: "Sets", value: .integer(sets), unit: nil)
    }
    
    override var systemName: String {
        return "chart.bar.xaxis"
    }
}
