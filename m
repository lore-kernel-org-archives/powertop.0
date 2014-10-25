Content-Type: multipart/mixed; boundary="===============5413820333562836848=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 05/14] configure: use AC_USE_SYSTEM_EXTENSIONS to
 determine features
Date: Sat, 25 Oct 2014 18:33:52 +0100
Message-ID: <1414258441-30099-6-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5413820333562836848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The AC_USE_SYSTEM_EXTENSIONS will enable everything that a system allows
to be enabled, so there is no longer need for a source file specific
*_SOURCE definitions.  Secondly the uses of _BSD_SOURCE that are removed
in this change are part of deprecated API.  See reference link for
details.

Reference: https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;a=3Dcommit;h=
=3Dc941736c92fa3a319221f65f6755659b2a5e0a20
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 configure.ac                         | 1 +
 src/report/report-formatter-base.cpp | 2 --
 src/report/report-formatter-csv.cpp  | 2 --
 src/report/report-formatter-html.cpp | 2 --
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index 27e52ad..dc376ce 100644
--- a/configure.ac
+++ b/configure.ac
@@ -18,6 +18,7 @@ AC_CONFIG_FILES([
 ])
 AC_CONFIG_SRCDIR([src/main.cpp])
 AC_CONFIG_MACRO_DIR([m4])
+AC_USE_SYSTEM_EXTENSIONS
 AC_CONFIG_HEADERS([config.h])
 GETTEXT_PACKAGE=3Dpowertop
 AC_SUBST([GETTEXT_PACKAGE])
diff --git a/src/report/report-formatter-base.cpp b/src/report/report-forma=
tter-base.cpp
index 7c5159e..4e10603 100644
--- a/src/report/report-formatter-base.cpp
+++ b/src/report/report-formatter-base.cpp
@@ -23,8 +23,6 @@
  * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
  * 2012.10 */
 =

-#define _BSD_SOURCE
-
 /* Uncomment to disable asserts */
 /*#define NDEBUG*/
 =

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index 523e79b..0360fd8 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -23,8 +23,6 @@
  * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
  * 2012.10 */
 =

-#define _BSD_SOURCE
-
 /* Uncomment to disable asserts */
 /*#define NDEBUG*/
 =

diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index 3803962..41440f9 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -23,8 +23,6 @@
  * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
  * 2012.10 */
 =

-#define _BSD_SOURCE
-
 /* Uncomment to disable asserts */
 /*#define NDEBUG*/
 =

-- =

2.1.2


--===============5413820333562836848==--

