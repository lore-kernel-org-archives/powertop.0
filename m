Content-Type: multipart/mixed; boundary="===============5411793011501905696=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Tue, 06 May 2014 10:53:10 +0300
Message-ID: <20140506075310.GA1127@swordfish>
In-Reply-To: 1399358531-17553-1-git-send-email-auke-jan.h.kok@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5411793011501905696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/05/14 23:42), Auke Kok wrote:
> ---
>  configure.ac | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/configure.ac b/configure.ac
> index baa5faa..5a90fe3 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -46,7 +46,8 @@ AC_FUNC_REALLOC
>  AC_FUNC_STRTOD
>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir =
munmap pow realpath regcomp select setlocale socket sqrt strcasecmp strchr =
strdup strerror strncasecmp strstr strtoul strtoull])
>  =

> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses i=
s required but was not found]), [])
> +PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LIBS"],
				^^^^^^^^^
				[ncursesw ncurses]?

	-ss

> +	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses =
is required but was not found]), []))
>  =

>  has_libpci=3D0
>  PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
> -- =

> 1.7.11.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============5411793011501905696==--

