FROM leethargo/debian4scip

WORKDIR /test

ADD files/install-julia.sh /test/install-julia.sh

RUN apt-get install --no-install-recommends -qq \
  build-essential ca-certificates git rsync unzip wget \
  && /test/install-julia.sh 1.0 \
  && /test/install-julia.sh 0.6

ENV NAME scip-julia-docker
