FROM gcc:11 

RUN \
 apt-get update && \
 apt-get -y install \
  wget \
  git \
  zip \
  unzip \
  rsync &&\
 rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN \
 git clone https://github.com/jart/cosmopolitan &&\
 cd cosmopolitan &&\
 git checkout 1.0 

WORKDIR /cosmopolitan
RUN \
 bash -c '\
  make -O; \
  for mode in dbg opt rel tiny; \
  do \
   make -O MODE=${mode}; \
  done;\
 '
