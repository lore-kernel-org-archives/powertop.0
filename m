Content-Type: multipart/mixed; boundary="===============8109285576711019034=="
MIME-Version: 1.0
From: Rick "Zero_Chaos" Farina <zerochaos at gentoo.org>
Subject: Re: [Powertop] [PATCH] use pkg-config to find ncurses
Date: Wed, 16 Apr 2014 17:03:49 -0400
Message-ID: <534EF035.8040802@gentoo.org>
In-Reply-To: 20140416195442.GB936@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8109285576711019034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/16/2014 03:54 PM, Sergey Senozhatsky wrote:
> On (04/16/14 12:41), Kok, Auke-jan H wrote:
>> ncurses by itself does not provide a pkgconfig check, it is however
>> manually added by various distributions, but not all of them.
>>
>> So, the patch below breaks building powertop for those distributions.
>>
> =

> yes. good point. apparently ncurses provides pkg-config files these days.
> but there still may be distributions that use older ncurses versions.


pkgconfig support was added on 20090103 according to the changelog here:
http://invisible-island.net/ncurses/NEWS.html.

Is is really a major concern to to require a version of ncurses released
within the last 5 years?

- -Zero
> =

> 	-ss
> =

>> I suggest that if you really want to make it use pkg-config, you write
>> it in such a way that if pkg-config checking fails, it will still
>> attempt to search for the appropriate libs instead.
>>
>> Auke
>>
>>
>>
>> On Wed, Apr 16, 2014 at 8:20 AM, Rick "Zero_Chaos" Farina
>> <zerochaos(a)gentoo.org> wrote:
> Original bug report: https://bugs.gentoo.org/show_bug.cgi?id=3D486124
> =

> Depending on how ncurses is built, it may require different information
> passed to the linker.  Use pkg-config to detect the correct information:
> =

> --- a/configure.ac
> +++ b/configure.ac
> @@ -46,7 +46,7 @@
>  AC_FUNC_STRTOD
>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir
> munmap pow realpath regcomp select setlocale socket sqrt strcasecmp
> strchr strdup strerror strncasecmp strstr strtoul strtoull])
> =

> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses
> is required but was not found]), [])
> +PKG_CHECK_MODULES(ncurses, ncurses, [LIBS=3D"$LIBS $ncurses_LIBS"],
> AC_MSG_ERROR([ncurses is required but was not found]))
> =

>  has_libpci=3D0
>  PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
> =

> =

> Original patch:
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-power/powerto=
p/files/powertop-2.4-tinfo.patch?revision=3D1.1&view=3Dmarkup
> =

> Please include this fix.
> =

> thanks,
> Zero
>>> _______________________________________________
>>> PowerTop mailing list
>>> PowerTop(a)lists.01.org
>>> https://lists.01.org/mailman/listinfo/powertop
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>
> =


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTTvA1AAoJEKXdFCfdEflK/VYP/2D9II4S6BMw/1flPtHfj5Yn
2L+iy9KpIbRAaV0n6XI4/0ppGM+21xXbw372z56ne/MBKqJD0TCOF2AyHhD/178U
oNkTjAt0aJuToO/IDZAR5Q4oD8KXQAO67lsH+VHkuV3R93hpxQ49COaGnPW62TvR
I3nBRJMiqN6sixQa5M5wT2OlQz9mzs7GxEt2VeRXNHtoLAvPScJYM6p1v1An/Vcz
a6YvLmKB0S5t5m3a8Nc7EAvcqJNgnKKtMBgfv8d6zi5ueFtdn4TxAKxqXZeNpgiV
uY/lKa1Ycz924ftd+iLTAf6q3H6PVY7GJnYbRXZ7niz0PqXtExgOmZ6JonZIhdBC
+TX161fjRQYjTf6JjwMYzKTc4Vx9lUjX4f/0jsPDmC/Wu0NcDL8GbBqP45AYIktX
I1uo6vDqglxg6vQDL3OrL+6oolDITfJaSTFFZ7QezdyA9uflCR9uQaCbnJ7zKCF/
acD1Vh9gabRQw2Mq1n9ATB9mpuFUESclVz6Xs/PCiWCTLM5XyIhfUU/RCeOEjG2j
ooEx999sAlrdjK5WH+chL1A/yQyamcfuH8cQmOO2p7o70Z6++/u18OdwbCRkgioe
87LaoT2VRwNAcQhR9X7XVYqGC8CbCtCISDPzEmH+AcCy8rPBNb3i9S7SNDiaVOAo
vc7kO3EajD6QYFp6aH2K
=3Do+vQ
-----END PGP SIGNATURE-----

--===============8109285576711019034==--

