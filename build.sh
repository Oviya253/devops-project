#!/bin/bash

# Build the Docker image
echo "Building Docker image..."
docker build -t devops-app:latest .

# Tag the image for Docker Hub
echo "Tagging image..."
docker tag devops-app:latest oviya253/dev:latest

echo "Docker image built successfully"
