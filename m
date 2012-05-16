Content-Type: multipart/mixed; boundary="===============6908987112448071025=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [RFC 2/2] build: use pkg-config for looking for
 netlink libraries
Date: Wed, 16 May 2012 09:31:34 -0700
Message-ID: <4FB3D666.7080907@linux.intel.com>
In-Reply-To: 1337140056-4037-2-git-send-email-vcgomes@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6908987112448071025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/15/2012 08:47 PM, Vinicius Costa Gomes wrote:
> Also, adds support for using libnl-3.0.
> ---
>
> I guess that it looks nicer, but it is more intrusive.
>
> BTW, I wasn't able to test in the case with just libnl-2.0.
>
>   configure.ac    |   29 +++++++++++++++++------------
>   src/Makefile.am |    6 +++---
>   src/tuning/iw.c |    2 +-
>   src/tuning/iw.h |    2 +-
>   4 files changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 2d56684..7b10c65 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -54,19 +54,24 @@ PKG_CHECK_MODULES([LIBZ], [zlib],[],[
>   	AC_SEARCH_LIBS([deflate], [z], [], AC_MSG_ERROR([zlib is required but =
was not found]), [])
>   ])
>
> -has_libnl_ver=3D0
> -PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
> -	AC_SEARCH_LIBS([nl_socket_alloc], [nl], [has_libnl_ver=3D2], [
> -		     PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [has_libnl=
_ver=3D3],
> -				       [AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [has_lib=
nl_ver=3D3], [], [])])
> -	], [])
> +PKG_CHECK_MODULES(LIBNL3, libnl-3.0 libnl-genl-3.0, [
> +	NETLINK_CFLAGS=3D${LIBNL3_CFLAGS}
> +	NETLINK_LIBS=3D${LIBNL3_LIBS}
> +], [
> +	PKG_CHECK_MODULES(LIBNL2, libnl-2.0, [
> +		NETLINK_CFLAGS=3D${LIBNL2_CFLAGS}
> +		NETLINK_LIBS=3D${LIBNL2_LIBS}
> +	], [
> +		PKG_CHECK_MODULES(LIBNL1, libnl-1, dummy=3Dyes,
> +			AC_MSG_ERROR(Netlink library is required))
> +		AC_DEFINE(NEED_LIBNL_COMPAT, 1,
> +			[Define to 1 if you need libnl-1 compat functions.])
> +		NETLINK_CFLAGS=3D${LIBNL1_CFLAGS}
> +		NETLINK_LIBS=3D${LIBNL1_LIBS}
Problem exists where PKG_CHECK_MODULES will only work if the =

distribution using it uses pkg configs. This is why we must also use =

search libs is pkg_check_modules fails.
> +	])
>   ])
> -if (test "$has_libnl_ver" -eq 0); then
> -	AC_MSG_ERROR(libnl is required but not found)
> -fi
> -if (test "$has_libnl_ver" -gt 1); then
> -	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher])
> -fi
> +AC_SUBST(NETLINK_CFLAGS)
> +AC_SUBST(NETLINK_LIBS)
>
>   AC_SEARCH_LIBS([pthread_create], [pthread], [], AC_MSG_ERROR([libpthrea=
d is required but was not found]), [])
>   AC_SEARCH_LIBS([inet_aton], [resolv], [], AC_MSG_ERROR([libresolv is re=
quired but was not found]), [])
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 935bdab..f2adc41 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -34,14 +34,14 @@ powertop_SOURCES =3D parameters/persistent.cpp parame=
ters/learn.cpp parameters/par
>   		measurement/sysfs.cpp measurement/acpi.h measurement/extech.cpp \
>   		measurement/power_supply.h measurement/extech.h main.cpp css.h powert=
op.css
>
> -powertop_CXXFLAGS =3D -O2 -g -fno-omit-frame-pointer -fstack-protector -=
Wall -Wshadow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS)=
 $(LIBNL_CFLAGS) $(GLIB2_CFLAGS)
> +powertop_CXXFLAGS =3D -O2 -g -fno-omit-frame-pointer -fstack-protector -=
Wall -Wshadow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS)=
 $(NETLINK_CFLAGS) $(GLIB2_CFLAGS)
>
>
> -powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_CFLAGS) $(PCIUTILS=
_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_CFLAGS) $(LIBZ_CFLAGS)
> +powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_CFLAGS) $(PCIUTILS=
_CFLAGS) $(NETLINK_CFLAGS) $(GLIB2_CFLAGS) $(LIBZ_CFLAGS)
>
>   powertop_LDADD =3D ../pevent/libparseevent.la
>
> -AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(LIBNL_LIBS) $(=
LIBZ_LIBS) $(NCURES_LIBS) $(PTHREAD_LIBS)  $(RESOLV_LIBS)
> +AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(NETLINK_LIBS) =
$(LIBZ_LIBS) $(NCURES_LIBS) $(PTHREAD_LIBS)  $(RESOLV_LIBS)
>
>   BUILT_SOURCES =3D css.h
>   CLEANFILES =3D css.h
> diff --git a/src/tuning/iw.c b/src/tuning/iw.c
> index aeba3fd..ba40d22 100644
> --- a/src/tuning/iw.c
> +++ b/src/tuning/iw.c
> @@ -50,7 +50,7 @@ OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SO=
FTWARE.
>   #include "iw.h"
>
>
> -#ifndef HAVE_LIBNL20
> +#ifdef NEED_LIBNL_COMPAT
its not just LIBNL compat but LIBNL compat > version 1
>   /* libnl 2.0 compatibility code */
>
>   static inline struct nl_handle *nl_socket_alloc(void)
> diff --git a/src/tuning/iw.h b/src/tuning/iw.h
> index acf132d..3b82aec 100644
> --- a/src/tuning/iw.h
> +++ b/src/tuning/iw.h
> @@ -46,7 +46,7 @@ OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SO=
FTWARE.
>   #include "config.h"
>   #endif
>
> -#ifndef HAVE_LIBNL20
> +#ifdef NEED_LIBNL_COMPAT
>   #define nl_sock nl_handle
>   #endif
so obviously libnl3 is not working? What distro and version are you =

running?
-Chris

> --
> 1.7.10.2
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============6908987112448071025==--

