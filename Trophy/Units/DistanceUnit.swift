//
//  DistanceUnit.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class DistanceUnit: Unit {
    
    enum Symbol: String {
        // Add other units as needed
        case mi
        case ft
        case yd
        case km
        case m
    }

    override init(symbol: Unit.Symbol) {
        super.init(symbol: symbol)
    }

    convenience init(distanceSymbol: Symbol) {
        self.init(symbol: .custom(distanceSymbol.rawValue))
    }
}
