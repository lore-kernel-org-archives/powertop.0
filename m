Content-Type: multipart/mixed; boundary="===============8201539481291868948=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] configure: rework libnl detection and fix
 libnl-2 case (v2)
Date: Tue, 13 Nov 2012 11:16:02 -0800
Message-ID: <50A29C72.6070705@linux.intel.com>
In-Reply-To: 20121113154841.GD2621@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8201539481291868948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/13/2012 07:48 AM, Sergey Senozhatsky wrote:
> Rework libnl detection.
>
> PKG_CHECK_MODULES macro appends FOO_CFLAGS and FOO_LIBS flags
>
> Example:
> LIBNL_CFLAGS =3D -I/usr/include/libnl3
> LIBNL_LIBS =3D -lnl-genl-3 -lnl-3
>
> while AC_SEARCH_LIBS only prepends -llibrary to LIBS, so AC_SEARCH_LIBS
> is not helpful.
>
> Use pkg-config PC file names to search for minimum package versions:
> libnl 3.+ -- libnl-3.0.pc
> libnl 2.+ -- libnl-2.0.pc
> libnl 1.+ -- libnl-1.0.pc
>
> Patch also changes $has_libnl_ver =3D=3D 0 error message and suppresses
> failed PKG_CHECK_MODULES output.
>
> Austin pointed out that libnl-2.0 provide only libnl-2.0.pc pkg-config
> file, while libnl-3 has at least 5 of them (for every `so').
> This is why we check libnl-3.0.pc and libnl-genl-3.0.pc in libnl-3 case.
>
> Many thanks to Austin Zhang for help.
> v2: Namhyung Kim reported that libnl-1.0.pc on Ubuntu is named libnl-1.pc.
>
> Reported-and-tested-by: Austin Zhang <zhang.austin(a)gmail.com>
> Tested-by: Namhyung Kim <namhyung(a)gmail.com>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
> ---
>
>   configure.ac | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> Sergey Senozhatsky
>
> diff --git a/configure.ac b/configure.ac
> index b8c183f..02952b3 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -54,15 +54,14 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D=
1],[
>    =

>   =

>   has_libnl_ver=3D0
> -PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
> -	has_libnl_ver=3D3], [
> -	AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
> -		has_libnl_ver=3D3], [
> -		AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> -			has_libnl_ver=3D2], [
> -			PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])])
> +# libnl-2 provides only libnl-2.0.pc file, so we check for separate libn=
l-genl-3.0.pc
> +# pkg-config file just for libnl-3.0 case.
> +#
> +PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0],=
 [has_libnl_ver=3D3], [
> +	PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=3D2], [
> +		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [has_libnl_=
ver=3D0])])])
>   if (test "$has_libnl_ver" -eq 0); then
> -	AC_MSG_ERROR(libnl is required but not found)
> +	AC_MSG_ERROR(libnl and libnl-genl are required but were not found)
>   fi
>   if (test "$has_libnl_ver" -gt 1); then
>   	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher=
])
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
this patch has been merged as it is signed off by Sergey
Thanks,
Chris


--===============8201539481291868948==--

