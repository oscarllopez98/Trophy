//
//  TrophyApp.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/26/23.
//

import SwiftUI

@main
struct TrophyApp: App {
    var body: some Scene {
        WindowGroup {
            // Replace "user-id-placeholder" with the actual ID of the user.
            ContentView(
                exerciseListViewModel: ExerciseListViewModel(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1")
            )
        }
    }
}
