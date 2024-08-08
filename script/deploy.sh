#!/bin/bash

# Pull the latest changes from the master branch
git pull origin master


# Get the latest tag from GitHub
TAG=$(git describe --tags $(git rev-list --tags --max-count=1))

# Print tag for verification
echo "Deploying version: $TAG"

# Build Docker image with versioning
docker build -t username/repository:$TAG .

# Deploy the application using Docker Compose
export TAG=$TAG
docker-compose down
docker-compose up -d