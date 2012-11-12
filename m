Content-Type: multipart/mixed; boundary="===============6572891439624686262=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Mon, 12 Nov 2012 12:09:18 +0300
Message-ID: <20121112090918.GC3851@swordfish>
In-Reply-To: CAGLu0vOCbyZsB1HX7bQ33K+817nRd+ioKo9ObgU8xRCVdNfA7w@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6572891439624686262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
may I ask you ti test the following one?


Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 configure.ac | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/configure.ac b/configure.ac
index b8c183f..cee5bf3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,15 +54,20 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1]=
,[
  =

 =

 has_libnl_ver=3D0
-PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
-	has_libnl_ver=3D3], [
-	AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
-		has_libnl_ver=3D3], [
-		AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
-			has_libnl_ver=3D2], [
-			PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])])
+
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0], [has_libnl_ver=3D3], [
+	PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=3D2], [
+		PKG_CHECK_MODULES([LIBNL], [libnl-1.0], [has_libnl_ver=3D1], [has_libnl_=
ver=3D0])])])
+
+#Austin Zhang reported failed configure on Ubuntu. It tourned out that ubu=
ntu does
+#not provide genl pkg-config files, thus PKG_CHECK_MODULES fails to check =
for
+#libnl-genl.
+#NOTE: AC_SEARCH_LIBS append -lnl-genl to LIBS, not to LIBNL_LIBS.
+#
+AC_SEARCH_LIBS([genl_connect], [nl-genl], [], [has_libnl_ver=3D0])
+
 if (test "$has_libnl_ver" -eq 0); then
-	AC_MSG_ERROR(libnl is required but not found)
+	AC_MSG_ERROR(libnl and libnl-genl are required but were not found)
 fi
 if (test "$has_libnl_ver" -gt 1); then
 	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher])


--===============6572891439624686262==--

