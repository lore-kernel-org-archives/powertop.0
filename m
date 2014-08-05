Content-Type: multipart/mixed; boundary="===============0922577593570695658=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 02/14] configure: prefer AS_IF macro rather than
 shell if statement
Date: Tue, 05 Aug 2014 22:31:26 +0100
Message-ID: <1407274298-16404-2-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1407274298-16404-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0922577593570695658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jumping in between shell and m4 syntaxes makes reading the code more
difficult, so stick to m4 when ever possible.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 configure.ac | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/configure.ac b/configure.ac
index b41cfb3..4991d97 100644
--- a/configure.ac
+++ b/configure.ac
@@ -108,23 +108,25 @@ dnl libnl-2 provides only libnl-2.0.pc file, so we ch=
eck for separate
 dnl libnl-genl-3.0.pc pkg-config file just for libnl-3.0 case.
 PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0], [=
has_libnl_ver=3D3], [
 	PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=3D2], [
-		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [has_libnl_ve=
r=3D0])])])
-if (test "$has_libnl_ver" -eq 0); then
-	AC_MSG_ERROR(libnl and libnl-genl are required but were not found)
-fi
-if (test "$has_libnl_ver" -gt 1); then
+		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [has_libnl_ve=
r=3D0])
+	])
+])
+AS_IF([test "$has_libnl_ver" -eq 0], [
+	AC_MSG_ERROR([libnl and libnl-genl are required but were not found])
+])
+AS_IF([test "$has_libnl_ver" -gt 1], [
 	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher])
-fi
+])
 =

-if (test "$has_libpci" -eq 0); then =

-	AC_DEFINE([HAVE_NO_PCI],[1],[Define if pci is not supported])
+AS_IF([test "$has_libpci" -eq 0], [
+	AC_DEFINE([HAVE_NO_PCI], [1], [Define if pci is not supported])
         AC_MSG_WARN([
 			************* LIBPCI SUPPORT NOT CONFIGURED**************
 			If you need or want pci support, please install libpci =

 			and re-configure PowerTOP. =

 			*********************************************************
 	])
-fi
+])
 =

 AC_SEARCH_LIBS([pthread_create], [pthread], [], [
 	AC_MSG_ERROR([libpthread is required but was not found])
-- =

2.0.4


--===============0922577593570695658==--

