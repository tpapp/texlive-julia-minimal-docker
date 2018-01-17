#!/bin/bash

# test Docker build locally

TMPDIR=`mktemp -d`
echo "making a local copy into $TMPDIR for testing"
cp -a /home/tamas/src/julia-local-packages/PGFPlotsX.jl/. $TMPDIR/
docker run -t -a STDOUT -a STDIN -a STDERR -v $TMPDIR:/mnt texlive-julia-minimal /test/test-script.sh stable PGFPlotsX
