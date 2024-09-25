#!/bin/sh

# Access and log environment variables
echo "Logging environment variables:"

# List of environment variables to log
echo "AMPLIFY_PINPOINT_APP_ID: $AMPLIFY_PINPOINT_APP_ID"
echo "AWS_REGION: $AWS_REGION"
echo "COGNITO_APP_CLIENT_ID: $COGNITO_APP_CLIENT_ID"
echo "COGNITO_IDENTITY_POOL_ID: $COGNITO_IDENTITY_POOL_ID"
echo "COGNITO_USER_POOL_ID: $COGNITO_USER_POOL_ID"
echo "TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD: $TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD"
echo "TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD: $TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD"
echo "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD: $TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD"
echo "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD: $TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD"
echo "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD: $TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD"
echo "TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD: $TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD"
echo "TROPHY_API_KEY_PROD: $TROPHY_API_KEY_PROD"

# Optional: Check if any specific variable is not set and log a message
if [ -z "$AMPLIFY_PINPOINT_APP_ID" ]; then
  echo "AMPLIFY_PINPOINT_APP_ID is not set!"
fi
if [ -z "$AWS_REGION" ]; then
  echo "AWS_REGION is not set!"
fi
if [ -z "$COGNITO_APP_CLIENT_ID" ]; then
  echo "COGNITO_APP_CLIENT_ID is not set!"
fi
if [ -z "$COGNITO_IDENTITY_POOL_ID" ]; then
  echo "COGNITO_IDENTITY_POOL_ID is not set!"
fi
if [ -z "$COGNITO_USER_POOL_ID" ]; then
  echo "COGNITO_USER_POOL_ID is not set!"
fi
if [ -z "$TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD" ]; then
  echo "TROPHY_INVOKE_PATH_GET_USER_EXERCISE_PROD is not set!"
fi
if [ -z "$TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD" ]; then
  echo "TROPHY_INVOKE_PATH_GET_USER_EXERCISES_PROD is not set!"
fi
if [ -z "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD" ]; then
  echo "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_PROD is not set!"
fi
if [ -z "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD" ]; then
  echo "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD is not set!"
fi
if [ -z "$TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD" ]; then
  echo "TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD is not set!"
fi
if [ -z "$TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD" ]; then
  echo "TROPHY_INVOKE_PATH_DELETE_USER_EXERCISE_PROD is not set!"
fi
if [ -z "$TROPHY_API_KEY_PROD" ]; then
  echo "TROPHY_API_KEY_PROD is not set!"
fi

# Copy and update awsconfiguration.json file
TEMPLATE_FILE="${SRCROOT}/awsconfiguration.template.json"
OUTPUT_FILE="${SRCROOT}/awsconfiguration.json"

echo "Copying awsconfiguration.template.json to awsconfiguration.json..."

# Copy the template file to the output file
cp "$TEMPLATE_FILE" "$OUTPUT_FILE"

echo "Replacing placeholders in awsconfiguration.json..."

# Replace placeholders in awsconfiguration.json with environment variable values
sed -i '' "s/{{COGNITO_IDENTITY_POOL_ID}}/$COGNITO_IDENTITY_POOL_ID/g" "$OUTPUT_FILE"
sed -i '' "s/{{COGNITO_USER_POOL_ID}}/$COGNITO_USER_POOL_ID/g" "$OUTPUT_FILE"
sed -i '' "s/{{COGNITO_APP_CLIENT_ID}}/$COGNITO_APP_CLIENT_ID/g" "$OUTPUT_FILE"
sed -i '' "s/{{AMPLIFY_PINPOINT_APP_ID}}/$AMPLIFY_PINPOINT_APP_ID/g" "$OUTPUT_FILE"
sed -i '' "s/{{AWS_REGION}}/$AWS_REGION/g" "$OUTPUT_FILE"

echo "awsconfiguration.json has been updated successfully!"
