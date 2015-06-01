Content-Type: multipart/mixed; boundary="===============0623161508587648983=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 1/9] build with udev library
Date: Mon, 01 Jun 2015 09:09:07 -0700
Message-ID: <1433174955-17349-2-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0623161508587648983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 configure.ac    | 5 +++++
 src/Makefile.am | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/configure.ac b/configure.ac
index 79ea055..9af9604 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,6 +54,7 @@ AC_CHECK_HEADERS([ \
 	locale.h \
 	malloc.h \
 	ncurses.h \
+	libudev.h \
 	stdint.h \
 	stdlib.h \
 	string.h \
@@ -106,6 +107,10 @@ AC_CHECK_FUNCS([ \
 	strtoull \
 ])
 =

+PKG_CHECK_MODULES([UDEV], [libudev], [LIBS=3D"$LIBS $udev_LIBS"], [
+		AC_MSG_ERROR([libudev is required but was not found])
+])
+
 PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses_L=
IBS"], [
 	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
 		AC_MSG_ERROR([ncurses is required but was not found])
diff --git a/src/Makefile.am b/src/Makefile.am
index d7132c0..ac2259c 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -133,6 +133,7 @@ powertop_CXXFLAGS =3D \
 	$(GLIB2_CFLAGS) \
 	$(LIBNL_CFLAGS) \
 	$(NCURSES_CFLAGS) \
+	$(UDEV_CFLAGS) \
 	$(PCIUTILS_CFLAGS)
 =

 =

@@ -142,6 +143,7 @@ powertop_CPPFLAGS =3D \
 	$(LIBNL_CFLAGS) \
 	$(LIBZ_CFLAGS) \
 	$(NCURSES_CFLAGS) \
+	$(UDEV_CFLAGS) \
 	$(PCIUTILS_CFLAGS)
 =

 powertop_LDADD =3D \
@@ -152,6 +154,7 @@ AM_LDFLAGS =3D \
 	$(LIBS) \
 	$(LIBZ_LIBS) \
 	$(NCURSES_LIBS) \
+	$(UDEV_LIBS) \
 	$(PCIUTILS_LIBS) \
 	$(PTHREAD_LIBS) \
 	$(RESOLV_LIBS)
-- =

2.4.1


--===============0623161508587648983==--

