Content-Type: multipart/mixed; boundary="===============8268140163972824218=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] Some more NaNs in report when CONFIG_TRACING is not enabled
Date: Fri, 17 Aug 2012 15:51:36 +0400
Message-ID: <502E3048.6020401@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8268140163972824218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

When you run the PowerTOP on the kernel with CONFIG_TRACING disabled,
you will get several NaNs (not a number) in the report. PowerTOP doesn't co=
rrectly
handle the situation when /sys/kernel/debug is present but /sys/kernel/debu=
g/tracing is not.

So the PowerTOP will be unable to get information about trace events. And i=
nstead of
arguing about that or skipping some tests, it will run and produce wrong re=
ports.

Since there will be no trace events captured, the measurement_time variable
in src/process/do_process.c will remain zero. So the functions like total_w=
akeups(),
total_gpu_ops(), total_disk_hits(), etc. will happily divide total by zero.

Yes, I know that it is not very useful to run the PowerTOP with tracing dis=
abled (although
the PowerTOP can still report information about devices), but I suppose tha=
t the PowerTOP
should check whether /sys/kernel/debug/tracing presents and say something i=
f not.

And as I see the PowerTOP almost never check the result of file opening fun=
ctions.
If it cannot open a file, the PowerTOP just silently skip it.

Thank you.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============8268140163972824218==--

