Content-Type: multipart/mixed; boundary="===============7745657296633932676=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 03/19] Makefile.am: add --install to
 ACLOCAL_AMFLAGS
Date: Wed, 03 Aug 2016 17:59:13 -0700
Message-ID: <1470272369-218664-4-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7745657296633932676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

This is supported by >=3Dautomake-1.10, so let's use it to ensure all
requisite m4 scripts are assembled at configure and build time.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index 128500e9b67c..819441e982c8 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,5 +1,5 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
-ACLOCAL_AMFLAGS =3D -I m4
+ACLOCAL_AMFLAGS =3D --install -I m4
 =

 SUBDIRS =3D \
 	traceevent \
-- =

1.8.3.1


--===============7745657296633932676==--

