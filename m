Content-Type: multipart/mixed; boundary="===============1433320072586690224=="
MIME-Version: 1.0
From: viresh kumar <viresh.kumar at linaro.org>
Subject: [Powertop] Query: Weird Output values: Percentage over 100%
Date: Wed, 29 Aug 2012 13:39:53 +0530
Message-ID: <CAOh2x==gOcSqWZhEn0iX5Es=cjByYHVe0_gM3WhaKtsjhvXfFg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1433320072586690224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I am noticing something strange in powertop reports.
When i run powertop with following parameters:

powertop -t 120 --html

I see following in summary section

Power Consumption Summary

0.1 wakeups/second, 0.0 GPU ops/second, 0.0 VFS ops/sec, 0.0 GFX
wakes/sec and 5375.4% CPU use

Usage	Events/s	Category	Description
2693%	 0.07	Timer	tick_sched_timer
2680%	 0.00	Timer	ehci_watchdog
0.6%	 0.00	Interrupt	[7] sched(softirq)
0.2%	 0.00	Interrupt	[1] timer(softirq)
0.2%	 0.00	Interrupt	[29] twd
0.1%	 0.00	kWork	pm_runtime_work
0.1%	 0.00	Timer	led_heartbeat_function
0.1%	 0.00	Interrupt	[9] RCU(softirq)
0.1%	 0.00	Interrupt	[57] OMAP DISPC
0.1%	 0.00	Process	rsyslogd -c5


How is percentage over 100 %...

System Info:

PowerTOP Version	v2.0
Kernel Version	Linux version 3.4.0-01820-gcc96f22
(viresh(a)blr-linut-001) (gcc version 4.7.1 20120514 (prerelease)
(crosstool-NG linaro-1.13.1-2012.05-20120523 - Linaro GCC 2012.05) )
#5 SMP PREEMPT Tue Aug 28 12:44:52 IST 2012
System Name	=

CPU Information	2x
OS Information	=


Running on ARM: Panda Board.

--
viresh

--===============1433320072586690224==--

