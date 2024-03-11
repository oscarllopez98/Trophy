//
//  ExerciseUnit.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class ExerciseUnit: Unit {
    
    enum Symbol: String, RawRepresentable, CaseIterable, Hashable {
        // Add other units as needed
        case reps
        case laps
    }
    
    override init(symbol: Unit.Symbol) {
        super.init(symbol: symbol)
    }

    convenience init(exerciseSymbol: Symbol) {
        self.init(symbol: .custom(exerciseSymbol.rawValue))
    }
    
}
