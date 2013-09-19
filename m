Content-Type: multipart/mixed; boundary="===============2170258184913678552=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 3/8] calibrate: use process_directory()
Date: Thu, 19 Sep 2013 15:41:23 +0300
Message-ID: <20130919124123.GD2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2170258184913678552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

use process_directory() helper

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/calibrate/calibrate.cpp | 151 ++++++++++++++--------------------------=
----
 1 file changed, 48 insertions(+), 103 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index 5457cf8..db368e0 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -33,7 +33,6 @@
 #include <pthread.h>
 #include <math.h>
 #include <sys/types.h>
-#include <dirent.h>
 =

 #include "../parameters/parameters.h"
 extern "C" {
@@ -85,45 +84,32 @@ static void restore_all_sysfs(void)
 	set_wifi_power_saving("wlan0", wireless_PS);
 }
 =

-static void find_all_usb(void)
+static void find_all_usb_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
+	ifstream file;
 =

-	dir =3D opendir("/sys/bus/usb/devices/");
-	if (!dir)
+	sprintf(filename, "/sys/bus/usb/devices/%s/power/active_duration", d_name=
);
+	if (access(filename, R_OK) !=3D 0)
 		return;
-	while (1) {
-		ifstream file;
-
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		sprintf(filename, "/sys/bus/usb/devices/%s/power/active_duration", entry=
->d_name);
-		if (access(filename, R_OK)!=3D0)
-			continue;
-
-		sprintf(filename, "/sys/bus/usb/devices/%s/power/idVendor", entry->d_nam=
e);
-		file.open(filename, ios::in);
-		if (file) {
-			file.getline(filename, 4096);
-			file.close();
-			if (strcmp(filename, "1d6b")=3D=3D0)
-				continue;
-		}
 =

-		sprintf(filename, "/sys/bus/usb/devices/%s/power/control", entry->d_name=
);
+	sprintf(filename, "/sys/bus/usb/devices/%s/power/idVendor", d_name);
+	file.open(filename, ios::in);
+	if (file) {
+		file.getline(filename, 4096);
+		file.close();
+		if (strcmp(filename, "1d6b") =3D=3D 0)
+			return;
+	}
 =

-		save_sysfs(filename);
+	sprintf(filename, "/sys/bus/usb/devices/%s/power/control", d_name);
+	save_sysfs(filename);
+	usb_devices.push_back(filename);
+}
 =

-		usb_devices.push_back(filename);
-	}
-	closedir(dir);
+static void find_all_usb(void)
+{
+	process_directory("/sys/bus/usb/devices/", find_all_usb_callback);
 }
 =

 static void suspend_all_usb_devices(void)
@@ -134,33 +120,19 @@ static void suspend_all_usb_devices(void)
 		write_sysfs(usb_devices[i], "auto\n");
 }
 =

-
-static void find_all_rfkill(void)
+static void find_all_rfkill_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
-
-	dir =3D opendir("/sys/class/rfkill/");
-	if (!dir)
+	sprintf(filename, "/sys/class/rfkill/%s/soft", d_name);
+	if (access(filename, R_OK) !=3D 0)
 		return;
-	while (1) {
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		sprintf(filename, "/sys/class/rfkill/%s/soft", entry->d_name);
-		if (access(filename, R_OK)!=3D0)
-			continue;
-
-		save_sysfs(filename);
+	save_sysfs(filename);
+	rfkill_devices.push_back(filename);
+}
 =

-		rfkill_devices.push_back(filename);
-	}
-	closedir(dir);
+static void find_all_rfkill(void)
+{
+	process_directory("/sys/class/rfkill/", find_all_rfkill_callback);
 }
 =

 static void rfkill_all_radios(void)
@@ -178,35 +150,22 @@ static void unrfkill_all_radios(void)
 		write_sysfs(rfkill_devices[i], "0\n");
 }
 =

-static void find_backlight(void)
+static void find_backlight_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
-
-	dir =3D opendir("/sys/class/backlight/");
-	if (!dir)
+	sprintf(filename, "/sys/class/backlight/%s/brightness", d_name);
+	if (access(filename, R_OK) !=3D 0)
 		return;
-	while (1) {
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		sprintf(filename, "/sys/class/backlight/%s/brightness", entry->d_name);
-		if (access(filename, R_OK)!=3D0)
-			continue;
 =

-		save_sysfs(filename);
-
-		backlight_devices.push_back(filename);
+	save_sysfs(filename);
+	backlight_devices.push_back(filename);
+	sprintf(filename, "/sys/class/backlight/%s/max_brightness", d_name);
+	blmax =3D read_sysfs(filename);
+}
 =

-		sprintf(filename, "/sys/class/backlight/%s/max_brightness", entry->d_nam=
e);
-		blmax =3D read_sysfs(filename);
-	}
-	closedir(dir);
+static void find_backlight(void)
+{
+	process_directory("/sys/class/backlight/", find_backlight_callback);
 }
 =

 static void lower_backlight(void)
@@ -217,34 +176,20 @@ static void lower_backlight(void)
 		write_sysfs(backlight_devices[i], "0\n");
 }
 =

-
-static void find_scsi_link(void)
+static void find_scsi_link_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
-
-	dir =3D opendir("/sys/class/scsi_host/");
-	if (!dir)
+	sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_policy",=
 d_name);
+	if (access(filename, R_OK)!=3D0)
 		return;
-	while (1) {
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_policy"=
, entry->d_name);
-		if (access(filename, R_OK)!=3D0)
-			continue;
 =

-		save_sysfs(filename);
-
-		scsi_link_devices.push_back(filename);
+	save_sysfs(filename);
+	scsi_link_devices.push_back(filename);
+}
 =

-	}
-	closedir(dir);
+static void find_scsi_link(void)
+{
+	process_directory("/sys/class/scsi_host/", find_scsi_link_callback);
 }
 =

 static void set_scsi_link(const char *state)

--===============2170258184913678552==--

