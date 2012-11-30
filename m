Content-Type: multipart/mixed; boundary="===============8875575603389035684=="
MIME-Version: 1.0
From: Thomas Waldecker <thomas.waldecker at gmail.com>
Subject: [Powertop] [PATCH] csstoh.sh shell script fixes cross compiling issues
Date: Fri, 30 Nov 2012 13:46:27 +0100
Message-ID: <1354279587-20606-1-git-send-email-thomas.waldecker@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8875575603389035684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Thomas Waldecker <thomas.waldecker(a)tqs.de>

Added the csstoh.sh shell script from Igor Zhbanov found here:
http://lists.01.org/pipermail/powertop/2012-July/000151.html
also patched the Makefile.am to use the csstoh.sh script.
The compiled csstoh binary doesn't work for cross compiling,
however Igors Patch never got applied upstream.
---
 src/Makefile.am |    8 +++-----
 src/csstoh.sh   |   45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100755 src/csstoh.sh

diff --git a/src/Makefile.am b/src/Makefile.am
index f60426a..a53d942 100644
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

@@ -48,6 +45,7 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $=
(LIBNL_LIBS) $(LIBZ_LIBS)
 =

 BUILT_SOURCES =3D css.h
 CLEANFILES =3D css.h
-css.h: csstoh powertop.css
-	./csstoh "$(srcdir)"/powertop.css css.h
+css.h: powertop.css
+	chmod +x ./csstoh.sh
+	./csstoh.sh "$(srcdir)"/powertop.css css.h
 =

diff --git a/src/csstoh.sh b/src/csstoh.sh
new file mode 100755
index 0000000..5918d12
--- /dev/null
+++ b/src/csstoh.sh
@@ -0,0 +1,45 @@
+#!/bin/bash
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
+# Written by Igor Zhbanov<i.zhbanov at samsung.com>
+
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
+if ! echo -n>$2; then
+	echo "Can't open file $2 for writing."
+	exit 1
+fi
+
+echo "#ifndef __INCLUDE_GUARD_CCS_H">>  $2
+echo "#define __INCLUDE_GUARD_CCS_H">>  $2
+echo>>  $2
+echo "const char css[] =3D ">>  $2
+
+sed -r 's/^(.*)$/\t\"\1\\n\"/' $1>>  $2
+
+echo ";">>  $2
+echo "#endif">>  $2
-- =

1.7.9.5


--===============8875575603389035684==--

