Content-Type: multipart/mixed; boundary="===============6399323758380407760=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Fri, 09 May 2014 14:59:46 -0700
Message-ID: <CABsxX9L4SEXXhoRVCqCD19rBeBNJ=-nvMcj1Ed_oLktmc_UfGA@mail.gmail.com>
In-Reply-To: 20140509073027.GB937@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6399323758380407760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2014 at 12:30 AM, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> On (05/08/14 10:06), Joe Konno wrote:
>> On Tue, May 06, 2014 at 05:38:24PM -0700, Kok, Auke-jan H wrote:
>> > On Tue, May 6, 2014 at 12:53 AM, Sergey Senozhatsky
>> > <sergey.senozhatsky(a)gmail.com> wrote:
>> > > On (05/05/14 23:42), Auke Kok wrote:
>> > >> ---
>> > >>  configure.ac | 3 ++-
>> > >>  1 file changed, 2 insertions(+), 1 deletion(-)
>> > >>
>> > >> diff --git a/configure.ac b/configure.ac
>> > >> index baa5faa..5a90fe3 100644
>> > >> --- a/configure.ac
>> > >> +++ b/configure.ac
>> > >> @@ -46,7 +46,8 @@ AC_FUNC_REALLOC
>> > >>  AC_FUNC_STRTOD
>> > >>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset =
mkdir munmap pow realpath regcomp select setlocale socket sqrt strcasecmp s=
trchr strdup strerror strncasecmp strstr strtoul strtoull])
>> > >>
>> > >> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncu=
rses is required but was not found]), [])
>> > >> +PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LI=
BS"],
>> > >                                 ^^^^^^^^^
>> > >                                 [ncursesw ncurses]?
>>
>> On my gentoo system (x86_64) with ncurses 5.9, after applying this patch,
>> -lncurses is linked, but not -lncursesw.
>>
>> >
>> > Good question, I actually do not know, and I don't have an ncurses
>> > pkgconfig around to see if that works.
>> >
>> > Alexandra, can you see if this works with:
>> >
>> > +PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncur=
ses_LIBS"],
>>
>> After hacking in this change, both -lncursesw and -lncurses are linked.
>>
>> If I checkout the v2.5 tag, only -lncursesw is linked.
>>
>> So, three different linking scenarios. Which one is "correct" for powert=
op?
>>
>
> ncursesw is preferred.

yup. I just sent a new version, which should be OK to merge for Alex.

Cheers,

Auke

--===============6399323758380407760==--

