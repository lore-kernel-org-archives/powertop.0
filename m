Content-Type: multipart/mixed; boundary="===============1033032492803525859=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Fix running failure when > 69 CPUs for open
 file limitation
Date: Tue, 04 Jun 2013 13:26:33 +0300
Message-ID: <20130604102633.GB2323@swordfish>
In-Reply-To: 20130604213123.GB14821@linux-youquan.bj.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1033032492803525859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (06/04/13 17:31), Youquan Song wrote:
> > =

> > how about, say, 2048? unlimited resource steals possibility to detect =

> > error/bug/leak/etc.
> =

> I do not like it. If there are more CPUs on larger machine and if we
> want to monitor more performance event for each CPU, the 2048 settting wi=
ll
>  be another issue.
> =


we may get the number of CPUs, multiply it by events number + probably add =
some =

extra fds, and set it as a limit. this is not a really big issue, though. m=
y point =

is that limited resource gives us better chances to detect resource leak in =

powertop, however I agree that we just may fireup valgrind for that purpose.


	-ss

> We just set it to the rlim_cur to rlim_max for the powertop application
> and to cater to powertop requirement as large as possible.
> =

> > and let's make rlimit change after checkroot() call.
> > =

> =

> Good point. Agree. Here is the modified patch.
> =

> =

> diff --git a/src/main.cpp b/src/main.cpp
> index 0883424..d24a3db 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -36,6 +36,7 @@
>  #include <getopt.h>
>  #include <unistd.h>
>  #include <locale.h>
> +#include <sys/resource.h>
>  =

>  #include "cpu/cpu.h"
>  #include "process/process.h"
> @@ -283,11 +284,17 @@ static void powertop_init(void)
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
> +	getrlimit (RLIMIT_NOFILE, &rlmt);
> +	rlmt.rlim_cur =3D rlmt.rlim_max;
> +	setrlimit (RLIMIT_NOFILE, &rlmt);
> +
>  	ret =3D system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1");
>  	ret =3D system("/sbin/modprobe msr > /dev/null 2>&1");
>  	statfs("/sys/kernel/debug", &st_fs);
> =

>  =

>=20

--===============1033032492803525859==--

