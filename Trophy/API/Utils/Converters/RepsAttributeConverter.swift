//
//  RepsAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

class RepsAttributeConverter {
    func convertToAPIFormat(_ repsAttribute: RepsAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["value"] = Int(repsAttribute.value.stringValue)
        return attributeDict
    }
}
