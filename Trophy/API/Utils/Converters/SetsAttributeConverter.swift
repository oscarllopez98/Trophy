//
//  SetsAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

class SetsAttributeConverter {
    func convertToAPIFormat(_ setsAttribute: SetsAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["value"] = setsAttribute.value
        return attributeDict
    }
}
