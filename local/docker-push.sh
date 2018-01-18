#!/bin/bash

# upload image (as "latest", no tag)

USER=tkpapp
IMAGE=texlive-julia-minimal

docker tag $IMAGE $USER/$IMAGE
docker push $USER/$IMAGE
