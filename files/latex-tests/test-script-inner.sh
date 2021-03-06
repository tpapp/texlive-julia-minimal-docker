#!/bin/bash

# This script is run *inside* the Docker image, to test the relevant functionionality.
set -e

/test/install-julia.sh 1         # installation should work
/test/julia-1/bin/julia -e '1+1' # installed nightly should work

/test/install-julia.sh 1.0         # installation should work
/test/julia-1.0/bin/julia -e '1+1' # should be installed

/test/install-julia.sh 1.1         # installation should work
/test/julia-1.1/bin/julia -e '1+1' # should be installed

/test/install-julia.sh 1.2         # installation should work
/test/julia-1.1/bin/julia -e '1+1' # should be installed

/test/install-julia.sh 1.3         # installation should work
/test/julia-1.3/bin/julia -e '1+1' # should be installed

/test/install-julia.sh 1.4         # installation should work
/test/julia-1.4/bin/julia -e '1+1' # should be installed

/test/install-julia.sh 1.5         # installation should work
/test/julia-1.5/bin/julia -e '1+1' # should be installed

/test/install-julia.sh nightly         # installation should work
/test/julia-nightly/bin/julia -e '1+1' # installed nightly should work

# latex environment should be available
cd /test/latex-tests

echo "########################################"
echo "#### testing pdflatex"
echo "########################################"

pdflatex -halt-on-error test-pdflatex.tex
file -bEi test-pdflatex.pdf | grep "application/pdf"

echo "########################################"
echo "#### testing lualatex"
echo "########################################"

lualatex --halt-on-error test-lualatex.tex
file -bEi test-lualatex.pdf | grep "application/pdf"
