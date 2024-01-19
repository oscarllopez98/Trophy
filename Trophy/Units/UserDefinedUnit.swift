//
//  UserDefinedUnit.swift
//  Trophy
//
//  Created by Oscar Lopez on 12/24/23.
//

import Foundation

class UserDefinedUnit: Unit {
    
    override init(symbol: String) {
        super.init(symbol: symbol)
    }

    convenience init(userDefinedSymbol: String) {
        self.init(symbol: .custom(userDefinedSymbol))
    }
}
