Content-Type: multipart/mixed; boundary="===============6041987204633130587=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Fri, 09 May 2014 10:30:27 +0300
Message-ID: <20140509073027.GB937@swordfish>
In-Reply-To: 20140508170619.GA17120@jbkonno-beef.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6041987204633130587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/08/14 10:06), Joe Konno wrote:
> On Tue, May 06, 2014 at 05:38:24PM -0700, Kok, Auke-jan H wrote:
> > On Tue, May 6, 2014 at 12:53 AM, Sergey Senozhatsky
> > <sergey.senozhatsky(a)gmail.com> wrote:
> > > On (05/05/14 23:42), Auke Kok wrote:
> > >> ---
> > >>  configure.ac | 3 ++-
> > >>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/configure.ac b/configure.ac
> > >> index baa5faa..5a90fe3 100644
> > >> --- a/configure.ac
> > >> +++ b/configure.ac
> > >> @@ -46,7 +46,8 @@ AC_FUNC_REALLOC
> > >>  AC_FUNC_STRTOD
> > >>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset m=
kdir munmap pow realpath regcomp select setlocale socket sqrt strcasecmp st=
rchr strdup strerror strncasecmp strstr strtoul strtoull])
> > >>
> > >> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncur=
ses is required but was not found]), [])
> > >> +PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LIB=
S"],
> > >                                 ^^^^^^^^^
> > >                                 [ncursesw ncurses]?
> =

> On my gentoo system (x86_64) with ncurses 5.9, after applying this patch,
> -lncurses is linked, but not -lncursesw.
> =

> > =

> > Good question, I actually do not know, and I don't have an ncurses
> > pkgconfig around to see if that works.
> > =

> > Alexandra, can you see if this works with:
> > =

> > +PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurs=
es_LIBS"],
> =

> After hacking in this change, both -lncursesw and -lncurses are linked.
> =

> If I checkout the v2.5 tag, only -lncursesw is linked.
> =

> So, three different linking scenarios. Which one is "correct" for powerto=
p?
> =


ncursesw is preferred.

	-ss

--===============6041987204633130587==--

