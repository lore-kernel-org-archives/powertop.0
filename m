Content-Type: multipart/mixed; boundary="===============5219601399038546002=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH] Use PACKAGE_VERSION for POWERTOP_VERSION
Date: Sun, 18 Nov 2012 00:42:47 +0900
Message-ID: <1353166967-24095-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5219601399038546002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It was missed to update POWERTOP_VERSION macro so that the
new v2.2 release still shows v2.1 string on the header of
ncurses window.  Convert to use PACKAGE_VERSION macro which
set by autotools to the AC_INIT version so that it cannot
be missed anymore.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/lib.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/lib.h b/src/lib.h
index 8cf4632..209421a 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -35,8 +35,8 @@
 =

 #define _(STRING)    gettext(STRING)
 =

-#define POWERTOP_VERSION "v2.1"
-#define POWERTOP_SHORT_VERSION "2.1"
+#define POWERTOP_VERSION "v"PACKAGE_VERSION
+#define POWERTOP_SHORT_VERSION PACKAGE_VERSION
 =

 =

 extern int get_max_cpu(void);
-- =

1.7.9.2


--===============5219601399038546002==--

