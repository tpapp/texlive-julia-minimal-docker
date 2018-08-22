#!/bin/bash

# This script is run *inside* the Docker image, to test the relevant functionionality.
set -e

/test/julia-1.0/bin/julia -e '1+1' # should be installed
/test/install-julia.sh nightly     # installation should work
/test/julia-nightly/bin/julia -e '1+1' # installed nightly should work
pdflatex -halt-on-error /mnt/test-plot.tex # latex environment should be available ...
test -e /mnt/test-plot.pdf || exit 1  # ... and produce a PDF
