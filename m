Content-Type: multipart/mixed; boundary="===============1026696474835832363=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [Warning fixes 2/6] Build with -Wno-unused-result for now,
 it seems at least some of these cases are intentional (see ml
 discussion)
Date: Fri, 24 Aug 2012 18:53:13 +0200
Message-ID: <20120824173217.DE8C4DFFDC@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1026696474835832363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Note: Is this this flag supported on all compilers?

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/Makefile.am b/src/Makefile.am
index d233d85..ec70bc4 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -33,8 +33,9 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		main.cpp css.h powertop.css cpu/intel_gpu.cpp
 =

 =

-powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -Wsh=
adow -Wformat $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_=
CFLAGS)
-
+powertop_CXXFLAGS =3D \
+	-fno-omit-frame-pointer -fstack-protector -Wall -Wshadow -Wformat -Wno-un=
used-result \
+	$(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_CFLAGS)
 =

 powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_CFLAGS) $(PCIUTILS_C=
FLAGS) $(LIBNL_CFLAGS) $(GLIB2_CFLAGS) $(LIBZ_CFLAGS) -DLOCALEDIR=3D\"$(loc=
aledir)\"
 =

-- =

1.7.7


--===============1026696474835832363==--

