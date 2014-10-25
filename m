Content-Type: multipart/mixed; boundary="===============4514534591416774999=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 06/14] powertop.m4: GCC_FORTIFY_SOURCE_CC copy idea
 of macro from Archlinux pacman
Date: Sat, 25 Oct 2014 18:33:53 +0100
Message-ID: <1414258441-30099-7-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4514534591416774999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The powertop.m4 is a collection file for autoconf m4 helper macros, such
as GCC_FORTIFY_SOURCE_CC.  The macro in case will define feature
_FORTIFY_SOURCE=3D2 when it is possible, instead of trying to enable when
it will not work, such as at times when optimization is turned off.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 configure.ac                |  2 ++
 m4/gcc_fortify_source_cc.m4 | 29 +++++++++++++++++++++++++++++
 src/Makefile.am             |  1 -
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 m4/gcc_fortify_source_cc.m4

diff --git a/configure.ac b/configure.ac
index dc376ce..e56a451 100644
--- a/configure.ac
+++ b/configure.ac
@@ -34,6 +34,7 @@ AC_PROG_LIBTOOL
 AC_PROG_CC
 AC_PROG_INSTALL
 AM_PROG_CC_C_O
+GCC_FORTIFY_SOURCE_CC
 =

 # Checks for libraries.
 AX_PTHREAD([
@@ -145,4 +146,5 @@ AC_SEARCH_LIBS([inet_aton], [resolv], [], [
 	AC_MSG_ERROR([libresolv is required but was not found])
 ], [])
 =

+
 AC_OUTPUT
diff --git a/m4/gcc_fortify_source_cc.m4 b/m4/gcc_fortify_source_cc.m4
new file mode 100644
index 0000000..1206672
--- /dev/null
+++ b/m4/gcc_fortify_source_cc.m4
@@ -0,0 +1,29 @@
+dnl GCC_FORTIFY_SOURCE_CC
+dnl checks -D_FORTIFY_SOURCE with the C++ compiler, if it exists then
+dnl updates CXXCPP
+AC_DEFUN([GCC_FORTIFY_SOURCE_CC],[
+  AC_LANG_ASSERT([C++])
+  AS_IF([test "X$CXX" !=3D "X"], [
+    AC_MSG_CHECKING([for FORTIFY_SOURCE support])
+    fs_old_cxxcpp=3D"$CXXCPP"
+    fs_old_cxxflags=3D"$CXXFLAGS"
+    CXXCPP=3D"$CXXCPP -D_FORTIFY_SOURCE=3D2"
+    CXXFLAGS=3D"$CXXFLAGS -Werror"
+    AC_COMPILE_IFELSE([
+      AC_LANG_PROGRAM([[]], [[
+        int main(void) {
+        #if !(__GNUC_PREREQ (4, 1) )
+        #error No FORTIFY_SOURCE support
+        #endif
+          return 0;
+        }
+      ]], [
+        AC_MSG_RESULT([yes])
+      ], [
+        AC_MSG_RESULT([no])
+        CXXCPP=3D"$fs_old_cxxcpp"
+      ])
+    ])
+    CXXFLAGS=3D"$fs_old_cxxflags"
+  ])
+])
diff --git a/src/Makefile.am b/src/Makefile.am
index 311b75e..bb2b369 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -134,7 +134,6 @@ powertop_CXXFLAGS =3D \
 =

 powertop_CPPFLAGS =3D \
 	-DLOCALEDIR=3D\"$(localedir)\" \
-	-D_FORTIFY_SOURCE=3D2 \
 	$(GLIB2_CFLAGS) \
 	$(LIBNL_CFLAGS) \
 	$(LIBZ_CFLAGS) \
-- =

2.1.2


--===============4514534591416774999==--

