#!/bin/bash

# Pull the latest changes from the master branch
git checkout master
git pull


# Get the latest tag from GitHub
TAG=$(git describe --tags $(git rev-list --tags --max-count=1))

# Print tag for verification
echo "Deploying version: $TAG"

# Load Docker image with versioning
docker build -t snoopify-nextjs:$TAG .

# Save Docker image to local directory
docker save -o ./images/snoopify-nextjs:$TAG.tar snoopify-nextjs:$TAG
