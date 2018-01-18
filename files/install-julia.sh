#!/bin/bash

if [ "$#" -ne 1 ]; then
    cat <<-END
use as

   install-julia.sh version

to download and extract binaries in /test/julia-<version>. For valid
versions, see the source.

The binary will be at /test/julia-<version>/bin/julia.
END
    exit 1
fi

VERSION=$1

case $VERSION in
    0.6)
        URL=https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.2-linux-x86_64.tar.gz
        ;;
    nightly)
        URL=https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz
        ;;
    *)
        echo "Unknown Julia version '$1'. Use '0.6' or 'nightly'."
        exit 1
esac

DEST=/test/julia-$1/

if [ -d $DEST ]; then
    echo "Julia $VERSION is already available, not downloading."
else
    echo "downloading and extracting Julia binaries"
    mkdir -p $DEST && wget -O - $URL | tar -C $DEST -zxpf - --strip-components 1
fi
