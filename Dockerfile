FROM ubuntu:17.10
MAINTAINER Tamas K. Papp <tkpapp@gmail.com>

WORKDIR /test

ADD install-julia.sh /test/install-julia.sh
ADD test-script.sh /test/test-script.sh
ADD .ssh/ /root/.ssh/

RUN apt-get update \
  && apt-get install --no-install-recommends -qq texlive-latex-base git \
    texlive-pictures texlive-latex-extra pdf2svg gnuplot poppler-utils \
    gnuplot-nox wget ca-certificates openssh-client \
  && /test/install-julia.sh 0.6 julia-0.6 \
  && chmod 700 /root/.ssh && chmod 600 /root/.ssh/*

ENV NAME texlive-julia-docker
