Content-Type: multipart/mixed; boundary="===============3169694972143476949=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] perf: Pass 0 as a third argument to ioctl
 on perf_fd
Date: Mon, 17 Sep 2012 08:21:02 -0700
Message-ID: <50573FDE.5090503@linux.intel.com>
In-Reply-To: 1347805051-2889-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3169694972143476949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/16/2012 07:17 AM, Namhyung Kim wrote:
> The third argument of PERF_EVENT_IOC_{ENABLE,DISABLE} ioctl is a flag
> to determine whether the command should be applied to group members.
> Since the powertop doesn't use the event grouping feature, it'd better
> passing 0 as a third argument explicitly.
>
> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>   src/perf/perf.cpp |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
> index 69f1da3..c8ba7a8 100644
> --- a/src/perf/perf.cpp
> +++ b/src/perf/perf.cpp
> @@ -128,7 +128,7 @@ void perf_event::create_perf_event(char *eventname, i=
nt _cpu)
>   		return;
>   	}
>   =

> -	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_ENABLE);
> +	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_ENABLE, 0);
>   =

>   	if (ret < 0) {
>   		fprintf(stderr, "failed to enable perf \n");
> @@ -210,7 +210,7 @@ void perf_event::start(void)
>   void perf_event::stop(void)
>   {
>   	int ret;
> -	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_DISABLE);
> +	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_DISABLE, 0);
>   	if (ret)
>   		cout << "stop failing\n";
>   }
Your patch as been merged.
Thank You
-C


--===============3169694972143476949==--

