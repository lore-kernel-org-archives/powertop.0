Content-Type: multipart/mixed; boundary="===============4935307448139340320=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 5/8] rfkill: use process_directory()
Date: Thu, 19 Sep 2013 15:43:06 +0300
Message-ID: <20130919124306.GE2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4935307448139340320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

use process_directory() helper

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/devices/rfkill.cpp | 46 +++++++++++++++++-----------------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/src/devices/rfkill.cpp b/src/devices/rfkill.cpp
index 2404432..01aec23 100644
--- a/src/devices/rfkill.cpp
+++ b/src/devices/rfkill.cpp
@@ -27,7 +27,6 @@
 =

 #include <stdio.h>
 #include <sys/types.h>
-#include <dirent.h>
 #include <libgen.h>
 #include <unistd.h>
 =

@@ -136,41 +135,30 @@ const char * rfkill::device_name(void)
 	return name;
 }
 =

-void create_all_rfkills(void)
+static void create_all_rfkills_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
 	char name[4096];
+	class rfkill *bl;
+	ifstream file;
 =

-	dir =3D opendir("/sys/class/rfkill/");
-	if (!dir)
-		return;
-	while (1) {
-		class rfkill *bl;
-		ifstream file;
-		entry =3D readdir(dir);
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-		sprintf(filename, "/sys/class/rfkill/%s/name", entry->d_name);
-		strcpy(name, entry->d_name);
-		file.open(filename, ios::in);
-		if (file) {
-			file.getline(name, 100);
-			file.close();
-		}
-
-		sprintf(filename, "/sys/class/rfkill/%s", entry->d_name);
-		bl =3D new class rfkill(name, filename);
-		all_devices.push_back(bl);
+	sprintf(filename, "/sys/class/rfkill/%s/name", d_name);
+	strcpy(name, d_name);
+	file.open(filename, ios::in);
+	if (file) {
+		file.getline(name, 100);
+		file.close();
 	}
-	closedir(dir);
 =

+	sprintf(filename, "/sys/class/rfkill/%s", d_name);
+	bl =3D new class rfkill(name, filename);
+	all_devices.push_back(bl);
 }
 =

-
+void create_all_rfkills(void)
+{
+	process_directory("/sys/class/rfkill/", create_all_rfkills_callback);
+}
 =

 double rfkill::power_usage(struct result_bundle *result, struct parameter_=
bundle *bundle)
 {
@@ -185,4 +173,4 @@ double rfkill::power_usage(struct result_bundle *result=
, struct parameter_bundle
 	power +=3D util * factor / 100.0;
 =

 	return power;
-}
\ No newline at end of file
+}

--===============4935307448139340320==--

