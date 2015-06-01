Content-Type: multipart/mixed; boundary="===============3675380938711069970=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 8/9] remove libpci and most dead code
Date: Mon, 01 Jun 2015 09:09:14 -0700
Message-ID: <1433174955-17349-9-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3675380938711069970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Leave device_has_runtime_pm for now.

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 Android.mk      |  1 -
 README          |  1 -
 configure.ac    | 15 ---------------
 src/Makefile.am |  7 ++-----
 src/lib.cpp     | 45 ---------------------------------------------
 src/lib.h       |  2 --
 src/main.cpp    |  3 ---
 7 files changed, 2 insertions(+), 72 deletions(-)

diff --git a/Android.mk b/Android.mk
index 2461233..2ebd8f1 100644
--- a/Android.mk
+++ b/Android.mk
@@ -4,7 +4,6 @@ include $(CLEAR_VARS)
 LOCAL_MODULE_TAGS :=3D debug
 LOCAL_SHARED_LIBRARIES :=3D libstlport \
 			  libnl \
-			  libpci \
 			  libtraceevnet \
 LOCAL_MODULE :=3D powertop  =

 =

diff --git a/README b/README
index 6e76842..803bc6d 100644
--- a/README
+++ b/README
@@ -20,7 +20,6 @@ development environment.
 =

 in addition to that, PowerTOP requires the following components:
 =

-pciutils-devel (is only required if you have PCI) =

 ncurses-devel  (required) =

 libnl-devel    (required)
 kernel version =3D> 2.6.38
diff --git a/configure.ac b/configure.ac
index 9af9604..bc16e23 100644
--- a/configure.ac
+++ b/configure.ac
@@ -117,11 +117,6 @@ PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=
=3D"$LIBS $ncurses_LIBS"], [
 	], [])
 ])
 =

-has_libpci=3D0
-PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1], [
-	AC_SEARCH_LIBS([pci_get_dev], [pci],[has_libpci=3D1], [has_libpci=3D0])
-])
- =

 =

 has_libnl_ver=3D0
 dnl libnl-2 provides only libnl-2.0.pc file, so we check for separate
@@ -138,16 +133,6 @@ AS_IF([test "$has_libnl_ver" -gt 1], [
 	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher])
 ])
 =

-AS_IF([test "$has_libpci" -eq 0], [
-	AC_DEFINE([HAVE_NO_PCI], [1], [Define if pci is not supported])
-        AC_MSG_WARN([
-			************* LIBPCI SUPPORT NOT CONFIGURED**************
-			If you need or want pci support, please install libpci =

-			and re-configure PowerTOP. =

-			*********************************************************
-	])
-])
-
 AC_SEARCH_LIBS([inet_aton], [resolv], [], [
 	AC_MSG_ERROR([libresolv is required but was not found])
 ], [])
diff --git a/src/Makefile.am b/src/Makefile.am
index ac2259c..c4326ec 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -133,8 +133,7 @@ powertop_CXXFLAGS =3D \
 	$(GLIB2_CFLAGS) \
 	$(LIBNL_CFLAGS) \
 	$(NCURSES_CFLAGS) \
-	$(UDEV_CFLAGS) \
-	$(PCIUTILS_CFLAGS)
+	$(UDEV_CFLAGS)
 =

 =

 powertop_CPPFLAGS =3D \
@@ -143,8 +142,7 @@ powertop_CPPFLAGS =3D \
 	$(LIBNL_CFLAGS) \
 	$(LIBZ_CFLAGS) \
 	$(NCURSES_CFLAGS) \
-	$(UDEV_CFLAGS) \
-	$(PCIUTILS_CFLAGS)
+	$(UDEV_CFLAGS)
 =

 powertop_LDADD =3D \
 	../traceevent/libtraceevnet.la
@@ -155,7 +153,6 @@ AM_LDFLAGS =3D \
 	$(LIBZ_LIBS) \
 	$(NCURSES_LIBS) \
 	$(UDEV_LIBS) \
-	$(PCIUTILS_LIBS) \
 	$(PTHREAD_LIBS) \
 	$(RESOLV_LIBS)
 =

diff --git a/src/lib.cpp b/src/lib.cpp
index 399d2bc..d1ea35a 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -37,15 +37,8 @@
 =

 #include "lib.h"
 =

-#ifndef HAVE_NO_PCI
-extern "C" {
-#include <pci/pci.h>
-}
-#endif
-
 #include <stdio.h>
 #include <stdint.h>
-#include <stdlib.h>
 #include <unistd.h>
 #include <sys/types.h>
 #include <sys/types.h>
@@ -341,44 +334,6 @@ const char *upci_id_to_name(struct udev_device* dev, c=
har* buffer)
 	return NULL;
 }
 =

-#ifndef HAVE_NO_PCI
-static struct pci_access *pci_access;
-
-char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int l=
en)
-{
-	char *ret;
-
-	buffer[0] =3D 0;
-
-	if (!pci_access) {
-		pci_access =3D pci_alloc();
-		pci_init(pci_access);
-	}
-
-	ret =3D pci_lookup_name(pci_access, buffer, len, PCI_LOOKUP_VENDOR | PCI_=
LOOKUP_DEVICE, vendor, device);
-
-	return ret;
-}
-
-void end_pci_access(void)
-{
-	if (pci_access)
-		pci_free_name_list(pci_access);
-}
-
-#else
-
-char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int l=
en)
-{
-	return NULL;
-}
-
-void end_pci_access(void)
-{
-}
-
-#endif /* HAVE_NO_PCI */
-
 int utf_ok =3D -1;
 =

 =

diff --git a/src/lib.h b/src/lib.h
index 464ce71..a577e3f 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -69,8 +69,6 @@ extern string read_sysfs_string(const char *format, const=
 char *param);
 extern void format_watts(double W, char *buffer, unsigned int len);
 =

 extern const char *upci_id_to_name(struct udev_device* dev, char* buffer);
-extern char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer=
, int len);
-extern void end_pci_access(void);
 =

 extern struct udev * get_udev();
 extern void cleanup_udev();
diff --git a/src/main.cpp b/src/main.cpp
index 65e54ac..1082f0e 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -282,7 +282,6 @@ void make_report(int time, char *workload, int iteratio=
ns, char *file)
 	learn_parameters(50, 0);
 	save_all_results("saved_results.powertop");
 	save_parameters("saved_parameters.powertop");
-	end_pci_access();
 	exit(0);
 }
 =

@@ -475,7 +474,6 @@ int main(int argc, char **argv)
 	if (debug_learning) {
 	        learn_parameters(1000, 1);
 		dump_parameter_bundle();
-		end_pci_access();
 		exit(0);
 	}
 	if (!auto_tune)
@@ -512,7 +510,6 @@ int main(int argc, char **argv)
 	save_parameters("saved_parameters.powertop");
 	learn_parameters(500, 0);
 	save_parameters("saved_parameters.powertop");
-	end_pci_access();
 	clear_tuning();
 	reset_display();
 =

-- =

2.4.1


--===============3675380938711069970==--

