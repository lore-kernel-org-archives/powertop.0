Content-Type: multipart/mixed; boundary="===============1476091086448074973=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Tue, 13 Nov 2012 13:18:41 +0300
Message-ID: <20121113101840.GB2621@swordfish.minsk.epam.com>
In-Reply-To: CAGLu0vOK9HGvtohORcvfm1F92863GShB2L+xkKyVE5koEhtmYg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1476091086448074973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/13/12 17:47), Austin Zhang wrote:
> =

>    > why we check 'libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0' and only
>    'libnl-2.0',
>    Because for v2, it just have=EF=BF=BDseparated=EF=BF=BDlibnl-genl libr=
ary, but there were
>    no=EF=BF=BDseparated pkg named=EF=BF=BDlibnl-genl-2.0.
>    >+AC_SEARCH_LIBS([genl_connect], [nl-genl nl], [], [has_libnl_ver=3D0])
>    With additional 'nl' checking, It doesn't help. Failed with same error
>    under both v3 and v2 cases for 12.04 (doesn't try others).=EF=BF=BD
>    If fact, genl_connect is in nl-genl both for v2 and v3. Not sure if it=
 is
>    some search path issue.=EF=BF=BD
> =


hm. ok, thanks for info. I'll check libnl 2.0 repo if they ever had pkg-con=
fig file
other than libnl-2.0.pc. If the only one they provide is libnl-2.0.pc then =
we'll stick
with inital PKG_CHECK_MODULES rework and your adjustment to libnl-2.0 case.

thanks for your patience and help!


Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 configure.ac | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/configure.ac b/configure.ac
index b8c183f..e6ae3ce 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,15 +54,11 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1]=
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
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0], [=
has_libnl_ver=3D3], [
+	PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=3D2], [
+		PKG_CHECK_MODULES([LIBNL], [libnl-1.0], [has_libnl_ver=3D1], [has_libnl_=
ver=3D0])])])
 if (test "$has_libnl_ver" -eq 0); then
-	AC_MSG_ERROR(libnl is required but not found)
+	AC_MSG_ERROR(libnl and libnl-genl are required but were not found)
 fi
 if (test "$has_libnl_ver" -gt 1); then
 	AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or higher])


--===============1476091086448074973==--

