Content-Type: multipart/mixed; boundary="===============0480222678334903547=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 1/2] perf: Pass 0 as a third argument to ioctl
 on perf_fd
Date: Mon, 17 Sep 2012 02:17:30 +0300
Message-ID: <20120916231730.GB3092@swordfish>
In-Reply-To: 1347805051-2889-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0480222678334903547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/16/12 23:17), Namhyung Kim wrote:
> The third argument of PERF_EVENT_IOC_{ENABLE,DISABLE} ioctl is a flag
> to determine whether the command should be applied to group members.
> Since the powertop doesn't use the event grouping feature, it'd better
> passing 0 as a third argument explicitly.
>

[..]
   <+629>:	mov    -0x88(%rbp),%rax
   <+636>:	mov    0x8(%rax),%eax
   <+639>:	mov    $0x2400,%esi
   <+644>:	mov    %eax,%edi
   <+646>:	mov    $0x0,%eax
   <+651>:	callq  0x404460 <ioctl(a)plt>
[..]

agree, let's pass 0 explicitly to perf_ioctl():

3307
3308         if (flags & PERF_IOC_FLAG_GROUP)
3309                 perf_event_for_each(event, func);
3310         else
3311                 perf_event_for_each_child(event, func);
3312 =




good catch, thank you!


	-ss

 =

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>  src/perf/perf.cpp |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
> index 69f1da3..c8ba7a8 100644
> --- a/src/perf/perf.cpp
> +++ b/src/perf/perf.cpp
> @@ -128,7 +128,7 @@ void perf_event::create_perf_event(char *eventname, i=
nt _cpu)
>  		return;
>  	}
>  =

> -	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_ENABLE);
> +	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_ENABLE, 0);
>  =

>  	if (ret < 0) {
>  		fprintf(stderr, "failed to enable perf \n");
> @@ -210,7 +210,7 @@ void perf_event::start(void)
>  void perf_event::stop(void)
>  {
>  	int ret;
> -	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_DISABLE);
> +	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_DISABLE, 0);
>  	if (ret)
>  		cout << "stop failing\n";
>  }
>=20

--===============0480222678334903547==--

