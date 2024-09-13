import SwiftUI
import Amplify
import Authenticator
import AWSCognitoAuthPlugin

@main
struct TrophyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State private var activePage: NavigationBar.Page? = .home

    init() {
        configureAmplify()
    }

    private func configureAmplify() {
        do {
            let region = ProcessInfo.processInfo.environment["AWS_REGION"] ?? "us-east-1"
            let userPoolId = ProcessInfo.processInfo.environment["AWS_USER_POOL_ID"] ?? ""
            let appClientId = ProcessInfo.processInfo.environment["AWS_APP_CLIENT_ID"] ?? ""

            // Create the Amplify configuration object dynamically
            let authConfig = AuthCategoryConfiguration(
                plugins: [
                    "awsCognitoAuthPlugin": [
                        "Region": JSONValue(stringLiteral: region),
                        "PoolId": JSONValue(stringLiteral: userPoolId),
                        "AppClientId": JSONValue(stringLiteral: appClientId)
                    ]
                ]
            )
            
            let amplifyConfig = AmplifyConfiguration(auth: authConfig)

            // Add and configure the AWS plugins
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure(amplifyConfig)
            print("Amplify configured successfully with environment variables")
        } catch {
            print("Unable to configure Amplify: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            Authenticator(totpOptions: .init(issuer: "Trophy")) { state in
                NavigationStack {
                    ContentView(
                        activePage: $activePage,
                        userId: state.user.userId,
                        username: state.user.username
                    )
                }
            }
        }
    }
}
