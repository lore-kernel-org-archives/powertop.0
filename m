Content-Type: multipart/mixed; boundary="===============1608989733203405527=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 13:29:40 +0400
Message-ID: <505AE204.6090907@samsung.com>
In-Reply-To: 20120920091433.GA3237@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1608989733203405527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sergey Senozhatsky wrote:

> On (09/20/12 12:24), Igor Zhbanov wrote:
>> Chris Ferron wrote:
>>
>> Now I'm looking for solution. But I see now only four ways:
>>
>> 1) Develop another kernel mechanism for providing information about all =
available
>>     CPUs and cores. Or ask the kernel authors not to remove offline core=
s from
>>     /proc/cpuinfo and their information files from /sys/.../cpu/.
> procps (e.g. top utility) use sysconf _SC_NPROCESSORS_CONF/_SC_NPROCESSOR=
S_ONLN for
> that purpose.
>
> https://www.gnu.org/software/libc/manual/html_node/Processor-Resources.ht=
ml

Counting of the CPUs is the least problem. (By the way, how sysconf() figur=
es
out the number? I suppose that it reads /proc/cpuinfo of scans /sys/.
Is there any other way?).

The problem is that the PowerTOP needs to read information about cores
from the files in /sys/.../cpu/cpuX/ directory (about C- and P-states, sibl=
ings
etc). And needed files in these directories are present only for cores
which are currently online.

So the Powertop is unable
1) To count the number of available CPUs.
2) To read information about all CPUs.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============1608989733203405527==--

