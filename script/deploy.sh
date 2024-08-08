#!/bin/bash

# Pull the latest changes from the master branch
git checkout master
git pull

# Get the latest tag from GitHub
TAG=$(git describe --tags $(git rev-list --tags --max-count=1))

# Print tag for verification
echo "Deploying version: $TAG"

# Build Docker image with versioning
docker buildx build -t snoopify-nextjs:$TAG .

# Deploy the application using Docker Compose
export TAG=$TAG
docker compose down
docker compose up -d
