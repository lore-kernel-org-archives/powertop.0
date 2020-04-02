Content-Type: multipart/mixed; boundary="===============1988688635679823304=="
MIME-Version: 1.0
From: Gayatri Kammela <gayatri.kammela at intel.com>
Subject: [Powertop] [PATCH] src/display.cpp: Fix: Add the missing part of the
 patch changes
Date: Thu, 02 Apr 2020 13:18:26 -0700
Message-ID: <20200402201826.1348-1-gayatri.kammela@intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1988688635679823304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch fixes the part of missing patch changes and updates the
version in configure.ac to 2.12-pre

fixes: 152a39949691 ("Revert "configure.ac: version strings from git
describe"")

Reported-by: Anthony Wong <yp(a)anthonywong.net>
Signed-off-by: Joe Konno <joe.konno(a)intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela(a)intel.com>
---
 configure.ac    | 2 +-
 src/display.cpp | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index bc3b5b935703..d5d33762a136 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,7 +2,7 @@
 # Process this file with autoconf to produce a configure script.
 =

 AC_PREREQ([2.69])
-AC_INIT([powertop], [2.9-pre], [powertop(a)lists.01.org], [], [https://01.=
org/powertop])
+AC_INIT([powertop], [2.12-pre], [powertop(a)lists.01.org], [], [https://01=
.org/powertop])
 AM_INIT_AUTOMAKE([
 	-Wall
 	1.12.2
diff --git a/src/display.cpp b/src/display.cpp
index 7b3a7a2f2073..71311446728d 100644
--- a/src/display.cpp
+++ b/src/display.cpp
@@ -117,7 +117,7 @@ void show_tab(unsigned int tab)
 =

 	wattrset(tab_bar, A_REVERSE);
 	mvwprintw(tab_bar, 0,0, "%120s", "");
-	mvwprintw(tab_bar, 0,0, "PowerTOP %s", PACKAGE_SHORT_VERSION);
+	mvwprintw(tab_bar, 0,0, "PowerTOP %s", PACKAGE_VERSION);
 =

 	bottom_line =3D newwin(1, 0, LINES-1, 0);
 	wattrset(bottom_line, A_REVERSE);
-- =

2.17.1

--===============1988688635679823304==--

