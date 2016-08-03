Content-Type: multipart/mixed; boundary="===============3235964489273195659=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Checking whether librt is needed for
 clock_gettime().
Date: Wed, 03 Aug 2016 08:31:15 -0700
Message-ID: <20160803083115.44b00021@jbkonno-basil.jf.intel.com>
In-Reply-To: 20160802032949.GA18501@obsidian
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3235964489273195659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Aug 2016 06:29:53 +0300
eSyr <evgsyr(a)gmail.com> wrote:

> Commit ef79e28 introduced usage of clock_gettime() function, which,
> unfortunately, breaks build on some systems, namely Debian Wheezy, due
> to the fact it should be linked with librt. This commit adds configure
> check whether additional library is needed in order to use
> aforementioned function.
> =

> * configure.ac: using AC_SEARCH_LIBS() for checking whether librt is
>   needed for clock_gettime().
> ---
>  configure.ac |    2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/configure.ac b/configure.ac
> index 088d0de..7573d84 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -106,6 +106,8 @@ AC_CHECK_FUNCS([ \
>  	strtoull \
>  ])
>  =

> +AC_SEARCH_LIBS([clock_gettime], [rt])
> +
>  PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses=
_LIBS"], [
>  	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
>  		AC_MSG_ERROR([ncurses is required but was not found])

You have my Acked-by. Pushed, and thanks for your contribution!

commit 25558463a185e8c606bd0a341e18d0996ade5f4e
Author:     eSyr <evgsyr(a)gmail.com>
AuthorDate: Tue Aug 2 06:29:53 2016 +0300
Commit:     Joe Konno <joe.konno(a)intel.com>
CommitDate: Wed Aug 3 08:26:38 2016 -0700

    Checking whether librt is needed for clock_gettime().
    =

    Commit ef79e28 introduced usage of clock_gettime() function, which,
    unfortunately, breaks build on some systems, namely Debian Wheezy, due
    to the fact it should be linked with librt. This commit adds configure
    check whether additional library is needed in order to use
    aforementioned function.
    =

    * configure.ac: using AC_SEARCH_LIBS() for checking whether librt is
      needed for clock_gettime().
    =

    Acked-by: Joe Konno <joe.konno(a)intel.com>

--===============3235964489273195659==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4yMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKWG9nNURBQW9KRUkySVI5VXZTcXBtbzBNUUFNYVNQY0w5
VUZuOEdFNUs4Tm1rM1RPOQp3d2t6V3h1QjVYVkZCc2IvbndCSlNpeGNvaWRlSUpqSG10cWE5eGJj
cC9nSCs5ZnA5TzlIOTdmTlVvNHQyZ29KCklqdzhacXpHZHVndHJwS0dYUHNIaGdNZFpjVHN1VXBF
T1A4alcyalRTS2cxTXFTcDBiazhFVWRGYlFiYzNrQlcKemVlMURvVFBJZmw4RVgxeHdnOFgwRUZr
NEMrUFA4L3p6RW9GOURnaG9OUS9YV1BiRG5xK2Mxbld5aUlDci9UWApBbjhwaGZ6djZyZ2I5dmdL
ajB5NXJ0bUluMjdnMVZ5L3lqY0p4dkxPcnhYdklXSnlhekp6SHBlT1d1VW1URkZVCjZkdjNtcElX
T2hpMkZYV2FQSXJSajh3KzRNcDJKZVlPU2FLUTR6UnFsZ2dlZnl3aERXdnlWNlB3WHNUY3ZjOGwK
OXhOU05GSUJSenpMaTR2bXdBYkg5L3RNNGZzS1dDMGN4T2V4OU9zUG5XSU9ST3NZQUtHWDJrdDZ4
amNxS29hcwppb2EvTTlHZzFpaVFsQnFWZXY4OWpyakpneEprVFFDbGJqYmgxRmk2QkQ2WExQcVhN
dmNVTm5Odno4WU03R0MyCjZwUk1OeStKMHFwcG0yY25nVjRGWGN5a3VseFI1dmVRd2Q4NVd1T24r
cWM0anRETGNzSWpJUWJld2sxVklEd0YKem9Ra2hxcWduLzZzYnlEbHlxdldhQnl5US9QMHZkcXc1
Q3hwbDNvK1U1S1VTQUJTQTNod2pHNWt4bVhuZWFnSQo4cmFkTnZDSkJLdFhOVWdCK1AvUFFlUjl4
TW9qQXNIZVlvTlVCbFZsYVBUaU9Yb2sxeW5JcVdyQ1p3SE00ZmFICkpTUDBta3ExVDRlQlVSakdE
RGFpCj1tbW56Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============3235964489273195659==--

