Content-Type: multipart/mixed; boundary="===============6675616240944823319=="
MIME-Version: 1.0
From: Mikko Rapeli <mikko.rapeli at iki.fi>
Subject: [Powertop] [PATCH] Fix string null termination and SIGABRT from glibc
Date: Wed, 26 Sep 2012 12:04:01 +0300
Message-ID: <20120926090401.GO11028@lakka.kapsi.fi>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6675616240944823319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

According to http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D682388
the string is not null terminated when too much data is read.

This patch fixes the crashes for me. My traces:

PowerTOP 2.1      Overview   Idle stats   Frequency stats   Device stats   =
Tunab

          Package   |            CPU 0
POLL        0.0%    | POLL        0.0%    0.0 ms
C1          0.0%    | C1          0.0%    0.0 ms
C2          3.8%    | C2          5.4%    0.2 ms
C3         12.4%    | C3         20.9%    1.7 ms

                    |            CPU 1
                    | POLL        0.0%    0.0 ms
                    | C1          0.0%    0.2 ms
                    | C2          2.2%    0.2 ms
                    | C3          3.8%    0.9 ms

*** stack smashing detected ***: /usr/local/sbin/powertop terminated
                                                                    =3D=3D=
=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
                /lib/i386-linux-gnu/i686/cmov/libc.so.6(__fortify_fail+0x50=
)[0xb7d7be70]
        /lib/i386-linux-gnu/i686/cmov/libc.so.6(+0xe4e1a)[0xb7d7be1a]
                                                                     /usr/l=
ocal/sbin/powertop[0x8067a01]
<ESC> Exit |            /usr/local/sbin/powertop[0x8067ce7]
                                                           /usr/local/sbin/=
powertop[0x806b727]
              /usr/local/sbin/powertop[0x8070d62]
                                                 /usr/local/sbin/powertop[0=
x806c2e6]
    /usr/local/sbin/powertop[0x8089ecf]
                                       /usr/local/sbin/powertop[0x804df42]
                                                                          /=
lib/i386-linux-gnu/i686/cmov/libc.so.6(__libc_start_main+0xe6)[0xb7cade46]
                                                                     /usr/l=
ocal/sbin/powertop[0x804e0f1]
                        =3D=3D=3D=3D=3D=3D=3D Memory map: =3D=3D=3D=3D=3D=
=3D=3D=3D
                                                    08048000-080af000 r-xp =
00000000 08:02 2336756    /usr/local/sbin/powertop
                                             080af000-080b0000 rw-p 0006700=
0 08:02 2336756    /usr/local/sbin/powertop
                                      080b0000-1022a000 rw-p 00000000 00:00=
 0          [heap]
             b68c6000-b69c7000 rw-p 00000000 00:00 0
                                                     b6aaa000-b6acb000 rw-p=
 00000000 00:00 0
             b6acb000-b6b4c000 rw-s 00000000 00:09 5025       anon_inode:[p=
erf_event]
     b6b4c000-b6bcd000 rw-s 00000000 00:09 5025       anon_inode:[perf_even=
t]
                                                                           =
  b6bcd000-b6c4e000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                                     b6c4e0=
00-b6ccf000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                             b6ccf000-b6d50=
000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                     b6d50000-b6dd1000 rw-s=
 00000000 00:09 5025       anon_inode:[perf_event]
                                             b6dd1000-b6e52000 rw-s 0000000=
0 00:09 5025       anon_inode:[perf_event]
                                     b6e52000-b6ed3000 rw-s 00000000 00:09 =
5025       anon_inode:[perf_event]
                             b6ed3000-b6f54000 rw-s 00000000 00:09 5025    =
   anon_inode:[perf_event]
                     b6f54000-b6fd5000 rw-s 00000000 00:09 5025       anon_=
inode:[perf_event]
             b6fd5000-b7056000 rw-s 00000000 00:09 5025       anon_inode:[p=
erf_event]
     b7056000-b70d7000 rw-s 00000000 00:09 5025       anon_inode:[perf_even=
t]
                                                                           =
  b70d7000-b7158000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                                     b71580=
00-b71d9000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                             b71d9000-b725a=
000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                     b725a000-b72db000 rw-s=
 00000000 00:09 5025       anon_inode:[perf_event]
                                             b72db000-b735c000 rw-s 0000000=
