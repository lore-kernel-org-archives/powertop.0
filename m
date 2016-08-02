Content-Type: multipart/mixed; boundary="===============8059141525548839965=="
MIME-Version: 1.0
From: eSyr <evgsyr at gmail.com>
Subject: [Powertop] [PATCH] Checking whether librt is needed for
 clock_gettime().
Date: Tue, 02 Aug 2016 06:29:53 +0300
Message-ID: <20160802032949.GA18501@obsidian>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8059141525548839965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Commit ef79e28 introduced usage of clock_gettime() function, which,
unfortunately, breaks build on some systems, namely Debian Wheezy, due
to the fact it should be linked with librt. This commit adds configure
check whether additional library is needed in order to use
aforementioned function.

* configure.ac: using AC_SEARCH_LIBS() for checking whether librt is
  needed for clock_gettime().
---
 configure.ac |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure.ac b/configure.ac
index 088d0de..7573d84 100644
--- a/configure.ac
+++ b/configure.ac
@@ -106,6 +106,8 @@ AC_CHECK_FUNCS([ \
 	strtoull \
 ])
 =

+AC_SEARCH_LIBS([clock_gettime], [rt])
+
 PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS=3D"$LIBS $ncurses_L=
IBS"], [
 	AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
 		AC_MSG_ERROR([ncurses is required but was not found])
-- =

1.7.10.4


--===============8059141525548839965==--

