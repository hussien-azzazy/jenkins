#!/bin/bash

echo "Building the application using Gradle..."

# Make sure gradlew is executable if you're using the wrapper
chmod +x gradlew

# Run the build
./gradlew clean build

# Optionally, if npm is still required for frontend tasks
echo "Checking npm version..."
npm --version