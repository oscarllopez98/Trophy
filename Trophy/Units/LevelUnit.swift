//
//  LevelUnit.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/25/23.
//

import Foundation

class LevelUnit: Unit {
    
    enum Symbol: Int {
        // Add other units as needed
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
    }
    
    override init(symbol: Unit.Symbol) {
        super.init(symbol: symbol)
    }

    convenience init(levelSymbol: Symbol) {
        self.init(symbol: .custom(String(levelSymbol.rawValue)))
    }
}
