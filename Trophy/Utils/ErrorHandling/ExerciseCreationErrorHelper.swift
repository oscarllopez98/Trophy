//
//  ExerciseCreationErrorHelper.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation


enum ExerciseCreationError: Error {
    case invalidName
    case invalidType
}

class ExerciseCreationErrorHelper {
    static func handleCreationError(_ error: Error) {
        //Handle different types of creation errors
        switch error {
        case ExerciseCreationError.invalidName:
            print("Invalid exercise name")
        case ExerciseCreationError.invalidType:
            print("Invalid exercise type")
        default:
            print("Unknown cretion error")
        }
    }
}
