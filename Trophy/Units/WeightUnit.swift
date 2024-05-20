//
//  WeightUnit.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class WeightUnit: Unit {
    
    enum Symbol: String, RawRepresentable, CaseIterable, Hashable {
        // Add other units as needed
        case lb
        case kg
    }
    
    override init(symbol: Unit.Symbol) {
        super.init(symbol: symbol)
    }

    convenience init(weightSymbol: Symbol) {
        self.init(symbol: .custom(weightSymbol.rawValue))
    }
    
    convenience init?(weightString: String) {
        if let weightSymbol = Symbol(rawValue: weightString) {
            self.init(weightSymbol: weightSymbol)
        } else {
            return nil // Return nil if the string does not match any Symbol case
        }
    }
    
}
