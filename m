Content-Type: multipart/mixed; boundary="===============8334542654530553435=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 14:40:17 +0400
Message-ID: <505AF291.4000308@samsung.com>
In-Reply-To: 505AE85E.6000102@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8334542654530553435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Arjan van de Ven wrote:
> On 9/20/2012 10:24 AM, Igor Zhbanov wrote:
>
>> Now I'm looking for solution. But I see now only four ways:
>>
>> 1) Develop another kernel mechanism for providing information about all =
available
>>     CPUs and cores. Or ask the kernel authors not to remove offline core=
s from
>>     /proc/cpuinfo and their information files from /sys/.../cpu/.
>> 2) Scan /sys/.../cpu for all CPUs and temporarily wake it up to gather i=
nformation.
>> 3) Ask the user to run PowerTOP on a heavy loaded system for the first t=
ime
>>     (or wake up all CPUs by the PowerTOP) and store collected CPU inform=
ation somewhere
>>     in /var/cache/powertop and reuse it on later runs.
>> 4) Don't just sleep in a main cycle, but scan /sys/.../cpu for new CPUs =
to appear.
>>     (Perhaps there could be something like D-Bus or netlink notification=
 when a core
>>      brought online -- I don't know about it).
>>
>> At your personal view, what way fits better in the PowerTOP project?
> it's messy. ARM in some ways is abusing CPU Offline for idle...
>
>> P.S. This may be the case for x86 CPUs too. I have disable CPU2 by writi=
ng
>> to /sys/devices/system/cpu2/online, and the PowerTOP sees only CPU0, CPU=
1, and CPU3.
>> Although default PC's CPU governor as I know doesn't turn off CPUs frequ=
ently.
> on x86, you don't win any power at all by offlining CPUs (in fact, it's v=
ery power inefficient to do so,
> idle tends to be THAT good)

Or it could be that kernel on ARM wrongly removes information from /proc/cp=
uinfo and /sys/
for offline cores. Or it wrongly considers them offline.

As I know many of the ARM CPUs has only two C-states. First is independent =
for each core:
WFI -- Wait For Interrupt. In this state the CPU just calls the halt instru=
ction.

And the second state is ARM power down. This is the coupled state. As I und=
erstand,
the whole package could enter this state only when all cores (except curren=
t) are in WFI state.
So the last active core powers the CPU down.

But is it correct to consider ARM core to be offline when it is just in WFI=
 state?

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============8334542654530553435==--

