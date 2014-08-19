Content-Type: multipart/mixed; boundary="===============2194574646789945495=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 01/14] configure: use vertical lists
Date: Tue, 19 Aug 2014 20:51:54 +0900
Message-ID: <20140819115154.GD2484@swordfish>
In-Reply-To: 1407274298-16404-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2194574646789945495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/05/14 22:31), Sami Kerola wrote:
> Horizontal lists has downside of being managed as a single entry in
> version control, which makes commits that add and remove items difficult
> to follow.  With vertical lists each entry is managed separately, which
> is much nicer.
> =

> Additionally add project URL to autoconfig init, and pretty print macro
> expressions to have indentation, and bracing that follows more or less in
> K&R style.
> =


hello,

at a glance, looks good.
though, I'm not really sure about "[PATCH 09/14] do not use ncurses
when --auto-tune is specified".


thank you,

	-ss

> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
> ---
>  configure.ac | 82 +++++++++++++++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 67 insertions(+), 15 deletions(-)
> =

> diff --git a/configure.ac b/configure.ac
> index 0b02ad2..b41cfb3 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -2,15 +2,21 @@
>  # Process this file with autoconf to produce a configure script.
>  =

>  AC_PREREQ([2.68])
> -AC_INIT([powertop], [2.6.1], [powertop(a)lists.01.org])
> -AM_INIT_AUTOMAKE([-Wall foreign ])
> +AC_INIT([powertop], [2.6.1], [powertop(a)lists.01.org], [], [https://01.=
org/powertop])
> +AM_INIT_AUTOMAKE([-Wall foreign])
>  AC_LANG([C++])
> -AC_CONFIG_FILES([Makefile src/Makefile traceevent/Makefile po/Makefile.i=
n doc/Makefile])
> +AC_CONFIG_FILES([
> +	Makefile
> +	src/Makefile
> +	traceevent/Makefile
> +	po/Makefile.in
> +	doc/Makefile
> +])
>  AC_CONFIG_SRCDIR([src/main.cpp])
>  AC_CONFIG_MACRO_DIR([m4])
>  AC_CONFIG_HEADERS([config.h])
>  GETTEXT_PACKAGE=3Dpowertop
> -AC_SUBST(GETTEXT_PACKAGE)
> +AC_SUBST([GETTEXT_PACKAGE])
>  AM_SILENT_RULES([yes])
>  AM_GNU_GETTEXT([external])
>  AM_GNU_GETTEXT_VERSION([0.18])
> @@ -26,7 +32,23 @@ AM_PROG_CC_C_O
>  =

>  # Checks for libraries.
>  # Checks for header files.
> -AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h malloc.h stdint.h =
stdlib.h string.h sys/ioctl.h sys/socket.h sys/statfs.h sys/time.h termios.=
h unistd.h ncurses.h])
> +AC_CHECK_HEADERS([ \
> +	fcntl.h \
> +	libintl.h \
> +	limits.h \
> +	locale.h \
> +	malloc.h \
> +	ncurses.h \
> +	stdint.h \
> +	stdlib.h \
> +	string.h \
> +	sys/ioctl.h \
> +	sys/socket.h \
> +	sys/statfs.h \
> +	sys/time.h \
> +	termios.h \
> +	unistd.h \
> +])
>  =

>  # Checks for typedefs, structures, and compiler characteristics.
>  AC_HEADER_STDBOOL
> @@ -44,20 +66,46 @@ AC_FUNC_MALLOC
>  AC_FUNC_MMAP
>  AC_FUNC_REALLOC
>  AC_FUNC_STRTOD
> -AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir =
munmap pow realpath regcomp select setlocale socket sqrt strcasecmp strchr =
strdup strerror strncasecmp strstr strtoul strtoull])
> +AC_CHECK_FUNCS([ \
> +	fdatasync \
> +	getpagesize \
> +	gettimeofday \
> +	memmove \
> +	memset \
> +	mkdir \
> +	munmap \
> +	pow \
> +	realpath \
> +	regcomp \
> +	select \
> +	setlocale \
> +	socket \
> +	sqrt \
> +	strcasecmp \
> +	strchr \
> +	strdup \
> +	strerror \
> +	strncasecmp \
> +	strstr \
> +	strtoul \
> +	strtoull \
> +])
>  =

> -PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses=
_LIBS"],
> -	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses =
is required but was not found]), []))
> +PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses=
_LIBS"], [
> +	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
> +		AC_MSG_ERROR([ncurses is required but was not found])
> +	], [])
> +])
>  =

>  has_libpci=3D0
> -PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
> -	AC_SEARCH_LIBS([pci_get_dev], [pci],[has_libpci=3D1], [has_libpci=3D0] =
)])
> +PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1], [
> +	AC_SEARCH_LIBS([pci_get_dev], [pci],[has_libpci=3D1], [has_libpci=3D0])
> +])
>   =

>  =

>  has_libnl_ver=3D0
> -# libnl-2 provides only libnl-2.0.pc file, so we check for separate libn=
l-genl-3.0.pc
> -# pkg-config file just for libnl-3.0 case.
> -#
> +dnl libnl-2 provides only libnl-2.0.pc file, so we check for separate
> +dnl libnl-genl-3.0.pc pkg-config file just for libnl-3.0 case.
>  PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0],=
 [has_libnl_ver=3D3], [
>  	PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=3D2], [
>  		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [has_libnl_=
ver=3D0])])])
> @@ -78,7 +126,11 @@ if (test "$has_libpci" -eq 0); then
>  	])
>  fi
>  =

> -AC_SEARCH_LIBS([pthread_create], [pthread], [], AC_MSG_ERROR([libpthread=
 is required but was not found]), [])
> -AC_SEARCH_LIBS([inet_aton], [resolv], [], AC_MSG_ERROR([libresolv is req=
uired but was not found]), [])
> +AC_SEARCH_LIBS([pthread_create], [pthread], [], [
> +	AC_MSG_ERROR([libpthread is required but was not found])
> +], [])
> +AC_SEARCH_LIBS([inet_aton], [resolv], [], [
> +	AC_MSG_ERROR([libresolv is required but was not found])
> +], [])
>  =

>  AC_OUTPUT
> -- =

> 2.0.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============2194574646789945495==--

