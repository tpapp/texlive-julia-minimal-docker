#!/bin/bash

set -e

if [ "$TRAVIS_BRANCH" != "master" ]
then
    echo "Not on master, not pushing Docker image."
    exit 0
fi

echo "Pushing Docker image."
docker login --username $DOCKER_USER --password $DOCKER_PASSWORD
docker push $DOCKER_USER/$IMAGE
