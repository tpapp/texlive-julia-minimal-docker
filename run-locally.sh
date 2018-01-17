#!/bin/bash
TMPDIR=`mktemp -d`
cp -a /home/tamas/src/julia-local-packages/PGFPlotsX.jl/. $TMPDIR/
docker run -ti -a STDOUT -a STDIN -a STDERR -v $TMPDIR:/mnt texlive-julia-minimal /test/test-script.sh stable PGFPlotsX
