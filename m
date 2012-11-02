Content-Type: multipart/mixed; boundary="===============2631804151261308613=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [FYI][RFC][PATCH 0/2] MALI GPU profiling support
Date: Fri, 02 Nov 2012 19:05:36 +0400
Message-ID: <5093E140.20604@samsung.com>
In-Reply-To: CAMFVxViK-WCd7e4rA2S449S4p+YsPjp9Tp2iZe5Srd=b2SijuQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2631804151261308613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ferron, Chris E wrote:

> On Thu, Nov 1, 2012 at 5:00 AM, Igor Zhbanov <i.zhbanov(a)samsung.com> wr=
ote:
>>                          * Initial voltage and frequency values *
>>
>> When PowerTOP starts on system with display turned on and some graphical
>> applications already running, there is a possibility for situation where=
 some
>> rendering job will be started before PowerTOP grabs the first voltage or
>> frequency setting event. So PowerTOP will be unaware of current frequency
>> and/or voltage value. Because of this it is impossible to correctly calc=
ulate
>> power consumption for that task because it is impossible to ask the driv=
er
>> about current frequency and voltage. And in the current version PowerTOP=
 drops
>> jobs before first voltage or frequency change event (such events are fre=
quent
>> enough, so it's not a problem). It is possible to use some default value=
 but
> Gaining defaults and baselines is a pretty generic issues. To increase
> samples and such, have you
> considered using the calibration to help here?
>> it will be GPU-dependent and we don't know what value to use.

The Powertop doesn't have the ability to calibrate GPU now. It is possible =
to refine
the C constant by the means of calibration. But we still would not know at =
what voltage
and frequency the rendering job (that was started before the Powertop) runn=
ing.
Fortunately, these rendering jobs takes less than a second usually. So prob=
ably
we could ignore them.

The better solution could be if we had some support from GPU driver to ask =
for current
frequency and voltage.

Some off-topic.

By the way, I now study the possibility to adopt another approach. Consider=
 what would be
if we had CPU and GPU power consumption statistics right inside the kernel.=
 I don't like
the current way when the Powertop must handle several thousands events per =
second (because
of catching every sched_switch and sched_wakeup events that could happen CO=
NFIG_HZ * cpu_nr
times every second) just to calculate single number (usage) for each proces=
s.

The kernel knows what is the current voltage and frequency for each process.
Also it knows the duration of each time slice. So the kernel could easily c=
ompute on each
task switch how much power was consumed by particular task and update its c=
ounter.

Then the Powertop could just grab these counters periodically.

This feature could have on/off switch via sysctl to be turned only for some=
 time.

I think that this way is better. Also it significantly reduces the amount o=
f work performed
by the Powertop. What you think?

-- =

Best regards,
Igor Zhbanov,
Technical Leader,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============2631804151261308613==--

