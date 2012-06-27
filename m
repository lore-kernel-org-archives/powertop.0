Content-Type: multipart/mixed; boundary="===============3748649030001564757=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] prevent jump on uninitialized value
Date: Wed, 27 Jun 2012 11:17:14 +0300
Message-ID: <20120627081714.GC2996@swordfish.datadirect.datadirectnet.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3748649030001564757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

workload is getting 'initialized' with stack garbage,
so later conditional check of !workload[0] in report()
is invalid.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index d8e2a47..7a1b976 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -356,7 +356,7 @@ int main(int argc, char **argv)
 	int c;
 	bool wantreport =3D FALSE;
 	char filename[4096];
-	char workload[4096];
+	char workload[4096] =3D {0,};
 	int  iterations =3D 1;
 =

 #ifndef DISABLE_TRYCATCH


--===============3748649030001564757==--

