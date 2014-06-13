Content-Type: multipart/mixed; boundary="===============0055350530830369769=="
MIME-Version: 1.0
From: Tobias Klauser <tklauser at distanz.ch>
Subject: [Powertop] [PATCH] Add csstosh.sh to EXTRA_DIST
Date: Fri, 13 Jun 2014 14:07:39 +0200
Message-ID: <1402661259-14839-1-git-send-email-tklauser@distanz.ch>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0055350530830369769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since css.h is in CLEANFILES, `make clean' will delete it and thus
cause the build to fail afterwards due to a missing csstoh.sh to
regenerate it. Fix this by adding csstoh.sh to EXTRA_DIST which will
cause it to be included in the tarball.

Signed-off-by: Tobias Klauser <tklauser(a)distanz.ch>
---
 src/Makefile.am |    1 +
 1 file changed, 1 insertion(+)

diff --git a/src/Makefile.am b/src/Makefile.am
index 9d053a4..6886388 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -52,3 +52,4 @@ CLEANFILES =3D css.h
 css.h: powertop.css
 	$(SHELL) ${srcdir}/csstoh.sh ${srcdir}/powertop.css css.h
 =

+EXTRA_DIST =3D ${srcdir}/csstoh.sh
-- =

1.7.9.5



--===============0055350530830369769==--

