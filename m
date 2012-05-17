Content-Type: multipart/mixed; boundary="===============4251086009694596083=="
MIME-Version: 1.0
From: Lekensteyn <lekensteyn at gmail.com>
Subject: [Powertop] Segmentation fault occurs with --calibrate
Date: Thu, 17 May 2012 17:48:13 +0200
Message-ID: <3231880.1xuGnurXlG@penguin>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4251086009694596083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

With the new Powertop 2.0, `powertop --calibrate` segfaults. Debugging outp=
ut =

is attached:

> Starting program: /tmp/powertop-2.0/src/powertop --calibrate
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
> Starting PowerTOP power estimate calibration =

> Calibrating idle
> =

> Program received signal SIGSEGV, Segmentation fault.
> perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
> 180             for (i =3D 0; i < events.size(); i++) {
> (gdb) bt
> #0  perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
> #1  0x000000000040f9b0 in start_cpu_measurement () at cpu/cpu.cpp:297
> #2  0x0000000000442655 in one_measurement (seconds=3D15) at main.cpp:182
> #3  0x000000000043f4c2 in idle_calibration () at calibrate/calibrate.cpp:=
423
> #4  calibrate () at calibrate/calibrate.cpp:466
> #5  0x000000000040665f in main (argc=3D2, argv=3D0x7fffffffe718) at main.=
cpp:325
> (gdb) up
> #1  0x000000000040f9b0 in start_cpu_measurement () at cpu/cpu.cpp:297
> 297             perf_events->start()
> (gdb) print perf_events
> $5 =3D (perf_bundle *) 0x0

The order of processing seems flawed. Immediately during argument processin=
g, =

calibrate() is called. But start_cpu_measurement requires some initializati=
on =

which is done by enumerate_cpus() in the main() function after arguments =

processing. You know your code better, so I'll gratefully wait for your =

patches.

Thanks,
Peter

--===============4251086009694596083==--

