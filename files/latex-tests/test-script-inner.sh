#!/bin/bash

# This script is run *inside* the Docker image, to test the relevant functionionality.
set -e

/test/install-julia.sh 1.0         # installation should work
/test/julia-1.0/bin/julia -e '1+1' # should be installed

/test/install-julia.sh 1.1         # installation should work
/test/julia-1.1/bin/julia -e '1+1' # should be installed

/test/install-julia.sh nightly         # installation should work
/test/julia-nightly/bin/julia -e '1+1' # installed nightly should work

# latex environment should be available
pdflatex -halt-on-error test-plot.tex
file -bEi test-plot.pdf | grep "application/pdf"
