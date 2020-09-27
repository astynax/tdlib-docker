FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    gcc-5 \
    g++-5 \
    gperf \
    cmake \
    make \
    libssl-dev

WORKDIR /work

COPY docker/Makefile .

ENTRYPOINT ["make"]
