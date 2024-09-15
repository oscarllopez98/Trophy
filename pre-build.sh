#!/bin/bash

# Paths to your template and configuration files
AMPLIFY_TEMPLATE="${SRCROOT}/amplifyconfiguration.template.json"
AWS_TEMPLATE="${SRCROOT}/awsconfiguration.template.json"

AMPLIFY_OUTPUT="${SRCROOT}/amplifyconfiguration.json"
AWS_OUTPUT="${SRCROOT}/awsconfiguration.json"

# Step 1: Copy template files to the output files
cp "$AMPLIFY_TEMPLATE" "$AMPLIFY_OUTPUT"
cp "$AWS_TEMPLATE" "$AWS_OUTPUT"

echo "Configuration files have been copied successfully from templates."
