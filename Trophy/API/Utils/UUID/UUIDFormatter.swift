//
//  UUIDFormatter.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/20/24.
//

import Foundation

class UUIDFormatter {
    func addDashesToUUID(_ uuidString: String) -> String? {
        // Ensure the input string is exactly 32 characters long
        guard uuidString.count == 32 else {
            return nil
        }
        
        // Insert dashes at the appropriate positions
        var uuidWithDashes = ""
        uuidWithDashes.append(contentsOf: uuidString.prefix(8) + "-")
        uuidWithDashes.append(contentsOf: uuidString.dropFirst(8).prefix(4) + "-")
        uuidWithDashes.append(contentsOf: uuidString.dropFirst(12).prefix(4) + "-")
        uuidWithDashes.append(contentsOf: uuidString.dropFirst(16).prefix(4) + "-")
        uuidWithDashes.append(contentsOf: uuidString.dropFirst(20))

        return uuidWithDashes
    }
}
