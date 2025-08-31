#!/bin/bash

set -e

# From DockerHub


# Pull the Docker image from Docker Hub
# docker pull ajs3ra8/aws-sample-python-flask-app

# Run the Docker image as a container
# docker run -d -p 5000:5000 ajs3ra8/aws-sample-python-flask-app

# From ECR

# Authenticate with ECR (non-TTY safe)
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 178502900821.dkr.ecr.ap-south-1.amazonaws.com

# Pull the Docker image from ECR
docker pull 178502900821.dkr.ecr.ap-south-1.amazonaws.com/simple-docker-service-0653d624ff7f:latest

# Stop any existing container running this image (optional)
docker ps -q --filter ancestor=178502900821.dkr.ecr.ap-south-1.amazonaws.com/simple-docker-service-0653d624ff7f:latest | xargs -r docker stop
docker ps -a -q --filter ancestor=178502900821.dkr.ecr.ap-south-1.amazonaws.com/simple-docker-service-0653d624ff7f:latest | xargs -r docker rm

#This stops and removes any container using port 5000.
docker ps -q --filter "publish=5000" | xargs -r docker stop
docker ps -a -q --filter "publish=5000" | xargs -r docker rm

# Run the Docker image as a container
docker run -d -p 5000:5000 178502900821.dkr.ecr.ap-south-1.amazonaws.com/simple-docker-service-0653d624ff7f:latest
