//
//  EnvironmentVariableManager.swift
//  Trophy
//
//  Created by Oscar Lopez on 6/28/24.
//

import Foundation

/**
 Retrieves the value of an environment variable.
 
 - Parameter name: The name of the environment variable.
 - Returns: The value of the environment variable, or nil if not found.
 */
func getEnvironmentVariable(_ name: String) -> String? {
    return ProcessInfo.processInfo.environment[name]
}
