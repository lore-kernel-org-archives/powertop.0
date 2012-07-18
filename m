Content-Type: multipart/mixed; boundary="===============2022177654850250370=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Make ncurses dependency optional
Date: Wed, 18 Jul 2012 18:54:27 +0400
Message-ID: <1342623267-30567-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2022177654850250370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Make ncurses dependency optional. Provide --without-ncurses option
to configure.
---
 configure.ac               |    6 +++++-
 src/cpu/cpu.cpp            |    3 +++
 src/display.cpp            |    7 +++++++
 src/display.h              |    3 +++
 src/lib.cpp                |    7 +++++++
 src/main.cpp               |    2 ++
 src/process/do_process.cpp |    7 +++++++
 src/tuning/tuning.cpp      |    5 +++++
 8 files changed, 39 insertions(+), 1 deletions(-)

diff --git a/configure.ac b/configure.ac
index ff4cdea..084056f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -45,7 +45,11 @@ AC_FUNC_REALLOC
 AC_FUNC_STRTOD
 AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir mu=
nmap pow realpath regcomp select setlocale socket sqrt strcasecmp strchr st=
rdup strerror strncasecmp strstr strtoul strtoull])
 =

-AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses is =
required but was not found]), [])
+AC_ARG_WITH([ncurses], AS_HELP_STRING([--without-ncurses], [Disable ncurse=
s support]))
+AS_IF([test "x$with_ncurses" =3D "xno"], [
+	AC_DEFINE([DISABLE_NCURSES], [1], [Disable ncurses support])], [
+	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [],
+		AC_MSG_ERROR([ncurses is required but was not found]), [])])
 =

 PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
 	AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is required=
 but was not found]), [])
diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 941bcff..1c66740 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -22,12 +22,15 @@
  * Authors:
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
+#include "../../config.h"
 #include <iostream>
 #include <fstream>
 #include <vector>
 #include <string.h>
 #include <stdlib.h>
+#ifndef DISABLE_NCURSES
 #include <ncurses.h>
+#endif /* !DISABLE_NCURSES */
 =

 #include "cpu.h"
 #include "cpudevice.h"
diff --git a/src/display.cpp b/src/display.cpp
index caa66d0..75d347f 100644
--- a/src/display.cpp
+++ b/src/display.cpp
@@ -22,10 +22,13 @@
  * Authors:
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
+#include "../config.h"
 #include "display.h"
 #include "lib.h"
 =

+#ifndef DISABLE_NCURSES
 #include <ncurses.h>
+#endif /* !DISABLE_NCURSES */
 =

 =

 #include <vector>
@@ -85,7 +88,11 @@ void reset_display(void)
 	echo();
 	nocbreak();
 =

+#ifndef NCURSES_NOMACROS
 	resetterm();
+#else /* NCURSES_NOMACROS */
+	reset_shell_mode();
+#endif /* NCURSES_NOMACROS */
 }
 =

 =

diff --git a/src/display.h b/src/display.h
index e0f66a3..67c191a 100644
--- a/src/display.h
+++ b/src/display.h
@@ -26,9 +26,12 @@
 #define __INCLUDE_GUARD_DISPLAY_H_
 =

 =

+#include "../config.h"
 #include <map>
 #include <string>
+#ifndef DISABLE_NCURSES
 #include <ncurses.h>
+#endif /* !DISABLE_NCURSES */
 =

 using namespace std;
 =

diff --git a/src/lib.cpp b/src/lib.cpp
index 0f87e48..26b8c0e 100644
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
@@ -55,7 +56,9 @@ extern "C" {
 #endif
 #include <limits>
 #include <math.h>
+#ifndef DISABLE_NCURSES
 #include <ncurses.h>
+#endif /* !DISABLE_NCURSES */
 =

 static int kallsyms_read =3D 0;
 =

@@ -260,8 +263,10 @@ void format_watts(double W, char *buffer, unsigned int=
 len)
 		sprintf(buffer, _("    0 mW"));
 =

 #ifndef DISABLE_NCURSES
+#ifndef DISABLE_WSTRING
 	while (mbstowcs(NULL,buffer,0) < len)
 		strcat(buffer, " ");
+#endif /* DISABLE_WSTRING */
 #endif
 }
 =

@@ -418,6 +423,7 @@ void process_directory(const char *d_name, callback fn)
 	closedir(dir);
 }
 =

+#ifndef DISABLE_NCURSES
 int get_user_input(char *buf, unsigned sz)
 {
 	fflush(stdout);
@@ -429,3 +435,4 @@ int get_user_input(char *buf, unsigned sz)
 	/* to distinguish between getnstr error and empty line */
 	return ret || strlen(buf);
 }
+#endif /* DISABLE_NCURSES */
diff --git a/src/main.cpp b/src/main.cpp
index 7a1b976..8f096c9 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -86,6 +86,7 @@ static void print_version()
 	printf(_("PowerTOP version" POWERTOP_VERSION ", compiled on " __DATE__ "\=
n"));
 }
 =

+#ifndef DISABLE_NCURSES
 static bool set_refresh_timeout()
 {
 	static char buf[4];
@@ -99,6 +100,7 @@ static bool set_refresh_timeout()
 	time_out =3D time;
 	return 1;
 }
+#endif /* !DISABLE_NCURSES */
 =

 static void print_usage()
 {
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 731fe3e..6c7950b 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -22,6 +22,7 @@
  * Authors:
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
+#include "../../config.h"
 #include "process.h"
 #include "interrupt.h"
 #include "timer.h"
@@ -37,7 +38,9 @@
 =

 #include <stdio.h>
 #include <string.h>
+#ifndef DISABLE_NCURSES
 #include <ncurses.h>
+#endif /* !DISABLE_NCURSES */
 =

 #include "../perf/perf_bundle.h"
 #include "../perf/perf_event.h"
@@ -858,7 +861,9 @@ void process_update_display(void)
 		if (!show_power)
 			strcpy(power, "          ");
 		sprintf(name, "%s", all_power[i]->type());
+#ifndef DISABLE_WSTRING
 		while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
+#endif /* !DISABLE_WSTRING */
 =

 =

 		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&=
 all_power[i]->Witts() =3D=3D 0)
@@ -871,7 +876,9 @@ void process_update_display(void)
 			else
 				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->usag=
e_units());
 		}
+#ifndef DISABLE_WSTRING
 		while (mbstowcs(NULL,usage,0) < 14) strcat(usage, " ");
+#endif /* !DISABLE_WSTRING */
 		sprintf(events, "%5.1f", all_power[i]->events());
 		if (!all_power[i]->show_events())
 			events[0] =3D 0;
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 1a90417..2e1981b 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -23,11 +23,14 @@
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
 =

+#include "../../config.h"
 #include <algorithm>
 =

 #include <stdio.h>
 #include <string.h>
+#ifndef DISABLE_NCURSES
 #include <ncurses.h>
+#endif /* !DISABLE_NCURSES */
 =

 =

 #include "tuning.h"
@@ -182,12 +185,14 @@ static bool tunables_sort(class tunable * i, class tu=
nable * j)
 	return false;
 }
 =

+#ifndef DISABLE_NCURSES
 void tuning_window::window_refresh()
 {
 	clear_tuning();
 	should_clear =3D TRUE;
 	init_tuning();
 }
+#endif /* !DISABLE_NCURSES */
 =

 static void sort_tunables(void)
 {
-- =

1.7.5.4


--===============2022177654850250370==--

