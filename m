Content-Type: multipart/mixed; boundary="===============2912496930996152412=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Make libpci dependency optional
Date: Wed, 18 Jul 2012 18:53:57 +0400
Message-ID: <1342623237-30526-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2912496930996152412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Make libpci dependency optional. Provide --without-libpci option to configu=
re.
---
 configure.ac               |   10 +++++++---
 src/devices/runtime_pm.cpp |    3 +++
 src/lib.cpp                |    5 +++++
 src/main.cpp               |    6 ++++++
 src/tuning/runtime.cpp     |    4 ++++
 5 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index ff4cdea..4a7cdfe 100644
--- a/configure.ac
+++ b/configure.ac
@@ -47,9 +47,13 @@ AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmo=
ve memset mkdir munmap p
 =

 AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses is =
required but was not found]), [])
 =

-PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
-	AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is required=
 but was not found]), [])
-]) =

+AC_ARG_WITH([libpci], AS_HELP_STRING([--without-libpci], [Disable libcpi s=
upport]))
+AS_IF([test "x$with_libpci" =3D "xno"], [
+	AC_DEFINE([DISABLE_PCI], [1], [Disable PCI support])], [
+	PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
+		AC_SEARCH_LIBS([pci_get_dev], [pci], [],
+		AC_MSG_ERROR([libpci is required but was not found]), [])])])
+
 PKG_CHECK_MODULES([LIBZ], [zlib],[],[
 	AC_SEARCH_LIBS([deflate], [z], [], AC_MSG_ERROR([zlib is required but was=
 not found]), [])
 ]) =

diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index 0d13cab..0ef0895 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -22,6 +22,7 @@
  * Authors:
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
+#include "../../config.h"
 #include "runtime_pm.h"
 =

 #include <string.h>
@@ -201,6 +202,7 @@ static void do_bus(const char *bus)
 =

 		dev =3D new class runtime_pmdevice(entry->d_name, filename);
 =

+#ifndef DISABLE_PCI
 		if (strcmp(bus, "pci") =3D=3D 0) {
 			uint16_t vendor =3D 0, device =3D 0;
 =

@@ -226,6 +228,7 @@ static void do_bus(const char *bus)
 				dev->set_human_name(devname);
 			}
 		}
+#endif /* !DISABLE_PCI */
 		all_devices.push_back(dev);
 	}
 	closedir(dir);
diff --git a/src/lib.cpp b/src/lib.cpp
index 0f87e48..3eb3b15 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -23,6 +23,7 @@
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  *	Peter Anvin
  */
+#include "../config.h"
 #include <map>
 #include <string.h>
 #include <iostream>
@@ -35,9 +36,11 @@
 #include <math.h>
 #include <stdlib.h>
 =

+#ifndef DISABLE_PCI
 extern "C" {
 #include <pci/pci.h>
 }
+#endif /* !DISABLE_PCI */
 =

 #include "lib.h"
 =

@@ -266,6 +269,7 @@ void format_watts(double W, char *buffer, unsigned int =
len)
 }
 =

 =

+#ifndef DISABLE_PCI
 static struct pci_access *pci_access;
 =

 char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int l=
en)
@@ -289,6 +293,7 @@ void end_pci_access(void)
 	if (pci_access)
 		pci_free_name_list(pci_access);
 }
+#endif /* !DISABLE_PCI */
 =

 int utf_ok =3D -1;
 =

diff --git a/src/main.cpp b/src/main.cpp
index 7a1b976..997c41d 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -280,7 +280,9 @@ void report(int time, char *workload, int iterations, c=
har *file)
 	learn_parameters(50, 0);
 	save_all_results("saved_results.powertop");
 	save_parameters("saved_parameters.powertop");
+#ifndef DISABLE_PCI
 	end_pci_access();
+#endif /* !DISABLE_PCI */
 	exit(0);
 }
 =

@@ -443,7 +445,9 @@ int main(int argc, char **argv)
 	if (debug_learning) {
 	        learn_parameters(1000, 1);
 		dump_parameter_bundle();
+#ifndef DISABLE_PCI
 		end_pci_access();
+#endif /* !DISABLE_PCI */
 		exit(0);
 	}
 =

@@ -473,7 +477,9 @@ int main(int argc, char **argv)
 	save_parameters("saved_parameters.powertop");
 	learn_parameters(500, 0);
 	save_parameters("saved_parameters.powertop");
+#ifndef DISABLE_PCI
 	end_pci_access();
+#endif /* !DISABLE_PCI */
 	clear_tuning();
 	reset_display();
 =

diff --git a/src/tuning/runtime.cpp b/src/tuning/runtime.cpp
index b57d53e..4528e41 100644
--- a/src/tuning/runtime.cpp
+++ b/src/tuning/runtime.cpp
@@ -23,6 +23,7 @@
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
 =

+#include "../../config.h"
 #include "tuning.h"
 #include "tunable.h"
 #include "unistd.h"
@@ -48,6 +49,7 @@ runtime_tunable::runtime_tunable(const char *path, const =
char *bus, const char *
 	if (!device_has_runtime_pm(path))
 		sprintf(desc, _("%s device %s has no runtime power management"), bus, de=
v);
 =

+#ifndef DISABLE_PCI
 	if (strcmp(bus, "pci") =3D=3D 0) {
 		char filename[4096];
 		uint16_t vendor =3D 0, device =3D 0;
@@ -77,6 +79,8 @@ runtime_tunable::runtime_tunable(const char *path, const =
char *bus, const char *
 =

 =

 	}
+#endif /* !DISABLE_PCI */
+
 	sprintf(toggle_good, "echo 'auto' > '%s';", runtime_path);
 	sprintf(toggle_bad, "echo 'on' > '%s';", runtime_path);
 }
-- =

1.7.5.4


--===============2912496930996152412==--

