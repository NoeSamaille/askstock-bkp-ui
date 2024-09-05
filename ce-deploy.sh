#!/bin/bash

ibmcloud ce project current

# Prompt the user for the required parameters
read -p "App name: " APP_NAME
read -p "App version: " APP_VERSION
read -p "GitHub repo URL: " BUILD_SOURCE
read -p "watsonx Flows Engine endpoint: " WXFLOWS_ENDPOINT

# Execute the command with the provided parameters
ibmcloud ce app create \
  --name "$APP_NAME" \
  --build-commit main \
  --build-source "$BUILD_SOURCE" \
  --cpu 0.25 \
  --memory 500M \
  --min-scale 1 \
  --max-scale 1 \
  --image "quay.io/noesamaille0/askstock-ui:$APP_VERSION" \
  --registry-secret quay-noesamaille0 \
  --env-from-secret wxflows-ns \
  --env VITE_WXFLOWS_ENDPOINT="$WXFLOWS_ENDPOINT"
