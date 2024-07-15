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
            Authenticator(totpOptions: .init(issuer: "Trophy")) { state in
                VStack {
                    Text("Hello, \(state.user.username)")
                    Button("Sign out") {
                        Task {
                            await state.signOut()
                        }
                    }
                    HomeView(
                        userId: state.user.userId,
                        username: state.user.username
                    )
                }
            }
        }
    }
}
