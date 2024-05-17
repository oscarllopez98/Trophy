//
//  WeightAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

class WeightAttributeConverter {
    func convertToAPIFormat(_ weightAttribute: WeightAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["value"] = weightAttribute.value
        attributeDict["unit"] = weightAttribute.unit?.symbolAsString
        return attributeDict
    }
}
