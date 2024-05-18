//
//  TimeAttributeConverter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/17/24.
//

import Foundation

import Foundation

class TimeAttributeConverter {
    func convertToAPIFormat(_ timeAttribute: TimeAttribute) -> [String: Any] {
        var attributeDict: [String: Any] = [:]
        let seconds = convertToSeconds(timeAttribute)
        attributeDict["value"] = Int(seconds ?? 0)

        return attributeDict
    }
    
    func convertToSeconds(_ timeAttribute: TimeAttribute) -> Int? {
        let timeString = timeAttribute.value.stringValue
        
        // Split the time string into components
        let components = timeString.split(separator: ":")
        
        // Ensure we have exactly 3 components (hours, minutes, seconds)
        guard components.count == 3,
              let hours = Int(components[0]),
              let minutes = Int(components[1]),
              let seconds = Int(components[2]) else {
            return nil // Return nil if the format is invalid
        }
        
        // Calculate total seconds
        let totalSeconds = (hours * 3600) + (minutes * 60) + seconds
        return totalSeconds
    }
}

