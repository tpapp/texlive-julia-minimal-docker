# minimal docker setup for texlive and Julia

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

For testing Julia packages that rely on [TeXLive](https://tug.org/texlive/). It was written primarily for [PGFPlotsX.jl](https://github.com/KristofferC/PGFPlotsX.jl)

## Usage

Call `docker` as something like

```sh
docker run -ti -a STDOUT -a STDIN -a STDERR -v .:/mnt texlive-julia-minimal /test/test-script.sh stable PGFPlotsX
```

ie

1. the source for the package is mounted at `/mnt` in the container (this is hardcoded into the scripts)

2. `stable` is the version, the alternative is `nightly`,

3. the last argument is the package name.
