import SwiftUI
import Authenticator
import Amplify
import AWSCognitoAuthPlugin

@main
struct TrophyApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State private var activePage: NavigationBar.Page? = .home

    init() {
        configureAmplify()
    }

    private func configureAmplify() {
        // Extract environment variables
        let pinpointAppId = ProcessInfo.processInfo.environment["AMPLIFY_PINPOINT_APP_ID"] ?? ""
        let region = ProcessInfo.processInfo.environment["AWS_REGION"] ?? ""
        let identityPoolId = ProcessInfo.processInfo.environment["COGNITO_IDENTITY_POOL_ID"] ?? ""
        let userPoolId = ProcessInfo.processInfo.environment["COGNITO_USER_POOL_ID"] ?? ""
        let appClientId = ProcessInfo.processInfo.environment["COGNITO_APP_CLIENT_ID"] ?? ""

        // Validate environment variables
        guard !pinpointAppId.isEmpty,
              !region.isEmpty,
              !identityPoolId.isEmpty,
              !userPoolId.isEmpty,
              !appClientId.isEmpty else {
            print("Error: Missing environment variables for Amplify configuration.")
            return
        }

        do {
            // Load JSON configuration strings using environment variables
            let amplifyConfigString = """
            {
                "analytics": {
                    "plugins": {
                        "awsPinpointAnalyticsPlugin": {
                            "pinpointAnalytics": {
                                "appId": "\(pinpointAppId)",
                                "region": "\(region)"
                            },
                            "pinpointTargeting": {
                                "region": "\(region)"
                            }
                        }
                    }
                },
                "auth": {
                    "plugins": {
                        "awsCognitoAuthPlugin": {
                            "IdentityManager": { "Default": {} },
                            "CredentialsProvider": {
                                "CognitoIdentity": {
                                    "Default": {
                                        "PoolId": "\(identityPoolId)",
                                        "Region": "\(region)"
                                    }
                                }
                            },
                            "CognitoUserPool": {
                                "Default": {
                                    "PoolId": "\(userPoolId)",
                                    "AppClientId": "\(appClientId)",
                                    "Region": "\(region)"
                                }
                            },
                            "Auth": {
                                "Default": {
                                    "authenticationFlowType": "USER_SRP_AUTH",
                                    "socialProviders": [],
                                    "usernameAttributes": ["EMAIL", "PHONE_NUMBER"],
                                    "signupAttributes": ["BIRTHDATE", "EMAIL", "NAME", "PHONE_NUMBER"],
                                    "passwordProtectionSettings": {
                                        "passwordPolicyMinLength": 8,
                                        "passwordPolicyCharacters": []
                                    },
                                    "mfaConfiguration": "OFF",
                                    "mfaTypes": ["SMS"],
                                    "verificationMechanisms": ["EMAIL"]
                                }
                            }
                        }
                    }
                }
            }
            """
            
            // Convert JSON string to Data
            guard let amplifyConfigData = amplifyConfigString.data(using: .utf8) else {
                print("Error converting JSON string to Data.")
                return
            }
            
            // Decode JSON data to AmplifyConfiguration
            let decoder = JSONDecoder()
            let config = try decoder.decode(AmplifyConfiguration.self, from: amplifyConfigData)
            
            // Add and configure Amplify
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            print("Successfully added Auth plugin.")
            
            try Amplify.configure(config)
            print("Amplify configured successfully using environment variables.")
            
        } catch {
            print("Error during Amplify configuration: \(error)")
        }

        print("End of configuration process.")
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
