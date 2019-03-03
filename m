Content-Type: multipart/mixed; boundary="===============1713466284863022144=="
MIME-Version: 1.0
From: Victor Rodriguez <vm.rod25 at gmail.com>
Subject: [Powertop] seg fault at clearlinux v2.10 with kernel 4.20
Date: Sun, 03 Mar 2019 11:25:17 -0600
Message-ID: <CAK5mteyfDq6Wm-wdbfiWO8iJc=kgJFRN13=uECJX4W8=_BEjGQ@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1713466284863022144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Marc and I were debugging segfault in Clear Linux version 28020

Program received signal SIGSEGV, Segmentation fault.
                                                    0x0000000000442b66
in perf_event::process (this=3D0x4a3ab0, cookie=3Dcookie(a)entry=3D0x4b1d10)
at perf/perf.cpp:233
233 if (perf_fd < 0)
(gdb) bt
#0  0x0000000000442b66 in perf_event::process (this=3D0x4a3ab0,
cookie=3Dcookie(a)entry=3D0x4b1d10) at perf/perf.cpp:233
#1  0x00000000004439d8 in perf_bundle::process (this=3D0x4b1cc0) at
perf/perf_bundle.cpp:326
#2  0x0000000000420ce1 in process_cpu_data () at cpu/cpu.cpp:1037
#3  0x00000000004146d5 in one_measurement (seconds=3D-4,
seconds(a)entry=3D1, sample_interval=3D<optimized out>,
    sample_interval(a)entry=3D5, workload=3Dworkload(a)entry=3D0x0) at main=
.cpp:255
#4  0x000000000040aad3 in main (argc=3D1, argv=3D0x7fffffffcf58) at main.cp=
p:542

The bug seems to be in this call of the perf file descriptor
https://github.com/fenrus75/powertop/blob/master/src/perf/perf_bundle.cpp#L=
323

by the call of perf_event::process in perf.cpp

I guess that perf_fd =3D sys_perf_event_open(&attr, -1, _cpu, -1, 0); is
not generating the perf event

We have a copy of perf_event.h taken from the kernel and I wonder if
we do need to update it

In the Clear Linux  we are running kernel: 4.20.10-698.native

Happy to help with the fix, just need a bit of direction

Regards

Victor Rodriguez

--===============1713466284863022144==--

