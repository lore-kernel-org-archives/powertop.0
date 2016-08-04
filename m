Content-Type: multipart/mixed; boundary="===============6260724374299314526=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 01/19] configure.ac: bump version to 2.9-pre
Date: Wed, 03 Aug 2016 17:59:11 -0700
Message-ID: <1470272369-218664-2-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6260724374299314526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Once we get things ready for pre-release testing, AC_REVISION will
change to "-rcX" and a version tag will be pushed. For now, executing a
local build with "--version" will give some indication it's something
you built and not something provided by your package manager.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 7573d8421271..4681c9e3ad28 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,7 +2,7 @@
 # Process this file with autoconf to produce a configure script.
 =

 AC_PREREQ([2.68])
-AC_INIT([powertop], [2.8], [powertop(a)lists.01.org], [], [https://01.org/=
powertop])
+AC_INIT([powertop], [2.9-pre], [powertop(a)lists.01.org], [], [https://01.=
org/powertop])
 AM_INIT_AUTOMAKE([
 	-Wall
 	1.12.2
-- =

1.8.3.1


--===============6260724374299314526==--

