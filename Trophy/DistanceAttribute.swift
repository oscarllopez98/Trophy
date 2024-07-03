//
//  DistanceAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class DistanceAttribute: ExerciseAttribute {
    private var distance: Double

    init(distance: Double, unit: DistanceUnit?) {
        self.distance = distance
        super.init(name: "Distance", value: .double(distance), unit: unit)
    }
    
    override var systemName: String {
        return "ruler"
    }
}
