//
//  Unit.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class Unit: Equatable {
    var symbol: Symbol
    
    init(symbol: Symbol) {
        self.symbol = symbol
    }
    
    static func == (lhs: Unit, rhs: Unit) -> Bool {
        return lhs.symbol == rhs.symbol
    }
    
    enum Symbol: Equatable {
        case custom(String)
    }
    
    var symbolAsString: String {
        switch self.symbol {
        case .custom(let string):
            return string
        }
    }
}
