//
//  IdentifiableError.swift
//  Trophy
//
//  Created by Oscar Lopez on 5/24/24.
//

struct IdentifiableError: Identifiable, Error {
    let id = UUID()
    let message: String
}
