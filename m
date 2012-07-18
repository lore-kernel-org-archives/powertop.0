Content-Type: multipart/mixed; boundary="===============2749979697343467555=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Remove unneded zlib dependency
Date: Wed, 18 Jul 2012 18:54:58 +0400
Message-ID: <1342623298-30628-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2749979697343467555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove unneded zlib dependency from configure.ac
---
 configure.ac |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index ff4cdea..4b3d027 100644
--- a/configure.ac
+++ b/configure.ac
@@ -50,9 +50,6 @@ AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_E=
RROR([ncurses is requir
 PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
 	AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is required=
 but was not found]), [])
 ]) =

-PKG_CHECK_MODULES([LIBZ], [zlib],[],[
-	AC_SEARCH_LIBS([deflate], [z], [], AC_MSG_ERROR([zlib is required but was=
 not found]), [])
-]) =

 =

 has_libnl_ver=3D0
 PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
-- =

1.7.5.4


--===============2749979697343467555==--

