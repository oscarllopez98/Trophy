//
//  EnvironmentVariableManager.swift
//  Trophy
//
//  Created by Oscar Lopez on 6/28/24.
//

import Foundation

func getEnvironmentVariable(_ key: String) -> String? {
    return ProcessInfo.processInfo.environment[key]
}
