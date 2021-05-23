ARG mode=rel

FROM gcc:11 as gcc

RUN \
 apt-get update && \
 apt-get -y install \
  wget \
  git \
  zip \
  unzip \
  rsync &&\
 rm -rf /var/lib/apt/lists/*

WORKDIR /build
RUN \
 git clone https://github.com/jart/cosmopolitan &&\
 cd cosmopolitan &&\
 git checkout 1.0 

WORKDIR /build/cosmopolitan
RUN \
 make -O
#make -j12 MODE=${mode}

RUN \
 rsync \
  -qmzarv \
  --include="*/" \
  --include="*.com" \
  --exclude="*" \
  /build/cosmopolitan/o/ /application

FROM alpine
WORKDIR /application
COPY \
 --from=gcc \
 /application/ \
 /application/
  

