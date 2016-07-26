Content-Type: multipart/mixed; boundary="===============6971639651821092788=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v1 3/4] .gitignore: ignore a few more m4 macros
Date: Tue, 26 Jul 2016 12:35:34 -0700
Message-ID: <20160726193535.27247-4-joe.konno@linux.intel.com>
In-Reply-To: 20160726193535.27247-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6971639651821092788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

After bumping gettext to 0.19.8, additional macros get installed by
'aclocal'. As we depend on the host's gettext to supply these scripts,
let's not track them.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index de3c3b1670cf..5e867719d7e7 100644
--- a/.gitignore
+++ b/.gitignore
@@ -35,6 +35,7 @@ Makefile.in
 /libtool
 /ltmain.sh
 /m4/codeset.m4
+/m4/extern-inline.m4
 /m4/fcntl-o.m4
 /m4/gettext.m4
 /m4/glibc2.m4
@@ -59,6 +60,7 @@ Makefile.in
 /m4/ltversion.m4
 /m4/lt~obsolete.m4
 /m4/nls.m4
+/m4/pkg.m4
 /m4/po.m4
 /m4/printf-posix.m4
 /m4/progtest.m4
-- =

2.9.0


--===============6971639651821092788==--

