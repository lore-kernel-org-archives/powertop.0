Content-Type: multipart/mixed; boundary="===============1495042268324324112=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: [Powertop] powertop 2.5 SEGV
Date: Fri, 31 Jan 2014 18:58:49 -0800
Message-ID: <20140201025849.GM26750@merlins.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1495042268324324112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I had powertop running and it crashed when my laptop woke up from
hibernate


(gdb) bt
#0  0x00007f35fef581e5 in __GI_raise (sig=3D6) at ../nptl/sysdeps/unix/sysv=
/linux/raise.c:56
#1  0x00007f35fef5b398 in __GI_abort () at abort.c:90
#2  0x00007f35fef937cb in __libc_message (do_abort=3D2, fmt=3D0x7f35ff08d89=
5 "*** %s ***: %s terminated\n")
    at ../sysdeps/unix/sysv/linux/libc_fatal.c:199
#3  0x00007f35ff01fd17 in __GI___fortify_fail (msg=3D0x7f35ff08d82c "buffer=
 overflow detected")
    at fortify_fail.c:31
#4  0x00007f35ff01ecd0 in __GI___chk_fail () at chk_fail.c:28
#5  0x00000000004203c9 in strcpy (__src=3D0xcfe6ca4 "btrfs-endio-writ\336A"=
, =

    __dest=3D0xc923744 "btrfs-endio-writ:\t", '0' <repeats 16 times>, "\nSA=
")
    at /usr/include/x86_64-linux-gnu/bits/string3.h:104
#6  process::process (this=3D0xc9235f0, _comm=3D0xcfe6ca4 "btrfs-endio-writ=
\336A", _pid=3D16862, _tid=3D0)
    at process/process.cpp:92
#7  0x0000000000420add in find_create_process (comm=3D0xcfe6ca4 "btrfs-endi=
o-writ\336A", pid=3D16862)
    at process/process.cpp:174
#8  0x000000000042435f in perf_process_bundle::handle_trace_point (this=3D<=
optimized out>, =

    trace=3D<optimized out>, cpu=3D6, time=3D577721466901169) at process/do=
_process.cpp:252
#9  0x0000000000429835 in perf_bundle::process (this=3D0xb3b96f0) at perf/p=
erf_bundle.cpp:338
#10 0x0000000000424f36 in process_process_data () at process/do_process.cpp=
:1113
#11 0x0000000000443b2f in one_measurement (seconds=3D<optimized out>, workl=
oad=3D<optimized out>) at main.cpp:212
#12 0x0000000000407762 in main (argc=3D1, argv=3D0x7fffe31d9a38) at main.cp=
p:468

Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901

--===============1495042268324324112==--

