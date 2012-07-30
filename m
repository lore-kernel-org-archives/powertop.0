Content-Type: multipart/mixed; boundary="===============2535711611490671627=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] configure: First try to use libnl-3, then libnl-2,
 then libnl-1
Date: Mon, 30 Jul 2012 17:55:11 +0400
Message-ID: <1343656511-25137-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2535711611490671627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change search order for libnl in configure.ac:
first try to use libnl-3, then libnl-2, then libnl-1.
---
 configure.ac |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index 3f5775f..552626c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -53,12 +53,13 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1]=
,[
  =

 =

 has_libnl_ver=3D0
-PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
-	AC_SEARCH_LIBS([nl_socket_alloc], [nl], [has_libnl_ver=3D2], [
-		     PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [has_libnl_v=
er=3D3],
-				       [AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [has_libnl=
_ver=3D3], [], [])])
-	], [])
-])
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
+	has_libnl_ver=3D3], [
+	AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
+		has_libnl_ver=3D3], [
+		AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
+			has_libnl_ver=3D2], [
+			PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])])
 if (test "$has_libnl_ver" -eq 0); then
 	AC_MSG_ERROR(libnl is required but not found)
 fi
-- =

1.7.5.4


--===============2535711611490671627==--

