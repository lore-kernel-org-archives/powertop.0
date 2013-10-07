Content-Type: multipart/mixed; boundary="===============8961839137969769748=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] patch: tell user if the system is running out of FDs
Date: Mon, 07 Oct 2013 17:05:08 +0300
Message-ID: <20131007140508.GA2271@swordfish.minsk.epam.com>
In-Reply-To: 23016151.2470223.1381151558300.JavaMail.root@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8961839137969769748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/07/13 09:12), Jaroslav Skarvada wrote:
> ----- Original Message -----
> > On (09/19/13 11:23), Jaroslav Skarvada wrote:
> > > Hi,
> > > =

> > > complex servers can run out of FDs easily (due to perf).
> > > In such case tell user that more FDs are needed instead
> > > of the generic message (that kernel doesn't support
> > > the perf)
> > =

> > Hello Jaroslav,
> > Thank you for your patch.
> > =

> > Youquan Song proposed to change RLIMIT_NOFILE in "[PATCH] Fix running
> > failure when > 69 CPUs for open file limitation" some time ago
> > (v1 of the patch
> > https://lists.01.org/pipermail/powertop/2013-May/000850.html)
> > =

> > after some thinking I've merged Youquan's patch to powertop2-next tree
> > https://github.com/sergey-senozhatsky/powertop2-next/commit/4cbb9576058=
18dc7e4b7932dafac0aad5ed0b87a
> > =

> > (not upstreamed yet).
> > =

> > while I don't really want to unlimit fds, at the same time from the use=
r's
> > point of view it'd better to handle it `transparently'. I think most li=
kely
> > user
> > will react with `ulimit -n unlimited' to any powertop rlimited fds mess=
age,
> > since
> > he/she really does not control (+does not care about) the number of ope=
ned
> > fds.
> > =

> > thanks,
> > 	-ss
> > =

> =

> Hi,

Hello,

> I used Youquan's patch, but we have noticed that it can only overcome sof=
t limits,
> but not hard limits. E.g. on Fedora (and probably others) there is a soft=
 limit
> of 1024 and a hard limit of 4096, so if powertop opens at least 15 file d=
escriptors
> per CPU, then this will fail on a system with >273 CPUs.

that's a pretty big system

> In case you think we can also temporally increase the hard limit (as we a=
lready have
> the privilege), the attached patch will do it. In case you think the hard=
 limits set by
> the system administrator are untouchable (e.g. violation of system resour=
ces hard limits
> could result in a bad effects like explosion in a nuclear power plant :),=
 the
> previously sent patch that fixes the error message needs to be also used

hm, need to think about this for a moment. both your patches make sense.
I'd probably go with `temporally increase the hard limit' solution, to make
someones life easier. what do you, guys, think?


	-ss

> regards
> =

> Jaroslav

> diff --git a/src/main.cpp b/src/main.cpp
> index 0883424..e0e8a71 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -36,6 +36,8 @@
>  #include <getopt.h>
>  #include <unistd.h>
>  #include <locale.h>
> +#include <sys/resource.h>
> +#include <linux/limits.h>
>  =

>  #include "cpu/cpu.h"
>  #include "process/process.h"
> @@ -283,11 +285,16 @@ static void powertop_init(void)
>  	static char initialized =3D 0;
>  	int ret;
>  	struct statfs st_fs;
> +	struct rlimit rlmt;
>  =

>  	if (initialized)
>  		return;
>  =

>  	checkroot();
> +
> +	rlmt.rlim_cur =3D rlmt.rlim_max =3D NR_OPEN;
> +	setrlimit (RLIMIT_NOFILE, &rlmt);
> +
>  	ret =3D system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1");
>  	ret =3D system("/sbin/modprobe msr > /dev/null 2>&1");
>  	statfs("/sys/kernel/debug", &st_fs);


--===============8961839137969769748==--

