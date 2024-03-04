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
    
    var stringValue: String {
        switch self {
        case .string(let str):
            return str
        case .double(let value):
            return String(value)
        case .integer(let value):
            return String(value)
        case .timeInterval(let interval):
            // Convert time interval to a formatted string
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            return formatter.string(from: interval) ?? ""
        }
    }
}

extension AttributeType {
    func updateValue(_ newValue: ValueType) {
        // Default implementation for updating value
    }
}
