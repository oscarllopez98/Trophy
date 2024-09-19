import Foundation

struct EnvConfig {
    // Amplify Stuff
    static let AMPLIFY_PINPOINT_APP_ID = ProcessInfo.processInfo.environment["AMPLIFY_PINPOINT_APP_ID"] ?? ""
    static let AWS_REGION = ProcessInfo.processInfo.environment["AWS_REGION"] ?? ""
    static let COGNITO_APP_CLIENT_ID = ProcessInfo.processInfo.environment["COGNITO_APP_CLIENT_ID"] ?? ""
    static let COGNITO_IDENTITY_POOL_ID = ProcessInfo.processInfo.environment["COGNITO_IDENTITY_POOL_ID"] ?? ""
    static let COGNITO_USER_POOL_ID = ProcessInfo.processInfo.environment["COGNITO_USER_POOL_ID"] ?? ""

    // API Stuff
    static let INVOKE_PATH_GET_USER_EXERCISE_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD"] ?? ""
    static let INVOKE_PATH_GET_USER_EXERCISES_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD"] ?? ""
    static let INVOKE_PATH_PUT_USER_EXERCISE_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD"] ?? ""
    static let INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD"] ?? ""
    static let INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD"] ?? ""
    static let INVOKE_PATH_DELETE_USER_EXERCISE_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD"] ?? ""
    static let API_KEY_PROD = ProcessInfo.processInfo.environment["TROPHY_API_KEY_PROD"] ?? ""
}
