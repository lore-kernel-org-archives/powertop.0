Content-Type: multipart/mixed; boundary="===============1711244084387629789=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH 2/3] Remove redundant inclusion of -O2 -g in
 powertop_CXXFLAGS
Date: Mon, 21 May 2012 21:46:26 +0200
Message-ID: <1337631481.2616.1.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1711244084387629789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When building a program then program_CXXFLAGS replaces AM_CXXFLAGS and
CXXFLAGS is appended to it, this is the reason for the double -O2 -g options
when building the powertop binary.

This patch removes the extra -O2 -g and returns the control of the optimiza=
tion
and debug flags to CXXFLAGS as one would expect.

Please note that the default value of CXXFLAGS is -O2 -g if the compiler
supports it.

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/Makefile.am |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index e26c8bc..3e8294a 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -33,7 +33,7 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		main.cpp css.h powertop.css
 =

 =

-powertop_CXXFLAGS =3D -O2 -g -fno-omit-frame-pointer -fstack-protector -Wa=
ll -Wshadow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $=
(LIBNL_CFLAGS) $(GLIB2_CFLAGS)
+powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -Wsh=
adow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_=
CFLAGS) $(GLIB2_CFLAGS)
 =

 =

 powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_CFLAGS) $(PCIUTILS_C=
FLAGS) $(LIBNL_CFLAGS) $(GLIB2_CFLAGS) $(LIBZ_CFLAGS)
-- =

1.7.10


--===============1711244084387629789==--

