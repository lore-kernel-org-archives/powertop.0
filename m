Content-Type: multipart/mixed; boundary="===============3701046635402123859=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 2/2] perf: Check return value of strdup
Date: Mon, 17 Sep 2012 01:48:16 +0300
Message-ID: <20120916224816.GA3092@swordfish>
In-Reply-To: 1347805051-2889-2-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3701046635402123859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/16/12 23:17), Namhyung Kim wrote:
> The strdup() can return NULL so that the result should be checked.
> =

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---

looks good to me, thank you.

	-ss

>  src/perf/perf.cpp |    5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
> index c8ba7a8..35b4017 100644
> --- a/src/perf/perf.cpp
> +++ b/src/perf/perf.cpp
> @@ -145,6 +145,11 @@ void perf_event::set_event_name(const char *event_na=
me)
>  	if (name)
>  		free(name);
>  	name =3D strdup(event_name);
> +	if (!name) {
> +		fprintf(stderr, "failed to allocate event name\n");
> +		return;
> +	}
> +
>  	char *c;
>  =

>  	c =3D strchr(name, ':');

--===============3701046635402123859==--

