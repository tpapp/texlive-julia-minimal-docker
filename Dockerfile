FROM leethargo/debian4scip

WORKDIR /test

ADD files/install-julia.sh /test/install-julia.sh

RUN /test/install-julia.sh 0.6

ENV NAME scip-julia-docker
