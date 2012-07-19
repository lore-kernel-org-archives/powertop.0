Content-Type: multipart/mixed; boundary="===============0041771172014108101=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH v3] conditionally disable pci if not supported
Date: Thu, 19 Jul 2012 13:12:00 -0700
Message-ID: <50086A10.1050505@linux.intel.com>
In-Reply-To: 1340644453-9135-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0041771172014108101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2012 10:14 AM, Rajagopal Venkat wrote:
> disable pci if not supported by host platform. When
> libpci is not found, define a macro which will be
> used for conditional compilation.
>
> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> ---
>   configure.ac |    5 +++--
>   src/lib.cpp  |   20 ++++++++++++++++++--
>   src/lib.h    |    5 +++++
>   3 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 4da4eea..3cbc7b0 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -48,8 +48,9 @@ AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memm=
ove memset mkdir munmap p
>   AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses =
is required but was not found]), [])
>   =

>   PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
> -	AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is requir=
ed but was not found]), [])
> -])
> +	AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_DEFINE([HAVE_NO_PCI],[1],[D=
efine if pci is not supported]), [])
> +])
> +
>   PKG_CHECK_MODULES([LIBZ], [zlib],[],[
>   	AC_SEARCH_LIBS([deflate], [z], [], AC_MSG_ERROR([zlib is required but =
was not found]), [])
>   ])
> diff --git a/src/lib.cpp b/src/lib.cpp
> index 0f87e48..77e49a2 100644
> --- a/src/lib.cpp
> +++ b/src/lib.cpp
> @@ -35,11 +35,13 @@
>   #include <math.h>
>   #include <stdlib.h>
>   =

> +#include "lib.h"
> +
> +#ifndef HAVE_NO_PCI
>   extern "C" {
>   #include <pci/pci.h>
>   }
> -
> -#include "lib.h"
> +#endif
>   =

>   #include <stdio.h>
>   #include <stdint.h>
> @@ -266,6 +268,7 @@ void format_watts(double W, char *buffer, unsigned in=
t len)
>   }
>   =

>   =

> +#ifndef HAVE_NO_PCI
>   static struct pci_access *pci_access;
>   =

>   char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, in=
t len)
> @@ -290,6 +293,19 @@ void end_pci_access(void)
>   		pci_free_name_list(pci_access);
>   }
>   =

> +#else
> +
> +char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int=
 len)
> +{
> +	return NULL;
> +}
> +
> +void end_pci_access(void)
> +{
> +}
> +
> +#endif /* HAVE_NO_PCI */
> +
>   int utf_ok =3D -1;
>   =

>   =

> diff --git a/src/lib.h b/src/lib.h
> index 588c023..7093b7f 100644
> --- a/src/lib.h
> +++ b/src/lib.h
> @@ -30,6 +30,11 @@
>   #endif
>   #include <stdint.h>
>   =

> +/* Include only for Automake builds */
> +#ifdef HAVE_CONFIG_H
> +#include "config.h"
> +#endif
> +
>   #ifndef DISABLE_I18N
>   #define _(STRING)    gettext(STRING)
>   #else
Thank you your patch has been merged.


--===============0041771172014108101==--

