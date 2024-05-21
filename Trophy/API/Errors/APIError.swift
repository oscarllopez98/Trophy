//
//  APIError.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/18/24.
//

import Foundation

enum APIError: Error {
    case nilParameter(parameterName: String)
    case emptyParameter(parameterName: String)
    
    // GET
    case GETUserExerciseFailed(userId: String, exerciseId: String)
    case GETUserExerciseFailedResponse
    case GETUserExerciseFailedConversion
    
    // Formatting Errors
    case UUIDFailedFormatting(uuid: String)
}
