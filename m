Content-Type: multipart/mixed; boundary="===============2749001778622846205=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH] event-parse: Add compatibility for non GNU
 strerror_r
Date: Wed, 05 Jun 2019 08:53:04 +0200
Message-ID: <20190605065304.GA18527@noemi.bahnhof.se>
In-Reply-To: 20190604190447.8561-1-rosenp@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2749001778622846205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 12:04:47PM -0700, Rosen Penev wrote:
> Needed for libraries like musl that do not implement the GNU variant.

This patch seems curious.

> Signed-off-by: Rosen Penev <rosenp(a)gmail.com>
> ---
>  traceevent/event-parse.c | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/traceevent/event-parse.c b/traceevent/event-parse.c
> index 5a717a0..1f7eb80 100644
> --- a/traceevent/event-parse.c
> +++ b/traceevent/event-parse.c
> @@ -5121,12 +5121,17 @@ int pevent_strerror(struct pevent *pevent __maybe=
_unused,
>  	const char *msg;
>  =

>  	if (errnum >=3D 0) {
> +#if defined(__GLIBC__)
>  		msg =3D strerror_r(errnum, buf, buflen);
>  		if (msg !=3D buf) {
>  			size_t len =3D strlen(msg);
>  			memcpy(buf, msg, min(buflen - 1, len));
>  			*(buf + min(buflen - 1, len)) =3D '\0';
>  		}
> +#else
> +		if (strerror_r(errnum, buf, buflen))
> +			snprintf(buf, buflen, "errnum %i", errnum);

Was

if (a human readable response is returned from strerror_r)
  clobber it with a numeric version of the error

really what you wanted to achieve?

I would rather expect something like

	if (errnum >=3D 0) {
		msg =3D strerror_r(errnum, buf, buflen);
#if defined(__GLIBC__)
		if (msg !=3D buf)
			strlcpy(buf, msg, buflen);
	#endif
	}

where the #ifdef ends up as a pure optimization if strerror_r is the XSI ve=
rsion.

/MF

> +#endif
>  		return 0;
>  	}
>  =

> -- =

> 2.17.1
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============2749001778622846205==--

