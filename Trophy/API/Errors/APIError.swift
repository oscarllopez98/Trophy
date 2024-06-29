//
//  APIError.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/18/24.
//

import Foundation

enum APIError: Error, Equatable {
    
    // -- Status Code Errors --
        // API Keys
        case UNAUTHORIZED_ACCESS_API_KEY
        case FORBIDDEN_ACCESS_API_KEY
        case EMPTY_API_KEY
        case UNCHECKED_ACCESS_STATUS_CODE_API_KEY
    
        // Invoke Paths
        case UNAUTHORIZED_ACCESS_INVOKE_PATH
        case FORBIDDEN_ACCESS_INVOKE_PATH
        case EMPTY_INVOKE_PATH
        case UNCHECKED_ACCESS_STATUS_CODE_INVOKE_PATH
    
    // Parameter Errors
    case nilParameter(parameterName: String)
    case emptyParameter(parameterName: String)
    
    // PUT API Call Errors
    case PUTUserExerciseFailed(userId: String, exercise: Exercise)
    
    // GET API Call Errors
    case GETUserExerciseFailed(userId: String, exerciseId: String)
    case GETLimitedUserExercisesFailed(userId: String)
    case GETUserExerciseFailedResponse
    case GETUserExerciseFailedConversion
    
    // Formatting Errors
    case UUIDFailedFormatting(uuid: String)
}