0 00:09 5025       anon_inode:[perf_event]
                                     b735c000-b73dd000 rw-s 00000000 00:09 =
5025       anon_inode:[perf_event]
                             b73dd000-b745e000 rw-s 00000000 00:09 5025    =
   anon_inode:[perf_event]
                     b745e000-b74df000 rw-s 00000000 00:09 5025       anon_=
inode:[perf_event]
             b74df000-b7560000 rw-s 00000000 00:09 5025       anon_inode:[p=
erf_event]
     b7560000-b75e1000 rw-s 00000000 00:09 5025       anon_inode:[perf_even=
t]
                                                                           =
  b75e1000-b7662000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                                     b76620=
00-b76e3000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                             b76e3000-b7764=
000 rw-s 00000000 00:09 5025       anon_inode:[perf_event]
                                                     b7764000-b77e5000 rw-s=
 00000000 00:09 5025       anon_inode:[perf_event]
                                             b77e5000-b7866000 rw-s 0000000=
0 00:09 5025       anon_inode:[perf_event]
                                     b7866000-b78e7000 rw-s 00000000 00:09 =
5025       anon_inode:[perf_event]
                             b78e7000-b7968000 rw-s 00000000 00:09 5025    =
   anon_inode:[perf_event]
                     b7968000-b79e9000 rw-s 00000000 00:09 5025       anon_=
inode:[perf_event]
             b79e9000-b7a6a000 rw-s 00000000 00:09 5025       anon_inode:[p=
erf_event]
     b7a6a000-b7aeb000 rw-s 00000000 00:09 5025       anon_inode:[perf_even=
t]
                                                                           =
  b7aeb000-b7c62000 r--p 00000000 08:02 2621607    /usr/lib/locale/locale-a=
rchive
                                                                           =
 b7c62000-b7c65000 rw-p 00000000 00:00 0
                                    b7c65000-b7c67000 r-xp 00000000 08:02 6=
32012     /lib/i386-linux-gnu/i686/cmov/libdl-2.13.so
                                                b7c67000-b7c68000 r--p 0000=
1000 08:02 632012     /lib/i386-linux-gnu/i686/cmov/libdl-2.13.so
                                                            b7c68000-b7c690=
00 rw-p 00002000 08:02 632012     /lib/i386-linux-gnu/i686/cmov/libdl-2.13.=
so
                                                                        b7c=
69000-b7c6a000 rw-p 00000000 00:00 0
                                b7c6a000-b7c7a000 r-xp 00000000 08:02 63203=
6     /lib/i386-linux-gnu/i686/cmov/libresolv-2.13.so
                                                b7c7a000-b7c7b000 r--p 0001=
0000 08:02 632036     /lib/i386-linux-gnu/i686/cmov/libresolv-2.13.so
                                                                b7c7b000-b7=
c7c000 rw-p 00011000 08:02 632036     /lib/i386-linux-gnu/i686/cmov/libreso=
lv-2.13.so
                                                                           =
     b7c7c000-b7c7e000 rw-p 00000000 00:00 0
                                        b7c7e000-b7c95000 r-xp 00000000 08:=
02 632038     /lib/i386-linux-gnu/libz.so.1.2.7
                                          b7c95000-b7c96000 r--p 00016000 0=
8:02 632038     /lib/i386-linux-gnu/libz.so.1.2.7
                                            b7c96000-b7c97000 rw-p 00017000=
 08:02 632038     /lib/i386-linux-gnu/libz.so.1.2.7
                                              b7c97000-b7ded000 r-xp 000000=
00 08:02 632108     /lib/i386-linux-gnu/i686/cmov/libc-2.13.so
                                                         b7ded000-b7dee000 =
---p 00156000 08:02 632108     /lib/i386-linux-gnu/i686/cmov/libc-2.13.so
                                                                    b7dee00=
0-b7df0000 r--p 00156000 08:02 632108     /lib/i386-linux-gnu/i686/cmov/lib=
c-2.13.so
                                                                           =
    b7df0000-b7df1000 rw-p 00158000 08:02 632108     /lib/i386-linux-gnu/i6=
86/cmov/libc-2.13.so
          b7df1000-b7df4000 rw-p 00000000 00:00 0
                                                  b7df4000-b7e10000 r-xp 00=
