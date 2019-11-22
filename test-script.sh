#!/bin/bash

# This script is run by the CI environment.

docker run -t -a STDOUT -a STDIN -a STDERR $DOCKER_USER/$IMAGE /test/latex-tests/test-script-inner.sh
