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
        do {
            // Load JSON configuration strings
            let amplifyConfigString = """
            {
                "analytics": {
                    "plugins": {
                        "awsPinpointAnalyticsPlugin": {
                            "pinpointAnalytics": {
                                "appId": "\(ProcessInfo.processInfo.environment["AMPLIFY_PINPOINT_APP_ID"] ?? "")",
                                "region": "\(ProcessInfo.processInfo.environment["AWS_REGION"] ?? "")"
                            },
                            "pinpointTargeting": {
                                "region": "\(ProcessInfo.processInfo.environment["AWS_REGION"] ?? "")"
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
                                        "PoolId": "\(ProcessInfo.processInfo.environment["COGNITO_IDENTITY_POOL_ID"] ?? "")",
                                        "Region": "\(ProcessInfo.processInfo.environment["AWS_REGION"] ?? "")"
                                    }
                                }
                            },
                            "CognitoUserPool": {
                                "Default": {
                                    "PoolId": "\(ProcessInfo.processInfo.environment["COGNITO_USER_POOL_ID"] ?? "")",
                                    "AppClientId": "\(ProcessInfo.processInfo.environment["COGNITO_APP_CLIENT_ID"] ?? "")",
                                    "Region": "\(ProcessInfo.processInfo.environment["AWS_REGION"] ?? "")"
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
            
            try Amplify.configure()
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
