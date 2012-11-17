Content-Type: multipart/mixed; boundary="===============4459577931682927465=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Use PACKAGE_VERSION for POWERTOP_VERSION
Date: Sat, 17 Nov 2012 19:03:00 +0300
Message-ID: <20121117160300.GA2943@swordfish>
In-Reply-To: 1353166967-24095-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4459577931682927465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/18/12 00:42), Namhyung Kim wrote:
> It was missed to update POWERTOP_VERSION macro so that the
> new v2.2 release still shows v2.1 string on the header of
> ncurses window.  Convert to use PACKAGE_VERSION macro which
> set by autotools to the AC_INIT version so that it cannot
> be missed anymore.
> =

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---


looks good to me, thanks.

	-ss


>  src/lib.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/src/lib.h b/src/lib.h
> index 8cf4632..209421a 100644
> --- a/src/lib.h
> +++ b/src/lib.h
> @@ -35,8 +35,8 @@
>  =

>  #define _(STRING)    gettext(STRING)
>  =

> -#define POWERTOP_VERSION "v2.1"
> -#define POWERTOP_SHORT_VERSION "2.1"
> +#define POWERTOP_VERSION "v"PACKAGE_VERSION
> +#define POWERTOP_SHORT_VERSION PACKAGE_VERSION
>  =

>  =

>  extern int get_max_cpu(void);
> -- =

> 1.7.9.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============4459577931682927465==--

