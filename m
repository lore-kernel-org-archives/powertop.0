Content-Type: multipart/mixed; boundary="===============1055860466772839081=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] use pkg-config to find ncurses
Date: Wed, 16 Apr 2014 12:41:29 -0700
Message-ID: <CABsxX9LT9hHOcuHDVDtbzMw94mexBFwHyZ=uWNZM5PbBrU5bMg@mail.gmail.com>
In-Reply-To: 534E9FB6.6080402@gentoo.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1055860466772839081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ncurses by itself does not provide a pkgconfig check, it is however
manually added by various distributions, but not all of them.

So, the patch below breaks building powertop for those distributions.

I suggest that if you really want to make it use pkg-config, you write
it in such a way that if pkg-config checking fails, it will still
attempt to search for the appropriate libs instead.

Auke



On Wed, Apr 16, 2014 at 8:20 AM, Rick "Zero_Chaos" Farina
<zerochaos(a)gentoo.org> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Original bug report: https://bugs.gentoo.org/show_bug.cgi?id=3D486124
>
> Depending on how ncurses is built, it may require different information
> passed to the linker.  Use pkg-config to detect the correct information:
>
> - --- a/configure.ac
> +++ b/configure.ac
> @@ -46,7 +46,7 @@
>  AC_FUNC_STRTOD
>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir
> munmap pow realpath regcomp select setlocale socket sqrt strcasecmp
> strchr strdup strerror strncasecmp strstr strtoul strtoull])
>
> - -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses
> is required but was not found]), [])
> +PKG_CHECK_MODULES(ncurses, ncurses, [LIBS=3D"$LIBS $ncurses_LIBS"],
> AC_MSG_ERROR([ncurses is required but was not found]))
>
>  has_libpci=3D0
>  PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
>
>
> Original patch:
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-power/powerto=
p/files/powertop-2.4-tinfo.patch?revision=3D1.1&view=3Dmarkup
>
> Please include this fix.
>
> thanks,
> Zero
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.22 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
>
> iQIcBAEBAgAGBQJTTp+2AAoJEKXdFCfdEflKJVkP/19iu4BWlFZ5TV0XVKvi0lm9
> DsIK9gkN+Kpa5F3QjTgDOCA7K72VdTGCv8os3A0KHPocrQ55tNb0lyILJYs6/rdL
> YSCMrd1TjacVhZujwTjia99BA/EwkPGpeogKdKuzHfRI6EYk6QFDaeljG11Jjds+
> VQ/sW3Fbe63/Sw6jvvHYTi0wE2hu30ot9Y+GQXkaNfJMpvk16S2GevKr+PG6wAqF
> gL1hLG7b5NNTgZxNLZJMDMIFZcUA/VMBUPZta5KyGpzjrMcVcZkNZ3YegwkwIJQ/
> Dq0xA/HhXUSgCIcp2cTuBF2YZrKE/linFmFHyKJ0NEvbaEpAsPLkhzpz3E8d+b++
> t8ceoTAYYRGpJU9fGNLcHCaHmREtzQMJn7hTT85Rbz0+duohaj6xqkKTemlPykTu
> ZDM+48oUXEe+iwcfp4ctbJILwZaw+IIzA2GhtR3QATjfQZe4lXczHHt2VW50toIb
> hFaKrg/uYqHe7KpHq/+rdtjNhOsP7Ckaq+USTQ7/AmoFLB6Bt+3NM9sIHdyeWUfG
> XXnOKPPpPSOZXFE/mKodqI0tOP0cngbMuLr60axELZi0gxiUiDVxKuRAOlukVRSY
> RQFKRIucrEeR/uwDH/sbq1xQ0dnE0JdJs4VO8K40KkSskE7eHOoBIJ8c3kL02Sfm
> c6KasduRgzZfWUo4plC1
> =3Dyt9+
> -----END PGP SIGNATURE-----
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============1055860466772839081==--

