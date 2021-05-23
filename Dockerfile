FROM gcc:11 as gcc
WORKDIR /build
RUN \
 git clone https://github.com/jart/cosmopolitan &&\
 cd cosmopolitan &&\
 make 
RUN \
 for dbg_file in $(ls o/examples) ;\
 do \
  file=${dbg_file/.dbg//}; \
  echo ${file}; \
  objcopy -S -O binary ${file}.dbg ${file}; \
 done

FROM alpine
WORKDIR /application
COPY \
 --from=gcc \
  /build/cosmopolitan/o/examples \
  /application/examples_dbg
 
ENTRYPOINT /application/hello-world.com
