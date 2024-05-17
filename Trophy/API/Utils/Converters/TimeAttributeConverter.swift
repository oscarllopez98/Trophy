//
//  TimeAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

class TimeAttributeConverter {
    func convertToAPIFormat(_ timeAttribute: TimeAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["value"] = timeAttribute.value
        return attributeDict
    }
}
