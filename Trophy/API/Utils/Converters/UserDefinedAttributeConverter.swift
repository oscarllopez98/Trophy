//
//  UserDefinedAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

class UserDefinedAttributeConverter {
    func convertToAPIFormat(_ userDefinedAttribute: UserDefinedAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        attributeDict["name"] = userDefinedAttribute.name
        attributeDict["value"] = userDefinedAttribute.value
        attributeDict["unit"] = userDefinedAttribute.unit?.symbolAsString
        return attributeDict
    }
}
