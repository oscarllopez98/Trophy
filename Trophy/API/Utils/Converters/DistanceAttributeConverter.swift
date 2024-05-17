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
        attributeDict["value"] = distanceAttribute.value
        attributeDict["unit"] = distanceAttribute.unit?.symbolAsString
        return attributeDict
    }
}
