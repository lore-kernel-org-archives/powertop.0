Content-Type: multipart/mixed; boundary="===============7671499996146128423=="
MIME-Version: 1.0
From: Benedikt Morbach <moben at exherbo.org>
Subject: [Powertop] [PATCH] remove -Werror from AM_INIT_AUTOMAKE
Date: Mon, 18 Jun 2012 00:30:14 +0200
Message-ID: <1339972214-18301-1-git-send-email-moben@exherbo.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7671499996146128423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

While this is nice while developing, it may cause
various problems with distributed tarballs.

A new automake version could add a warning, causing errors for distributions
and users, who might need to patch configure.ac and thus run autoreconf.

For example, we hit an error where a third party package (gettext) uses
functionality (AM_PROG_MKDIR_P) which is deprecated in newer automake versi=
ons(1.12.1),
causing the powertop build to fail.

Since the problem lies elsewhere, it is stupid to fail for this while build=
ing powertop
---
 configure.ac |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 4da4eea..ff4cdea 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,7 @@
 =

 AC_PREREQ([2.68])
 AC_INIT([powertop], [2.0], [powertop(a)lists.01.org])
-AM_INIT_AUTOMAKE([-Wall -Werror foreign ])
+AM_INIT_AUTOMAKE([-Wall foreign ])
 AC_LANG([C++])
 AC_CONFIG_FILES([Makefile src/Makefile pevent/Makefile po/Makefile.in doc/=
Makefile])
 AC_CONFIG_SRCDIR([src/main.cpp])
-- =

1.7.10.4


--===============7671499996146128423==--

