Content-Type: multipart/mixed; boundary="===============7448394788241037993=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Thu, 08 May 2014 09:14:43 -0700
Message-ID: <60402.10.24.17.174.1399565683.squirrel@linux.intel.com>
In-Reply-To: 60893.10.24.20.10.1399490263.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7448394788241037993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>> On Tue, May 6, 2014 at 12:53 AM, Sergey Senozhatsky
>> <sergey.senozhatsky(a)gmail.com> wrote:
>>> On (05/05/14 23:42), Auke Kok wrote:
>>>> ---
>>>>  configure.ac | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/configure.ac b/configure.ac
>>>> index baa5faa..5a90fe3 100644
>>>> --- a/configure.ac
>>>> +++ b/configure.ac
>>>> @@ -46,7 +46,8 @@ AC_FUNC_REALLOC
>>>>  AC_FUNC_STRTOD
>>>>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset
>>>> mkdir munmap pow realpath regcomp select setlocale socket sqrt
>>>> strcasecmp strchr strdup strerror strncasecmp strstr strtoul
>>>> strtoull])
>>>>
>>>> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [],
>>>> AC_MSG_ERROR([ncurses
>>>> is required but was not found]), [])
>>>> +PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LIBS"=
],
>>>                                 ^^^^^^^^^
>>>                                 [ncursesw ncurses]?
>>
>> Good question, I actually do not know, and I don't have an ncurses
>> pkgconfig around to see if that works.
>>
>> Alexandra, can you see if this works with:
>>
>> +PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS
>> $ncurses_LIBS"],
>>
>> That needs to be tested by someone with a new ncurses.
>>
>> Auke
>>
>
> I'm on training this week.  I will be able to test at the end of the day
> after my class today.
>
> Thank you,
> Alexandra.
>
I tested in ubuntu I'm running libncurses5 powertop configured and
installed with out issues.

Looking for someone to test on chrome.

Thank you,
Alexandra.

--===============7448394788241037993==--

