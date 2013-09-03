Content-Type: multipart/mixed; boundary="===============4379347124569203551=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] (BUG) powertop-1.13 fails to kernel-3.10.7
Date: Tue, 03 Sep 2013 08:58:50 +0300
Message-ID: <20130903055850.GA2464@swordfish>
In-Reply-To: CAAEzAp-9iZSPDkntiguA9mez+xk+n0ZLbDV-N79P0s8Lx7eUgg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4379347124569203551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/24/13 09:35), Dennis Jenkins wrote:
>    Hello,
> =

>    =EF=BF=BD=EF=BF=BD I recently updated my Gentoo linux kernel from 3.8.=
18 to 3.10.7.=EF=BF=BD
>    powertop now hangs while starting up.=EF=BF=BD "strace" shows that pow=
ertop is
>    reading the contents of "/proc/timer_list" over and over (but with no=
=EF=BF=BD
>    "seek" call, which is weird to me).

Hello,
sorry for long response. this one really looks like a kernel bug
fixed by 84a78a6504f5c5394a8e558702e5b54131f01d14 upstream (3.11)

	-ss

>    ostara ~ # powertop --version
>    powertop version 1.13
> =

>    ostara ~ # uname -r
>    3.10.7-gentoo
> =

>    ostara ~ # zgrep TIMER /proc/config.gz
>    CONFIG_HIGH_RES_TIMERS=3Dy
>    CONFIG_TIMERFD=3Dy
>    CONFIG_OPROFILE_NMI_TIMER=3Dy
>    CONFIG_HPET_TIMER=3Dy
>    # CONFIG_X86_PM_TIMER is not set
>    CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
>    # CONFIG_HW_RANDOM_TIMERIOMEM is not set
>    # CONFIG_HANGCHECK_TIMER is not set
>    # CONFIG_PPS_CLIENT_KTIMER is not set
>    CONFIG_SND_TIMER=3Dm
>    # CONFIG_SND_HRTIMER is not set
>    CONFIG_TIMER_STATS=3Dy
> =

>    ostara ~ # wc /proc/timer_list
>    387 1569 16282 /proc/timer_list
> =

>    ostara ~ # strace -e\!read powertop
>    (tailing...)
>    open("/proc/interrupts", O_RDONLY)=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD =3D 3
>    fstat(3, {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0
>    mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, =
0) =3D
>    0x7fcfdd7c3000
>    open("/proc/timer_list", O_RDONLY)=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD =3D 4
>    fstat(4, {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0
>    mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, =
0) =3D
>    0x7fcfdd7c2000
>    ^CProcess 22238 detached
> =

>    Now run "strace" again, but without the "-e\!read" and watch it read f=
d #4
>    over and over and over again.
> =

>    If you need any additional info, please let me know.

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============4379347124569203551==--

