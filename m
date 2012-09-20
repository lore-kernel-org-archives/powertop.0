Content-Type: multipart/mixed; boundary="===============2794739584421163515=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 12:43:54 +0300
Message-ID: <20120920094354.GB3237@swordfish.minsk.epam.com>
In-Reply-To: 505AE204.6090907@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2794739584421163515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/20/12 13:29), Igor Zhbanov wrote:
> >On (09/20/12 12:24), Igor Zhbanov wrote:
> >>Chris Ferron wrote:
> >>
> >>Now I'm looking for solution. But I see now only four ways:
> >>
> >>1) Develop another kernel mechanism for providing information about all=
 available
> >>    CPUs and cores. Or ask the kernel authors not to remove offline cor=
es from
> >>    /proc/cpuinfo and their information files from /sys/.../cpu/.
> >procps (e.g. top utility) use sysconf _SC_NPROCESSORS_CONF/_SC_NPROCESSO=
RS_ONLN for
> >that purpose.
> >
> >https://www.gnu.org/software/libc/manual/html_node/Processor-Resources.h=
tml
> =

> Counting of the CPUs is the least problem. (By the way, how sysconf() fig=
ures
> out the number? I suppose that it reads /proc/cpuinfo of scans /sys/.
> Is there any other way?).
> =

> The problem is that the PowerTOP needs to read information about cores
> from the files in /sys/.../cpu/cpuX/ directory (about C- and P-states, si=
blings
> etc). And needed files in these directories are present only for cores
> which are currently online.
>

right, I was thinking about that some time ago: and from the top of my head=
 kind of a solution
seemed to be to track number of CPUs before measure, compare with the previ=
ously known one,
and "re-init" powertop (at least rebuild CPUs part), but it's not that ofte=
n that I offline/online
CPUs, so I decided to drop it. with ARM we have a different story.

on x86(_64) "dirty" CPU offline support looks "easy", just make get_msr() e=
rror non-fatal.
online -- that's the problem, agree.
 =

	-ss

> So the Powertop is unable
> 1) To count the number of available CPUs.
> 2) To read information about all CPUs.
> =



--===============2794739584421163515==--

