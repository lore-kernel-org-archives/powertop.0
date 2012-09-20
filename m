Content-Type: multipart/mixed; boundary="===============0811035558717815484=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 13:57:10 +0400
Message-ID: <505AE876.4080105@samsung.com>
In-Reply-To: 20120920094354.GB3237@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0811035558717815484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sergey Senozhatsky wrote:

> On (09/20/12 13:29), Igor Zhbanov wrote:
>>> On (09/20/12 12:24), Igor Zhbanov wrote:
>>>> Chris Ferron wrote:
>>>>
>>>> Now I'm looking for solution. But I see now only four ways:
>>>>
>>>> 1) Develop another kernel mechanism for providing information about al=
l available
>>>>     CPUs and cores. Or ask the kernel authors not to remove offline co=
res from
>>>>     /proc/cpuinfo and their information files from /sys/.../cpu/.
>>> procps (e.g. top utility) use sysconf _SC_NPROCESSORS_CONF/_SC_NPROCESS=
ORS_ONLN for
>>> that purpose.
>>>
>>> https://www.gnu.org/software/libc/manual/html_node/Processor-Resources.=
html
>> Counting of the CPUs is the least problem. (By the way, how sysconf() fi=
gures
>> out the number? I suppose that it reads /proc/cpuinfo of scans /sys/.
>> Is there any other way?).
>>
>> The problem is that the PowerTOP needs to read information about cores
>> from the files in /sys/.../cpu/cpuX/ directory (about C- and P-states, s=
iblings
>> etc). And needed files in these directories are present only for cores
>> which are currently online.
> right, I was thinking about that some time ago: and from the top of my he=
ad kind of a solution
> seemed to be to track number of CPUs before measure, compare with the pre=
viously known one,
> and "re-init" powertop (at least rebuild CPUs part), but it's not that of=
ten that I offline/online
> CPUs, so I decided to drop it. with ARM we have a different story.
>
> on x86(_64) "dirty" CPU offline support looks "easy", just make get_msr()=
 error non-fatal.
> online -- that's the problem, agree.

Perhaps PowerTOP could wake up every core in its calibration phase and stor=
y collected
information in platform config file.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============0811035558717815484==--

