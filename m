Content-Type: multipart/mixed; boundary="===============3732444411310600915=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Mon, 05 Nov 2012 13:24:18 +0300
Message-ID: <20121105102418.GA3123@swordfish>
In-Reply-To: CAMFVxVjb4p0u8WxhKS+o-FE_1B21m5O35_ui19PHg1mPhad_WA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3732444411310600915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
sorry for long reply

Can you please help testing this one?

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 configure.ac | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index b8c183f..cf01279 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,13 +54,11 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1]=
,[
  =

 =

 has_libnl_ver=3D0
-PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
+AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
 	has_libnl_ver=3D3], [
-	AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
-		has_libnl_ver=3D3], [
-		AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
-			has_libnl_ver=3D2], [
-			PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])])
+	AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
+		has_libnl_ver=3D2], [
+		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])
 if (test "$has_libnl_ver" -eq 0); then
 	AC_MSG_ERROR(libnl is required but not found)
 fi


--===============3732444411310600915==--

