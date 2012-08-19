Content-Type: multipart/mixed; boundary="===============6190196665402044347=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 00:57:34 +0300
Message-ID: <20120819215734.GA3137@swordfish>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6190196665402044347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

do not implement get_user_input() in DISABLE_NCURSES builds

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/lib.cpp | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 77e49a2..ddb0b5c 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -436,12 +436,16 @@ void process_directory(const char *d_name, callback f=
n)
 =

 int get_user_input(char *buf, unsigned sz)
 {
+	int ret =3D 0;
+#ifndef DISABLE_NCURSES
 	fflush(stdout);
 	echo();
 	/* Upon successful completion, these functions return OK. Otherwise, they=
 return ERR. */
-	int ret =3D getnstr(buf, sz);
+	ret =3D getnstr(buf, sz);
 	noecho();
 	fflush(stdout);
 	/* to distinguish between getnstr error and empty line */
-	return ret || strlen(buf);
+	ret |=3D strlen(buf);
+#endif
+	return ret;
 }

--===============6190196665402044347==--

