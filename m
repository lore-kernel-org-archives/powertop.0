Content-Type: multipart/mixed; boundary="===============4617440690332350533=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Thu, 08 Nov 2012 17:09:38 +0300
Message-ID: <20121108140938.GA3090@swordfish.minsk.epam.com>
In-Reply-To: CAMFVxVjb4p0u8WxhKS+o-FE_1B21m5O35_ui19PHg1mPhad_WA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4617440690332350533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
can you please test this patch?


----

Rework libnl detection.

PKG_CHECK_MODULES macro appends FOO_CFLAGS and FOO_LIBS flags

Example:
LIBNL_CFLAGS =3D -I/usr/include/libnl3
LIBNL_LIBS =3D -lnl-genl-3 -lnl-3

while AC_SEARCH_LIBS only prepends -llibrary to LIBS, so AC_SEARCH_LIBS
is not helpful here.


Use pkg-config PC file names to search for minimum package versions:
libnl 3.+ -- libnl-3.0.pc
libnl 2.+ -- libnl-2.0.pc
libnl 1.+ -- libnl-1.0.pc


Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 configure.ac | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/configure.ac b/configure.ac
index b8c183f..b9c3c2e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,13 +54,10 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1]=
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
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0], [=
has_libnl_ver=3D3], [
+	PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0 libnl-genl-2.0 >=3D 2.0], =
[has_libnl_ver=3D2], [
+		PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [])])])
 if (test "$has_libnl_ver" -eq 0); then
 	AC_MSG_ERROR(libnl is required but not found)
 fi


--===============4617440690332350533==--

