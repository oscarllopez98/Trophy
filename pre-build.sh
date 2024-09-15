#!/bin/bash

# Paths to your configuration files
AMPLIFY_TEMPLATE="${SRCROOT}/amplifyconfiguration.template.json"
AMPLIFY_OUTPUT="${SRCROOT}/amplifyconfiguration.json"

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

# If any required environment variables are missing, exit with an error message
if [ ! -z "$MISSING_VARS" ]; then
    echo "Error: The following environment variables are missing: $MISSING_VARS"
    exit 1
fi

# Copy the template file to the output configuration file (this resets the output file each build)
cp "$AMPLIFY_TEMPLATE" "$AMPLIFY_OUTPUT"

# Replace placeholders in amplifyconfiguration.json with the actual env variable values
sed -i '' "s/{{AMPLIFY_PINPOINT_APP_ID}}/$AMPLIFY_PINPOINT_APP_ID/g;
           s/{{COGNITO_IDENTITY_POOL_ID}}/$COGNITO_IDENTITY_POOL_ID/g;
           s/{{COGNITO_USER_POOL_ID}}/$COGNITO_USER_POOL_ID/g;
           s/{{COGNITO_APP_CLIENT_ID}}/$COGNITO_APP_CLIENT_ID/g;
           s/{{AWS_REGION}}/$AWS_REGION/g;" "$AMPLIFY_OUTPUT"

# Notify the user that the configuration has been updated
echo "Amplify configuration has been updated with environment variables."
