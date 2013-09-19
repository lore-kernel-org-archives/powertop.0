Content-Type: multipart/mixed; boundary="===============1164762604542989620=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] patch: tell user if the system is running out of FDs
Date: Thu, 19 Sep 2013 23:41:26 +0300
Message-ID: <20130919204126.GB2307@swordfish>
In-Reply-To: 808108042.17411093.1379604201988.JavaMail.root@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1164762604542989620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/19/13 11:23), Jaroslav Skarvada wrote:
> Hi,
> =

> complex servers can run out of FDs easily (due to perf).
> In such case tell user that more FDs are needed instead
> of the generic message (that kernel doesn't support
> the perf)

Hello Jaroslav,
Thank you for your patch.

Youquan Song proposed to change RLIMIT_NOFILE in "[PATCH] Fix running
failure when > 69 CPUs for open file limitation" some time ago
(v1 of the patch https://lists.01.org/pipermail/powertop/2013-May/000850.ht=
ml)

after some thinking I've merged Youquan's patch to powertop2-next tree
https://github.com/sergey-senozhatsky/powertop2-next/commit/4cbb957605818dc=
7e4b7932dafac0aad5ed0b87a

(not upstreamed yet).

while I don't really want to unlimit fds, at the same time from the user's
point of view it'd better to handle it `transparently'. I think most likely=
 user
will react with `ulimit -n unlimited' to any powertop rlimited fds message,=
 since
he/she really does not control (+does not care about) the number of opened =
fds.

thanks,
	-ss

> regards
> =

> Jaroslav

> diff -up powertop-2.4/src/perf/perf.cpp.orig powertop-2.4/src/perf/perf.c=
pp
> --- powertop-2.4/src/perf/perf.cpp.orig	2013-01-31 16:39:27.000000000 -05=
00
> +++ powertop-2.4/src/perf/perf.cpp	2013-09-19 10:36:02.298839248 -0400
> @@ -26,6 +26,7 @@
>  #include <iostream>
>  #include <fstream>
>  =

> +#include <errno.h>
>  #include <unistd.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> @@ -72,6 +73,7 @@ void perf_event::create_perf_event(char =

>  {
>  	struct perf_event_attr attr;
>  	int ret;
> +	int err;
>  =

>  	struct {
>  		__u64 count;
> @@ -107,10 +109,15 @@ void perf_event::create_perf_event(char =

>  	perf_fd =3D sys_perf_event_open(&attr, -1, _cpu, -1, 0);
>  =

>  	if (perf_fd < 0) {
> +		err =3D errno;
>  		reset_display();
> -		fprintf(stderr, _("PowerTOP %s needs the kernel to support the 'perf' =
subsystem\n"), POWERTOP_VERSION);
> -		fprintf(stderr, _("as well as support for trace points in the kernel:\=
n"));
> -		fprintf(stderr, "CONFIG_PERF_EVENTS=3Dy\nCONFIG_PERF_COUNTERS=3Dy\nCON=
FIG_TRACEPOINTS=3Dy\nCONFIG_TRACING=3Dy\n");
> +		if (err =3D=3D EMFILE)
> +			fprintf(stderr, _("Too many open files, please increase the limit of =
open file descriptors.\n"));
> +		else {
> +			fprintf(stderr, _("PowerTOP %s needs the kernel to support the 'perf'=
 subsystem\n"), POWERTOP_VERSION);
> +			fprintf(stderr, _("as well as support for trace points in the kernel:=
\n"));
> +			fprintf(stderr, "CONFIG_PERF_EVENTS=3Dy\nCONFIG_PERF_COUNTERS=3Dy\nCO=
NFIG_TRACEPOINTS=3Dy\nCONFIG_TRACING=3Dy\n");
> +		}
>  		exit(EXIT_FAILURE);
>  	}
>  	if (read(perf_fd, &read_data, sizeof(read_data)) =3D=3D -1) {

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============1164762604542989620==--

