Content-Type: multipart/mixed; boundary="===============0046187372606351408=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Tue, 13 Nov 2012 12:26:25 +0300
Message-ID: <20121113092624.GA2621@swordfish.minsk.epam.com>
In-Reply-To: CAGLu0vP=Q9mepudrBj7d5W_9Pf3n_sVSF77TC-WT_4cdSEEBHQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0046187372606351408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/13/12 17:06), Austin Zhang wrote:
> =

>    Unfortunately, it only works in one 11.10 case, and doesn't work for
>    others. For libnl-3 case,
>    ...
>    checking for library containing genl_connect...no
>    ...
>
ok, which means that genl_connect is withing libnl.

I really would like to keep checks consistent, otherwise it's a bit unclear
why we check 'libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0' and only 'libnl-2=
.0',
besides, I've a feeling that will break build on some distros (in case if =

that is only Ubuntu specific, we'll end up w/o -nl-genl).

Add -nl to AC_SEARCH_LIBS.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 configure.ac | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/configure.ac b/configure.ac
index b8c183f..0958d73 100644
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
+#Austin Zhang reported failed configure on Ubuntu. It turned out that ubun=
tu does
+#not provide genl pkg-config files, thus PKG_CHECK_MODULES fails to check =
for
+#libnl-genl.
+#NOTE: AC_SEARCH_LIBS append -lnl-genl to LIBS, not to LIBNL_LIBS.
+#
+AC_SEARCH_LIBS([genl_connect], [nl-genl nl], [], [has_libnl_ver=3D0])
+
 if (test "$has_libnl_ver" -eq 0); then
-	AC_MSG_ERROR(libnl is required but not found)
+	AC_MSG_ERROR(libnl and libnl-genl are required but were not found)
 fi
 if (test "$has_libnl_ver" -gt 1); then
 	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher])


--===============0046187372606351408==--

