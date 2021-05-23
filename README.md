# cosmopolitan 

# TL;DR 
Compiles all example programs from https://github.com/jart/cosmopolitan which can be executed in linux, mac, windows, FreeBSD, OpenBSD, you can even boot it on bare metal!

This repository puts all the executables in a docker container called 'marcelmaatkamp/osmopolitan:1.0'

# Longer description
Cosmopolitan Libc makes C a build-once run-anywhere language, like Java, except it doesn't need an interpreter or virtual machine. Instead, it reconfigures stock GCC and Clang to output a POSIX-approved polyglot format that runs natively on Linux + Mac + Windows + FreeBSD + OpenBSD + NetBSD + BIOS with the best possible performance and the tiniest footprint imaginable.

# 
# usage
```
$ docker run --rm -ti marcelmaatkamp/cosmopolitan:1.0 ash
```

# Example files
```
auto-launch-gdb-on-crash.com                      life.com
breakpoint.com                                    ls.com
cp.com                                            lstime.com
cplusplus.com                                     nc.com
crashreport.com                                   nesemu1.com
ctrlc.com                                         panels.com
curl.com                                          printargs.com
date.com                                          printprimes.com
echo.com                                          program.com
forkrand.com                                      rusage.com
generalized-automatic-datastructure-printing.com  seq.com
gui.com                                           sleep.com
hangman.com                                       stat.com
hello.com                                         system.com
hello2.com                                        touch.com
hello3.com                                        ttyinfo.com
hellolua.com                                      ucontext-sigfpe-recovery.com
hertz.com                                         unbourne.com
hostname.com                                      walk.com
ispell.com                                        x86split.com
```

# Third party
```
alignof_test.com       cast_test.com          decl_test.com          line_test.com          run-test262.com        union_test2.com
alignof_test2.com      cast_test2.com         decl_test2.com         line_test2.com         sizeof_test.com        usualconv_test.com
alloca_test.com        chibicc.com            enum_test.com          literal_test.com       sizeof_test2.com       usualconv_test2.com
alloca_test2.com       chibicc2.com           enum_test2.com         literal_test2.com      sqlite3.com            varargs_test.com
arith_test.com         compat_test.com        extern_test.com        lua.com                string_test.com        varargs_test2.com
arith_test2.com        compat_test2.com       extern_test2.com       lz4cli.com             string_test2.com       variable_test.com
asm_test.com           complit_test.com       float_test.com         macro_test.com         struct_test.com        variable_test2.com
asm_test2.com          complit_test2.com      float_test2.com        macro_test2.com        struct_test2.com       vector_test.com
assert_test.com        const_test.com         function_test.com      offsetof_test.com      typedef_test.com       vector_test2.com
assert_test2.com       const_test2.com        function_test2.com     offsetof_test2.com     typedef_test2.com      vla_test.com
attribute_test.com     constexpr_test.com     generic_test.com       pointer_test.com       typeof_test.com        vla_test2.com
attribute_test2.com    constexpr_test2.com    generic_test2.com      pointer_test2.com      typeof_test2.com
bitfield_test.com      control_test.com       initializer_test.com   pragma-once_test.com   unicode_gen.com
bitfield_test2.com     control_test2.com      initializer_test2.com  pragma-once_test2.com  unicode_test.com
builtin_test.com       dce_test.com           int128_test.com        qjs.com                unicode_test2.com
builtin_test2.com      dce_test2.com          int128_test2.com       qjsc.com               union_test.com
```

# build
If you want to change the source code, the docker-container or want to extract the binary, use the docker-compose 
```
$ docker-compose up --build
```
The executables will be in '/application'
