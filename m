Content-Type: multipart/mixed; boundary="===============6112380761703872206=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: [Powertop] [PATCH v2] powertop: fix various resource leaks
Date: Tue, 05 Aug 2014 22:01:58 +0600
Message-ID: <1407254518-6705-1-git-send-email-meraj.enigma@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6112380761703872206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fixes various resource leaks detected by valgrind and coverity scan.

move pclose(file) in the scope of "out" label.

Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
---
 src/devices/ahci.cpp     | 4 +++-
 src/perf/perf_bundle.cpp | 4 +++-
 src/tuning/bluetooth.cpp | 6 +++---
 3 files changed, 9 insertions(+), 5 deletions(-)

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
index 92f5835..9be327e 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -108,7 +108,7 @@ static int last_check_result;
 int bt_tunable::good_bad(void)
 {
 	struct hci_dev_info devinfo;
-	FILE *file;
+	FILE *file =3D 0;
 	int fd;
 	int thisbytes =3D 0;
 	int ret;
@@ -149,11 +149,9 @@ int bt_tunable::good_bad(void)
 			memset(line, 0, 2048);
 			if (fgets(line, 2047, file) =3D=3D NULL) {
 				result =3D last_check_result =3D TUNE_GOOD;
-				pclose(file);
 				goto out;
 			}
 =

-			pclose(file);
 			if (strlen(line) > 0) {
 				result =3D last_check_result =3D TUNE_GOOD;
 				goto out;
@@ -166,6 +164,8 @@ int bt_tunable::good_bad(void)
 =

 out:
 	previous_bytes =3D thisbytes;
+	if (file)
+		pclose(file);
 	close(fd);
 	return result;
 }
-- =

1.9.1


--===============6112380761703872206==--