000000 08:02 630810     /lib/i386-linux-gnu/libgcc_s.so.1
                                                    b7e10000-b7e11000 rw-p =
0001b000 08:02 630810     /lib/i386-linux-gnu/libgcc_s.so.1
                                                      b7e11000-b7e35000 r-x=
p 00000000 08:02 632046     /lib/i386-linux-gnu/i686/cmov/libm-2.13.so
                                                                 b7e35000-b=
7e36000 r--p 00023000 08:02 632046     /lib/i386-linux-gnu/i686/cmov/libm-2=
.13.so
                                                                           =
 b7e36000-b7e37000 rw-p 00024000 08:02 632046     /lib/i386-linux-gnu/i686/=
cmov/libm-2.13.so
       b7e37000-b7e38000 rw-p 00000000 00:00 0
                                               b7e38000-b7f18000 r-xp 00000=
000 08:02 2514966    /usr/lib/i386-linux-gnu/libstdc++.so.6.0.17
                                                           b7f18000-b7f1c00=
0 r--p 000e0000 08:02 2514966    /usr/lib/i386-linux-gnu/libstdc++.so.6.0.17
                                                                       b7f1=
c000-b7f1d000 rw-p 000e4000 08:02 2514966    /usr/lib/i386-linux-gnu/libstd=
c++.so.6.0.17
   b7f1d000-b7f24000 rw-p 00000000 00:00 0
                                           b7f24000-b7f41000 r-xp 00000000 =
08:02 630823     /lib/i386-linux-gnu/libtinfo.so.5.9
                                               b7f41000-b7f43000 r--p 0001c=
000 08:02 630823     /lib/i386-linux-gnu/libtinfo.so.5.9
                                                   b7f43000-b7f44000 rw-p 0=
001e000 08:02 630823     /lib/i386-linux-gnu/libtinfo.so.5.9
                                                       b7f44000-b7f75000 r-=
xp 00000000 08:02 630988     /lib/i386-linux-gnu/libncursesw.so.5.9
                                                              b7f75000-b7f7=
6000 r--p 00030000 08:02 630988     /lib/i386-linux-gnu/libncursesw.so.5.9
                                                                     b7f760=
00-b7f77000 rw-p 00031000 08:02 630988     /lib/i386-linux-gnu/libncursesw.=
so.5.9
                                                                           =
 b7f77000-b7f8c000 r-xp 00000000 08:02 631069     /lib/i386-linux-gnu/i686/=
cmov/libpthread-2.13.so
             b7f8c000-b7f8d000 r--p 00014000 08:02 631069     /lib/i386-lin=
ux-gnu/i686/cmov/libpthread-2.13.so
                              b7f8d000-b7f8e000 rw-p 00015000 08:02 631069 =
    /lib/i386-linux-gnu/i686/cmov/libpthread-2.13.so
                                               b7f8e000-b7f90000 rw-p 00000=
000 00:00 0
       b7f90000-b7fa7000 r-xp 00000000 08:02 630877     /lib/i386-linux-gnu=
/libnl-3.so.200.5.2
              b7fa7000-b7fa8000 r--p 00017000 08:02 630877     /lib/i386-li=
nux-gnu/libnl-3.so.200.5.2
                     b7fa8000-b7fa9000 rw-p 00018000 08:02 630877     /lib/=
i386-linux-gnu/libnl-3.so.200.5.2
                            b7fa9000-b7faa000 rw-p 00000000 00:00 0
                                                                    b7faa00=
0-b7fae000 r-xp 00000000 08:02 630867     /lib/i386-linux-gnu/libnl-genl-3.=
so.200.5.2
                                                                           =
     b7fae000-b7faf000 r--p 00003000 08:02 630867     /lib/i386-linux-gnu/l=
ibnl-genl-3.so.200.5.2
            b7faf000-b7fb0000 rw-p 00004000 08:02 630867     /lib/i386-linu=
x-gnu/libnl-genl-3.so.200.5.2
                        b7fb0000-b7fbb000 r-xp 00000000 08:02 630812     /l=
ib/i386-linux-gnu/libpci.so.3.1.9
                            b7fbb000-b7fbc000 r--p 0000a000 08:02 630812   =
  /lib/i386-linux-gnu/libpci.so.3.1.9
                                b7fbc000-b7fbd000 rw-p 0000b000 08:02 63081=
