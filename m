Content-Type: multipart/mixed; boundary="===============4210620563763517826=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Fri, 09 May 2014 15:00:51 -0700
Message-ID: <CABsxX9+00qQGkUc2eNMw4DxFjQ3gzpt7BYkvK3tK5yWbOM-b=A@mail.gmail.com>
In-Reply-To: 1399672743-14111-1-git-send-email-auke-jan.h.kok@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4210620563763517826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ignore this one, somehow I messed up the --amend :(

Auke


On Fri, May 9, 2014 at 2:59 PM, Auke Kok <auke-jan.h.kok(a)intel.com> wrote:
> v2 - also link against ncursesw.
> ---
>  configure.ac | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/configure.ac b/configure.ac
> index baa5faa..5a90fe3 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -46,7 +46,8 @@ AC_FUNC_REALLOC
>  AC_FUNC_STRTOD
>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir =
munmap pow realpath regcomp select setlocale socket sqrt strcasecmp strchr =
strdup strerror strncasecmp strstr strtoul strtoull])
>
> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses i=
s required but was not found]), [])
> +PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LIBS"],
> +       AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([nc=
urses is required but was not found]), []))
>
>  has_libpci=3D0
>  PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
> --
> 1.7.11.2
>

--===============4210620563763517826==--

