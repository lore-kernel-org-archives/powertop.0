Content-Type: multipart/mixed; boundary="===============6320288916617689969=="
MIME-Version: 1.0
From: zhang.austin at gmail.com
Subject: [Powertop] [PATCH] Change library/pkg search condition for libnl2/3
Date: Fri, 02 Nov 2012 20:30:46 +0800
Message-ID: <1351859446-9074-1-git-send-email-zhang.austin@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6320288916617689969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Austin Zhang <zhang.austin(a)gmail.com>

So that we can configure in system with libnl2 or/and libnl3.

Without/With this patch, the './configure' result as:
---------------------------------------------------------------------------=
-----
                   |        ubuntu 11-10         ||          ubuntu 12.04
---------------------------------------------------------------------------=
-----
                   | libnl-1 | libnl-2 | libnl-3 || libnl-1 | libnl-2 | lib=
nl-3
---------------------------------------------------------------------------=
-----
without this patch | Pass    | Fail    | Fail    || Pass    | Fail    | Pass
with    this patch | Pass    | Pass    | Pass    || Pass    | Pass    | Pass
---------------------------------------------------------------------------=
-----

Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
---
 configure.ac |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index b8c183f..ccc0ec5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,11 +54,11 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1]=
,[
  =

 =

 has_libnl_ver=3D0
-PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0], [
 	has_libnl_ver=3D3], [
 	AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
 		has_libnl_ver=3D3], [
-		AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
+		PKG_CHECK_MODULES([LIBNL], [libnl-2.0], [
 			has_libnl_ver=3D2], [
 			PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])])
 if (test "$has_libnl_ver" -eq 0); then
-- =

1.7.5.4


--===============6320288916617689969==--

