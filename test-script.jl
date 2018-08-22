#!/bin/bash
docker run -t -a STDOUT -a STDIN -a STDERR -v tkpapp/texlive-julia-minimal /test//test/julia-1.0/bin/julia -e '1+1'
