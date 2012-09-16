Content-Type: multipart/mixed; boundary="===============0051333312785026389=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH 2/2] perf: Check return value of strdup
Date: Sun, 16 Sep 2012 23:17:31 +0900
Message-ID: <1347805051-2889-2-git-send-email-namhyung@gmail.com>
In-Reply-To: 1347805051-2889-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0051333312785026389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The strdup() can return NULL so that the result should be checked.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/perf/perf.cpp |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index c8ba7a8..35b4017 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -145,6 +145,11 @@ void perf_event::set_event_name(const char *event_name)
 	if (name)
 		free(name);
 	name =3D strdup(event_name);
+	if (!name) {
+		fprintf(stderr, "failed to allocate event name\n");
+		return;
+	}
+
 	char *c;
 =

 	c =3D strchr(name, ':');
-- =

1.7.9.2


--===============0051333312785026389==--

