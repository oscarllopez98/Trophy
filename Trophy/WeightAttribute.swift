//
//  WeightAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class WeightAttribute: ExerciseAttribute, AttributeType {
    private var weight: Double {
        didSet {
            
        }
    }

    init(weight: Double, unit: WeightUnit) {
        self.weight = weight
        super.init(name: "Weight", value: .double(weight), unit: unit)
    }
}
