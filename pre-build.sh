#!/bin/bash

# Paths to your configuration files
AMPLIFY_TEMPLATE="${SRCROOT}/amplifyconfiguration.template.json"
AMPLIFY_OUTPUT="${SRCROOT}/amplifyconfiguration.json"
ENV_CONFIG_FILE="${SRCROOT}/Trophy/EnvConfig.swift"

# Check if envConfig file exists, and create it if it doesn't
if [ ! -f "${SRCROOT}/envConfig" ]; then
    echo "envConfig file not found. Creating the file with default placeholders."

    # Create the envConfig file with placeholders or default values
    cat <<EOL > "${SRCROOT}/envConfig"
TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD=your_get_user_exercise_prod_path
TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD=your_get_user_exercises_prod_path
TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD=your_put_user_exercise_prod_path
TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD=your_put_user_exercise_with_exercise_id_prod_path
TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD=your_put_user_exercise_gpt_prod_path
TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD=your_delete_user_exercise_prod_path
TROPHY_API_KEY_PROD=your_api_key_prod
EOL

    echo "envConfig file has been created with placeholder values. Please update it with actual values before proceeding."
    exit 1  # Exit to prevent continuing with placeholder values
fi

# Source envConfig to load environment variables from it
source "${SRCROOT}/envConfig"

# Ensure all environment variables are set before proceeding
MISSING_VARS=""

if [ -z "$AMPLIFY_PINPOINT_APP_ID" ]; then
    MISSING_VARS+="AMPLIFY_PINPOINT_APP_ID "
fi

if [ -z "$COGNITO_IDENTITY_POOL_ID" ]; then
    MISSING_VARS+="COGNITO_IDENTITY_POOL_ID "
fi

if [ -z "$COGNITO_USER_POOL_ID" ]; then
    MISSING_VARS+="COGNITO_USER_POOL_ID "
fi

if [ -z "$COGNITO_APP_CLIENT_ID" ]; then
    MISSING_VARS+="COGNITO_APP_CLIENT_ID "
fi

if [ -z "$AWS_REGION" ]; then
    MISSING_VARS+="AWS_REGION "
fi

if [ -z "$TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD" ]; then
    MISSING_VARS+="TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD "
fi

if [ -z "$TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD" ]; then
    MISSING_VARS+="TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD "
fi

if [ -z "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD" ]; then
    MISSING_VARS+="TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD "
fi

if [ -z "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD" ]; then
    MISSING_VARS+="TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD "
fi

if [ -z "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD" ]; then
    MISSING_VARS+="TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD "
fi

if [ -z "$TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD" ]; then
    MISSING_VARS+="TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD "
fi

if [ -z "$TROPHY_API_KEY_PROD" ]; then
    MISSING_VARS+="TROPHY_API_KEY_PROD "
fi

# If any required environment variables are missing, exit with an error message
if [ ! -z "$MISSING_VARS" ]; then
    echo "Error: The following environment variables are missing: $MISSING_VARS"
    exit 1
fi

# Copy the template file to the output configuration file (this resets the output file each build)
echo "Copying template file to configuration file..."
cp "$AMPLIFY_TEMPLATE" "$AMPLIFY_OUTPUT"

# Ensure the configuration file was copied correctly
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy template file to configuration file"
    exit 1
fi

# Replace placeholders in amplifyconfiguration.json with the actual env variable values
sed -i '' "s/{{AMPLIFY_PINPOINT_APP_ID}}/$AMPLIFY_PINPOINT_APP_ID/g;
           s/{{COGNITO_IDENTITY_POOL_ID}}/$COGNITO_IDENTITY_POOL_ID/g;
           s/{{COGNITO_USER_POOL_ID}}/$COGNITO_USER_POOL_ID/g;
           s/{{COGNITO_APP_CLIENT_ID}}/$COGNITO_APP_CLIENT_ID/g;
           s/{{AWS_REGION}}/$AWS_REGION/g;" "$AMPLIFY_OUTPUT"

# Create or update EnvConfig.swift file
echo "Updating EnvConfig.swift with environment variables..."

cat <<EOL > "$ENV_CONFIG_FILE"
import Foundation

struct EnvConfig {
    static let INVOKE_PATH_GET_USER_EXERCISE_PROD = "$TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD"
    static let INVOKE_PATH_GET_USER_EXERCISES_PROD = "$TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD"
    static let INVOKE_PATH_PUT_USER_EXERCISE_PROD = "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD"
    static let INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD = "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD"
    static let INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD = "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD"
    static let INVOKE_PATH_DELETE_USER_EXERCISE_PROD = "$TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD"
    static let API_KEY_PROD = "$TROPHY_API_KEY_PROD"
}
EOL

echo "EnvConfig.swift has been updated with environment variables."
