#!/bin/bash
docker run -t -a STDOUT -a STDIN -a STDERR -v $PWD:/mnt tkpapp/texlive-julia-minimal /mnt/test-script-inner.sh
