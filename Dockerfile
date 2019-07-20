FROM ubuntu:19.04
MAINTAINER Tamas K. Papp <tkpapp@gmail.com>

WORKDIR /test

ADD files/install-julia.sh /test/install-julia.sh
ADD files/.ssh/ /root/.ssh/
ADD test-script-inner.sh /test/test-script-inner.sh
RUN apt-get update \
        && apt-get install --no-install-recommends -qq texlive-latex-base git \
        texlive-pictures texlive-latex-extra pdf2svg \
        poppler-utils gnuplot-nox wget ca-certificates openssh-client rsync file \
        && /test/install-julia.sh 1.1 \
        && chmod 700 /root/.ssh && chmod 600 /root/.ssh/*

ENV NAME texlive-julia-docker
