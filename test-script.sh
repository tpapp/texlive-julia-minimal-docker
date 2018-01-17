#!/bin/bash

if [ "$#" -ne 2 ]; then
    cat <<-END
use as

   test-script.sh julia_version pkgname

where julia-version is accepted by install-julia.sh.

The script

1. Downloads and extracts the julia binary if necessary,
2. clones the package from /mnt,
3. builds it, emits coverage info in /mnt.
END
    exit 1
fi

JULIAVER=$1
JULIADIR=/test/julia-$JULIAVER
PKGNAME=$2

## stable is in the image, but nightly needs to be installed
[ "$JULIAVER" == "nightly" ] && /test/install-julia.sh $JULIAVER $JULIADIR

cd /mnt && if [[ -a .git/shallow ]]; then git fetch --unshallow; fi

# run tests
$JULIADIR/bin/julia -e "Pkg.clone(\"/mnt/\", \"$PKGNAME\"); Pkg.build(\"$PKGNAME\"); Pkg.test(\"$PKGNAME\"; coverage=true)"

# save coverage results back to host
cp `$JULIADIR/bin/julia -e "print(Pkg.dir(\"$PKGNAME\", \"src\"))"`/*.cov /mnt/src/
