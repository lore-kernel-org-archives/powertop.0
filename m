Content-Type: multipart/mixed; boundary="===============7792955728486762128=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 1/8] lib: unify process_directory()
Date: Thu, 19 Sep 2013 15:38:49 +0300
Message-ID: <20130919123849.GB2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7792955728486762128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

remove `lo' check from process_directory() and force net callers
to check for passed d_name. since process_directory() called
from different sites `lo' check is overhead.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/lib.cpp | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 881e52f..f27ec2f 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -448,12 +448,8 @@ void process_directory(const char *d_name, callback fn)
 			break;
 		if (entry->d_name[0] =3D=3D '.')
 			continue;
-		if (strcmp(entry->d_name, "lo")=3D=3D0)
-			continue;
-
 		fn(entry->d_name);
 	}
-
 	closedir(dir);
 }
=20

--===============7792955728486762128==--

