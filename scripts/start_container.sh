#!/bin/bash

set -e

# From DockerHub

# Pull the Docker image from Docker Hub
# docker pull ajs3ra8/aws-sample-python-flask-app

# Run the Docker image as a container
# docker run -d -p 5000:5000 ajs3ra8/aws-sample-python-flask-app

# From ECR

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 178502900821.dkr.ecr.ap-south-1.amazonaws.com

docker pull 178502900821.dkr.ecr.ap-south-1.amazonaws.com/simple-docker-service-0653d624ff7f:latest

docker run -d -p 5000:5000 178502900821.dkr.ecr.ap-south-1.amazonaws.com/simple-docker-service-0653d624ff7f:latest
