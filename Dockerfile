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
 cd cosmopolitan 

WORKDIR /cosmopolitan
RUN \
 bash -c '\
  make -O; \
  for mode in dbg opt rel tiny; \
  do \
   make -O MODE=${mode}; \
  done;\
 '

RUN \
 bash -c '\
 for i in $(ls /cosmopolitan-gcc/bin); \
 do \
  filename=${i/x86_64-linux-musl-/}; \
  ln -s /cosmopolitan-gcc/bin/x86_64-linux-musl-${filename} /usr/local/bin/${filename}; \
 done;'

RUN \
 mkdir -p /cosmopolitan-gcc/x86_64-linux-musl/usr/local &&\
 git clone \
  https://github.com/fabriziobertocci/cosmo-include \
  /usr/local/include
