Content-Type: multipart/mixed; boundary="===============2127557598158380986=="
MIME-Version: 1.0
From: cshanahan at comcast.net
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Sun, 11 Nov 2012 19:12:40 +0000
Message-ID: <164841353.33797.1352661160320.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net>
In-Reply-To: CAE4GLste6Aha0VcB4z7KQWkqw3H=3PCVow=QbPPUOEj4U+coVA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2127557598158380986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Sent: Friday, November 9, 2012 2:20:59 AM
> Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
>>
>> can you please do the following one (may be it'll work out w/o powertop
>> re-compile)
>>
>> gdb PATH_TO_POWERTOP_BINARY
>> $ run --calibrate
>> $ bt
>>
>>
> The "??" will turn into real functions, when you install powertop-debugin=
fo
> from above:
> Missing separate debuginfos, use: zypper install
> powertop-debuginfo-2.0-2.1.2.x86_64
>
> Could you install that package and try it again please?


Done. Output below.

I hope this helps to make PowerTop better, though it doesn't look like its =
going
to help me with my problem. PowerTop made some change to my system that I c=
annot
find. The files in /var/cache/powertop/ are empty. Something was changed wi=
th
systemd and I can't find it. The problem persists after reboot. I can boot =
using
any number of LiveCDs and I the WiFi hardware button works as expected. Har=
dware
is fine.

6930p:~ # ll /var/cache/powertop/
total 0
-rw-r--r-- 1 root root 0 Nov  8 20:29 saved_parameters.powertop
-rw-r--r-- 1 root root 0 Nov  8 20:29 saved_results.powertop


(gdb) run --calibrate
Starting program: /usr/sbin/powertop --calibrate
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Starting PowerTOP power estimate calibration =

Calibrating idle
Detaching after fork from child process 3784.

Program received signal SIGSEGV, Segmentation fault.
perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
180     perf/perf_bundle.cpp: No such file or directory.
Missing separate debuginfos, use: zypper install glibc-debuginfo-2.15-22.6.=
4.x86_64
libgcc47-debuginfo-4.7.1_20120723-1.1.1.x86_64 libncurses5-debuginfo-5.9-12=
.5.1.x86_64
libnl3-200-debuginfo-3.2.9-2.1.2.x86_64 libpci3-debuginfo-3.1.9-3.1.2.x86_64
libstdc++47-debuginfo-4.7.1_20120723-1.1.1.x86_64 zlib-debuginfo-1.2.7-2.1.=
2.x86_64
(gdb) bt
#0  perf_bundle::start (this=3D0x0) at perf/perf_bundle.cpp:180
#1  0x000000000040ff30 in start_cpu_measurement () at cpu/cpu.cpp:297
#2  0x0000000000442f15 in one_measurement (seconds=3D15) at main.cpp:182
#3  0x000000000043fd7a in idle_calibration () at calibrate/calibrate.cpp:423
#4  calibrate () at calibrate/calibrate.cpp:466
#5  0x0000000000406f98 in main (argc=3D2, argv=3D0x7fffffffe388) at main.cp=
p:325
(gdb)


Do you need me to install the additional missing debuginfos (noted above) o=
r is
this sufficient?


--
Chris

--===============2127557598158380986==--

