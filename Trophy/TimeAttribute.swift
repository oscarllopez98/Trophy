//
//  TimeAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class TimeAttribute: ExerciseAttribute {
    private var time: TimeInterval

    init(time: TimeInterval) {
        self.time = time
        super.init(name: "Time", value: .timeInterval(time), unit: nil)
    }
    
    override var systemName: String {
        return "stopwatch"
    }
}
