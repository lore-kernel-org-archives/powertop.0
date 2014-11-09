Content-Type: multipart/mixed; boundary="===============1728793792487873008=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 02/14] configure: use autoconf-archive
 ax_pthread.m4
Date: Sun, 09 Nov 2014 13:14:19 +0000
Message-ID: <1415538871-11411-3-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1728793792487873008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

The configuration script "AX_PTHREAD" was added to the build specification
so that corresponding special parameters will be taken into account.

Reference: http://www.gnu.org/software/autoconf-archive/ax_pthread.html
Reviewed-by: SF Markus Elfring <elfring(a)users.sourceforge.net>
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 .gitignore       |  39 ++++++-
 configure.ac     |  11 +-
 m4/ax_pthread.m4 | 332 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 376 insertions(+), 6 deletions(-)
 create mode 100644 m4/ax_pthread.m4

diff --git a/.gitignore b/.gitignore
index b9188a1..f879840 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,9 +13,6 @@
 Makefile
 Makefile.in
 =

-# directories
-/m4/
-
 # individual files
 /ABOUT-NLS
 /ChangeLog
@@ -35,6 +32,42 @@ Makefile.in
 /install-sh
 /libtool
 /ltmain.sh
+/m4/codeset.m4
+/m4/fcntl-o.m4
+/m4/gettext.m4
+/m4/glibc2.m4
+/m4/glibc21.m4
+/m4/iconv.m4
+/m4/intdiv0.m4
+/m4/intl.m4
+/m4/intldir.m4
+/m4/intlmacosx.m4
+/m4/intmax.m4
+/m4/inttypes-pri.m4
+/m4/inttypes_h.m4
+/m4/lcmessage.m4
+/m4/lib-ld.m4
+/m4/lib-link.m4
+/m4/lib-prefix.m4
+/m4/libtool.m4
+/m4/lock.m4
+/m4/longlong.m4
+/m4/ltoptions.m4
+/m4/ltsugar.m4
+/m4/ltversion.m4
+/m4/lt~obsolete.m4
+/m4/nls.m4
+/m4/po.m4
+/m4/printf-posix.m4
+/m4/progtest.m4
+/m4/size_max.m4
+/m4/stdint_h.m4
+/m4/threadlib.m4
+/m4/uintmax_t.m4
+/m4/visibility.m4
+/m4/wchar_t.m4
+/m4/wint_t.m4
+/m4/xsize.m4
 /missing
 /po/Makevars.template
 /po/POTFILES
diff --git a/configure.ac b/configure.ac
index b7a7104..e5732fd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -35,6 +35,14 @@ AC_PROG_INSTALL
 AM_PROG_CC_C_O
 =

 # Checks for libraries.
+AX_PTHREAD([
+    LIBS=3D"$PTHREAD_LIBS $LIBS"
+    CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+    CC=3D"$PTHREAD_CC"
+  ], [
+    AC_MSG_ERROR([Could not configure pthreads support])
+])
+
 # Checks for header files.
 AC_CHECK_HEADERS([ \
 	fcntl.h \
@@ -132,9 +140,6 @@ AS_IF([test "$has_libpci" -eq 0], [
 	])
 ])
 =

-AC_SEARCH_LIBS([pthread_create], [pthread], [], [
-	AC_MSG_ERROR([libpthread is required but was not found])
-], [])
 AC_SEARCH_LIBS([inet_aton], [resolv], [], [
 	AC_MSG_ERROR([libresolv is required but was not found])
 ], [])
