Content-Type: multipart/mixed; boundary="===============9188746934729748818=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Sun, 11 Nov 2012 22:45:28 +0300
Message-ID: <20121111194528.GA3851@swordfish>
In-Reply-To: 164841353.33797.1352661160320.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9188746934729748818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/11/12 19:12), cshanahan(a)comcast.net wrote:
> Done. Output below.
> =

> I hope this helps to make PowerTop better, though it doesn't look like it=
s going
> to help me with my problem. PowerTop made some change to my system that I=
 cannot
> find. The files in /var/cache/powertop/ are empty. Something was changed =
with
> systemd and I can't find it. The problem persists after reboot. I can boo=
t using
> any number of LiveCDs and I the WiFi hardware button works as expected. H=
ardware
> is fine.
> =

> 6930p:~ # ll /var/cache/powertop/
> total 0
> -rw-r--r-- 1 root root 0 Nov  8 20:29 saved_parameters.powertop
> -rw-r--r-- 1 root root 0 Nov  8 20:29 saved_results.powertop
> =

> =

> (gdb) run --calibrate
> Starting program: /usr/sbin/powertop --calibrate
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
> Starting PowerTOP power estimate calibration =

> Calibrating idle
> Detaching after fork from child process 3784.
> =

> Program received signal SIGSEGV, Segmentation fault.
> perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
> 180     perf/perf_bundle.cpp: No such file or directory.
> Missing separate debuginfos, use: zypper install glibc-debuginfo-2.15-22.=
6.4.x86_64
> libgcc47-debuginfo-4.7.1_20120723-1.1.1.x86_64 libncurses5-debuginfo-5.9-=
12.5.1.x86_64
> libnl3-200-debuginfo-3.2.9-2.1.2.x86_64 libpci3-debuginfo-3.1.9-3.1.2.x86=
_64
> libstdc++47-debuginfo-4.7.1_20120723-1.1.1.x86_64 zlib-debuginfo-1.2.7-2.=
1.2.x86_64
> (gdb) bt
> #0  perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
> #1  0x000000000040ff30 in start_cpu_measurement () at cpu/cpu.cpp:297
> #2  0x0000000000442f15 in one_measurement (seconds=3D15) at main.cpp:182
> #3  0x000000000043fd7a in idle_calibration () at calibrate/calibrate.cpp:=
423
> #4  calibrate () at calibrate/calibrate.cpp:466
> #5  0x0000000000406f98 in main (argc=3D2, argv=3D0x7fffffffe388) at main.=
cpp:325
> (gdb)
> =

> =


hm, that's something. seems like enumerate_cpus(); failed
because perf_bundle was NULL in cpu by the time of =

	perf_events->start();

call, but it did not crashed on any of enumerate_cpus()

332         perf_events =3D new perf_power_bundle();
333 =

334         if (!perf_events->add_event("power:cpu_idle")){
335                 perf_events->add_event("power:power_start");
336                 perf_events->add_event("power:power_end");
337         }
338         if (!perf_events->add_event("power:cpu_frequency"))
339                 perf_events->add_event("power:power_frequency");


so it leaves only one suspect: enumerate_cpus()

269         file.open("/proc/cpuinfo",  ios::in);
270 =

271         if (!file)
272                 return;



is that happeninig all the time? =

a *very* stupid question - do you have /proc/cpuinfo file?


	-ss=20

--===============9188746934729748818==--

