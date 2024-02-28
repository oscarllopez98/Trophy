//
//  ExerciseValidationHelper.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class ExerciseValidationHelper {
    
    //Validate Exercise Name
    static func validateName(_ name: String) -> Bool {
        return !name.isEmpty && !(name.count > 20)
    }
    
    //Validate Exercise Type
    static func validateType(_ type: ExerciseType) -> Bool {
        //Placeholder logic until I define invalid Typings
        return true;
    }
}
