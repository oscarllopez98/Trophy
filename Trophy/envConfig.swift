import Foundation

struct EnvConfig {
    static let INVOKE_PATH_GET_USER_EXERCISE_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD"] ?? ""
    static let INVOKE_PATH_GET_USER_EXERCISES_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD"] ?? ""
    static let INVOKE_PATH_PUT_USER_EXERCISE_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD"] ?? ""
    static let INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD"] ?? ""
    static let INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD"] ?? ""
    static let INVOKE_PATH_DELETE_USER_EXERCISE_PROD = ProcessInfo.processInfo.environment["TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD"] ?? ""
    static let API_KEY_PROD = ProcessInfo.processInfo.environment["TROPHY_API_KEY_PROD"] ?? ""
}
