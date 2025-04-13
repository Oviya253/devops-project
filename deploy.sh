#!/bin/bash

# Pull the latest image
echo "Pulling the latest image..."
docker pull oviya253/dev:latest

# Stop and remove existing container if it exists
echo "Stopping existing container if running..."
docker stop devops-app || true
docker rm devops-app || true

# Run the new container
echo "Starting new container..."
docker run -d --name devops-app -p 80:3000 oviya253/dev:latest

echo "Deployment completed successfully"
