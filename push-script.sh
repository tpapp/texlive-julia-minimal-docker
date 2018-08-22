USER=tkpapp
IMAGE=texlive-julia-minimal

set -e

# if [ "$CIRRUS_BRANCH" != "master" ]
# then
#     exit 0
# fi

docker login --username $DOCKER_USER --password $DOCKER_PASSWORD
docker push $USER/$IMAGE
