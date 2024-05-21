//
//  DistanceAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/16/24.
//

import Foundation

class DistanceAttributeConverter {
    func convertToAPIFormat(_ distanceAttribute: DistanceAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["value"] = Double(distanceAttribute.value.stringValue)
        attributeDict["unit"] = distanceAttribute.unit?.symbolAsString
        return attributeDict
    }
}
