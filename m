Content-Type: multipart/mixed; boundary="===============4971954539939989150=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 01/12] configure: use vertical lists and AS_IF macro
Date: Sat, 02 Aug 2014 12:54:06 +0100
Message-ID: <1406980457-19077-2-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4971954539939989150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Horizontal lists has downside of being managed as a single entry in
version control, which makes commits that add and remove items difficult
to follow.  With vertical lists each entry is managed separately, which
is much nicer.

Additionally make the 'if' statements to use AS_IF() macro, add project
URL to autoconfig init, and pretty print macro expressions to have
indentation, and bracing that follows more or less in K&R style.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 configure.ac | 102 +++++++++++++++++++++++++++++++++++++++++++++----------=
----
 1 file changed, 78 insertions(+), 24 deletions(-)

diff --git a/configure.ac b/configure.ac
index 0b02ad2..d38f750 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,15 +2,21 @@
 # Process this file with autoconf to produce a configure script.
 =

 AC_PREREQ([2.68])
-AC_INIT([powertop], [2.6.1], [powertop(a)lists.01.org])
-AM_INIT_AUTOMAKE([-Wall foreign ])
+AC_INIT([powertop], [2.6.1], [powertop(a)lists.01.org], [], [https://01.or=
g/powertop])
+AM_INIT_AUTOMAKE([-Wall foreign])
 AC_LANG([C++])
-AC_CONFIG_FILES([Makefile src/Makefile traceevent/Makefile po/Makefile.in =
doc/Makefile])
+AC_CONFIG_FILES([ \
+	Makefile \
+	src/Makefile \
+	traceevent/Makefile \
+	po/Makefile.in \
+	doc/Makefile
+])
 AC_CONFIG_SRCDIR([src/main.cpp])
 AC_CONFIG_MACRO_DIR([m4])
 AC_CONFIG_HEADERS([config.h])
 GETTEXT_PACKAGE=3Dpowertop
-AC_SUBST(GETTEXT_PACKAGE)
+AC_SUBST([GETTEXT_PACKAGE])
 AM_SILENT_RULES([yes])
 AM_GNU_GETTEXT([external])
 AM_GNU_GETTEXT_VERSION([0.18])
@@ -26,7 +32,23 @@ AM_PROG_CC_C_O
 =

 # Checks for libraries.
 # Checks for header files.
-AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h malloc.h stdint.h st=
dlib.h string.h sys/ioctl.h sys/socket.h sys/statfs.h sys/time.h termios.h =
unistd.h ncurses.h])
+AC_CHECK_HEADERS([ \
+	fcntl.h \
+	libintl.h \
+	limits.h \
+	locale.h \
+	malloc.h \
+	ncurses.h \
+	stdint.h \
+	stdlib.h \
+	string.h \
+	sys/ioctl.h \
+	sys/socket.h \
+	sys/statfs.h \
+	sys/time.h \
+	termios.h \
+	unistd.h \
+])
 =

 # Checks for typedefs, structures, and compiler characteristics.
 AC_HEADER_STDBOOL
@@ -44,41 +66,73 @@ AC_FUNC_MALLOC
 AC_FUNC_MMAP
 AC_FUNC_REALLOC
 AC_FUNC_STRTOD
-AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir mu=
nmap pow realpath regcomp select setlocale socket sqrt strcasecmp strchr st=
rdup strerror strncasecmp strstr strtoul strtoull])
+AC_CHECK_FUNCS([ \
+	fdatasync \
+	getpagesize \
+	gettimeofday \
+	memmove \
+	memset \
+	mkdir \
+	munmap \
+	pow \
+	realpath \
+	regcomp \
+	select \
+	setlocale \
+	socket \
+	sqrt \
+	strcasecmp \
+	strchr \
+	strdup \
+	strerror \
+	strncasecmp \
+	strstr \
+	strtoul \
+	strtoull \
+])
 =

-PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses_L=
IBS"],
-	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses is=
 required but was not found]), []))
+PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses_L=
IBS"], [
+	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
+		AC_MSG_ERROR([ncurses is required but was not found])
+	], [])
+])
 =

 has_libpci=3D0
-PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
-	AC_SEARCH_LIBS([pci_get_dev], [pci],[has_libpci=3D1], [has_libpci=3D0] )])
+PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1], [
+	AC_SEARCH_LIBS([pci_get_dev], [pci],[has_libpci=3D1], [has_libpci=3D0])
+])
  =

 =

 has_libnl_ver=3D0
-# libnl-2 provides only libnl-2.0.pc file, so we check for separate libnl-=
genl-3.0.pc
-# pkg-config file just for libnl-3.0 case.
-#
+dnl libnl-2 provides only libnl-2.0.pc file, so we check for separate
+dnl libnl-genl-3.0.pc pkg-config file just for libnl-3.0 case.
 PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0], [=
has_libnl_ver=3D3], [
 	PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=3D2], [
-		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [has_libnl_ve=
r=3D0])])])
-if (test "$has_libnl_ver" -eq 0); then
-	AC_MSG_ERROR(libnl and libnl-genl are required but were not found)
-fi
-if (test "$has_libnl_ver" -gt 1); then
+		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [has_libnl_ve=
r=3D0])
+	])
+])
+AS_IF([test "$has_libnl_ver" -eq 0], [
+	AC_MSG_ERROR([libnl and libnl-genl are required but were not found])
+])
+AS_IF([test "$has_libnl_ver" -gt 1], [
 	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher])
-fi
+])
 =

-if (test "$has_libpci" -eq 0); then =

-	AC_DEFINE([HAVE_NO_PCI],[1],[Define if pci is not supported])
+AS_IF([test "$has_libpci" -eq 0], [
+	AC_DEFINE([HAVE_NO_PCI], [1], [Define if pci is not supported])
         AC_MSG_WARN([
 			************* LIBPCI SUPPORT NOT CONFIGURED**************
 			If you need or want pci support, please install libpci =

 			and re-configure PowerTOP. =

 			*********************************************************
 	])
-fi
+])
 =

-AC_SEARCH_LIBS([pthread_create], [pthread], [], AC_MSG_ERROR([libpthread i=
s required but was not found]), [])
-AC_SEARCH_LIBS([inet_aton], [resolv], [], AC_MSG_ERROR([libresolv is requi=
red but was not found]), [])
+AC_SEARCH_LIBS([pthread_create], [pthread], [], [
+	AC_MSG_ERROR([libpthread is required but was not found])
+], [])
+AC_SEARCH_LIBS([inet_aton], [resolv], [], [
+	AC_MSG_ERROR([libresolv is required but was not found])
+], [])
 =

 AC_OUTPUT
-- =

2.0.3


--===============4971954539939989150==--

