Content-Type: multipart/mixed; boundary="===============1717514529028041769=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: [Powertop] [PATCH] powertop: fix various resource leaks
Date: Mon, 04 Aug 2014 19:50:57 +0600
Message-ID: <1407160257-4871-1-git-send-email-meraj.enigma@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1717514529028041769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fixes some resource leaks detected by valgrind and coverity scan.

Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
---
 src/devices/ahci.cpp     | 4 +++-
 src/perf/perf_bundle.cpp | 4 +++-
 src/tuning/bluetooth.cpp | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index 3b4627a..a4d1345 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -67,8 +67,10 @@ static string disk_name(char *path, char *target, char *=
shortname)
 		sprintf(line, "%s/%s/model", pathname, dirent->d_name);
 		file =3D fopen(line, "r");
 		if (file) {
-			if (fgets(line, 4096, file) =3D=3D NULL)
+			if (fgets(line, 4096, file) =3D=3D NULL) {
+				fclose(file);
 				break;
+			}
 			fclose(file);
 			c =3D strchr(line, '\n');
 			if (c)
diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
index b0e982b..cf1ae11 100644
--- a/src/perf/perf_bundle.cpp
+++ b/src/perf/perf_bundle.cpp
@@ -142,8 +142,10 @@ static void parse_event_format(const char *event_name)
 =

 	buf =3D read_file(file);
 	free(file);
-	if (!buf)
+	if (!buf) {
+		free(name);
 		return;
+	}
 =

 	pevent_parse_event(perf_event::pevent, buf, strlen(buf), sys);
 	free(name);
diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
index 92f5835..2c1e283 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -144,8 +144,10 @@ int bt_tunable::good_bad(void)
 		if (file) {
 			char line[2048];
 			/* first line is standard header */
-			if (fgets(line, 2047, file) =3D=3D NULL)
+			if (fgets(line, 2047, file) =3D=3D NULL) {
+				pclose(file);
 				goto out;
+			}
 			memset(line, 0, 2048);
 			if (fgets(line, 2047, file) =3D=3D NULL) {
 				result =3D last_check_result =3D TUNE_GOOD;
-- =

1.9.1


--===============1717514529028041769==--

