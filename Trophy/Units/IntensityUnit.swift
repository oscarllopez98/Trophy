//
//  IntensityUnit.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/25/23.
//

import Foundation

class IntensityUnit: Unit {
    
    enum Symbol: String {
        // Add other units as needed
        case high
        case med
        case low
    }
    
    override init(symbol: Unit.Symbol) {
        super.init(symbol: symbol)
    }

    convenience init(intensitySymbol: Symbol) {
        self.init(symbol: .custom(intensitySymbol.rawValue))
    }
}
