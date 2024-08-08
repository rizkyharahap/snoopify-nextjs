#!/bin/bash

# Pull the latest changes from the master branch
git pull origin master

# Build Docker image with versioning
VERSION=$(git describe --tags $(git rev-list --tags --max-count=1))
docker build -t username/repository:$VERSION .

# Deploy the application using Docker Compose
docker-compose down
docker-compose up -d
