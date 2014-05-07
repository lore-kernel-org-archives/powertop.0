Content-Type: multipart/mixed; boundary="===============8539555611058939563=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Wed, 07 May 2014 12:17:43 -0700
Message-ID: <60893.10.24.20.10.1399490263.squirrel@linux.intel.com>
In-Reply-To: CABsxX9LV5E9w6eNKtAmoD4kUm1rryCgwDiQKiCN17MDeqxByyA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8539555611058939563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On Tue, May 6, 2014 at 12:53 AM, Sergey Senozhatsky
> <sergey.senozhatsky(a)gmail.com> wrote:
>> On (05/05/14 23:42), Auke Kok wrote:
>>> ---
>>>  configure.ac | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/configure.ac b/configure.ac
>>> index baa5faa..5a90fe3 100644
>>> --- a/configure.ac
>>> +++ b/configure.ac
>>> @@ -46,7 +46,8 @@ AC_FUNC_REALLOC
>>>  AC_FUNC_STRTOD
>>>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset
>>> mkdir munmap pow realpath regcomp select setlocale socket sqrt
>>> strcasecmp strchr strdup strerror strncasecmp strstr strtoul
>>> strtoull])
>>>
>>> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses
>>> is required but was not found]), [])
>>> +PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LIBS"],
>>                                 ^^^^^^^^^
>>                                 [ncursesw ncurses]?
>
> Good question, I actually do not know, and I don't have an ncurses
> pkgconfig around to see if that works.
>
> Alexandra, can you see if this works with:
>
> +PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS
> $ncurses_LIBS"],
>
> That needs to be tested by someone with a new ncurses.
>
> Auke
>

I'm on training this week.  I will be able to test at the end of the day
after my class today.

Thank you,
Alexandra.

--===============8539555611058939563==--

