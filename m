Content-Type: multipart/mixed; boundary="===============2253136277143962835=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 12:14:33 +0300
Message-ID: <20120920091433.GA3237@swordfish.minsk.epam.com>
In-Reply-To: 505AD2D0.10505@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2253136277143962835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/20/12 12:24), Igor Zhbanov wrote:
> Chris Ferron wrote:
> =

> Now I'm looking for solution. But I see now only four ways:
> =

> 1) Develop another kernel mechanism for providing information about all a=
vailable
>    CPUs and cores. Or ask the kernel authors not to remove offline cores =
from
>    /proc/cpuinfo and their information files from /sys/.../cpu/.

procps (e.g. top utility) use sysconf _SC_NPROCESSORS_CONF/_SC_NPROCESSORS_=
ONLN for
that purpose.

https://www.gnu.org/software/libc/manual/html_node/Processor-Resources.html


	-ss

> 2) Scan /sys/.../cpu for all CPUs and temporarily wake it up to gather in=
formation.
> 3) Ask the user to run PowerTOP on a heavy loaded system for the first ti=
me
>    (or wake up all CPUs by the PowerTOP) and store collected CPU informat=
ion somewhere
>    in /var/cache/powertop and reuse it on later runs.
> 4) Don't just sleep in a main cycle, but scan /sys/.../cpu for new CPUs t=
o appear.
>    (Perhaps there could be something like D-Bus or netlink notification w=
hen a core
>     brought online -- I don't know about it).
> =

> At your personal view, what way fits better in the PowerTOP project?
> =

> P.S. This may be the case for x86 CPUs too. I have disable CPU2 by writing
> to /sys/devices/system/cpu2/online, and the PowerTOP sees only CPU0, CPU1=
, and CPU3.
> Although default PC's CPU governor as I know doesn't turn off CPUs freque=
ntly.
>=20

--===============2253136277143962835==--

