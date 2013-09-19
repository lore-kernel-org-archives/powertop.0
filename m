Content-Type: multipart/mixed; boundary="===============6655534886932665090=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 2/8] alsa: use process_directory()
Date: Thu, 19 Sep 2013 15:40:07 +0300
Message-ID: <20130919124007.GC2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6655534886932665090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

use process_directory() helper

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/devices/alsa.cpp | 46 +++++++++++++++++-----------------------------
 src/devices/alsa.h   |  4 ++--
 2 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index 33a52f5..5dee334 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -27,10 +27,8 @@
 =

 #include <stdio.h>
 #include <sys/types.h>
-#include <dirent.h>
 #include <unistd.h>
 =

-
 using namespace std;
 =

 #include "device.h"
@@ -42,7 +40,7 @@ using namespace std;
 #include <string.h>
 #include <unistd.h>
 =

-alsa::alsa(char *_name, char *path): device()
+alsa::alsa(const char *_name, const char *path): device()
 {
 	ifstream file;
 =

@@ -152,39 +150,29 @@ const char * alsa::device_name(void)
 	return name;
 }
 =

-void create_all_alsa(void)
+static void create_all_alsa_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
+	class alsa *bl;
+	ofstream file;
 =

-	dir =3D opendir("/sys/class/sound/card0/");
-	if (!dir)
+	if (strncmp(d_name, "hwC", 3) !=3D 0)
 		return;
-	while (1) {
-		class alsa *bl;
-		ofstream file;
-		entry =3D readdir(dir);
-		if (!entry)
-			break;
-		if (strncmp(entry->d_name, "hwC", 3) !=3D 0)
-			continue;
-		sprintf(filename, "/sys/class/sound/card0/%s/power_on_acct", entry->d_na=
me);
-
-		if (access(filename, R_OK) !=3D 0)
-			continue;
-
-		sprintf(filename, "/sys/class/sound/card0/%s", entry->d_name);
-
-		bl =3D new class alsa(entry->d_name, filename);
-		all_devices.push_back(bl);
-		register_parameter("alsa-codec-power", 0.5);
-	}
-	closedir(dir);
 =

-}
+	sprintf(filename, "/sys/class/sound/card0/%s/power_on_acct", d_name);
+	if (access(filename, R_OK) !=3D 0)
+		return;
 =

+	sprintf(filename, "/sys/class/sound/card0/%s", d_name);
+	bl =3D new class alsa(d_name, filename);
+	all_devices.push_back(bl);
+	register_parameter("alsa-codec-power", 0.5);
+}
 =

+void create_all_alsa(void)
+{
+	process_directory("/sys/class/sound/card0/", create_all_alsa_callback);
+}
 =

 double alsa::power_usage(struct result_bundle *result, struct parameter_bu=
ndle *bundle)
 {
diff --git a/src/devices/alsa.h b/src/devices/alsa.h
index 5aebfd7..f7b4b97 100644
--- a/src/devices/alsa.h
+++ b/src/devices/alsa.h
@@ -41,7 +41,7 @@ class alsa: public device {
 	int rindex;
 public:
 =

-	alsa(char *_name, char *path);
+	alsa(const char *_name, const char *path);
 =

 	virtual void start_measurement(void);
 	virtual void end_measurement(void);
@@ -63,4 +63,4 @@ public:
 extern void create_all_alsa(void);
 =

 =

-#endif
\ No newline at end of file
+#endif

--===============6655534886932665090==--

