Content-Type: multipart/mixed; boundary="===============9004299113707093574=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Remove unneded zlib dependency
Date: Wed, 18 Jul 2012 15:02:44 -0700
Message-ID: <50073284.8090005@linux.intel.com>
In-Reply-To: 1342623298-30628-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9004299113707093574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/18/2012 07:54 AM, Igor Zhbanov wrote:
> Remove unneded zlib dependency from configure.ac
> ---
>   configure.ac |    3 ---
>   1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index ff4cdea..4b3d027 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -50,9 +50,6 @@ AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG=
_ERROR([ncurses is requir
>   PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
>   	AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is requi=
red but was not found]), [])
>   ])
> -PKG_CHECK_MODULES([LIBZ], [zlib],[],[
> -	AC_SEARCH_LIBS([deflate], [z], [], AC_MSG_ERROR([zlib is required but w=
as not found]), [])
> -])
>   =

>   has_libnl_ver=3D0
>   PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [

Your patch has been merged
Thank You

--===============9004299113707093574==--

