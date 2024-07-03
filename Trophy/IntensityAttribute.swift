//
//  IntensityAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/25/23.
//

import Foundation

class IntensityAttribute: ExerciseAttribute {
    private var intensity: Intensity
    
    enum Intensity: String, CaseIterable, Hashable {
        // Add other units as needed
        case high
        case med
        case low
    }

    init(value: Intensity) {
        self.intensity = value
        super.init(name: "Intensity", value: .string(value.rawValue), unit: nil)
    }
    
    convenience init?(intensityString: String) {
        if let intensityValue = Intensity(rawValue: intensityString) {
            self.init(value: intensityValue)
        } else {
            return nil // Return nil if the string does not match any Intensity case
        }
    }
    
    override var systemName: String {
        return "flame"
    }
}
