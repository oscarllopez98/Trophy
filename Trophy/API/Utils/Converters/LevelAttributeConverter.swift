//
//  LevelAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

class LevelAttributeConverter {
    func convertToAPIFormat(_ levelAttribute: LevelAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["value"] = levelAttribute.value
        return attributeDict
    }
}
