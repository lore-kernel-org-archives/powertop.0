Content-Type: multipart/mixed; boundary="===============3718933256845246407=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] csstoh shell-script for cross-compiling PowerTOP
Date: Wed, 11 Jul 2012 16:49:06 +0400
Message-ID: <1342010946-19003-1-git-send-email-i.zhbanov@samsung.com>
In-Reply-To: 1342007181.4108.38.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3718933256845246407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It was impossible to build PowerTOP for ARM with a cross-compiler
because PowerTOP uses internal csstoh utility that converts
powertop.css to powertoh.h for inclusion in *.cpp source files.

When you use the cross-compiler (without making complicated rules
in the Makefile) this utility will be compiled for ARM platform too.
And you cannot run it on x86 build host.

To solve this issue I have rewritten it in a shell script.
---
 .gitignore      |    1 -
 src/Makefile.am |    7 ++-----
 src/csstoh.sh   |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 6 deletions(-)
 create mode 100644 src/csstoh.sh

diff --git a/.gitignore b/.gitignore
index 5534072..35f0df6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -39,7 +39,6 @@ po/*.gmo
 po/stamp-po
 src/powertop
 src/css.h
-src/csstoh
 src/Makefile.in
 src/.deps/
 src/Makefile
diff --git a/src/Makefile.am b/src/Makefile.am
index c77b2aa..15e5feb 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,9 +1,6 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
 ACLOCAL_AMFLAGS =3D -I ../m4 =

 =

-noinst_PROGRAMS =3D csstoh
-csstoh_SOURCES =3D csstoh.c =

-
 sbin_PROGRAMS =3D powertop
 nodist_powertop_SOURCES =3D css.h
 =

@@ -44,6 +41,6 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $=
(LIBNL_LIBS) $(LIBZ_LIBS)
 =

 BUILT_SOURCES =3D css.h
 CLEANFILES =3D css.h
-css.h: csstoh powertop.css
-	./csstoh powertop.css css.h
+css.h: powertop.css
+	$(SHELL) ./csstoh.sh powertop.css css.h
 =

diff --git a/src/csstoh.sh b/src/csstoh.sh
new file mode 100644
index 0000000..cc9ad3f
--- /dev/null
+++ b/src/csstoh.sh
@@ -0,0 +1,44 @@
+#!/bin/sh
+#
+# This program file is free software; you can redistribute it and/or modif=
y it
+# under the terms of the GNU General Public License as published by the
+# Free Software Foundation; version 2 of the License.
+#
+# This program is distributed in the hope that it will be useful, but WITH=
OUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program in a file named COPYING; if not, write to the
+# Free Software Foundation, Inc,
+# 51 Franklin Street, Fifth Floor,
+# Boston, MA 02110-1301 USA
+# or just google for it.
+#
+# Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
+
+if [ $# -lt 2 ]; then
+	echo "Usage: csstoh.sh cssfile header.h"
+	exit 1
+fi
+
+if [ ! -r $1 ]; then
+	echo "Can't find file $1"
+	exit 1
+fi
+
+if ! echo -n >$2; then
+	echo "Can't open file $2 for writing."
+	exit 1
+fi
+
+echo "#ifndef __INCLUDE_GUARD_CCS_H" >> $2
+echo "#define __INCLUDE_GUARD_CCS_H" >> $2
+echo >> $2
+echo "const char css[] =3D " >> $2
+
+sed -r 's/^(.*)$/\t\"\1\\n\"/' $1 >> $2
+
+echo ";" >> $2
+echo "#endif" >> $2
-- =

1.7.5.4


--===============3718933256845246407==--

