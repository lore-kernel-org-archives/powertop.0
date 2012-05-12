Content-Type: multipart/mixed; boundary="===============4514572998743411217=="
MIME-Version: 1.0
From: Vinicius Costa Gomes <vcgomes at gmail.com>
Subject: [Powertop] [PATCH] Fix trying to use libnl-2.0 when only libnl-3.0 is
 installed
Date: Sat, 12 May 2012 12:50:16 -0300
Message-ID: <1336837816-9884-1-git-send-email-vcgomes@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4514572998743411217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Vinicius Costa Gomes <vinicius.gomes(a)openbossa.org>

When using libnl-3.0 we need to link with libnl-genl also, if not, we
get a lot of undefined symbols.
---
 configure.ac |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 2d56684..3579b6e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -56,7 +56,7 @@ PKG_CHECK_MODULES([LIBZ], [zlib],[],[
 =

 has_libnl_ver=3D0
 PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
-	AC_SEARCH_LIBS([nl_socket_alloc], [nl], [has_libnl_ver=3D2], [
+	AC_SEARCH_LIBS([nl_socket_alloc], [libnl-2.0], [has_libnl_ver=3D2], [
 		     PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [has_libnl_v=
er=3D3],
 				       [AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [has_libnl=
_ver=3D3], [], [])])
 	], [])
-- =

1.7.10.1


--===============4514572998743411217==--

