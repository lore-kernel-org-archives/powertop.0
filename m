Content-Type: multipart/mixed; boundary="===============5763258699823563767=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH 2/2] perf_bundle: Cleanup realloc use
Date: Tue, 18 Sep 2012 23:21:03 +0900
Message-ID: <1347978063-10119-2-git-send-email-namhyung@gmail.com>
In-Reply-To: 1347978063-10119-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5763258699823563767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The if block can be removed since the realloc can handle NULL pointer
as a first argument.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/perf/perf_bundle.cpp |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
index 4e70f30..7649036 100644
--- a/src/perf/perf_bundle.cpp
+++ b/src/perf/perf_bundle.cpp
@@ -112,13 +112,10 @@ static char * read_file(const char *file)
 		exit(-1);
 =

 	while((r =3D read(fd, buf, 4096)) > 0) {
-		if (len) {
-			char *tmp =3D (char *)realloc(buffer, len + r + 1);
-			if (!tmp)
-				free(buffer);
-			buffer =3D tmp;
-		} else
-			buffer =3D (char *)malloc(r + 1);
+		char *tmp =3D (char *)realloc(buffer, len + r + 1);
+		if (!tmp)
+			free(buffer);
+		buffer =3D tmp;
 		if (!buffer)
 			goto out;
 		memcpy(buffer + len, buf, r);
-- =

1.7.9.2


--===============5763258699823563767==--

