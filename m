Content-Type: multipart/mixed; boundary="===============9136886282636402373=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 12:24:48 +0400
Message-ID: <505AD2D0.10505@samsung.com>
In-Reply-To: 5059E1AF.3010000@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9136886282636402373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Chris Ferron wrote:

> On 09/19/2012 01:26 AM, Igor Zhbanov wrote:
>> I mean that only online cores are shown in /proc/cpuinfo.
>> So the PowerTOP doesn't count currently offline ones.
>> And you must run the PowerTOP on a heavy loaded system
>> to let the PowerTOP see all CPU cores.
>> Therefore it is impossible to run the PowerTOP before starting
>> of heavy application to get information about all CPU cores.
>> Probably the PowerTOP could cache CPU information in some file,
>> so it will be possible to register trace events for all cores.
> Off hand I don't have a good solution to help your ARM story. Your notes
> are interesting and I agree this is something that ARM is going to need.
> Do you have a complete solution you would like to purpose? I assume you
> have done some hacking to get around this, but if you have taken that
> and tuned it i suggest purposing the change. If you find a solution that
> doesn't digress the Architectures, and corrects the ARM story then
> please submit patches. I would be interested in seeing what you have
> come up with.
> I will try and look for a general solution, are there any other ARM
> advocates on this list who would like to chime in?

Now I'm looking for solution. But I see now only four ways:

1) Develop another kernel mechanism for providing information about all ava=
ilable
    CPUs and cores. Or ask the kernel authors not to remove offline cores f=
rom
    /proc/cpuinfo and their information files from /sys/.../cpu/.
2) Scan /sys/.../cpu for all CPUs and temporarily wake it up to gather info=
rmation.
3) Ask the user to run PowerTOP on a heavy loaded system for the first time
    (or wake up all CPUs by the PowerTOP) and store collected CPU informati=
on somewhere
    in /var/cache/powertop and reuse it on later runs.
4) Don't just sleep in a main cycle, but scan /sys/.../cpu for new CPUs to =
appear.
    (Perhaps there could be something like D-Bus or netlink notification wh=
en a core
     brought online -- I don't know about it).

At your personal view, what way fits better in the PowerTOP project?

P.S. This may be the case for x86 CPUs too. I have disable CPU2 by writing
to /sys/devices/system/cpu2/online, and the PowerTOP sees only CPU0, CPU1, =
and CPU3.
Although default PC's CPU governor as I know doesn't turn off CPUs frequent=
ly.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============9136886282636402373==--

