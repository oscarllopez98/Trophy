#!/bin/bash

# Paths to your template and configuration files
AMPLIFY_TEMPLATE="${SRCROOT}/amplifyconfiguration.template.json"
AWS_TEMPLATE="${SRCROOT}/awsconfiguration.template.json"

AMPLIFY_OUTPUT="${SRCROOT}/amplifyconfiguration.json"
AWS_OUTPUT="${SRCROOT}/awsconfiguration.json"

# Debugging: Print paths
echo "AMPLIFY_TEMPLATE path: $AMPLIFY_TEMPLATE"
echo "AWS_TEMPLATE path: $AWS_TEMPLATE"

# Check if template files exist
if [ ! -f "$AMPLIFY_TEMPLATE" ]; then
    echo "Error: $AMPLIFY_TEMPLATE not found!"
    exit 1
fi

if [ ! -f "$AWS_TEMPLATE" ]; then
    echo "Error: $AWS_TEMPLATE not found!"
    exit 1
fi

# Step 1: Copy template files to the output files
cp "$AMPLIFY_TEMPLATE" "$AMPLIFY_OUTPUT"
cp "$AWS_TEMPLATE" "$AWS_OUTPUT"

echo "Configuration files have been copied successfully from templates."
