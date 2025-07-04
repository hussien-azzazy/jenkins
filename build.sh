#!/bin/bash

echo "Building the project using Gradle..."
gradle clean build

# Optionally, if npm is still required for frontend tasks
echo "Checking npm version..."
npm --version