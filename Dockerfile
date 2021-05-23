FROM gcc:11 as gcc
RUN apt-get update && \
    apt-get -y install \
     wget \
     git \
     zip \
     unzip &&\
    rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN \
 git clone https://github.com/jart/cosmopolitan &&\
 cd cosmopolitan &&\
 git checkout 1.0 &&\
 make 

RUN \
 mkdir -p \
  /application/examples \
  /application/third_party &&\
 cp $(find /build/cosmopolitan/o/examples/ -name *.com) /application/examples &&\
 cp $(find /build/cosmopolitan/o/third_party/ -name *.com) /application/third_party

FROM alpine
WORKDIR /application
COPY \
 --from=gcc \
 /application \
 /application
  

