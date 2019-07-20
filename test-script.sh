#!/bin/bash

# This script is run by the CI environment.

docker run -t -a STDOUT -a STDIN -a STDERR tkpapp/texlive-julia-minimal /test/latex-tests/test-script-inner.sh
