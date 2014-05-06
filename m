Content-Type: multipart/mixed; boundary="===============3152177989387632638=="
MIME-Version: 1.0
From: Auke Kok <auke-jan.h.kok at intel.com>
Subject: [Powertop] [PATCH] Optionally check for ncurses pkgconfig file.
Date: Mon, 05 May 2014 23:42:11 -0700
Message-ID: <1399358531-17553-1-git-send-email-auke-jan.h.kok@intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3152177989387632638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 configure.ac | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index baa5faa..5a90fe3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -46,7 +46,8 @@ AC_FUNC_REALLOC
 AC_FUNC_STRTOD
 AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset mkdir mu=
nmap pow realpath regcomp select setlocale socket sqrt strcasecmp strchr st=
rdup strerror strncasecmp strstr strtoul strtoull])
 =

-AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses is =
required but was not found]), [])
+PKG_CHECK_MODULES([NCURSES], [ncurses], [LIBS=3D"$LIBS $ncurses_LIBS"],
+	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses is=
 required but was not found]), []))
 =

 has_libpci=3D0
 PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
-- =

1.7.11.2


--===============3152177989387632638==--

