FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libntl-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y glib2.0

WORKDIR opprf_psi

COPY . .

RUN mkdir -p build
RUN rm -rf build/*
RUN cd build && cmake -DCMAKE_BUILD_TYPE=Release -DPSI_ANALYTICS_BUILD_EXAMPLE=ON .. && make -j32