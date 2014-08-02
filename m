Content-Type: multipart/mixed; boundary="===============6404942367508870669=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 12/12] clean up .gitignore file
Date: Sat, 02 Aug 2014 12:54:17 +0100
Message-ID: <1406980457-19077-13-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6404942367508870669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Keep the regular expressions, directories, and individual files separate
understandable way.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 .gitignore | 111 +++++++++++++++++++++++++++------------------------------=
----
 1 file changed, 49 insertions(+), 62 deletions(-)

diff --git a/.gitignore b/.gitignore
index d00973f..b9188a1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,66 +1,53 @@
-*~
-*.o
+# regular expressions
 *.a
-*.html
 *.csv
-*.powertop
-ChangeLog
-Makefile.in
-aclocal.m4
-config.guess
-config.h.in
-config.rpath
-config.sub
-configure
-depcomp
-install-sh
-ltmain.sh
-missing
-stamp-h1
-Makefile
-config.h
-config.log
-config.status
-libtool
-pevent/.deps/
-pevent/Makefile
-pevent/Makefile.in
-po/Makefile
-po/Makevars.template
-po/POTFILES
-po/Rules-quot
-po/boldquot.sed
-po/en(a)boldquot.header
-po/en(a)quot.header
-po/insert-header.sin
-po/quot.sed
-po/remove-potcdate.sin
-po/*.gmo
-po/stamp-po
-src/powertop
-src/css.h
-src/Makefile.in
-src/.deps/
-src/Makefile
-src/calibrate/.deps/
-src/cpu/.deps/
-src/cpu/rapl/.deps
-src/devices/.deps/
-src/measurement/.deps/
-src/parameters/.deps/
-src/perf/.deps/
-src/process/.deps/
-src/tuning/.deps/
-src/report/.deps/
-m4
 *.dirstamp
-*.lo
+*.html
 *.la
-autom4te.cache
-remove-potcdate.sed
-compile
-stamp-po
-ABOUT-NLS
-ar-lib
-traceevent/.deps/
-traceevents/.libs/
+*.lo
+*.o
+*.powertop
+*~
+.deps
+/po/*.gmo
+Makefile
+Makefile.in
+
+# directories
+/m4/
+
+# individual files
+/ABOUT-NLS
+/ChangeLog
+/aclocal.m4
+/ar-lib
+/autom4te.cache
+/compile
+/config.guess
+/config.h
+/config.h.in
+/config.log
+/config.rpath
+/config.status
+/config.sub
+/configure
+/depcomp
+/install-sh
+/libtool
+/ltmain.sh
+/missing
+/po/Makevars.template
+/po/POTFILES
+/po/Rules-quot
+/po/boldquot.sed
+/po/en(a)boldquot.header
+/po/en(a)quot.header
+/po/insert-header.sin
+/po/quot.sed
+/po/remove-potcdate.sin
+/po/stamp-po
+/remove-potcdate.sed
+/src/css.h
+/src/powertop
+/stamp-h1
+/stamp-po
-- =

2.0.3


--===============6404942367508870669==--

