Content-Type: multipart/mixed; boundary="===============0701241482113666970=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [Warning fixes 3/6] Remove trailing whitespace
Date: Fri, 24 Aug 2012 18:54:57 +0200
Message-ID: <20120824173217.DED8CE00CC@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0701241482113666970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/Makefile.am b/src/Makefile.am
index ec70bc4..48b0e3b 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,8 +1,8 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
-ACLOCAL_AMFLAGS =3D -I ../m4 =

+ACLOCAL_AMFLAGS =3D -I ../m4
 =

 noinst_PROGRAMS =3D csstoh
-csstoh_SOURCES =3D csstoh.c =

+csstoh_SOURCES =3D csstoh.c
 =

 sbin_PROGRAMS =3D powertop
 nodist_powertop_SOURCES =3D css.h
-- =

1.7.7


--===============0701241482113666970==--

