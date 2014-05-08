Content-Type: multipart/mixed; boundary="===============6648024792300928704=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Thu, 08 May 2014 10:06:19 -0700
Message-ID: <20140508170619.GA17120@jbkonno-beef.jf.intel.com>
In-Reply-To: CABsxX9LV5E9w6eNKtAmoD4kUm1rryCgwDiQKiCN17MDeqxByyA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6648024792300928704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 05:38:24PM -0700, Kok, Auke-jan H wrote:
> On Tue, May 6, 2014 at 12:53 AM, Sergey Senozhatsky
> <sergey.senozhatsky(a)gmail.com> wrote:
> > On (05/05/14 23:42), Auke Kok wrote:
> >> ---
> >>  configure.ac | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/configure.ac b/configure.ac
> >> index baa5faa..5a90fe3 100644
> >> --- a/configure.ac
> >> +++ b/configure.ac
> >> @@ -46,7 +46,8 @@ AC_FUNC_REALLOC
> >>  AC_FUNC_STRTOD
> >>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkd=
ir munmap pow realpath regcomp select setlocale socket sqrt strcasecmp strc=
hr strdup strerror strncasecmp strstr strtoul strtoull])
> >>
> >> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurse=
s is required but was not found]), [])
> >> +PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LIBS"=
],
> >                                 ^^^^^^^^^
> >                                 [ncursesw ncurses]?

On my gentoo system (x86_64) with ncurses 5.9, after applying this patch,
-lncurses is linked, but not -lncursesw.

> =

> Good question, I actually do not know, and I don't have an ncurses
> pkgconfig around to see if that works.
> =

> Alexandra, can you see if this works with:
> =

> +PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses=
_LIBS"],

After hacking in this change, both -lncursesw and -lncurses are linked.

If I checkout the v2.5 tag, only -lncursesw is linked.

So, three different linking scenarios. Which one is "correct" for powertop?

--===============6648024792300928704==--

