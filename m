Content-Type: multipart/mixed; boundary="===============2468699117005940571=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 08/10] backlight: use process_directory() helper
Date: Mon, 14 Oct 2013 11:40:55 +0300
Message-ID: <1381740057-12499-9-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2468699117005940571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/devices/backlight.cpp | 42 +++++++++++++++---------------------------
 src/devices/backlight.h   |  4 ++--
 2 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
index 03aa5bc..ebdebc8 100644
--- a/src/devices/backlight.cpp
+++ b/src/devices/backlight.cpp
@@ -39,7 +39,7 @@ using namespace std;
 #include <string.h>
 =

 =

-backlight::backlight(char *_name, char *path): device()
+backlight::backlight(const char *_name, const char *path): device()
 {
 	char devname[128];
 	min_level =3D 0;
@@ -156,36 +156,24 @@ const char * backlight::device_name(void)
 	return name;
 }
 =

-void create_all_backlights(void)
+static void create_all_backlights_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
+	class backlight *bl;
 	char filename[4096];
-
-	dir =3D opendir("/sys/class/backlight/");
-	if (!dir)
-		return;
-	while (1) {
-		class backlight *bl;
-		entry =3D readdir(dir);
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-		sprintf(filename, "/sys/class/backlight/%s", entry->d_name);
-		bl =3D new class backlight(entry->d_name, filename);
-		all_devices.push_back(bl);
-		register_parameter("backlight");
-		register_parameter("backlight-power");
-		register_parameter("backlight-boost-40", 0, 0.5);
-		register_parameter("backlight-boost-80", 0, 0.5);
-		register_parameter("backlight-boost-100", 0, 0.5);
-	}
-	closedir(dir);
-
+	sprintf(filename, "/sys/class/backlight/%s", d_name);
+	bl =3D new class backlight(d_name, filename);
+	all_devices.push_back(bl);
 }
 =

-
+void create_all_backlights(void)
+{
+	process_directory("/sys/class/backlight/", create_all_backlights_callback=
);
+	register_parameter("backlight");
+	register_parameter("backlight-power");
+	register_parameter("backlight-boost-40", 0, 0.5);
+	register_parameter("backlight-boost-80", 0, 0.5);
+	register_parameter("backlight-boost-100", 0, 0.5);
+}
 =

 double backlight::power_usage(struct result_bundle *result, struct paramet=
er_bundle *bundle)
 {
diff --git a/src/devices/backlight.h b/src/devices/backlight.h
index 549654e..3d5377a 100644
--- a/src/devices/backlight.h
+++ b/src/devices/backlight.h
@@ -37,7 +37,7 @@ class backlight: public device {
 	int r_index_power;
 public:
 =

-	backlight(char *_name, char *path);
+	backlight(const char *_name, const char *path);
 =

 	virtual void start_measurement(void);
 	virtual void end_measurement(void);
@@ -55,4 +55,4 @@ public:
 extern void create_all_backlights(void);
 =

 =

-#endif
\ No newline at end of file
+#endif
-- =

1.8.4.679.g0a1a803


--===============2468699117005940571==--

