Content-Type: multipart/mixed; boundary="===============1027672060336459954=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 3/3 v1] configure.ac: ax_add_fortify_source
Date: Tue, 11 Feb 2020 14:15:42 -0800
Message-ID: <20200211221542.46228-4-joe.konno@linux.intel.com>
In-Reply-To: 20200211221542.46228-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1027672060336459954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Use a maintained autoconf-archive macro to determine whether we need to
add -D_FORTIFY_SOURCE=3D2, or if the underlying OS (or toolchain) has it
baked in.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 configure.ac                |  2 +-
 m4/gcc_fortify_source_cc.m4 | 29 -----------------------------
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 m4/gcc_fortify_source_cc.m4

diff --git a/configure.ac b/configure.ac
index 0f9cbd2e8625..d5d33762a136 100644
--- a/configure.ac
+++ b/configure.ac
@@ -36,7 +36,7 @@ AC_PROG_LIBTOOL
 AC_PROG_CC
 AC_PROG_INSTALL
 AM_PROG_CC_C_O
-GCC_FORTIFY_SOURCE_CC
+AX_ADD_FORTIFY_SOURCE
 AX_CXX_COMPILE_STDCXX_11([noext], [mandatory])
 =

 # Checks for libraries.
diff --git a/m4/gcc_fortify_source_cc.m4 b/m4/gcc_fortify_source_cc.m4
deleted file mode 100644
index 1206672c955d..000000000000
--- a/m4/gcc_fortify_source_cc.m4
+++ /dev/null
@@ -1,29 +0,0 @@
-dnl GCC_FORTIFY_SOURCE_CC
-dnl checks -D_FORTIFY_SOURCE with the C++ compiler, if it exists then
-dnl updates CXXCPP
-AC_DEFUN([GCC_FORTIFY_SOURCE_CC],[
-  AC_LANG_ASSERT([C++])
-  AS_IF([test "X$CXX" !=3D "X"], [
-    AC_MSG_CHECKING([for FORTIFY_SOURCE support])
-    fs_old_cxxcpp=3D"$CXXCPP"
-    fs_old_cxxflags=3D"$CXXFLAGS"
-    CXXCPP=3D"$CXXCPP -D_FORTIFY_SOURCE=3D2"
-    CXXFLAGS=3D"$CXXFLAGS -Werror"
-    AC_COMPILE_IFELSE([
-      AC_LANG_PROGRAM([[]], [[
-        int main(void) {
-        #if !(__GNUC_PREREQ (4, 1) )
-        #error No FORTIFY_SOURCE support
-        #endif
-          return 0;
-        }
-      ]], [
-        AC_MSG_RESULT([yes])
-      ], [
-        AC_MSG_RESULT([no])
-        CXXCPP=3D"$fs_old_cxxcpp"
-      ])
-    ])
-    CXXFLAGS=3D"$fs_old_cxxflags"
-  ])
-])
-- =

2.25.0

--===============1027672060336459954==--

