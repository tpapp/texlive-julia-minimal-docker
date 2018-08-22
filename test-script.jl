#!/bin/bash
docker run -t -a STDOUT -a STDIN -a STDERR -v tkpapp/texlive-julia-minimal /test/install-julia.sh nightly
