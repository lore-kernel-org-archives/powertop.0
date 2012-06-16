Content-Type: multipart/mixed; boundary="===============1788177401225697670=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] Please revert the workload patch
Date: Sat, 16 Jun 2012 13:16:53 +0200
Message-ID: <1339845413.2673.1.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1788177401225697670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello.

Could you please revert the workload patch
(b45a38317777678b94cdf4cc81896e3a66db68bd) as it seems to try to
execute some random memory. When powertop is started as

./powertop

I see the following stack trace:

Breakpoint 1, system (line=3D0x7fffffffd440 "\020\020i") at pt-system.c:29
29      pt-system.c: No such file or directory.
(gdb) where
#0  system (line=3D0x7fffffffd440 "\020\020i") at pt-system.c:29
#1  0x0000000000456933 in one_measurement (seconds=3D20, workload=3D0x7ffff=
fffd440 "\020\020i") at main.cpp:190
#2  0x00000000004572c2 in main (argc=3D1, argv=3D0x7fffffffe538) at main.cp=
p:455
(gdb) =


This shows up as a powertop beeing nonresponsive, flashing the
display excessively and warning about not managing to run the program.

/MF



--===============1788177401225697670==--

