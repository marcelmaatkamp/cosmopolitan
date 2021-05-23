# Cosmopolitan in docker 

# TL;DR 
Compiles all example programs from [Cosmopolitan Libc](https://github.com/jart/cosmopolitan) where each inidividual binary can be executed in linux, mac, windows, FreeBSD, OpenBSD and you can even boot it n qemu or install it on bare metal!

# Description
[Cosmopolitan Libc](https://github.com/jart/cosmopolitan) describes itself as: "makes C a build-once run-anywhere language, like Java, except it doesn't need an interpreter or virtual machine. Instead, it reconfigures stock GCC and Clang to output a POSIX-approved polyglot format that runs natively on Linux + Mac + Windows + FreeBSD + OpenBSD + NetBSD + BIOS with the best possible performance and the tiniest footprint imaginable."

# build
```
$ docker-compose up --build &&\
  sudo chown -R ${USER} data/* 
``

# Examples

## hello-world

### docker
```
% docker run --rm -ti marcelmaatkamp/cosmopolitan sh -c /application/examples/hello.com
hello world
``

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
  qemu-system-x86_64 -m 16 -nographic -fda ${PWD}/cosmopolitan/examples/hello.com

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
```
$ docker run -v ${PWD}/cosmopolitan:/data marcelmaatkamp/cosmopolitan sh -c 'cp -r /application/* /data' &&\
  sudo chown -R ${USER} ${PWD}/cosmopolitan &&\
  qemu-system-x86_64 -m 16 -nographic -fda ${PWD}/cosmopolitan/third_party/sqlite3/sqlite3.com
```

# files
```
./examples
./examples/lstime.com
./examples/curl.com
./examples/ctrlc.com
./examples/rusage.com
./examples/life.com
./examples/hellolua.com
./examples/breakpoint.com
./examples/hertz.com
./examples/seq.com
./examples/nc.com
./examples/ttyinfo.com
./examples/printargs.com
./examples/ucontext-sigfpe-recovery.com
./examples/date.com
./examples/auto-launch-gdb-on-crash.com
./examples/unbourne.com
./examples/gui.com
./examples/kilo.com
./examples/touch.com
./examples/ispell.com
./examples/cplusplus.com
./examples/x86split.com
./examples/cp.com
./examples/generalized-automatic-datastructure-printing.com
./examples/echo.com
./examples/hostname.com
./examples/forkrand.com
./examples/sleep.com
./examples/stat.com
./examples/package
./examples/package/program.com
./examples/hello3.com
./examples/hello2.com
./examples/hello.com
./examples/nesemu1.com
./examples/printprimes.com
./examples/walk.com
./examples/hangman.com
./examples/crashreport.com
./examples/panels.com
./examples/ls.com
./examples/system.com
./build
./build/bootstrap
./build/bootstrap/package.com
./build/bootstrap/ar.com
./build/bootstrap/compile.com
./build/bootstrap/zipobj.com
./build/bootstrap/mkdeps.com
./test
./test/libc
./test/libc/crypto
./test/libc/crypto/rijndael_test.com
./test/libc/nexgen32e
./test/libc/nexgen32e/crc32_test.com
./test/libc/nexgen32e/ffs_test.com
./test/libc/nexgen32e/memset_test.com
./test/libc/nexgen32e/kcp437_test.com
./test/libc/nexgen32e/strcaseconv_test.com
./test/libc/nexgen32e/strcspn_test.com
./test/libc/nexgen32e/memrchr_test.com
./test/libc/nexgen32e/cescapec_test.com
./test/libc/nexgen32e/lz4decode_test.com
./test/libc/nexgen32e/strsak32_test.com
./test/libc/nexgen32e/sidiv_test.com
./test/libc/nexgen32e/memeqmask_test.com
./test/libc/nexgen32e/memmove_test.com
./test/libc/intrin
./test/libc/intrin/palignr_test.com
./test/libc/intrin/asan_test.com
./test/libc/intrin/intrin_test.com
./test/libc/intrin/pshuf_test.com
./test/libc/intrin/pmulhrsw_test.com
./test/libc/fmt
./test/libc/fmt/strtoumax_test.com
./test/libc/fmt/palandprintf_test.com
./test/libc/fmt/sscanf_test.com
./test/libc/fmt/llog10_test.com
./test/libc/fmt/strerror_test.com
./test/libc/fmt/itoa64radix10_test.com
./test/libc/fmt/strtoimax_test.com
./test/libc/fmt/basename_test.com
./test/libc/fmt/fmt_test.com
./test/libc/fmt/fcvt_test.com
./test/libc/fmt/sprintf_s_test.com
./test/libc/fmt/dirname_test.com
./test/libc/fmt/timevaltofiletime_test.com
./test/libc/fmt/itoa64radix16_test.com
./test/libc/runtime
./test/libc/runtime/grow_test.com
./test/libc/runtime/itsatrap_test.com
./test/libc/runtime/arch_prctl_test.com
./test/libc/runtime/memtrack_test.com
./test/libc/runtime/getdosenviron_test.com
./test/libc/runtime/getdosargv_test.com
./test/libc/runtime/mmap_test.com
./test/libc/runtime/carsort_test.com
./test/libc/dns
./test/libc/dns/dnsheader_test.com
./test/libc/dns/resolvehoststxt_test.com
./test/libc/dns/pascalifydnsname_test.com
./test/libc/dns/dnsquestion_test.com
./test/libc/dns/parsehoststxt_test.com
./test/libc/dns/parseresolvconf_test.com
./test/libc/dns/comparednsnames_test.com
./test/libc/tinymath
./test/libc/tinymath/fmod_test.com
./test/libc/tinymath/log_test.com
./test/libc/tinymath/logb_test.com
./test/libc/tinymath/log1p_test.com
./test/libc/tinymath/asin_test.com
./test/libc/tinymath/gamma_test.com
./test/libc/tinymath/exp2_test.com
./test/libc/tinymath/sqrt_test.com
./test/libc/tinymath/strtod_test.com
./test/libc/tinymath/ldexp_test.com
./test/libc/tinymath/ceil_test.com
./test/libc/tinymath/floor_test.com
./test/libc/tinymath/cosh_test.com
./test/libc/tinymath/hypot_test.com
./test/libc/tinymath/expm1_test.com
./test/libc/tinymath/powl_test.com
./test/libc/tinymath/sinh_test.com
./test/libc/tinymath/acosh_test.com
./test/libc/tinymath/erf_test.com
./test/libc/tinymath/log2_test.com
./test/libc/tinymath/copysign_test.com
./test/libc/tinymath/atan2_test.com
./test/libc/tinymath/ilogb_test.com
./test/libc/tinymath/fabs_test.com
./test/libc/tinymath/tan_test.com
./test/libc/tinymath/round_test.com
./test/libc/tinymath/cbrt_test.com
./test/libc/tinymath/sin_test.com
./test/libc/tinymath/asinh_test.com
./test/libc/tinymath/tanh_test.com
./test/libc/tinymath/pow10_test.com
./test/libc/tinymath/atanl_test.com
./test/libc/tinymath/exp10_test.com
./test/libc/tinymath/atanh_test.com
./test/libc/tinymath/acos_test.com
./test/libc/tinymath/atan_test.com
./test/libc/tinymath/atan2l_test.com
./test/libc/tinymath/exp2l_test.com
./test/libc/tinymath/exp_test.com
./test/libc/tinymath/trunc_test.com
./test/libc/mem
./test/libc/mem/strdup_test.com
./test/libc/mem/malloc_test.com
./test/libc/str
./test/libc/str/crc32c_test.com
./test/libc/str/str_test.com
./test/libc/str/strlen_test.com
./test/libc/str/strcasecmp_test.com
./test/libc/str/bsr_test.com
./test/libc/str/regex_test.com
./test/libc/str/strcmp_test.com
./test/libc/str/memcpy_test.com
./test/libc/str/strchr_test.com
./test/libc/str/towupper_test.com
./test/libc/str/tpenc_test.com
./test/libc/str/memfrob_test.com
./test/libc/str/tprecode8to16_test.com
./test/libc/str/strtolower_test.com
./test/libc/str/highwayhash64_test.com
./test/libc/str/strlcpy_test.com
./test/libc/str/memccpy_test.com
./test/libc/str/strstr_test.com
./test/libc/str/strrchr_test.com
./test/libc/str/sigset_test.com
./test/libc/str/memmem_test.com
./test/libc/str/strtok_r_test.com
./test/libc/str/getutf16_test.com
./test/libc/str/pututf16_test.com
./test/libc/str/tprecode16to8_test.com
./test/libc/str/a64l_test.com
./test/libc/str/strcpy_test.com
./test/libc/str/undeflate_test.com
./test/libc/calls
./test/libc/calls/fcntl_test.com
./test/libc/calls/ftruncate_test.com
./test/libc/calls/vfork_test.com
./test/libc/calls/getenv_test.com
./test/libc/calls/sigaction_test.com
./test/libc/calls/writev_test.com
./test/libc/calls/lseek_test.com
./test/libc/calls/mprotect_test.com
./test/libc/calls/mkntcmdline_test.com
./test/libc/calls/access_test.com
./test/libc/calls/signal_test.com
./test/libc/calls/mkdir_test.com
./test/libc/calls/fork_test.com
./test/libc/calls/mkntpath_test.com
./test/libc/calls/getcwd_test.com
./test/libc/calls/stat_test.com
./test/libc/calls/mkntenvblock_test.com
./test/libc/calls/commandv_test.com
./test/libc/x
./test/libc/x/utf8toutf16_test.com
./test/libc/x/xslurp_test.com
./test/libc/x/utf16toutf8_test.com
./test/libc/x/xjoinpaths_test.com
./test/libc/x/xasprintf_test.com
./test/libc/x/xstrcat_test.com
./test/libc/bits
./test/libc/bits/popcnt_test.com
./test/libc/bits/bitreverse_test.com
./test/libc/bits/rounddown2pow_test.com
./test/libc/bits/roundup2pow_test.com
./test/libc/bits/morton_test.com
./test/libc/bits/division_test.com
./test/libc/bits/roundup2log_test.com
./test/libc/bits/integralarithmetic_test.com
./test/libc/alg
./test/libc/alg/reverse_test.com
./test/libc/alg/critbit0_test.com
./test/libc/alg/djbsort_test.com
./test/libc/alg/bisectcarleft_test.com
./test/libc/alg/comparator_test.com
./test/libc/alg/qsort_test.com
./test/libc/alg/replacestr_test.com
./test/libc/alg/arraylist_test.com
./test/libc/alg/tarjan_test.com
./test/libc/rand
./test/libc/rand/devrand_test.com
./test/libc/rand/rand_test.com
./test/libc/release
./test/libc/release/smoke.com
./test/libc/release/smoke-nms.com
./test/libc/release/smokecxx.com
./test/libc/release/smokeansi.com
./test/libc/stdio
./test/libc/stdio/fgets_test.com
./test/libc/stdio/tmpfile_test.com
./test/libc/stdio/getdelim_test.com
./test/libc/stdio/freopen_test.com
./test/libc/stdio/ungetc_test.com
./test/libc/stdio/spawn_test.com
./test/libc/stdio/dirstream_test.com
./test/libc/stdio/fmemopen_test.com
./test/libc/stdio/mkostempsm_test.com
./test/libc/stdio/fgetwc_test.com
./test/libc/stdio/ftell_test.com
./test/libc/stdio/fwrite_test.com
./test/libc/stdio/popen_test.com
./test/libc/stdio/system_test.com
./test/libc/stdio/fputc_test.com
./test/libc/stdio/fputs_test.com
./test/libc/unicode
./test/libc/unicode/strnwidth_test.com
./test/libc/unicode/wcwidth_test.com
./test/libc/time
./test/libc/time/strftime_test.com
./test/libc/time/clock_gettime_test.com
./test/libc/time/dsleep_test.com
./test/libc/xed
./test/libc/xed/x86ild_widenop_test.com
./test/libc/xed/x86ild_popular_binary_test.com
./test/libc/xed/x86ild_popular_i86_test.com
./test/libc/xed/x86ild_popular_logical_test.com
./test/libc/xed/x86ild_popular_i386_test.com
./test/libc/xed/x86ild_test.com
./test/libc/xed/x86ild_popular_i186_test.com
./test/libc/xed/x86ild_popular_misc_test.com
./test/libc/xed/x86ild_popular_cmov_test.com
./test/libc/sock
./test/libc/sock/inet_ntop_test.com
./test/libc/sock/socketpair_test.com
./test/libc/sock/inet_ntoa_test.com
./test/libc/sock/inet_pton_test.com
./test/libc/sock/sendrecvmsg_test.com
./test/libc/sock/poll_test.com
./test/tool
./test/tool/viz
./test/tool/viz/lib
./test/tool/viz/lib/bilinearscale_test.com
./test/tool/viz/lib/halfblit_test.com
./test/tool/viz/lib/fun_test.com
./test/tool/viz/lib/convoindex_test.com
./test/tool/viz/lib/ycbcr2rgb2_test.com
./test/tool/build
./test/tool/build/lib
./test/tool/build/lib/machine_test.com
./test/tool/build/lib/javadown_test.com
./test/tool/build/lib/modrm_test.com
./test/tool/build/lib/interner_test.com
./test/tool/build/lib/divmul_test.com
./test/tool/build/lib/bitscan_test.com
./test/tool/build/lib/alu_test.com
./test/tool/build/lib/asmdown_test.com
./test/tool/build/lib/numbers.com
./test/tool/build/lib/iovs_test.com
./test/tool/build/lib/disinst_test.com
./test/tool/build/lib/xlaterrno_test.com
./test/tool/build/lib/optest.com
./test/tool/build/lib/pty_test.com
./test/tool/build/lib/bsu_test.com
./test/tool/net
./test/tool/net/redbean_test.com
./test/net
./test/net/http
./test/net/http/escapejsstringliteral_test.com
./test/net/http/isreasonablepath_test.com
./test/net/http/encodehttpheadervalue_test.com
./test/net/http/visualizecontrolcodes_test.com
./test/net/http/parsehttprange_test.com
./test/net/http/isacceptablehost_test.com
./test/net/http/isacceptablepath_test.com
./test/net/http/parsecontentlength_test.com
./test/net/http/escapehtml_test.com
./test/net/http/parsehttprequest_test.com
./test/net/http/escapeurlparam_test.com
./test/net/http/encodebase64_test.com
./test/net/http/parseurl_test.com
./test/net/http/parsehttpdatetime_test.com
./test/net/http/decodelatin1_test.com
./test/net/http/underlong_test.com
./test/net/http/indentlines_test.com
./test/net/http/hascontrolcodes_test.com
./test/dsp
./test/dsp/scale
./test/dsp/scale/magikarp_test.com
./test/dsp/scale/scale_test.com
./test/dsp/tty
./test/dsp/tty/ttyraster_test.com
./test/dsp/tty/windex_test.com
./test/dsp/tty/ttymove_test.com
./test/dsp/tty/rgb2ansi_test.com
./test/dsp/core
./test/dsp/core/sad16x8n_test.com
./test/dsp/core/gamma_test.com
./test/dsp/core/illumination_test.com
./test/dsp/core/getintegercoefficients8_test.com
./test/dsp/core/scalevolume_test.com
./test/dsp/core/float2short_test.com
./test/dsp/core/inv3_test.com
./test/dsp/core/getintegercoefficients_test.com
./tool
./tool/viz
./tool/viz/generatematrix.com
./tool/viz/xterm256gradient.com
./tool/viz/printimage.com
./tool/viz/magikarp.com
./tool/viz/upscalefloat.com
./tool/viz/basicidea.com
./tool/viz/life.com
./tool/viz/deathstar.com
./tool/viz/comma.com
./tool/viz/unbing.com
./tool/viz/memzoom.com
./tool/viz/tailf.com
./tool/viz/printvideo.com
./tool/viz/int2float.com
./tool/viz/ascii2utf8.com
./tool/viz/double2int.com
./tool/viz/printpixel.com
./tool/viz/upscaleint.com
./tool/viz/xterm256effective2.com
./tool/viz/printansi.com
./tool/viz/printpeb.com
./tool/viz/bing.com
./tool/viz/invertblocks.com
./tool/viz/xterm256info.com
./tool/viz/xterm256effective.com
./tool/viz/fold.com
./tool/viz/unicode.com
./tool/viz/xterm256cubes.com
./tool/viz/bin2asm.com
./tool/viz/od16.com
./tool/viz/rgbtoxterm.com
./tool/viz/cpuid.com
./tool/viz/derasterize.com
./tool/viz/generatetortureimage.com
./tool/viz/bf.com
./tool/viz/tabalign.com
./tool/build
./tool/build/refactor.com
./tool/build/package.com
./tool/build/ar.com
./tool/build/rollup.com
./tool/build/lz4toasm.com
./tool/build/tinyemu.com
./tool/build/blinkenlights.com
./tool/build/x86combos.com
./tool/build/runitd.com
./tool/build/dis.com
./tool/build/dropcache.com
./tool/build/runit.com
./tool/build/calculator.com
./tool/build/compile.com
./tool/build/helpop.com
./tool/build/pstrace.com
./tool/build/summy.com
./tool/build/rle.com
./tool/build/zipobj.com
./tool/build/mkdeps.com
./tool/decode
./tool/decode/xor.com
./tool/decode/ar.com
./tool/decode/x86opinfo.com
./tool/decode/peboff.com
./tool/decode/mkwides.com
./tool/decode/elf.com
./tool/decode/x87.com
./tool/decode/scrubdox.com
./tool/decode/macho.com
./tool/decode/ent.com
./tool/decode/pe2.com
./tool/decode/hex.com
./tool/decode/unhex.com
./tool/decode/zip.com
./tool/decode/mkcombos.com
./tool/net
./tool/net/echoserver.com
./tool/net/dig.com
./tool/net/redbean.com
./tool/hash
./tool/hash/crctab.com
./third_party
./third_party/lz4cli
./third_party/lz4cli/lz4cli.com
./third_party/chibicc
./third_party/chibicc/chibicc2.com
./third_party/chibicc/test
./third_party/chibicc/test/asm_test2.com
./third_party/chibicc/test/typeof_test2.com
./third_party/chibicc/test/offsetof_test.com
./third_party/chibicc/test/cast_test2.com
./third_party/chibicc/test/assert_test.com
./third_party/chibicc/test/alloca_test.com
./third_party/chibicc/test/typedef_test2.com
./third_party/chibicc/test/cast_test.com
./third_party/chibicc/test/usualconv_test.com
./third_party/chibicc/test/literal_test.com
./third_party/chibicc/test/dce_test.com
./third_party/chibicc/test/union_test.com
./third_party/chibicc/test/alloca_test2.com
./third_party/chibicc/test/asm_test.com
./third_party/chibicc/test/float_test.com
./third_party/chibicc/test/enum_test.com
./third_party/chibicc/test/attribute_test.com
./third_party/chibicc/test/vector_test.com
./third_party/chibicc/test/typeof_test.com
./third_party/chibicc/test/generic_test.com
./third_party/chibicc/test/generic_test2.com
./third_party/chibicc/test/assert_test2.com
./third_party/chibicc/test/unicode_test.com
./third_party/chibicc/test/function_test.com
./third_party/chibicc/test/arith_test.com
./third_party/chibicc/test/pointer_test.com
./third_party/chibicc/test/sizeof_test.com
./third_party/chibicc/test/struct_test2.com
./third_party/chibicc/test/const_test2.com
./third_party/chibicc/test/extern_test.com
./third_party/chibicc/test/pointer_test2.com
./third_party/chibicc/test/function_test2.com
./third_party/chibicc/test/macro_test2.com
./third_party/chibicc/test/dce_test2.com
./third_party/chibicc/test/compat_test2.com
./third_party/chibicc/test/extern_test2.com
./third_party/chibicc/test/bitfield_test2.com
./third_party/chibicc/test/vla_test2.com
./third_party/chibicc/test/vla_test.com
./third_party/chibicc/test/varargs_test2.com
./third_party/chibicc/test/string_test.com
./third_party/chibicc/test/compat_test.com
./third_party/chibicc/test/control_test.com
./third_party/chibicc/test/pragma-once_test.com
./third_party/chibicc/test/line_test.com
./third_party/chibicc/test/usualconv_test2.com
./third_party/chibicc/test/typedef_test.com
./third_party/chibicc/test/unicode_test2.com
./third_party/chibicc/test/macro_test.com
./third_party/chibicc/test/initializer_test.com
./third_party/chibicc/test/constexpr_test2.com
./third_party/chibicc/test/constexpr_test.com
./third_party/chibicc/test/int128_test2.com
./third_party/chibicc/test/builtin_test2.com
./third_party/chibicc/test/bitfield_test.com
./third_party/chibicc/test/complit_test2.com
./third_party/chibicc/test/enum_test2.com
./third_party/chibicc/test/variable_test.com
./third_party/chibicc/test/const_test.com
./third_party/chibicc/test/string_test2.com
./third_party/chibicc/test/variable_test2.com
./third_party/chibicc/test/literal_test2.com
./third_party/chibicc/test/builtin_test.com
./third_party/chibicc/test/sizeof_test2.com
./third_party/chibicc/test/line_test2.com
./third_party/chibicc/test/control_test2.com
./third_party/chibicc/test/decl_test.com
./third_party/chibicc/test/complit_test.com
./third_party/chibicc/test/varargs_test.com
./third_party/chibicc/test/decl_test2.com
./third_party/chibicc/test/pragma-once_test2.com
./third_party/chibicc/test/attribute_test2.com
./third_party/chibicc/test/union_test2.com
./third_party/chibicc/test/arith_test2.com
./third_party/chibicc/test/float_test2.com
./third_party/chibicc/test/struct_test.com
./third_party/chibicc/test/int128_test.com
./third_party/chibicc/test/offsetof_test2.com
./third_party/chibicc/test/initializer_test2.com
./third_party/chibicc/test/vector_test2.com
./third_party/chibicc/test/alignof_test.com
./third_party/chibicc/test/alignof_test2.com
./third_party/chibicc/chibicc.com
./third_party/lua
./third_party/lua/lua.com
./third_party/quickjs
./third_party/quickjs/unicode_gen.com
./third_party/quickjs/qjs.com
./third_party/quickjs/qjsc.com
./third_party/quickjs/run-test262.com
./third_party/sqlite3
./third_party/sqlite3/sqlite3.com
```

# build
If you want to change the source code, the docker-container or want to extract the binary, use the docker-compose 
```
$ docker-compose up --build
```
The executables will be in '/application'
