FROM ubuntu:17.10
MAINTAINER Tamas K. Papp <tkpapp@gmail.com>

WORKDIR /test

ADD install-julia.sh /test/install-julia.sh
ADD test-script.sh /test/test-script.sh

RUN apt-get update \
  && apt-get install --no-install-recommends -qq wget texlive-latex-base git \
    texlive-pictures texlive-latex-extra pdf2svg gnuplot poppler-utils \
    gnuplot-nox ca-certificates \
  && /test/install-julia.sh 0.6 julia-0.6

ENV NAME texlive-julia-docker
