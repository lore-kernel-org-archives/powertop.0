Content-Type: multipart/mixed; boundary="===============8013457867587485259=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Mon, 17 Sep 2012 16:57:51 +0400
Message-ID: <50571E4F.1010604@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8013457867587485259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

When you start the PowerTOP on a "cold" ARM phone with several cores and lo=
w CPU average
some cores could be powered down. It is very frequent situation on ARM plat=
form to dynamically
turn cores on/off to save power.

And when the PowerTOP scans /proc/cpuinfo file in enumerate_cpus() function=
, it will see
only one working core, so PowerTOP calls handle_one_cpu(...) only once and =
sets number of CPUs to 1.
So the PowerTOP will not register trace events for other cores.

Later when the system load (during the lifetime of PowerTOP) increases, the=
 Linux kernel powers-up
additional cores. But the PowerTOP will not catch events for them.

I thought about scanning the /sys/devices/system/cpu/ directory for finding=
 out how many CPUs
the system has. But the problem is that the directories for CPUs in offline=
 mode doesn't provide
needed subdirectories cpuidle/ and topology/ (also it misses some files in =
cpufreq/ directory).

The only way to enable these directories is to (temporarily?) turn the core=
 on.
This could be done e.g. by writing 1 to cpu/cpuX/online.
But I'm not sure how long the core will stay online before the kernel turns=
 it off again because of
low load. On my phone this happens in a less than a second.

Another possible way is to scan /sys/.../cpu/ for the number of CPUs in the=
 system,
register trace events for all that CPUs (by the way, is it possible to regi=
ster a trace event
for the core that is now off?), sleep for the needed amount of time as usua=
l, and before
the processing of data, temporarily turn every core on to find out informat=
ion about it.

Or the PowerTOP could remember which cores was turned on before the testing=
, turn it all on,
read needed info, turn some cores off to restore the state of the system an=
d begin test.

Or it could scan /sys/.../cpu/ with some interval (1 second) instead of jus=
t sleeping,
and grab the information about new cores brought online.

By the way, the PowerTOP scans /proc/ directory twice -- once before the st=
art and once after
to get information about processes (to provide more information from trace =
events).
But if some process starts after the PowerTOP begins to sleep, and dies bef=
ore the sleep ends,
then the PowerTOP will be unable to get information about that process (e.g=
. command line).
So the PowerTOP will know only its PID and shortened version of the command=
 line (task->comm[16]).

I have a patch adding scanning of /proc/ capabilities to the PowerTOP. I us=
e this /proc/ scanner
in MALI supporting patch, because MALI provides only the PID of the process=
 in their events,
and that is not enough to know about the process. It needs more discussion =
so I will send the patch
little later. But I want to notice, that it could be useful for the rest of=
 the PowerTOP too
to catch that processes. (The best solution will be to catch the process ex=
it, but that event
provides only short task->comm[16]).

Anyway, the PowerTOP could do more instead of just sleeping.

What do you think?

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


--===============8013457867587485259==--

