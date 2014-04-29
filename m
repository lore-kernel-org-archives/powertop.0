Content-Type: multipart/mixed; boundary="===============5201933936777518713=="
MIME-Version: 1.0
From: Rick "Zero_Chaos" Farina <zerochaos at gentoo.org>
Subject: Re: [Powertop] [PATCH] use pkg-config to find ncurses
Date: Tue, 29 Apr 2014 10:19:39 -0400
Message-ID: <535FB4FB.3010409@gentoo.org>
In-Reply-To: 56235.10.254.3.215.1398470335.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5201933936777518713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/25/2014 07:58 PM, Alexandra Yates wrote:
> Hi Zero,
> =

> Based on Sergey's feedback can you send a revision for your patches?
> =

> thank you,
> Alex
> On 04/16/2014 03:54 PM, Sergey Senozhatsky wrote:
>>>> On (04/16/14 12:41), Kok, Auke-jan H wrote:
>>>>> ncurses by itself does not provide a pkgconfig check, it is however
>>>>> manually added by various distributions, but not all of them.
>>>>>
>>>>> So, the patch below breaks building powertop for those distributions.
>>>>>
>>>>
>>>> yes. good point. apparently ncurses provides pkg-config files these
>>>> days.
>>>> but there still may be distributions that use older ncurses versions.
> =

> =

> pkgconfig support was added on 20090103 according to the changelog here:
> http://invisible-island.net/ncurses/NEWS.html.
> =

> Is is really a major concern to to require a version of ncurses released
> within the last 5 years?

I believe these comments stand for themselves.  If a user isn't on a
modern ncurses I fail to see why they would be on a modern powertop
either.  Supporting things >5 years old building against modern things
is past my point of caring.  If someone else would like to amend the
patch to fall back to hardcoded libs that's fine, but I'm not going to
invest my time in this.  Sadly, my autotools skills are unimpressive and
there is no justification for the amount of time this would take me.

Accept the patch, don't accept the patch, modify the patch as you see
fit, whatever you like.

Thanks,
Zero
> =

> -Zero
>>>>
>>>> 	-ss
>>>>
>>>>> I suggest that if you really want to make it use pkg-config, you write
>>>>> it in such a way that if pkg-config checking fails, it will still
>>>>> attempt to search for the appropriate libs instead.
>>>>>
>>>>> Auke
>>>>>
>>>>>
>>>>>
>>>>> On Wed, Apr 16, 2014 at 8:20 AM, Rick "Zero_Chaos" Farina
>>>>> <zerochaos(a)gentoo.org> wrote:
>>>> Original bug report: https://bugs.gentoo.org/show_bug.cgi?id=3D486124
>>>>
>>>> Depending on how ncurses is built, it may require different information
>>>> passed to the linker.  Use pkg-config to detect the correct informatio=
n:
>>>>
>>>> --- a/configure.ac
>>>> +++ b/configure.ac
>>>> @@ -46,7 +46,7 @@
>>>>  AC_FUNC_STRTOD
>>>>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkd=
ir
>>>> munmap pow realpath regcomp select setlocale socket sqrt strcasecmp
>>>> strchr strdup strerror strncasecmp strstr strtoul strtoull])
>>>>
>>>> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses
>>>> is required but was not found]), [])
>>>> +PKG_CHECK_MODULES(ncurses, ncurses, [LIBS=3D"$LIBS $ncurses_LIBS"],
>>>> AC_MSG_ERROR([ncurses is required but was not found]))
>>>>
>>>>  has_libpci=3D0
>>>>  PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
>>>>
>>>>
>>>> Original patch:
>>>> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-power/powe=
rtop/files/powertop-2.4-tinfo.patch?revision=3D1.1&view=3Dmarkup
>>>>
>>>> Please include this fix.
>>>>
>>>> thanks,
>>>> Zero
>>>>>> _______________________________________________
>>>>>> PowerTop mailing list
>>>>>> PowerTop(a)lists.01.org
>>>>>> https://lists.01.org/mailman/listinfo/powertop
>>>>> _______________________________________________
>>>>> PowerTop mailing list
>>>>> PowerTop(a)lists.01.org
>>>>> https://lists.01.org/mailman/listinfo/powertop
>>>>>
>>>>
> =

>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>
> =

> =

> Thank you,
> Alexandra.
> =


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTX7T7AAoJEKXdFCfdEflKMpwP/A3ajGdX9nzIN9qelCT6B1Zh
EfwGI+aNQ+ae9GP7BMYx9Dzirrg7g///cTv3oXxnSpX4XiQIj7oozwLOF1DgEcs8
XdmoTSONx6gEiGlYU60jrMKokml+bJoABxM4R6tBMYM2XUD+Zx28TdM76SCx2cGq
CiWI6dvK7x5afyLbrjRtNvkBQ2k5qMej4s/4fDC/yr1XNvaLxEq4RQyohF+5dAk8
T9rD6Yq0B8EvyrXT09TD03cNm/GH+I4Fzuo/h7Ivun10TM40nsXHuNq67LPhYgVa
ox28MsyRcaRnHyoPzuuMOhz+/QIeUgDHOu1lTFBDNcJgCuox+OPf1O9flw/HTEZ/
+YQewdYIgjIiv9tVjwdvXlkr/JSgCl0CdjaJT6MN+VhXz2aMdyQh9TV5Ph8+KBIH
3+R3pUGKh+mTEyJ5mwBXMsL9jqQa8TTwFp9OGRjmnqyvyqRJ7z4CRQrnLRfS+D99
5FaZkS2NL/5XDnLAZcNqrRkV4w+UFjuJK5yrZxiYWXgX1n6IqX8eY8Q66SMfBRMG
6XKtGD53ku7DV6H+/dlfzOZTD8B+emOJQXprT5O9/QPX1R1bbpC3DSEzMTadtRPi
CVhMEPfdY/UllH+pIAVNP3ORo4vgRJwOfZNhcqLke7sDrSjqTa5KnAbjb+4Qb5nK
nBQKYIQfN92Mb7fxF3ve
=3DdGdt
-----END PGP SIGNATURE-----

--===============5201933936777518713==--

