#!/bin/bash
set -e
/test/julia-1.0/bin/julia -e '1+1'
/test/install-julia.sh nightly
/test/julia-nightly/bin/julia -e '1+1'
