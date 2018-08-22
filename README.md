# minimal docker setup for texlive and Julia

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
[![Build Status](https://api.cirrus-ci.com/github/tpapp/texlive-julia-minimal-docker.svg)](https://cirrus-ci.com/github/tpapp/texlive-julia-minimal-docker)

For testing Julia packages that rely on [TeXLive](https://tug.org/texlive/). It was written primarily for [PGFPlotsX.jl](https://github.com/KristofferC/PGFPlotsX.jl), may be useful for other Julia projects that have extensive binary dependencies (with modifications, of course, you need to edit the [`Dockerfile`](Dockerfile)).

## Usage

Call `docker` as something like

```sh
docker run -ti -a STDOUT -a STDIN -a STDERR -v .:/mnt texlive-julia-minimal /mnt/test-script.sh 1.0
```

ie

1. the source for the package is mounted at `/mnt` in the container (this is hardcoded into the scripts)

2. `1.0` is the version, see [`files/install-julia.sh`](files/install-julia.sh) for alternatives,

3. `test-script.sh` comes from your repository.

## What's in the image

1. a minimal TeXLive distribution

2. script [`files/install-julia.sh`](files/install-julia.sh) to install Julia from official binaries

## Local scripts

Scripts for building, generation and deployment are in [`local/`](local/). See their documentation there. Some paths are hardcoded for my own machine.

## Files for populating the repo

See [their documentation](files/README.md).
