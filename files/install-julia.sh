#!/bin/bash

if [ "$#" -ne 1 ]; then
    cat <<-END
use as

   install-julia.sh version

to download and extract binaries in /test/julia-<version>.
<version> can be

    1) a complete version number of the form v#.#.# (or #.#.#);
    2) a version number of the form v#.# (or #.#);
    3) a version number of the form v# (or #);
    3) nightly

The binary will be at /test/julia-<version>/bin/julia.
END
    exit 1
fi

# TODO: This needs to be manually updated until something like
# https://github.com/JuliaLang/julia/issues/33817 has been resolved
LATEST_V1_MINOR="5"

VERSION=$1

if [[ $VERSION = nightly ]]; then
    URL=https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz
elif [[ $VERSION =~ v?([0-9]+).([0-9]+).([0-9]+) ]]; then
    MAJOR=${BASH_REMATCH[1]}
    MINOR=${BASH_REMATCH[2]}
    PATCH=${BASH_REMATCH[3]}
    TARBALL=$MAJOR.$MINOR/julia-$MAJOR.$MINOR.$PATCH-linux-x86_64.tar.gz
    URL=https://julialang-s3.julialang.org/bin/linux/x64/$TARBALL
elif [[ $VERSION =~ v?([0-9]+).([0-9]+) ]]; then
    MAJOR=${BASH_REMATCH[1]}
    MINOR=${BASH_REMATCH[2]}
    TARBALL=$MAJOR.$MINOR/julia-$MAJOR.$MINOR-latest-linux-x86_64.tar.gz
    URL=https://julialang-s3.julialang.org/bin/linux/x64/$TARBALL
elif [[ $VERSION =~ v?([0-9]+) ]]; then
    MAJOR=${BASH_REMATCH[1]}
    if (( MAJOR == 1 )); then
        MINOR=$LATEST_V1_MINOR
    else
        echo "Don't know the latest minor version for Julia v$MAJOR."
    fi
    TARBALL=$MAJOR.$MINOR/julia-$MAJOR.$MINOR-latest-linux-x86_64.tar.gz
    URL=https://julialang-s3.julialang.org/bin/linux/x64/$TARBALL
else
    echo "Could not parse input as a valid version."
    exit 1
fi

DEST=/test/julia-$VERSION/

if [ -d $DEST ]; then
    echo "Julia $VERSION is already available, not downloading."
else
    echo "downloading and extracting Julia binaries for $VERSION"
    mkdir -p $DEST && wget -O - $URL | tar -C $DEST -zxpf - --strip-components 1
fi
