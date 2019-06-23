Content-Type: multipart/mixed; boundary="===============1016241131940047644=="
MIME-Version: 1.0
From: Anthony Wong <yp at anthonywong.net>
Subject: [Powertop] [PATCH] Add bash command-line completion.
Date: Sun, 23 Jun 2019 12:56:34 +0800
Message-ID: <20190623045634.18820-1-yp@anthonywong.net>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1016241131940047644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Anthony Wong <yp(a)anthonywong.net>
---
 Makefile.am                         |  3 +-
 configure.ac                        |  8 ++++++
 scripts/bash-completion/Makefile.am |  2 ++
 scripts/bash-completion/powertop    | 43 +++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 scripts/bash-completion/Makefile.am
 create mode 100644 scripts/bash-completion/powertop

diff --git a/Makefile.am b/Makefile.am
index 3aabb22..ffb5e91 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -5,7 +5,8 @@ SUBDIRS =3D \
 	traceevent \
 	src \
 	po \
-	doc
+	doc \
+	scripts/bash-completion
 =

 EXTRA_DIST =3D \
 	config.rpath \
diff --git a/configure.ac b/configure.ac
index d6a15e1..ca7f1d5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -17,6 +17,7 @@ AC_CONFIG_FILES([
 	traceevent/Makefile
 	po/Makefile.in
 	doc/Makefile
+	scripts/bash-completion/Makefile
 ])
 AC_CONFIG_SRCDIR([src/main.cpp])
 AC_CONFIG_MACRO_DIR([m4])
@@ -154,4 +155,11 @@ AC_SEARCH_LIBS([inet_aton], [resolv], [], [
 AC_DEFINE([PACKAGE_SHORT_VERSION], m4_esyscmd_s([cat version-short]),
 	[Short package version])
 =

+AS_IF([`pkg-config --exists bash-completion`], [
+	bashcompletiondir=3D`pkg-config --variable=3Dcompletionsdir --define-vari=
able=3Dprefix=3D${prefix} bash-completion`
+], [
+	bashcompletiondir=3D${datadir}/bash-completion/completions
+])
+AC_SUBST([bashcompletiondir], [$bashcompletiondir])
+
 AC_OUTPUT
diff --git a/scripts/bash-completion/Makefile.am b/scripts/bash-completion/=
Makefile.am
new file mode 100644
index 0000000..45073bd
--- /dev/null
+++ b/scripts/bash-completion/Makefile.am
@@ -0,0 +1,2 @@
+bashcompletiondir =3D @bashcompletiondir@
+dist_bashcompletion_DATA =3D powertop
diff --git a/scripts/bash-completion/powertop b/scripts/bash-completion/pow=
ertop
new file mode 100644
index 0000000..03d238e
--- /dev/null
+++ b/scripts/bash-completion/powertop
@@ -0,0 +1,43 @@
+#!/bin/bash
+#
+# Powertop tab completion for bash.
+#
+# This is part of PowerTOP
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
+
+_powertop()
+{
+    local cur prev words cword split
+    _init_completion -s || return
+
+	case $prev in
+		'-C'|'--csv'|'--extech'|'-r'|'--html'|'-w'|'--workload')
+			_filedir
+			return 0
+			;;
+    esac
+
+    local all_long_options=3D$( _parse_help "$1" )
+
+    COMPREPLY=3D( $( compgen -W "${all_long_options}" -- "$cur" ) )
+
+    return 0
+}
+
+# load the completion
+complete -F _powertop powertop
-- =

2.20.1


--===============1016241131940047644==--

