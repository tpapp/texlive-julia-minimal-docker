#!/bin/bash

if [ "$#" -ne 2 ]; then
    cat <<-END
use as

   install-julia.sh version dir

to download and extract binaries in <dir> for <version>, which can be "stable" or "nightly".

The binary will be at <dir>/bin/julia.
END
    exit 1
fi

case $1 in
    0.6)
        URL=https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.2-linux-x86_64.tar.gz
        ;;
    nightly)
        URL=https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz
        ;;
    *)
        echo "Unknown Julia version '$1'. Use 'stable' or 'nightly'."
        exit 1
esac

DEST=$2
TARBALL=julia.tar.gz
echo "downloading and extracting Julia binaries"
mkdir -p $DEST && wget -O - $URL | tar -C $DEST -zxpf - --strip-components 1
