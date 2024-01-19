//
//  AttributeType.swift
//  Trophy
//
//  Created by Oscar Lopez on 1/2/24.
//

import Foundation

protocol AttributeType: Equatable {
    var name: String { get }
    associatedtype ValueType
    var value: ValueType { get }
    func updateValue(_ newValue: ValueType)
}

enum AttributeValue: Equatable {
    case string(String)
    case double(Double)
    case integer(Int)
    case timeInterval(TimeInterval)
}

extension AttributeType {
    func updateValue(_ newValue: ValueType) {
        // Default implementation for updating value
    }
}
