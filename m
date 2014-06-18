Content-Type: multipart/mixed; boundary="===============6599130359947293883=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Add csstosh.sh to EXTRA_DIST
Date: Wed, 18 Jun 2014 12:26:58 -0700
Message-ID: <53110.10.24.2.0.1403119618.squirrel@linux.intel.com>
In-Reply-To: 1402661259-14839-1-git-send-email-tklauser@distanz.ch
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6599130359947293883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Since css.h is in CLEANFILES, `make clean' will delete it and thus
> cause the build to fail afterwards due to a missing csstoh.sh to
> regenerate it. Fix this by adding csstoh.sh to EXTRA_DIST which will
> cause it to be included in the tarball.
>
> Signed-off-by: Tobias Klauser <tklauser(a)distanz.ch>
> ---
>  src/Makefile.am |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 9d053a4..6886388 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -52,3 +52,4 @@ CLEANFILES =3D css.h
>  css.h: powertop.css
>  	$(SHELL) ${srcdir}/csstoh.sh ${srcdir}/powertop.css css.h
>
> +EXTRA_DIST =3D ${srcdir}/csstoh.sh
> --
> 1.7.9.5
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Hi Tobias,

I tested your patch in two boxes, it did the trick.

Thank you for fixing the bug.

Alexandra.

--===============6599130359947293883==--

