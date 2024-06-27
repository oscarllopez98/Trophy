//
//  TrophyApp.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/26/23.
//

import SwiftUI
import Amplify
import Authenticator
import AWSCognitoAuthPlugin
import SwiftUI

@main
struct TrophyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
        } catch {
            print("Unable to configure Amplify \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            Authenticator { state in
                VStack {
                    Text("Hello, \(state.user.username)")
                    Button("Sign out") {
                        Task {
                            await state.signOut()
                        }
                    }
                    // Replace "user-id-placeholder" with the actual ID of the user.
                    ContentView(
                        exerciseListViewModel: ExerciseListViewModel(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1")
                    )
                }
            }
        }
    }
}
