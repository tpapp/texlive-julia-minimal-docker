#!/bin/bash

# test Docker build locally, open a shell
TMPDIR=`mktemp -d`
echo "making a local copy into $TMPDIR for testing"
cp -a /home/tamas/code/julia/PGFPlotsX/. $TMPDIR/
docker run -ti -a STDOUT -a STDIN -a STDERR -v $TMPDIR:/mnt texlive-julia-minimal bash
