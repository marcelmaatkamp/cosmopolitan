# Cosmopolitan in docker 

# TL;DR 
Compiles all example programs from [Cosmopolitan Libc](https://github.com/jart/cosmopolitan) n a docker container (marcelmaatkamp/cosmopolitan)[https://hub.docker.com/r/marcelmaatkamp/cosmopolitan] where each individual binary can be executed multiple platforms like linux, mac, windows, FreeBSD, OpenBSD and you can even boot it in qemu or on bare metal.

# Description
[Cosmopolitan Libc](https://github.com/jart/cosmopolitan) describes itself as: "makes C a build-once run-anywhere language, like Java, except it doesn't need an interpreter or virtual machine. Instead, it reconfigures stock GCC and Clang to output a POSIX-approved polyglot format that runs natively on Linux + Mac + Windows + FreeBSD + OpenBSD + NetBSD + BIOS with the best possible performance and the tiniest footprint imaginable."

# Examples
These are examples on how to run the executables. In the section [files](#files) you can find all the possible example files. I've described a few examples (hello-world and sqlite) on how to run on multiple platforms, the rest is more of the same.

## hello-world

### docker
```
% docker run --rm -ti marcelmaatkamp/cosmopolitan sh -c /application/examples/hello.com

hello world
```

### linux
```
$ docker run -v ${PWD}/cosmopolitan:/data marcelmaatkamp/cosmopolitan sh -c 'cp -r /application/* /data' &&\ 
  sudo chown -R ${USER} ${PWD}/cosmopolitan &&\
  ${PWD}/cosmopolitan/examples/hello.com 

  hello world
```

### mac 
```
$ docker run -v ${PWD}/cosmopolitan:/data marcelmaatkamp/cosmopolitan sh -c 'cp -r /application/* /data' &&\
  sudo chown -R ${USER} ${PWD}/cosmopolitan &&\
  sh ${PWD}/cosmopolitan/examples/hello.com

  hello world
```

### qemu
```
$ docker run -v ${PWD}/cosmopolitan:/data marcelmaatkamp/cosmopolitan sh -c 'cp -r /application/* /data' &&\
  sudo chown -R ${USER} ${PWD}/cosmopolitan &&\
  qemu-system-x86_64 -m 16 -no-reboot -nographic -fda ${PWD}/cosmopolitan/examples/hello.com

SeaBIOS (version rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org)

iPXE (http://ipxe.org) 00:03.0 CA00 PCI2.10 PnP PMM+00F8F290+00EEF290 CA00

Booting from Hard Disk...
Boot failed: could not read the boot disk

Booting from Floppy...
hello world
```

## sqlite 

### docker 
```
$ docker run --rm -ti marcelmaatkamp/cosmopolitan sh -c third_party/sqlite3/sqlite3.com

SQLite version 3.35.5 2021-04-19 18:32:05
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>
```

### linux
```
$ docker run -v ${PWD}/cosmopolitan:/data marcelmaatkamp/cosmopolitan sh -c 'cp -r /application/* /data' &&\
  sudo chown -R ${USER} ${PWD}/cosmopolitan &&\
  ${PWD}/cosmopolitan/third_party/sqlite3/sqlite3.com

SQLite version 3.35.5 2021-04-19 18:32:05
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>
```

### mac
```
$ docker run -v ${PWD}/cosmopolitan:/data marcelmaatkamp/cosmopolitan sh -c 'cp -r /application/* /data' &&\
  sudo chown -R ${USER} ${PWD}/cosmopolitan &&\
  sh ${PWD}/cosmopolitan/third_party/sqlite3/sqlite3.com

SQLite version 3.35.5 2021-04-19 18:32:05
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>
```

# qemu
(This does not seem to work, I think sqlite is too clever and wants to do something special with the terminal and crashes, but maybe qemu-system-x86_64 has an option to make this work which is something to be tried out)
```
$ docker run -v ${PWD}/cosmopolitan:/data marcelmaatkamp/cosmopolitan sh -c 'cp -r /application/* /data' &&\
  sudo chown -R ${USER} ${PWD}/cosmopolitan &&\
  qemu-system-x86_64 -m 16 -no-reboot -nographic -fda ${PWD}/cosmopolitan/third_party/sqlite3/sqlite3.com
```

# build
If you want to compile the examples yourself just use the following command-line:
```
$ docker-compose up --build &&\
  sudo chown -R ${USER} ${PWD}/data/*
```

# files

| examples |
| ------ |
| [examples/date.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/date.com) |
| [examples/nesemu1.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/nesemu1.com) |
| [examples/walk.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/walk.com) |
| [examples/hellolua.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/hellolua.com) |
| [examples/cplusplus.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/cplusplus.com) |
| [examples/printargs.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/printargs.com) |
| [examples/hangman.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/hangman.com) |
| [examples/hello2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/hello2.com) |
| [examples/hello3.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/hello3.com) |
| [examples/seq.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/seq.com) |
| [examples/ucontext-sigfpe-recovery.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/ucontext-sigfpe-recovery.com) |
| [examples/breakpoint.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/breakpoint.com) |
| [examples/ctrlc.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/ctrlc.com) |
| [examples/printprimes.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/printprimes.com) |
| [examples/generalized-automatic-datastructure-printing.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/generalized-automatic-datastructure-printing.com) |
| [examples/lstime.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/lstime.com) |
| [examples/hello.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/hello.com) |
| [examples/nc.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/nc.com) |
| [examples/x86split.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/x86split.com) |
| [examples/cp.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/cp.com) |
| [examples/stat.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/stat.com) |
| [examples/hertz.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/hertz.com) |
| [examples/forkrand.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/forkrand.com) |
| [examples/ispell.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/ispell.com) |
| [examples/kilo.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/kilo.com) |
| [examples/ls.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/ls.com) |
| [examples/hostname.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/hostname.com) |
| [examples/crashreport.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/crashreport.com) |
| [examples/touch.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/touch.com) |
| [examples/sleep.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/sleep.com) |
| [examples/life.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/life.com) |
| [examples/panels.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/panels.com) |
| [examples/gui.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/gui.com) |
| [examples/unbourne.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/unbourne.com) |
| [examples/echo.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/echo.com) |
| [examples/rusage.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/rusage.com) |
| [examples/system.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/system.com) |
| [examples/curl.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/curl.com) |
| [examples/package/program.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/package/program.com) |
| [examples/auto-launch-gdb-on-crash.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/auto-launch-gdb-on-crash.com) |
| [examples/ttyinfo.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/examples/ttyinfo.com) |

| third_party |
| ------ |
| [third_party/chibicc/test/pragma-once_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/pragma-once_test.com) |
| [third_party/chibicc/test/dce_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/dce_test.com) |
| [third_party/chibicc/test/attribute_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/attribute_test2.com) |
| [third_party/chibicc/test/literal_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/literal_test2.com) |
| [third_party/chibicc/test/string_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/string_test.com) |
| [third_party/chibicc/test/decl_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/decl_test2.com) |
| [third_party/chibicc/test/line_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/line_test2.com) |
| [third_party/chibicc/test/typeof_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/typeof_test2.com) |
| [third_party/chibicc/test/alignof_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/alignof_test2.com) |
| [third_party/chibicc/test/struct_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/struct_test.com) |
| [third_party/chibicc/test/dce_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/dce_test2.com) |
| [third_party/chibicc/test/offsetof_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/offsetof_test.com) |
| [third_party/chibicc/test/alloca_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/alloca_test.com) |
| [third_party/chibicc/test/struct_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/struct_test2.com) |
| [third_party/chibicc/test/attribute_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/attribute_test.com) |
| [third_party/chibicc/test/asm_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/asm_test2.com) |
| [third_party/chibicc/test/vector_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/vector_test.com) |
| [third_party/chibicc/test/unicode_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/unicode_test.com) |
| [third_party/chibicc/test/macro_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/macro_test.com) |
| [third_party/chibicc/test/initializer_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/initializer_test2.com) |
| [third_party/chibicc/test/function_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/function_test.com) |
| [third_party/chibicc/test/varargs_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/varargs_test.com) |
| [third_party/chibicc/test/string_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/string_test2.com) |
| [third_party/chibicc/test/builtin_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/builtin_test2.com) |
| [third_party/chibicc/test/complit_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/complit_test2.com) |
| [third_party/chibicc/test/cast_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/cast_test2.com) |
| [third_party/chibicc/test/variable_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/variable_test.com) |
| [third_party/chibicc/test/pointer_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/pointer_test2.com) |
| [third_party/chibicc/test/arith_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/arith_test.com) |
| [third_party/chibicc/test/constexpr_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/constexpr_test2.com) |
| [third_party/chibicc/test/vla_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/vla_test2.com) |
| [third_party/chibicc/test/decl_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/decl_test.com) |
| [third_party/chibicc/test/bitfield_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/bitfield_test2.com) |
| [third_party/chibicc/test/function_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/function_test2.com) |
| [third_party/chibicc/test/unicode_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/unicode_test2.com) |
| [third_party/chibicc/test/asm_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/asm_test.com) |
| [third_party/chibicc/test/typeof_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/typeof_test.com) |
| [third_party/chibicc/test/typedef_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/typedef_test2.com) |
| [third_party/chibicc/test/compat_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/compat_test.com) |
| [third_party/chibicc/test/sizeof_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/sizeof_test2.com) |
| [third_party/chibicc/test/compat_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/compat_test2.com) |
| [third_party/chibicc/test/extern_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/extern_test.com) |
| [third_party/chibicc/test/literal_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/literal_test.com) |
| [third_party/chibicc/test/bitfield_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/bitfield_test.com) |
| [third_party/chibicc/test/float_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/float_test.com) |
| [third_party/chibicc/test/control_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/control_test.com) |
| [third_party/chibicc/test/enum_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/enum_test2.com) |
| [third_party/chibicc/test/typedef_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/typedef_test.com) |
| [third_party/chibicc/test/builtin_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/builtin_test.com) |
| [third_party/chibicc/test/int128_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/int128_test2.com) |
| [third_party/chibicc/test/cast_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/cast_test.com) |
| [third_party/chibicc/test/varargs_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/varargs_test2.com) |
| [third_party/chibicc/test/alignof_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/alignof_test.com) |
| [third_party/chibicc/test/sizeof_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/sizeof_test.com) |
| [third_party/chibicc/test/complit_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/complit_test.com) |
| [third_party/chibicc/test/alloca_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/alloca_test2.com) |
| [third_party/chibicc/test/extern_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/extern_test2.com) |
| [third_party/chibicc/test/generic_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/generic_test.com) |
| [third_party/chibicc/test/pragma-once_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/pragma-once_test2.com) |
| [third_party/chibicc/test/usualconv_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/usualconv_test2.com) |
| [third_party/chibicc/test/const_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/const_test.com) |
| [third_party/chibicc/test/enum_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/enum_test.com) |
| [third_party/chibicc/test/variable_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/variable_test2.com) |
| [third_party/chibicc/test/arith_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/arith_test2.com) |
| [third_party/chibicc/test/offsetof_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/offsetof_test2.com) |
| [third_party/chibicc/test/assert_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/assert_test.com) |
| [third_party/chibicc/test/vector_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/vector_test2.com) |
| [third_party/chibicc/test/constexpr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/constexpr_test.com) |
| [third_party/chibicc/test/line_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/line_test.com) |
| [third_party/chibicc/test/pointer_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/pointer_test.com) |
| [third_party/chibicc/test/const_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/const_test2.com) |
| [third_party/chibicc/test/control_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/control_test2.com) |
| [third_party/chibicc/test/generic_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/generic_test2.com) |
| [third_party/chibicc/test/assert_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/assert_test2.com) |
| [third_party/chibicc/test/float_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/float_test2.com) |
| [third_party/chibicc/test/union_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/union_test.com) |
| [third_party/chibicc/test/usualconv_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/usualconv_test.com) |
| [third_party/chibicc/test/vla_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/vla_test.com) |
| [third_party/chibicc/test/macro_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/macro_test2.com) |
| [third_party/chibicc/test/union_test2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/union_test2.com) |
| [third_party/chibicc/test/initializer_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/initializer_test.com) |
| [third_party/chibicc/test/int128_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/test/int128_test.com) |
| [third_party/chibicc/chibicc2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/chibicc2.com) |
| [third_party/chibicc/chibicc.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/chibicc/chibicc.com) |
| [third_party/lz4cli/lz4cli.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/lz4cli/lz4cli.com) |
| [third_party/quickjs/qjsc.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/quickjs/qjsc.com) |
| [third_party/quickjs/run-test262.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/quickjs/run-test262.com) |
| [third_party/quickjs/qjs.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/quickjs/qjs.com) |
| [third_party/quickjs/unicode_gen.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/quickjs/unicode_gen.com) |
| [third_party/lua/lua.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/lua/lua.com) |
| [third_party/sqlite3/sqlite3.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/third_party/sqlite3/sqlite3.com) |

| tool |
| ------ |
| [tool/net/redbean.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/net/redbean.com) |
| [tool/net/dig.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/net/dig.com) |
| [tool/net/echoserver.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/net/echoserver.com) |
| [tool/hash/crctab.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/hash/crctab.com) |
| [tool/decode/x86opinfo.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/x86opinfo.com) |
| [tool/decode/elf.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/elf.com) |
| [tool/decode/unhex.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/unhex.com) |
| [tool/decode/mkcombos.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/mkcombos.com) |
| [tool/decode/pe2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/pe2.com) |
| [tool/decode/ar.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/ar.com) |
| [tool/decode/macho.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/macho.com) |
| [tool/decode/scrubdox.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/scrubdox.com) |
| [tool/decode/peboff.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/peboff.com) |
| [tool/decode/zip.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/zip.com) |
| [tool/decode/ent.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/ent.com) |
| [tool/decode/x87.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/x87.com) |
| [tool/decode/hex.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/hex.com) |
| [tool/decode/mkwides.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/mkwides.com) |
| [tool/decode/xor.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/decode/xor.com) |
| [tool/viz/xterm256info.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/xterm256info.com) |
| [tool/viz/xterm256effective.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/xterm256effective.com) |
| [tool/viz/int2float.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/int2float.com) |
| [tool/viz/double2int.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/double2int.com) |
| [tool/viz/xterm256effective2.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/xterm256effective2.com) |
| [tool/viz/basicidea.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/basicidea.com) |
| [tool/viz/invertblocks.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/invertblocks.com) |
| [tool/viz/ascii2utf8.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/ascii2utf8.com) |
| [tool/viz/rgbtoxterm.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/rgbtoxterm.com) |
| [tool/viz/printpixel.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/printpixel.com) |
| [tool/viz/xterm256cubes.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/xterm256cubes.com) |
| [tool/viz/memzoom.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/memzoom.com) |
| [tool/viz/bf.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/bf.com) |
| [tool/viz/bing.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/bing.com) |
| [tool/viz/deathstar.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/deathstar.com) |
| [tool/viz/generatematrix.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/generatematrix.com) |
| [tool/viz/generatetortureimage.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/generatetortureimage.com) |
| [tool/viz/printvideo.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/printvideo.com) |
| [tool/viz/derasterize.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/derasterize.com) |
| [tool/viz/comma.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/comma.com) |
| [tool/viz/bin2asm.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/bin2asm.com) |
| [tool/viz/upscaleint.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/upscaleint.com) |
| [tool/viz/unbing.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/unbing.com) |
| [tool/viz/printpeb.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/printpeb.com) |
| [tool/viz/printansi.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/printansi.com) |
| [tool/viz/tabalign.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/tabalign.com) |
| [tool/viz/cpuid.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/cpuid.com) |
| [tool/viz/unicode.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/unicode.com) |
| [tool/viz/life.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/life.com) |
| [tool/viz/xterm256gradient.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/xterm256gradient.com) |
| [tool/viz/printimage.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/printimage.com) |
| [tool/viz/magikarp.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/magikarp.com) |
| [tool/viz/od16.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/od16.com) |
| [tool/viz/tailf.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/tailf.com) |
| [tool/viz/fold.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/fold.com) |
| [tool/viz/upscalefloat.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/viz/upscalefloat.com) |
| [tool/build/calculator.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/calculator.com) |
| [tool/build/rollup.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/rollup.com) |
| [tool/build/lz4toasm.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/lz4toasm.com) |
| [tool/build/zipobj.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/zipobj.com) |
| [tool/build/helpop.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/helpop.com) |
| [tool/build/tinyemu.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/tinyemu.com) |
| [tool/build/pstrace.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/pstrace.com) |
| [tool/build/ar.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/ar.com) |
| [tool/build/runitd.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/runitd.com) |
| [tool/build/dropcache.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/dropcache.com) |
| [tool/build/package.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/package.com) |
| [tool/build/runit.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/runit.com) |
| [tool/build/blinkenlights.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/blinkenlights.com) |
| [tool/build/summy.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/summy.com) |
| [tool/build/compile.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/compile.com) |
| [tool/build/dis.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/dis.com) |
| [tool/build/rle.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/rle.com) |
| [tool/build/refactor.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/refactor.com) |
| [tool/build/x86combos.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/x86combos.com) |
| [tool/build/mkdeps.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/tool/build/mkdeps.com) |

| build |
| ------ |
| [build/bootstrap/zipobj.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/build/bootstrap/zipobj.com) |
| [build/bootstrap/ar.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/build/bootstrap/ar.com) |
| [build/bootstrap/package.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/build/bootstrap/package.com) |
| [build/bootstrap/compile.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/build/bootstrap/compile.com) |
| [build/bootstrap/mkdeps.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/build/bootstrap/mkdeps.com) |

| test |
| ------ |
| [test/libc/calls/ftruncate_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/ftruncate_test.com) |
| [test/libc/calls/fork_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/fork_test.com) |
| [test/libc/calls/lseek_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/lseek_test.com) |
| [test/libc/calls/access_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/access_test.com) |
| [test/libc/calls/fcntl_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/fcntl_test.com) |
| [test/libc/calls/stat_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/stat_test.com) |
| [test/libc/calls/mkntenvblock_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/mkntenvblock_test.com) |
| [test/libc/calls/getenv_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/getenv_test.com) |
| [test/libc/calls/mkntcmdline_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/mkntcmdline_test.com) |
| [test/libc/calls/mkdir_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/mkdir_test.com) |
| [test/libc/calls/vfork_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/vfork_test.com) |
| [test/libc/calls/sigaction_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/sigaction_test.com) |
| [test/libc/calls/signal_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/signal_test.com) |
| [test/libc/calls/writev_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/writev_test.com) |
| [test/libc/calls/getcwd_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/getcwd_test.com) |
| [test/libc/calls/mkntpath_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/mkntpath_test.com) |
| [test/libc/calls/mprotect_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/mprotect_test.com) |
| [test/libc/calls/commandv_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/calls/commandv_test.com) |
| [test/libc/intrin/pshuf_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/intrin/pshuf_test.com) |
| [test/libc/intrin/asan_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/intrin/asan_test.com) |
| [test/libc/intrin/pmulhrsw_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/intrin/pmulhrsw_test.com) |
| [test/libc/intrin/palignr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/intrin/palignr_test.com) |
| [test/libc/intrin/intrin_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/intrin/intrin_test.com) |
| [test/libc/crypto/rijndael_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/crypto/rijndael_test.com) |
| [test/libc/tinymath/cbrt_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/cbrt_test.com) |
| [test/libc/tinymath/log2_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/log2_test.com) |
| [test/libc/tinymath/exp2_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/exp2_test.com) |
| [test/libc/tinymath/strtod_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/strtod_test.com) |
| [test/libc/tinymath/gamma_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/gamma_test.com) |
| [test/libc/tinymath/floor_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/floor_test.com) |
| [test/libc/tinymath/atan_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/atan_test.com) |
| [test/libc/tinymath/acosh_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/acosh_test.com) |
| [test/libc/tinymath/log1p_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/log1p_test.com) |
| [test/libc/tinymath/hypot_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/hypot_test.com) |
| [test/libc/tinymath/pow10_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/pow10_test.com) |
| [test/libc/tinymath/sqrt_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/sqrt_test.com) |
| [test/libc/tinymath/atan2_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/atan2_test.com) |
| [test/libc/tinymath/atanl_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/atanl_test.com) |
| [test/libc/tinymath/round_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/round_test.com) |
| [test/libc/tinymath/asinh_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/asinh_test.com) |
| [test/libc/tinymath/fabs_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/fabs_test.com) |
| [test/libc/tinymath/exp_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/exp_test.com) |
| [test/libc/tinymath/fmod_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/fmod_test.com) |
| [test/libc/tinymath/atan2l_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/atan2l_test.com) |
| [test/libc/tinymath/copysign_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/copysign_test.com) |
| [test/libc/tinymath/tan_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/tan_test.com) |
| [test/libc/tinymath/tanh_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/tanh_test.com) |
| [test/libc/tinymath/expm1_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/expm1_test.com) |
| [test/libc/tinymath/atanh_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/atanh_test.com) |
| [test/libc/tinymath/exp10_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/exp10_test.com) |
| [test/libc/tinymath/powl_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/powl_test.com) |
| [test/libc/tinymath/asin_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/asin_test.com) |
| [test/libc/tinymath/sinh_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/sinh_test.com) |
| [test/libc/tinymath/ldexp_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/ldexp_test.com) |
| [test/libc/tinymath/ilogb_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/ilogb_test.com) |
| [test/libc/tinymath/erf_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/erf_test.com) |
| [test/libc/tinymath/log_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/log_test.com) |
| [test/libc/tinymath/cosh_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/cosh_test.com) |
| [test/libc/tinymath/logb_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/logb_test.com) |
| [test/libc/tinymath/trunc_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/trunc_test.com) |
| [test/libc/tinymath/sin_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/sin_test.com) |
| [test/libc/tinymath/exp2l_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/exp2l_test.com) |
| [test/libc/tinymath/acos_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/acos_test.com) |
| [test/libc/tinymath/ceil_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/tinymath/ceil_test.com) |
| [test/libc/unicode/wcwidth_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/unicode/wcwidth_test.com) |
| [test/libc/unicode/strnwidth_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/unicode/strnwidth_test.com) |
| [test/libc/fmt/sprintf_s_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/sprintf_s_test.com) |
| [test/libc/fmt/llog10_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/llog10_test.com) |
| [test/libc/fmt/fcvt_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/fcvt_test.com) |
| [test/libc/fmt/basename_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/basename_test.com) |
| [test/libc/fmt/fmt_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/fmt_test.com) |
| [test/libc/fmt/palandprintf_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/palandprintf_test.com) |
| [test/libc/fmt/strerror_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/strerror_test.com) |
| [test/libc/fmt/dirname_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/dirname_test.com) |
| [test/libc/fmt/strtoumax_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/strtoumax_test.com) |
| [test/libc/fmt/timevaltofiletime_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/timevaltofiletime_test.com) |
| [test/libc/fmt/itoa64radix10_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/itoa64radix10_test.com) |
| [test/libc/fmt/sscanf_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/sscanf_test.com) |
| [test/libc/fmt/strtoimax_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/strtoimax_test.com) |
| [test/libc/fmt/itoa64radix16_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/fmt/itoa64radix16_test.com) |
| [test/libc/runtime/getdosargv_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/getdosargv_test.com) |
| [test/libc/runtime/grow_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/grow_test.com) |
| [test/libc/runtime/arch_prctl_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/arch_prctl_test.com) |
| [test/libc/runtime/mmap_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/mmap_test.com) |
| [test/libc/runtime/memtrack_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/memtrack_test.com) |
| [test/libc/runtime/carsort_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/carsort_test.com) |
| [test/libc/runtime/getdosenviron_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/getdosenviron_test.com) |
| [test/libc/runtime/itsatrap_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/runtime/itsatrap_test.com) |
| [test/libc/release/smoke.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/release/smoke.com) |
| [test/libc/release/smokeansi.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/release/smokeansi.com) |
| [test/libc/release/smoke-nms.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/release/smoke-nms.com) |
| [test/libc/release/smokecxx.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/release/smokecxx.com) |
| [test/libc/nexgen32e/ffs_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/ffs_test.com) |
| [test/libc/nexgen32e/memrchr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/memrchr_test.com) |
| [test/libc/nexgen32e/strcspn_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/strcspn_test.com) |
| [test/libc/nexgen32e/sidiv_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/sidiv_test.com) |
| [test/libc/nexgen32e/memmove_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/memmove_test.com) |
| [test/libc/nexgen32e/lz4decode_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/lz4decode_test.com) |
| [test/libc/nexgen32e/strsak32_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/strsak32_test.com) |
| [test/libc/nexgen32e/kcp437_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/kcp437_test.com) |
| [test/libc/nexgen32e/memeqmask_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/memeqmask_test.com) |
| [test/libc/nexgen32e/memset_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/memset_test.com) |
| [test/libc/nexgen32e/cescapec_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/cescapec_test.com) |
| [test/libc/nexgen32e/crc32_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/crc32_test.com) |
| [test/libc/nexgen32e/strcaseconv_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/nexgen32e/strcaseconv_test.com) |
| [test/libc/time/strftime_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/time/strftime_test.com) |
| [test/libc/time/dsleep_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/time/dsleep_test.com) |
| [test/libc/time/clock_gettime_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/time/clock_gettime_test.com) |
| [test/libc/xed/x86ild_popular_cmov_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_popular_cmov_test.com) |
| [test/libc/xed/x86ild_popular_i86_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_popular_i86_test.com) |
| [test/libc/xed/x86ild_popular_i186_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_popular_i186_test.com) |
| [test/libc/xed/x86ild_popular_i386_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_popular_i386_test.com) |
| [test/libc/xed/x86ild_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_test.com) |
| [test/libc/xed/x86ild_popular_binary_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_popular_binary_test.com) |
| [test/libc/xed/x86ild_popular_logical_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_popular_logical_test.com) |
| [test/libc/xed/x86ild_popular_misc_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_popular_misc_test.com) |
| [test/libc/xed/x86ild_widenop_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/xed/x86ild_widenop_test.com) |
| [test/libc/stdio/system_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/system_test.com) |
| [test/libc/stdio/tmpfile_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/tmpfile_test.com) |
| [test/libc/stdio/freopen_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/freopen_test.com) |
| [test/libc/stdio/fputs_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/fputs_test.com) |
| [test/libc/stdio/mkostempsm_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/mkostempsm_test.com) |
| [test/libc/stdio/fmemopen_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/fmemopen_test.com) |
| [test/libc/stdio/getdelim_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/getdelim_test.com) |
| [test/libc/stdio/ftell_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/ftell_test.com) |
| [test/libc/stdio/dirstream_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/dirstream_test.com) |
| [test/libc/stdio/fgets_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/fgets_test.com) |
| [test/libc/stdio/spawn_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/spawn_test.com) |
| [test/libc/stdio/fgetwc_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/fgetwc_test.com) |
| [test/libc/stdio/popen_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/popen_test.com) |
| [test/libc/stdio/ungetc_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/ungetc_test.com) |
| [test/libc/stdio/fputc_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/fputc_test.com) |
| [test/libc/stdio/fwrite_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/stdio/fwrite_test.com) |
| [test/libc/bits/popcnt_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/popcnt_test.com) |
| [test/libc/bits/roundup2pow_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/roundup2pow_test.com) |
| [test/libc/bits/morton_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/morton_test.com) |
| [test/libc/bits/bitreverse_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/bitreverse_test.com) |
| [test/libc/bits/integralarithmetic_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/integralarithmetic_test.com) |
| [test/libc/bits/roundup2log_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/roundup2log_test.com) |
| [test/libc/bits/rounddown2pow_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/rounddown2pow_test.com) |
| [test/libc/bits/division_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/bits/division_test.com) |
| [test/libc/sock/inet_ntoa_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/sock/inet_ntoa_test.com) |
| [test/libc/sock/inet_pton_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/sock/inet_pton_test.com) |
| [test/libc/sock/sendrecvmsg_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/sock/sendrecvmsg_test.com) |
| [test/libc/sock/poll_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/sock/poll_test.com) |
| [test/libc/sock/socketpair_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/sock/socketpair_test.com) |
| [test/libc/sock/inet_ntop_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/sock/inet_ntop_test.com) |
| [test/libc/rand/rand_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/rand/rand_test.com) |
| [test/libc/rand/devrand_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/rand/devrand_test.com) |
| [test/libc/dns/parseresolvconf_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/dns/parseresolvconf_test.com) |
| [test/libc/dns/comparednsnames_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/dns/comparednsnames_test.com) |
| [test/libc/dns/parsehoststxt_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/dns/parsehoststxt_test.com) |
| [test/libc/dns/resolvehoststxt_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/dns/resolvehoststxt_test.com) |
| [test/libc/dns/dnsheader_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/dns/dnsheader_test.com) |
| [test/libc/dns/dnsquestion_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/dns/dnsquestion_test.com) |
| [test/libc/dns/pascalifydnsname_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/dns/pascalifydnsname_test.com) |
| [test/libc/x/utf8toutf16_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/x/utf8toutf16_test.com) |
| [test/libc/x/utf16toutf8_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/x/utf16toutf8_test.com) |
| [test/libc/x/xstrcat_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/x/xstrcat_test.com) |
| [test/libc/x/xslurp_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/x/xslurp_test.com) |
| [test/libc/x/xjoinpaths_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/x/xjoinpaths_test.com) |
| [test/libc/x/xasprintf_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/x/xasprintf_test.com) |
| [test/libc/str/tprecode16to8_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/tprecode16to8_test.com) |
| [test/libc/str/strcasecmp_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strcasecmp_test.com) |
| [test/libc/str/pututf16_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/pututf16_test.com) |
| [test/libc/str/strstr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strstr_test.com) |
| [test/libc/str/strcmp_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strcmp_test.com) |
| [test/libc/str/regex_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/regex_test.com) |
| [test/libc/str/undeflate_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/undeflate_test.com) |
| [test/libc/str/memcpy_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/memcpy_test.com) |
| [test/libc/str/memfrob_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/memfrob_test.com) |
| [test/libc/str/highwayhash64_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/highwayhash64_test.com) |
| [test/libc/str/strchr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strchr_test.com) |
| [test/libc/str/a64l_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/a64l_test.com) |
| [test/libc/str/strcpy_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strcpy_test.com) |
| [test/libc/str/sigset_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/sigset_test.com) |
| [test/libc/str/strlcpy_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strlcpy_test.com) |
| [test/libc/str/getutf16_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/getutf16_test.com) |
| [test/libc/str/crc32c_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/crc32c_test.com) |
| [test/libc/str/strtolower_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strtolower_test.com) |
| [test/libc/str/str_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/str_test.com) |
| [test/libc/str/memmem_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/memmem_test.com) |
| [test/libc/str/strtok_r_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strtok_r_test.com) |
| [test/libc/str/memccpy_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/memccpy_test.com) |
| [test/libc/str/strlen_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strlen_test.com) |
| [test/libc/str/bsr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/bsr_test.com) |
| [test/libc/str/towupper_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/towupper_test.com) |
| [test/libc/str/strrchr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/strrchr_test.com) |
| [test/libc/str/tprecode8to16_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/tprecode8to16_test.com) |
| [test/libc/str/tpenc_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/str/tpenc_test.com) |
| [test/libc/mem/strdup_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/mem/strdup_test.com) |
| [test/libc/mem/malloc_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/mem/malloc_test.com) |
| [test/libc/alg/bisectcarleft_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/bisectcarleft_test.com) |
| [test/libc/alg/replacestr_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/replacestr_test.com) |
| [test/libc/alg/arraylist_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/arraylist_test.com) |
| [test/libc/alg/qsort_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/qsort_test.com) |
| [test/libc/alg/djbsort_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/djbsort_test.com) |
| [test/libc/alg/tarjan_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/tarjan_test.com) |
| [test/libc/alg/comparator_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/comparator_test.com) |
| [test/libc/alg/reverse_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/reverse_test.com) |
| [test/libc/alg/critbit0_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/libc/alg/critbit0_test.com) |
| [test/net/http/parsehttprequest_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/parsehttprequest_test.com) |
| [test/net/http/parsehttprange_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/parsehttprange_test.com) |
| [test/net/http/parsecontentlength_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/parsecontentlength_test.com) |
| [test/net/http/parsehttpdatetime_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/parsehttpdatetime_test.com) |
| [test/net/http/decodelatin1_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/decodelatin1_test.com) |
| [test/net/http/isacceptablehost_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/isacceptablehost_test.com) |
| [test/net/http/parseurl_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/parseurl_test.com) |
| [test/net/http/visualizecontrolcodes_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/visualizecontrolcodes_test.com) |
| [test/net/http/encodebase64_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/encodebase64_test.com) |
| [test/net/http/isacceptablepath_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/isacceptablepath_test.com) |
| [test/net/http/encodehttpheadervalue_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/encodehttpheadervalue_test.com) |
| [test/net/http/indentlines_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/indentlines_test.com) |
| [test/net/http/isreasonablepath_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/isreasonablepath_test.com) |
| [test/net/http/escapeurlparam_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/escapeurlparam_test.com) |
| [test/net/http/underlong_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/underlong_test.com) |
| [test/net/http/escapehtml_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/escapehtml_test.com) |
| [test/net/http/hascontrolcodes_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/hascontrolcodes_test.com) |
| [test/net/http/escapejsstringliteral_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/net/http/escapejsstringliteral_test.com) |
| [test/dsp/tty/windex_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/tty/windex_test.com) |
| [test/dsp/tty/ttymove_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/tty/ttymove_test.com) |
| [test/dsp/tty/rgb2ansi_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/tty/rgb2ansi_test.com) |
| [test/dsp/tty/ttyraster_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/tty/ttyraster_test.com) |
| [test/dsp/scale/magikarp_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/scale/magikarp_test.com) |
| [test/dsp/scale/scale_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/scale/scale_test.com) |
| [test/dsp/core/float2short_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/float2short_test.com) |
| [test/dsp/core/gamma_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/gamma_test.com) |
| [test/dsp/core/inv3_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/inv3_test.com) |
| [test/dsp/core/sad16x8n_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/sad16x8n_test.com) |
| [test/dsp/core/scalevolume_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/scalevolume_test.com) |
| [test/dsp/core/getintegercoefficients_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/getintegercoefficients_test.com) |
| [test/dsp/core/getintegercoefficients8_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/getintegercoefficients8_test.com) |
| [test/dsp/core/illumination_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/dsp/core/illumination_test.com) |
| [test/tool/net/redbean_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/net/redbean_test.com) |
| [test/tool/viz/lib/bilinearscale_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/viz/lib/bilinearscale_test.com) |
| [test/tool/viz/lib/halfblit_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/viz/lib/halfblit_test.com) |
| [test/tool/viz/lib/convoindex_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/viz/lib/convoindex_test.com) |
| [test/tool/viz/lib/ycbcr2rgb2_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/viz/lib/ycbcr2rgb2_test.com) |
| [test/tool/viz/lib/fun_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/viz/lib/fun_test.com) |
| [test/tool/build/lib/modrm_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/modrm_test.com) |
| [test/tool/build/lib/machine_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/machine_test.com) |
| [test/tool/build/lib/bitscan_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/bitscan_test.com) |
| [test/tool/build/lib/alu_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/alu_test.com) |
| [test/tool/build/lib/javadown_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/javadown_test.com) |
| [test/tool/build/lib/asmdown_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/asmdown_test.com) |
| [test/tool/build/lib/pty_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/pty_test.com) |
| [test/tool/build/lib/optest.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/optest.com) |
| [test/tool/build/lib/interner_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/interner_test.com) |
| [test/tool/build/lib/xlaterrno_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/xlaterrno_test.com) |
| [test/tool/build/lib/iovs_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/iovs_test.com) |
| [test/tool/build/lib/disinst_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/disinst_test.com) |
| [test/tool/build/lib/bsu_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/bsu_test.com) |
| [test/tool/build/lib/divmul_test.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/divmul_test.com) |
| [test/tool/build/lib/numbers.com](https://github.com/marcelmaatkamp/cosmopolitan/raw/main/data/application/test/tool/build/lib/numbers.com) |

