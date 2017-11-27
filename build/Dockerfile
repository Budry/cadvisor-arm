FROM arm32v7/golang

MAINTAINER Ondřej Záruba <info@zaruba-ondrej.cz> (https://zaruba-ondrej.cz)

ENV CADVISOR_VERSION "v0.27.2"

RUN apt-get update && apt-get install -y git dmsetup && apt-get clean
RUN git clone --branch ${CADVISOR_VERSION} https://github.com/google/cadvisor.git /go/src/github.com/google/cadvisor

WORKDIR /go/src/github.com/google/cadvisor

RUN make build