diff --git a/m4/ax_pthread.m4 b/m4/ax_pthread.m4
new file mode 100644
index 0000000..d383ad5
--- /dev/null
+++ b/m4/ax_pthread.m4
@@ -0,0 +1,332 @@
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+#        http://www.gnu.org/software/autoconf-archive/ax_pthread.html
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+#
+# SYNOPSIS
+#
+#   AX_PTHREAD([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
+#
+# DESCRIPTION
+#
+#   This macro figures out how to build C programs using POSIX threads. It
+#   sets the PTHREAD_LIBS output variable to the threads library and linker
+#   flags, and the PTHREAD_CFLAGS output variable to any special C compiler
+#   flags that are needed. (The user can also force certain compiler
+#   flags/libs to be tested by setting these environment variables.)
+#
+#   Also sets PTHREAD_CC to any special C compiler that is needed for
+#   multi-threaded programs (defaults to the value of CC otherwise). (This
+#   is necessary on AIX to use the special cc_r compiler alias.)
+#
+#   NOTE: You are assumed to not only compile your program with these flag=
s,
+#   but also link it with them as well. e.g. you should link with
+#   $PTHREAD_CC $CFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS $LIBS
+#
+#   If you are only building threads programs, you may wish to use these
+#   variables in your default LIBS, CFLAGS, and CC:
+#
+#     LIBS=3D"$PTHREAD_LIBS $LIBS"
+#     CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+#     CC=3D"$PTHREAD_CC"
+#
+#   In addition, if the PTHREAD_CREATE_JOINABLE thread-attribute constant
+#   has a nonstandard name, defines PTHREAD_CREATE_JOINABLE to that name
+#   (e.g. PTHREAD_CREATE_UNDETACHED on AIX).
+#
+#   Also HAVE_PTHREAD_PRIO_INHERIT is defined if pthread is found and the
+#   PTHREAD_PRIO_INHERIT symbol is defined when compiling with
+#   PTHREAD_CFLAGS.
+#
+#   ACTION-IF-FOUND is a list of shell commands to run if a threads library
+#   is found, and ACTION-IF-NOT-FOUND is a list of commands to run it if it
+#   is not found. If ACTION-IF-FOUND is not specified, the default action
+#   will define HAVE_PTHREAD.
+#
+#   Please let the authors know if this macro fails on any platform, or if
+#   you have any other suggestions or comments. This macro was based on wo=
rk
+#   by SGJ on autoconf scripts for FFTW (http://www.fftw.org/) (with help
+#   from M. Frigo), as well as ac_pthread and hb_pthread macros posted by
+#   Alejandro Forero Cuervo to the autoconf macro repository. We are also
+#   grateful for the helpful feedback of numerous users.
+#
+#   Updated for Autoconf 2.68 by Daniel Richard G.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Steven G. Johnson <stevenj(a)alum.mit.edu>
+#   Copyright (c) 2011 Daniel Richard G. <skunk(a)iSKUNK.ORG>
+#
+#   This program is free software: you can redistribute it and/or modify it
+#   under the terms of the GNU General Public License as published by the
+#   Free Software Foundation, either version 3 of the License, or (at your
+#   option) any later version.
+#
+#   This program is distributed in the hope that it will be useful, but
+#   WITHOUT ANY WARRANTY; without even the implied warranty of
+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Gener=
al
+#   Public License for more details.
+#
+#   You should have received a copy of the GNU General Public License along
+#   with this program. If not, see <http://www.gnu.org/licenses/>.
+#
+#   As a special exception, the respective Autoconf Macro's copyright owner
+#   gives unlimited permission to copy, distribute and modify the configure
+#   scripts that are the output of Autoconf when processing the Macro. You
+#   need not follow the terms of the GNU General Public License when using
+#   or distributing such scripts, even though portions of the text of the
+#   Macro appear in them. The GNU General Public License (GPL) does govern
+#   all other use of the material that constitutes the Autoconf Macro.
+#
+#   This special exception to the GPL applies to versions of the Autoconf
+#   Macro released by the Autoconf Archive. When you make and distribute a
+#   modified version of the Autoconf Macro, you may extend this special
+#   exception to the GPL to apply to your modified version as well.
+
+#serial 21
+
+AU_ALIAS([ACX_PTHREAD], [AX_PTHREAD])
+AC_DEFUN([AX_PTHREAD], [
+AC_REQUIRE([AC_CANONICAL_HOST])
+AC_LANG_PUSH([C])
+ax_pthread_ok=3Dno
+
+# We used to check for pthread.h first, but this fails if pthread.h
+# requires special compiler flags (e.g. on True64 or Sequent).
+# It gets checked for in the link test anyway.
+
+# First of all, check if the user has set any of the PTHREAD_LIBS,
+# etcetera environment variables, and if threads linking works using
+# them:
+if test x"$PTHREAD_LIBS$PTHREAD_CFLAGS" !=3D x; then
+        save_CFLAGS=3D"$CFLAGS"
+        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+        save_LIBS=3D"$LIBS"
+        LIBS=3D"$PTHREAD_LIBS $LIBS"
+        AC_MSG_CHECKING([for pthread_join in LIBS=3D$PTHREAD_LIBS with CFL=
AGS=3D$PTHREAD_CFLAGS])
+        AC_TRY_LINK_FUNC([pthread_join], [ax_pthread_ok=3Dyes])
+        AC_MSG_RESULT([$ax_pthread_ok])
+        if test x"$ax_pthread_ok" =3D xno; then
+                PTHREAD_LIBS=3D""
+                PTHREAD_CFLAGS=3D""
+        fi
+        LIBS=3D"$save_LIBS"
+        CFLAGS=3D"$save_CFLAGS"
+fi
+
+# We must check for the threads library under a number of different
+# names; the ordering is very important because some systems
+# (e.g. DEC) have both -lpthread and -lpthreads, where one of the
+# libraries is broken (non-POSIX).
+
+# Create a list of thread flags to try.  Items starting with a "-" are
+# C compiler flags, and other items are library names, except for "none"
+# which indicates that we try without any flags at all, and "pthread-confi=
g"
+# which is a program returning the flags for the Pth emulation library.
+
+ax_pthread_flags=3D"pthreads none -Kthread -kthread lthread -pthread -pthr=
eads -mthreads pthread --thread-safe -mt pthread-config"
+
+# The ordering *is* (sometimes) important.  Some notes on the
+# individual items follow:
+
+# pthreads: AIX (must check this before -lpthread)
+# none: in case threads are in libc; should be tried before -Kthread and
+#       other compiler flags to prevent continual compiler warnings
+# -Kthread: Sequent (threads in libc, but -Kthread needed for pthread.h)
+# -kthread: FreeBSD kernel threads (preferred to -pthread since SMP-able)
+# lthread: LinuxThreads port on FreeBSD (also preferred to -pthread)
+# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads)
+# -pthreads: Solaris/gcc
+# -mthreads: Mingw32/gcc, Lynx/gcc
+# -mt: Sun Workshop C (may only link SunOS threads [-lthread], but it
+#      doesn't hurt to check since this sometimes defines pthreads too;
+#      also defines -D_REENTRANT)
+#      ... -mt is also the pthreads flag for HP/aCC
+# pthread: Linux, etcetera
+# --thread-safe: KAI C++
+# pthread-config: use pthread-config program (for GNU Pth library)
+
+case ${host_os} in
+        solaris*)
+
+        # On Solaris (at least, for some versions), libc contains stubbed
+        # (non-functional) versions of the pthreads routines, so link-based
+        # tests will erroneously succeed.  (We need to link with -pthreads=
/-mt/
+        # -lpthread.)  (The stubs are missing pthread_cleanup_push, or rat=
her
+        # a function called by this macro, so we could check for that, but
+        # who knows whether they'll stub that too in a future libc.)  So,
+        # we'll just look for -pthreads and -lpthread first:
+
+        ax_pthread_flags=3D"-pthreads pthread -mt -pthread $ax_pthread_fla=
gs"
+        ;;
+
+        darwin*)
+        ax_pthread_flags=3D"-pthread $ax_pthread_flags"
+        ;;
+esac
+
+# Clang doesn't consider unrecognized options an error unless we specify
+# -Werror. We throw in some extra Clang-specific options to ensure that
+# this doesn't happen for GCC, which also accepts -Werror.
+
+AC_MSG_CHECKING([if compiler needs -Werror to reject unknown flags])
+save_CFLAGS=3D"$CFLAGS"
+ax_pthread_extra_flags=3D"-Werror"
+CFLAGS=3D"$CFLAGS $ax_pthread_extra_flags -Wunknown-warning-option -Wsizeo=
f-array-argument"
+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([int foo(void);],[foo()])],
+                  [AC_MSG_RESULT([yes])],
+                  [ax_pthread_extra_flags=3D
+                   AC_MSG_RESULT([no])])
+CFLAGS=3D"$save_CFLAGS"
+
+if test x"$ax_pthread_ok" =3D xno; then
+for flag in $ax_pthread_flags; do
+
+        case $flag in
+                none)
+                AC_MSG_CHECKING([whether pthreads work without any flags])
+                ;;
+
+                -*)
+                AC_MSG_CHECKING([whether pthreads work with $flag])
+                PTHREAD_CFLAGS=3D"$flag"
+                ;;
+
+                pthread-config)
+                AC_CHECK_PROG([ax_pthread_config], [pthread-config], [yes]=
, [no])
+                if test x"$ax_pthread_config" =3D xno; then continue; fi
+                PTHREAD_CFLAGS=3D"`pthread-config --cflags`"
+                PTHREAD_LIBS=3D"`pthread-config --ldflags` `pthread-config=
 --libs`"
+                ;;
+
+                *)
+                AC_MSG_CHECKING([for the pthreads library -l$flag])
+                PTHREAD_LIBS=3D"-l$flag"
+                ;;
+        esac
+
+        save_LIBS=3D"$LIBS"
+        save_CFLAGS=3D"$CFLAGS"
+        LIBS=3D"$PTHREAD_LIBS $LIBS"
+        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS $ax_pthread_extra_flags"
+
+        # Check for various functions.  We must include pthread.h,
+        # since some functions may be macros.  (On the Sequent, we
+        # need a special flag -Kthread to make this header compile.)
+        # We check for pthread_join because it is in -lpthread on IRIX
+        # while pthread_create is in libc.  We check for pthread_attr_init
+        # due to DEC craziness with -lpthreads.  We check for
+        # pthread_cleanup_push because it is one of the few pthread
+        # functions on Solaris that doesn't have a non-functional libc stu=
b.
+        # We try pthread_create on general principles.
+        AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>
+                        static void routine(void *a) { a =3D 0; }
+                        static void *start_routine(void *a) { return a; }],
+                       [pthread_t th; pthread_attr_t attr;
+                        pthread_create(&th, 0, start_routine, 0);
+                        pthread_join(th, 0);
+                        pthread_attr_init(&attr);
+                        pthread_cleanup_push(routine, 0);
+                        pthread_cleanup_pop(0) /* ; */])],
+                [ax_pthread_ok=3Dyes],
+                [])
+
+        LIBS=3D"$save_LIBS"
+        CFLAGS=3D"$save_CFLAGS"
+
+        AC_MSG_RESULT([$ax_pthread_ok])
+        if test "x$ax_pthread_ok" =3D xyes; then
+                break;
+        fi
+
+        PTHREAD_LIBS=3D""
+        PTHREAD_CFLAGS=3D""
+done
+fi
+
+# Various other checks:
+if test "x$ax_pthread_ok" =3D xyes; then
+        save_LIBS=3D"$LIBS"
+        LIBS=3D"$PTHREAD_LIBS $LIBS"
+        save_CFLAGS=3D"$CFLAGS"
+        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+
+        # Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
+        AC_MSG_CHECKING([for joinable pthread attribute])
+        attr_name=3Dunknown
+        for attr in PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_UNDETACHED; do
+            AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>],
+                           [int attr =3D $attr; return attr /* ; */])],
+                [attr_name=3D$attr; break],
+                [])
+        done
+        AC_MSG_RESULT([$attr_name])
+        if test "$attr_name" !=3D PTHREAD_CREATE_JOINABLE; then
+            AC_DEFINE_UNQUOTED([PTHREAD_CREATE_JOINABLE], [$attr_name],
+                               [Define to necessary symbol if this constant
+                                uses a non-standard name on your system.])
+        fi
+
+        AC_MSG_CHECKING([if more special flags are required for pthreads])
+        flag=3Dno
+        case ${host_os} in
+            aix* | freebsd* | darwin*) flag=3D"-D_THREAD_SAFE";;
+            osf* | hpux*) flag=3D"-D_REENTRANT";;
+            solaris*)
+            if test "$GCC" =3D "yes"; then
+                flag=3D"-D_REENTRANT"
+            else
+                # TODO: What about Clang on Solaris?
+                flag=3D"-mt -D_REENTRANT"
+            fi
+            ;;
+        esac
+        AC_MSG_RESULT([$flag])
+        if test "x$flag" !=3D xno; then
+            PTHREAD_CFLAGS=3D"$flag $PTHREAD_CFLAGS"
+        fi
+
+        AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],
+            [ax_cv_PTHREAD_PRIO_INHERIT], [
+                AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <pthread.h>]],
+                                                [[int i =3D PTHREAD_PRIO_I=
NHERIT;]])],
+                    [ax_cv_PTHREAD_PRIO_INHERIT=3Dyes],
+                    [ax_cv_PTHREAD_PRIO_INHERIT=3Dno])
+            ])
+        AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" =3D "xyes"],
+            [AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], [1], [Have PTHREAD_PRI=
O_INHERIT.])])
+
+        LIBS=3D"$save_LIBS"
+        CFLAGS=3D"$save_CFLAGS"
+
+        # More AIX lossage: compile with *_r variant
+        if test "x$GCC" !=3D xyes; then
+            case $host_os in
+                aix*)
+                AS_CASE(["x/$CC"],
+                  [x*/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128|x*/x=
lc|x*/xlc_v6|x*/xlc128|x*/xlc128_v6],
+                  [#handle absolute path differently from PATH based progr=
am lookup
+                   AS_CASE(["x$CC"],
+                     [x/*],
+                     [AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_CC=3D"${=
CC}_r"])],
+                     [AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])])])
+                ;;
+            esac
+        fi
+fi
+
+test -n "$PTHREAD_CC" || PTHREAD_CC=3D"$CC"
+
+AC_SUBST([PTHREAD_LIBS])
+AC_SUBST([PTHREAD_CFLAGS])
+AC_SUBST([PTHREAD_CC])
+
+# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
+if test x"$ax_pthread_ok" =3D xyes; then
+        ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have POS=
IX threads libraries and header files.])],[$1])
+        :
+else
+        ax_pthread_ok=3Dno
+        $2
+fi
+AC_LANG_POP
+])dnl AX_PTHREAD
-- =

2.1.3


--===============1728793792487873008==--

