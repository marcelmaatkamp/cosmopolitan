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

WORKDIR /build
RUN \
 git clone https://github.com/jart/cosmopolitan &&\
 cd cosmopolitan &&\
 git checkout 1.0 

WORKDIR /build/cosmopolitan
RUN \
 bash -c '\
  make -O; \
  for mode in dbg opt rel tiny; \
  do \
   make -O MODE=${mode}; \
  done;\
 '
# RUN \
#  rsync \
#   -qmzarv \
#   --include="*/" \
#   --include='*.'{com,dbg} \
#   --exclude="*" \
#   --prune-empty-dirs \
#   /build/cosmopolitan/o/ /cosmopolitan
# 
# FROM alpine
# WORKDIR /application
# COPY \
#  --from=gcc \
#  /cosmopolitan/ \
#  /cosmopolitan/
