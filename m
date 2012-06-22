Content-Type: multipart/mixed; boundary="===============0526147834989860415=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH] conditionally disable pci support on ARM platforms
Date: Sat, 23 Jun 2012 00:12:47 +0530
Message-ID: <1340390567-2994-1-git-send-email-rajagopal.venkat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0526147834989860415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 configure.ac |   16 +++++++++++++---
 src/lib.cpp  |   20 ++++++++++++++++++--
 src/lib.h    |    4 ++++
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/configure.ac b/configure.ac
index 4da4eea..c2ff430 100644
--- a/configure.ac
+++ b/configure.ac
@@ -22,6 +22,8 @@ AC_PROG_LIBTOOL
 AC_PROG_CC
 AC_PROG_INSTALL
 AM_PROG_CC_C_O
+AC_CANONICAL_HOST
+PKG_PROG_PKG_CONFIG
 =

 # Checks for libraries.
 # Checks for header files.
@@ -47,9 +49,17 @@ AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmo=
ve memset mkdir munmap p
 =

 AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses is =
required but was not found]), [])
 =

-PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
-	AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is required=
 but was not found]), [])
-]) =

+case "$host" in
+arm*)
+	AC_DEFINE([HAVE_NO_PCI],[1],[Define if host platform is ARM])
+	;;
+*)
+	PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
+		AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is require=
d but was not found]), [])
+	])
+	;;
+esac
+
 PKG_CHECK_MODULES([LIBZ], [zlib],[],[
 	AC_SEARCH_LIBS([deflate], [z], [], AC_MSG_ERROR([zlib is required but was=
 not found]), [])
 ]) =

diff --git a/src/lib.cpp b/src/lib.cpp
index 0f87e48..77e49a2 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -35,11 +35,13 @@
 #include <math.h>
 #include <stdlib.h>
 =

+#include "lib.h"
+
+#ifndef HAVE_NO_PCI
 extern "C" {
 #include <pci/pci.h>
 }
-
-#include "lib.h"
+#endif
 =

 #include <stdio.h>
 #include <stdint.h>
@@ -266,6 +268,7 @@ void format_watts(double W, char *buffer, unsigned int =
len)
 }
 =

 =

+#ifndef HAVE_NO_PCI
 static struct pci_access *pci_access;
 =

 char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int l=
en)
@@ -290,6 +293,19 @@ void end_pci_access(void)
 		pci_free_name_list(pci_access);
 }
 =

+#else
+
+char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int l=
en)
+{
+	return NULL;
+}
+
+void end_pci_access(void)
+{
+}
+
+#endif /* HAVE_NO_PCI */
+
 int utf_ok =3D -1;
 =

 =

diff --git a/src/lib.h b/src/lib.h
index 588c023..d354151 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -30,6 +30,10 @@
 #endif
 #include <stdint.h>
 =

+#if HAVE_CONFIG_H
+#include "config.h"
+#endif
+
 #ifndef DISABLE_I18N
 #define _(STRING)    gettext(STRING)
 #else
-- =

1.7.9.5


--===============0526147834989860415==--

