Content-Type: multipart/mixed; boundary="===============6075018105469859287=="
MIME-Version: 1.0
From: cshanahan at comcast.net
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Fri, 09 Nov 2012 01:37:18 +0000
Message-ID: <623577575.1331973.1352425038628.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net>
In-Reply-To: 20121105103220.GB3123@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6075018105469859287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> I was reading PowerTOP documentation and was curious whether it could he=
lp me
>> better manage power on my HP EliteBook 6930p laptop. I am running PowerT=
OP
>> v.2.0 on openSUSE 12.2 64-bit. After looking at some of my options from =
the
>> Overview and Stats tabs, I elected to run 'powertop --calibrate' as the =
docs
>> suggest. PowerTOP did not complete the calibration process; it exited wi=
th a
>> seg fault. Now the hardware button for WiFi (small button along the top =
of
>> the laptop near the screen) flashes constantly. I'm concerned that Power=
TOP
>> caused some sort of hardware problem and damaged my laptop.
>>
>> Is there a way for me to check what PowerTOP did to my machine?
>>
>> Is there a way for me to completely revert any changes made by PowerTOP?
>>
>> uname -a
>> Linux 6930p.site 3.4.11-2.16-desktop #1 SMP PREEMPT Wed Sep 26 17:05:00 =
UTC 2012 (259fc87) x86_64 x86_64 x86_64 GNU/Linux
>>
>> 6930p:~ # powertop --calibrate
>> Starting PowerTOP power estimate calibration
>> Calibrating idle
>> Segmentation fault
>
>
> can you please do the following one (may be it'll work out w/o powertop
> re-compile)
>
> gdb PATH_TO_POWERTOP_BINARY
> $ run --calibrate
> $ bt


Sure can.

6930p:~ # gdb /usr/sbin/powertop
GNU gdb (GDB) SUSE (7.4.50.20120603-2.1.2)
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-suse-linux".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/sbin/powertop...(no debugging symbols found)...do=
ne.
Missing separate debuginfos, use: zypper install powertop-debuginfo-2.0-2.1=
.2.x86_64
(gdb) run --calibrate
Starting program: /usr/sbin/powertop --calibrate
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Starting PowerTOP power estimate calibration =

Calibrating idle
Detaching after fork from child process 17369.

Program received signal SIGSEGV, Segmentation fault.
0x000000000042885c in ?? ()
(gdb) bt
#0  0x000000000042885c in ?? ()
#1  0x000000000040ff30 in ?? ()
#2  0x0000000000442f15 in ?? ()
#3  0x000000000043fd7a in ?? ()
#4  0x0000000000406f98 in ?? ()
#5  0x00007ffff6597455 in __libc_start_main () from /lib64/libc.so.6
#6  0x000000000040748d in ?? ()
#7  0x00007fffffffe378 in ?? ()
#8  0x0000000000000000 in ?? ()
(gdb) =



I hope this helps. The WiFi hardware light continues to blink, though WiFi
seems to work as expected.

Again, Thank you.


--
Chris

--===============6075018105469859287==--

