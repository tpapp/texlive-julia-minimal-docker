#!/bin/bash

echo "Building Docker image."
docker build --tag $DOCKER_USER/$IMAGE .
