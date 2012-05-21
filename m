Content-Type: multipart/mixed; boundary="===============4468825174953274641=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH 1/3] Remove unknown symbol
Date: Mon, 21 May 2012 21:39:47 +0200
Message-ID: <1337631427.2616.0.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4468825174953274641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nothing sets the symbol NCURES_LIBS and NCURSES_LIBS is already in the link
line, so this patch removes the misspelled version.

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/Makefile.am |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index b396691..e26c8bc 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -40,7 +40,7 @@ powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_CFL=
AGS) $(PCIUTILS_CFLAGS) $(L
 =

 powertop_LDADD =3D ../pevent/libparseevent.la
 =

-AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(LIBNL_LIBS) $(LI=
BZ_LIBS) $(NCURES_LIBS) $(PTHREAD_LIBS)  $(RESOLV_LIBS)
+AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(LIBNL_LIBS) $(LI=
BZ_LIBS) $(PTHREAD_LIBS)  $(RESOLV_LIBS)
 =

 BUILT_SOURCES =3D css.h
 CLEANFILES =3D css.h
-- =

1.7.10


--===============4468825174953274641==--

