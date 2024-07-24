//
//  User.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/27/23.
//

import Foundation

class User: ObservableObject {
    @Published var userId: String
    @Published var username: String
    
    init(userId: String, username: String) {
        self.userId = userId
        self.username = username
    }
}
