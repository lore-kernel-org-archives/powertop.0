Content-Type: multipart/mixed; boundary="===============0501267359242610211=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] configure: First try to use libnl-3,
 then libnl-2, then libnl-1
Date: Mon, 30 Jul 2012 09:08:54 -0700
Message-ID: <5016B196.6000505@linux.intel.com>
In-Reply-To: 1343656511-25137-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0501267359242610211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/30/2012 06:55 AM, Igor Zhbanov wrote:
> Change search order for libnl in configure.ac:
> first try to use libnl-3, then libnl-2, then libnl-1.
> ---
>   configure.ac |   13 +++++++------
>   1 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 3f5775f..552626c 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -53,12 +53,13 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D=
1],[
>    =

>   =

>   has_libnl_ver=3D0
> -PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
> -	AC_SEARCH_LIBS([nl_socket_alloc], [nl], [has_libnl_ver=3D2], [
> -		     PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [has_libnl=
_ver=3D3],
> -				       [AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [has_lib=
nl_ver=3D3], [], [])])
> -	], [])
> -])
> +PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
> +	has_libnl_ver=3D3], [
> +	AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
> +		has_libnl_ver=3D3], [
> +		AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> +			has_libnl_ver=3D2], [
> +			PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])])
>   if (test "$has_libnl_ver" -eq 0); then
>   	AC_MSG_ERROR(libnl is required but not found)
>   fi
Patch merged
Thank You

--===============0501267359242610211==--

