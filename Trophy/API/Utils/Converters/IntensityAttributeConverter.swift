//
//  IntensityAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

class IntensityAttributeConverter {
    func convertToAPIFormat(_ intensityAttribute: IntensityAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["value"] = intensityAttribute.value
        return attributeDict
    }
}
