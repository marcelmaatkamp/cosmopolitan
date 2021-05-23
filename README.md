# cosmopolitan "hello-world.com" example 

# TL;DR 
Compiles 'hello-world.c' into a binary 'hello-world.com' which can be executed in linux, mac, windows, FreeBSD, OpenBSD, you can even boot it on bare metal!

This repository builds a docker container with Cosmopolitan Libc from
 - https://justine.lol/cosmopolitan/index.html

And the 'hello-world.c' from
 - https://github.com/jart/cosmopolitan/blob/master/examples/hello.c

And puts the executable in a docker-container called 
 - marcelmaatkamp/osmopolitan-hello-world:latest

# Longer description
Cosmopolitan Libc makes C a build-once run-anywhere language, like Java, except it doesn't need an interpreter or virtual machine. Instead, it reconfigures stock GCC and Clang to output a POSIX-approved polyglot format that runs natively on Linux + Mac + Windows + FreeBSD + OpenBSD + NetBSD + BIOS with the best possible performance and the tiniest footprint imaginable.

# usage

## mac
```
% ./hello-world.com 
hello world
```

## linux
```
$ ./hello-world.com 
hello world
```

## docker 
```
$ docker run --rm marcelmaatkamp/osmopolitan-hello-world
hello world
```

# build
If you want to change the source code, the docker-container or want to extract the binary, use the docker-compose 
```
$ docker-compose up --build
```
The executable will be in 'data/'