2     /lib/i386-linux-gnu/libpci.so.3.1.9
                                    b7fd6000-b7fdd000 r--s 00000000 08:02 2=
518433    /usr/lib/i386-linux-gnu/gconv/gconv-modules.cache
                                                      b7fdd000-b7fdf000 r--=
p 00000000 08:02 2892068    /usr/local/share/locale/en_US/LC_MESSAGES/power=
top.mo
                                                                           =
 b7fdf000-b7fe1000 rw-p 00000000 00:00 0
                                    b7fe1000-b7fe2000 r-xp 00000000 00:00 0=
          [vdso]
           b7fe2000-b7ffe000 r-xp 00000000 08:02 630935     /lib/i386-linux
Program received signal SIGABRT, Aborted.
0xb7fe1424 in __kernel_vsyscall ()
(gdb) bt full
No symbol table info available.
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
        resultvar =3D <optimized out>
        pid =3D -1210122252
        selftid =3D 22773
        act =3D {__sigaction_handler =3D {
            sa_handler =3D 0xb7fff4e4 <_rtld_global+1220>,
            sa_sigaction =3D 0xb7fff4e4 <_rtld_global+1220>}, sa_mask =3D {
            __val =3D {1835008, 134937032, 134519608, 3221208440, 4319,
              3221208408, 134515384, 134515200, 3221208252, 4, 3221208336,
              3084252763, 134937032, 3083678964, 3084845044, 11, 3221209724,
              3221208456, 3084371588, 55, 3221208336, 4, 0, 3221208432, 0, =
2,
              3084702268, 3084702264, 3084697743, 3084697808, 230,
              3221208336}}, sa_flags =3D -1073758888, sa_restorer =3D 0xb7d=
ce616}
        sigs =3D {__val =3D {32, 0 <repeats 31 times>}}
    fmt=3D0xb7dce588 "*** %s ***: %s terminated\n")
    at ../sysdeps/unix/sysv/linux/libc_fatal.c:189
        ap =3D <optimized out>
        fd =3D -1073758600
---Type <return> to continue, or q <return> to quit---
        on_2 =3D <optimized out>
        list =3D <optimized out>
        nlist =3D <optimized out>
        cp =3D <optimized out>
        written =3D false
    at fortify_fail.c:32
No locals.
No locals.
No symbol table info available.
No symbol table info available.
No symbol table info available.
No symbol table info available.
No symbol table info available.
No symbol table info available.
---Type <return> to continue, or q <return> to quit---
No symbol table info available.
    ubp_av=3D0xbffff7f4, init=3D0x80954e0, fini=3D0x80954d0, rtld_fini=3D0x=
b7ff0590,
    stack_end=3D0xbffff7ec) at libc-start.c:228
        result =3D <optimized out>
        unwind_buf =3D {cancel_jmp_buf =3D {{jmp_buf =3D {-1210122252, 0, 0,
                -1073743928, 766793170, 1206313922}, mask_was_saved =3D 0}},
          priv =3D {pad =3D {0x0, 0x0, 0x1, 0x804e0d0}, data =3D {prev =3D =
0x0,
              cleanup =3D 0x0, canceltype =3D 1}}}
        not_first_call =3D <optimized out>
No symbol table info available.
---
 src/process/process.cpp |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/process/process.cpp b/src/process/process.cpp
index 71f81b6..34dc68d 100644
--- a/src/process/process.cpp
+++ b/src/process/process.cpp
@@ -86,7 +86,7 @@ static void cmdline_to_string(char *str)
 =

 process::process(const char *_comm, int _pid, int _tid) : power_consumer()
 {
-	char line[4096];
+	char line[4097];
 	ifstream file;
 =

 	strcpy(comm, _comm);
@@ -103,6 +103,7 @@ process::process(const char *_comm, int _pid, int _tid)=
 : power_consumer()
 		file.open(line);
 		while (file) {
 			file.getline(line, 4096);
+			line[4096] =3D '\0';
 			if (strstr(line, "Tgid")) {
 				char *c;
 				c =3D strchr(line, ':');
-- =

1.7.10.4


--===============6675616240944823319==--

