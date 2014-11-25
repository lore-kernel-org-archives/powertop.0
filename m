Content-Type: multipart/mixed; boundary="===============7732567700269984781=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 07/15] configure: use autoconf-archive
 ax_cxx_compile_stdcxx_11.m4
Date: Tue, 25 Nov 2014 21:16:20 +0000
Message-ID: <1416950188-16616-8-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7732567700269984781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ensure the powertop is compiled C++11 compliant compiler.  That allows
project contributors to use features from the latest standard without
hesitation are they allowed in this project.  The idea is to grant
greater liberties to upstream in cost of a dependency to downstream.

Notice that adding a downstream dependency to C++11 compliant compiler is
not outrageously unreasonable.  Many of the C++11 features has been
supported quite a while.  That said use of some features, such as
attributes (N2761), may still make maintainers to be unhappy if the case
is not justified well enough.

Reference: http://en.cppreference.com/w/cpp/compiler_support
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 configure.ac                   |   1 +
 m4/ax_cxx_compile_stdcxx_11.m4 | 142 +++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 143 insertions(+)
 create mode 100644 m4/ax_cxx_compile_stdcxx_11.m4

diff --git a/configure.ac b/configure.ac
index b9ee05a..79ea055 100644
--- a/configure.ac
+++ b/configure.ac
@@ -35,6 +35,7 @@ AC_PROG_CC
 AC_PROG_INSTALL
 AM_PROG_CC_C_O
 GCC_FORTIFY_SOURCE_CC
+AX_CXX_COMPILE_STDCXX_11([noext], [mandatory])
 =

 # Checks for libraries.
 AX_PTHREAD([
diff --git a/m4/ax_cxx_compile_stdcxx_11.m4 b/m4/ax_cxx_compile_stdcxx_11.m4
new file mode 100644
index 0000000..163a4c6
--- /dev/null
+++ b/m4/ax_cxx_compile_stdcxx_11.m4
@@ -0,0 +1,142 @@
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+#  http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_11.h=
tml
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+#
+# SYNOPSIS
+#
+#   AX_CXX_COMPILE_STDCXX_11([ext|noext],[mandatory|optional])
+#
+# DESCRIPTION
+#
+#   Check for baseline language coverage in the compiler for the C++11
+#   standard; if necessary, add switches to CXXFLAGS to enable support.
+#
+#   The first argument, if specified, indicates whether you insist on an
+#   extended mode (e.g. -std=3Dgnu++11) or a strict conformance mode (e.g.
+#   -std=3Dc++11).  If neither is specified, you get whatever works, with
+#   preference for an extended mode.
+#
+#   The second argument, if specified 'mandatory' or if left unspecified,
+#   indicates that baseline C++11 support is required and that the macro
+#   should error out if no mode with that support is found.  If specified
+#   'optional', then configuration proceeds regardless, after defining
+#   HAVE_CXX11 if and only if a supporting mode is found.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Benjamin Kosnik <bkoz(a)redhat.com>
+#   Copyright (c) 2012 Zack Weinberg <zackw(a)panix.com>
+#   Copyright (c) 2013 Roy Stogner <roystgnr(a)ices.utexas.edu>
+#   Copyright (c) 2014 Alexey Sokolov <sokolov(a)google.com>
+#
+#   Copying and distribution of this file, with or without modification, a=
re
+#   permitted in any medium without royalty provided the copyright notice
+#   and this notice are preserved. This file is offered as-is, without any
+#   warranty.
+
+#serial 4
+
+m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [[
+  template <typename T>
+    struct check
+    {
+      static_assert(sizeof(int) <=3D sizeof(T), "not big enough");
+    };
+
+    struct Base {
+    virtual void f() {}
+    };
+    struct Child : public Base {
+    virtual void f() override {}
+    };
+
+    typedef check<check<bool>> right_angle_brackets;
+
+    int a;
+    decltype(a) b;
+
+    typedef check<int> check_type;
+    check_type c;
+    check_type&& cr =3D static_cast<check_type&&>(c);
+
+    auto d =3D a;
+    auto l =3D [](){};
+]])
+
+AC_DEFUN([AX_CXX_COMPILE_STDCXX_11], [dnl
+  m4_if([$1], [], [],
+        [$1], [ext], [],
+        [$1], [noext], [],
+        [m4_fatal([invalid argument `$1' to AX_CXX_COMPILE_STDCXX_11])])dnl
+  m4_if([$2], [], [ax_cxx_compile_cxx11_required=3Dtrue],
+        [$2], [mandatory], [ax_cxx_compile_cxx11_required=3Dtrue],
+        [$2], [optional], [ax_cxx_compile_cxx11_required=3Dfalse],
+        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX_1=
1])])
+  AC_LANG_PUSH([C++])dnl
+  ac_success=3Dno
+  AC_CACHE_CHECK(whether $CXX supports C++11 features by default,
+  ax_cv_cxx_compile_cxx11,
+  [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])=
],
+    [ax_cv_cxx_compile_cxx11=3Dyes],
+    [ax_cv_cxx_compile_cxx11=3Dno])])
+  if test x$ax_cv_cxx_compile_cxx11 =3D xyes; then
+    ac_success=3Dyes
+  fi
+
+  m4_if([$1], [noext], [], [dnl
+  if test x$ac_success =3D xno; then
+    for switch in -std=3Dgnu++11 -std=3Dgnu++0x; do
+      cachevar=3DAS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
+      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
+                     $cachevar,
+        [ac_save_CXXFLAGS=3D"$CXXFLAGS"
+         CXXFLAGS=3D"$CXXFLAGS $switch"
+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_test=
body])],
+          [eval $cachevar=3Dyes],
+          [eval $cachevar=3Dno])
+         CXXFLAGS=3D"$ac_save_CXXFLAGS"])
+      if eval test x\$$cachevar =3D xyes; then
+        CXXFLAGS=3D"$CXXFLAGS $switch"
+        ac_success=3Dyes
+        break
+      fi
+    done
+  fi])
+
+  m4_if([$1], [ext], [], [dnl
+  if test x$ac_success =3D xno; then
+    for switch in -std=3Dc++11 -std=3Dc++0x; do
+      cachevar=3DAS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
+      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
+                     $cachevar,
+        [ac_save_CXXFLAGS=3D"$CXXFLAGS"
+         CXXFLAGS=3D"$CXXFLAGS $switch"
+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_test=
body])],
+          [eval $cachevar=3Dyes],
+          [eval $cachevar=3Dno])
+         CXXFLAGS=3D"$ac_save_CXXFLAGS"])
+      if eval test x\$$cachevar =3D xyes; then
+        CXXFLAGS=3D"$CXXFLAGS $switch"
+        ac_success=3Dyes
+        break
+      fi
+    done
+  fi])
+  AC_LANG_POP([C++])
+  if test x$ax_cxx_compile_cxx11_required =3D xtrue; then
+    if test x$ac_success =3D xno; then
+      AC_MSG_ERROR([*** A compiler with support for C++11 language feature=
s is required.])
+    fi
+  else
+    if test x$ac_success =3D xno; then
+      HAVE_CXX11=3D0
+      AC_MSG_NOTICE([No compiler with C++11 support was found])
+    else
+      HAVE_CXX11=3D1
+      AC_DEFINE(HAVE_CXX11,1,
+                [define if the compiler supports basic C++11 syntax])
+    fi
+
+    AC_SUBST(HAVE_CXX11)
+  fi
+])
-- =

2.1.3


--===============7732567700269984781==--

