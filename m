Content-Type: multipart/mixed; boundary="===============1008784022437737698=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v1 2/4] Makefile.am: ACLOCAL_AMFLAGS updated
Date: Tue, 26 Jul 2016 12:35:33 -0700
Message-ID: <20160726193535.27247-3-joe.konno@linux.intel.com>
In-Reply-To: 20160726193535.27247-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1008784022437737698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

According to the gettext documentation, "--install -I m4" are the
recommended AMFLAGS when using automake >=3D 1.10. Let's assume builders
are using a recent automake.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index 8e4e09d6145d..bf087e8caef3 100644
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

2.9.0


--===============1008784022437737698==--

