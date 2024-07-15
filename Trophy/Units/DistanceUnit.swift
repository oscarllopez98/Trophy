//
//  DistanceUnit.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class DistanceUnit: Unit {
    
    enum Symbol: String, RawRepresentable, CaseIterable, Hashable {
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
    
    init(symbol: Symbol) {
        super.init(symbol: .custom(symbol.rawValue))
    }
    
    convenience init?(distanceSymbol: String) {
        if let symbol = Symbol(rawValue: distanceSymbol) {
            self.init(symbol: symbol)
        } else {
            return nil // Return nil if the symbol is not valid
        }
    }
    
    // Convenience initializer from String
    convenience init?(stringValue: String) {
        if let symbol = Symbol(rawValue: stringValue) {
            self.init(symbol: symbol)
        } else {
            return nil // Return nil if the symbol is not valid
        }
    }
}
