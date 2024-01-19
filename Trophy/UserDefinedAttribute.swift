//
//  UserDefinedAttribute.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class UserDefinedAttribute: ExerciseAttribute {

    init(name: String, value: String, unit: Unit?) {
        super.init(name: name, value: .string(value), unit: unit)
    }
}
