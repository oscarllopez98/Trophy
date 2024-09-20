#!/bin/bash

# Function to log messages with a timestamp
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log_message "Starting pre-build script..."

# Path to the .xcconfig file
XC_CONFIG_FILE="${SRCROOT}/Configurations/Debug.xcconfig"  # Adjust path if needed

# Check if the .xcconfig file exists
if [ ! -f "$XC_CONFIG_FILE" ]; then
    log_message "Error: $XC_CONFIG_FILE not found."
    exit 1
fi

log_message ".xcconfig file found: $XC_CONFIG_FILE"

# Function to extract value from the .xcconfig file
extract_value() {
    local key=$1
    grep "${key} =" "$XC_CONFIG_FILE" | sed 's/.*= *//'
}

# Extract values from .xcconfig
AMPLIFY_PINPOINT_APP_ID=$(extract_value "AMPLIFY_PINPOINT_APP_ID")
COGNITO_IDENTITY_POOL_ID=$(extract_value "COGNITO_IDENTITY_POOL_ID")
COGNITO_USER_POOL_ID=$(extract_value "COGNITO_USER_POOL_ID")
COGNITO_APP_CLIENT_ID=$(extract_value "COGNITO_APP_CLIENT_ID")
AWS_REGION=$(extract_value "AWS_REGION")
TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD=$(extract_value "TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD")
TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD=$(extract_value "TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD")
TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD=$(extract_value "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD")
TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD=$(extract_value "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD")
TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD=$(extract_value "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD")
TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD=$(extract_value "TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD")
TROPHY_API_KEY_PROD=$(extract_value "TROPHY_API_KEY_PROD")

# Log the actual values of the environment variables
# Note: Removed logging


# Check if any environment variables are missing
MISSING_VARS=""
check_var() {
    local var_value="$1"
    local var_name="$2"
    if [ -z "$var_value" ]; then
        MISSING_VARS+="$var_name "
        log_message "Error: $var_name is missing."
    else
        log_message "$var_name is set to $var_value."
    fi
}

check_var "$AMPLIFY_PINPOINT_APP_ID" "AMPLIFY_PINPOINT_APP_ID"
check_var "$COGNITO_IDENTITY_POOL_ID" "COGNITO_IDENTITY_POOL_ID"
check_var "$COGNITO_USER_POOL_ID" "COGNITO_USER_POOL_ID"
check_var "$COGNITO_APP_CLIENT_ID" "COGNITO_APP_CLIENT_ID"
check_var "$AWS_REGION" "AWS_REGION"
check_var "$TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD" "TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD"
check_var "$TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD" "TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD"
check_var "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD" "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD"
check_var "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD" "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD"
check_var "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD" "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD"
check_var "$TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD" "TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD"
check_var "$TROPHY_API_KEY_PROD" "TROPHY_API_KEY_PROD"

# If any required environment variables are missing, exit with an error message
if [ ! -z "$MISSING_VARS" ]; then
    log_message "Error: The following environment variables are missing: $MISSING_VARS"
    exit 1
fi

log_message "Pre-build script completed successfully."
