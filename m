Content-Type: multipart/mixed; boundary="===============8579629540872364381=="
MIME-Version: 1.0
From: Thomas Waldecker <thomas.waldecker at gmail.com>
Subject: [Powertop] [PATCH] csstoh shell-script for cross-compiling
Date: Fri, 01 Feb 2013 21:37:09 +0100
Message-ID: <1359751029-7114-1-git-send-email-thomas.waldecker@gmail.com>
In-Reply-To: 20130131230555.GA7209@bacon.lysator.liu.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8579629540872364381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Updated the shellscript with changes made by Igor posted in mailing list
https://lists.01.org/pipermail/powertop/2012-July/000165.html
---
 .gitignore      |  1 -
 src/Makefile.am |  3 +--
 src/csstoh.sh   | 21 ++++++++++-----------
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/.gitignore b/.gitignore
index 96ffdba..35d41c2 100644
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
index a53d942..398b8a7 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -46,6 +46,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $=
(LIBNL_LIBS) $(LIBZ_LIBS)
 BUILT_SOURCES =3D css.h
 CLEANFILES =3D css.h
 css.h: powertop.css
-	chmod +x ./csstoh.sh
-	./csstoh.sh "$(srcdir)"/powertop.css css.h
+	$(SHELL) ./csstoh.sh powertop.css css.h
 =

diff --git a/src/csstoh.sh b/src/csstoh.sh
index 5918d12..9d4100b 100755
--- a/src/csstoh.sh
+++ b/src/csstoh.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 #
 # This program file is free software; you can redistribute it and/or modif=
y it
 # under the terms of the GNU General Public License as published by the
@@ -16,8 +16,7 @@
 # Boston, MA 02110-1301 USA
 # or just google for it.
 #
-# Written by Igor Zhbanov<i.zhbanov at samsung.com>
-
+# Written by Igor Zhbanov <i.zhbanov at samsung.com>
 =

 if [ $# -lt 2 ]; then
 	echo "Usage: csstoh.sh cssfile header.h"
@@ -29,17 +28,17 @@ if [ ! -r $1 ]; then
 	exit 1
 fi
 =

-if ! echo -n>$2; then
+if ! echo -n >$2; then
 	echo "Can't open file $2 for writing."
 	exit 1
 fi
 =

-echo "#ifndef __INCLUDE_GUARD_CCS_H">>  $2
-echo "#define __INCLUDE_GUARD_CCS_H">>  $2
-echo>>  $2
-echo "const char css[] =3D ">>  $2
+echo "#ifndef __INCLUDE_GUARD_CCS_H" >> $2
+echo "#define __INCLUDE_GUARD_CCS_H" >> $2
+echo >> $2
+echo "const char css[] =3D " >> $2
 =

-sed -r 's/^(.*)$/\t\"\1\\n\"/' $1>>  $2
+sed -r 's/^(.*)$/\t\"\1\\n\"/' $1 >> $2
 =

-echo ";">>  $2
-echo "#endif">>  $2
+echo ";" >> $2
+echo "#endif" >> $2
-- =

1.8.1


--===============8579629540872364381==--

