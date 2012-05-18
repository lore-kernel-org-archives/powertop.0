Content-Type: multipart/mixed; boundary="===============8483837631030369129=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH] Move AC_LANG after AC_INIT to make it take effect.
Date: Fri, 18 May 2012 13:31:37 +0200
Message-ID: <1337340697.2972.2.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8483837631030369129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looking at config.log one sees that the tests are run using the C compiler
in spite of the AC_LANG line if AC_LANG is before AC_INIT.

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 configure.ac |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 2d56684..2a547d9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,9 +2,9 @@
 # Process this file with autoconf to produce a configure script.
 =

 AC_PREREQ([2.68])
-AC_LANG([C++])
 AC_INIT([powertop], [2.0], [power(a)bughost.org])
 AM_INIT_AUTOMAKE([-Wall -Werror foreign ])
+AC_LANG([C++])
 AC_CONFIG_FILES([Makefile src/Makefile pevent/Makefile po/Makefile.in])
 AC_CONFIG_SRCDIR([src/main.cpp])
 AC_CONFIG_MACRO_DIR([m4])
-- =

1.7.10

Resent to the right list.
It could be an idea to change the mail address in AC_INIT.





--===============8483837631030369129==--

