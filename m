Content-Type: multipart/mixed; boundary="===============7302744604890847271=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Mon, 05 Nov 2012 13:51:06 +0300
Message-ID: <20121105105106.GC3123@swordfish>
In-Reply-To: 20121105102418.GA3123@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7302744604890847271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


please ignore it. doesn't work.


	-ss

On (11/05/12 13:24), Sergey Senozhatsky wrote:
> Hello,
> sorry for long reply
> =

> Can you please help testing this one?
> =

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> =

> ---
> =

>  configure.ac | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> =

> diff --git a/configure.ac b/configure.ac
> index b8c183f..cf01279 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -54,13 +54,11 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D=
1],[
>   =

>  =

>  has_libnl_ver=3D0
> -PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
> +AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
>  	has_libnl_ver=3D3], [
> -	AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
> -		has_libnl_ver=3D3], [
> -		AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> -			has_libnl_ver=3D2], [
> -			PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])])
> +	AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> +		has_libnl_ver=3D2], [
> +		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])
>  if (test "$has_libnl_ver" -eq 0); then
>  	AC_MSG_ERROR(libnl is required but not found)
>  fi
>=20

--===============7302744604890847271==--

