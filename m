Content-Type: multipart/mixed; boundary="===============8641624890108448824=="
MIME-Version: 1.0
From: cshanahan at comcast.net
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Mon, 12 Nov 2012 02:01:02 +0000
Message-ID: <179380942.45470.1352685662441.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net>
In-Reply-To: 20121111194528.GA3851@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8641624890108448824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
Sent: Sunday, November 11, 2012 2:45:28 PM
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault

>> =

>> (gdb) run --calibrate
>> Starting program: /usr/sbin/powertop --calibrate
>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/lib64/libthread_db.so.1".
>> Starting PowerTOP power estimate calibration =

>> Calibrating idle
>> Detaching after fork from child process 3784.
>> =

>> Program received signal SIGSEGV, Segmentation fault.
>> perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
>> 180     perf/perf_bundle.cpp: No such file or directory.
>> Missing separate debuginfos, use: zypper install glibc-debuginfo-2.15-22=
.6.4.x86_64
>> libgcc47-debuginfo-4.7.1_20120723-1.1.1.x86_64 libncurses5-debuginfo-5.9=
-12.5.1.x86_64
>> libnl3-200-debuginfo-3.2.9-2.1.2.x86_64 libpci3-debuginfo-3.1.9-3.1.2.x8=
6_64
>> libstdc++47-debuginfo-4.7.1_20120723-1.1.1.x86_64 zlib-debuginfo-1.2.7-2=
.1.2.x86_64
>> (gdb) bt
>> #0  perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
>> #1  0x000000000040ff30 in start_cpu_measurement () at cpu/cpu.cpp:297
>> #2  0x0000000000442f15 in one_measurement (seconds=3D15) at main.cpp:182
>> #3  0x000000000043fd7a in idle_calibration () at calibrate/calibrate.cpp=
:423
>> #4  calibrate () at calibrate/calibrate.cpp:466
>> #5  0x0000000000406f98 in main (argc=3D2, argv=3D0x7fffffffe388) at main=
.cpp:325
>> (gdb)
>> =

> =

>
> hm, that's something. seems like enumerate_cpus(); failed
> because perf_bundle was NULL in cpu by the time of =

>	perf_events->start();
>
> call, but it did not crashed on any of enumerate_cpus()
>
> 332         perf_events =3D new perf_power_bundle();
> 333 =

> 334         if (!perf_events->add_event("power:cpu_idle")){
> 335                 perf_events->add_event("power:power_start");
> 336                 perf_events->add_event("power:power_end");
> 337         }
> 338         if (!perf_events->add_event("power:cpu_frequency"))
> 339                 perf_events->add_event("power:power_frequency");
>
>
> so it leaves only one suspect: enumerate_cpus()
>
> 269         file.open("/proc/cpuinfo",  ios::in);
> 270 =

> 271         if (!file)
> 272                 return;
>
>
> is that happeninig all the time?

Yes. Happens all the time.


> a *very* stupid question - do you have /proc/cpuinfo file?

Yes, I do.

Any idea about my problem?

Thank you for youe help.


--
Chris

--===============8641624890108448824==--

