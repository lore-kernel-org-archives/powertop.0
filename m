Content-Type: multipart/mixed; boundary="===============9070843377319130180=="
MIME-Version: 1.0
From: Stefan Weil <sw at weilnetz.de>
Subject: [Powertop] [PATCH] Fix out-of-tree builds
Date: Thu, 12 Jul 2012 22:58:30 +0200
Message-ID: <1342126710-26497-1-git-send-email-sw@weilnetz.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9070843377319130180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Out-of-tree builds are a very useful feature which should be supported
by all programs which use GNU automake and the configure / make build.

For powertop, only a very small fix was needed to make it work.
Without that fix, powertop.css is not found when a build is not
started from the source tree, so csstoh fails and creates no css.h.

Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
---
 src/Makefile.am |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index c77b2aa..23625a2 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -45,5 +45,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $=
(LIBNL_LIBS) $(LIBZ_LIBS)
 BUILT_SOURCES =3D css.h
 CLEANFILES =3D css.h
 css.h: csstoh powertop.css
-	./csstoh powertop.css css.h
+	./csstoh "$(srcdir)"/powertop.css css.h
 =

-- =

1.7.10


--===============9070843377319130180==--

