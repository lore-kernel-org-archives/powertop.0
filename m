Content-Type: multipart/mixed; boundary="===============6362248331646210028=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 9/9] calibrate: use udev
Date: Mon, 01 Jun 2015 09:09:15 -0700
Message-ID: <1433174955-17349-10-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6362248331646210028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 src/calibrate/calibrate.cpp | 44 ++++++++++++-----------------------------=
---
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index 98abfe9..107d8d9 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -88,29 +88,16 @@ static void restore_all_sysfs(void)
 static void find_all_usb_callback(const char *d_name)
 {
 	char filename[4096];
-	ifstream file;
-
-	sprintf(filename, "/sys/bus/usb/devices/%s/power/active_duration", d_name=
);
-	if (access(filename, R_OK) !=3D 0)
-		return;
-
-	sprintf(filename, "/sys/bus/usb/devices/%s/power/idVendor", d_name);
-	file.open(filename, ios::in);
-	if (file) {
-		file.getline(filename, 4096);
-		file.close();
-		if (strcmp(filename, "1d6b") =3D=3D 0)
-			return;
-	}
-
-	sprintf(filename, "/sys/bus/usb/devices/%s/power/control", d_name);
+	sprintf(filename, "%s/power/control", d_name);
 	save_sysfs(filename);
 	usb_devices.push_back(filename);
 }
 =

 static void find_all_usb(void)
 {
-	process_directory("/sys/bus/usb/devices/", find_all_usb_callback);
+	process_subsystem("usb", find_all_usb_callback, 2,
+					  "+power/active_duration", NULL,
+					  "-power/idVendor", "1d6b");
 }
 =

 static void suspend_all_usb_devices(void)
@@ -124,16 +111,14 @@ static void suspend_all_usb_devices(void)
 static void find_all_rfkill_callback(const char *d_name)
 {
 	char filename[4096];
-	sprintf(filename, "/sys/class/rfkill/%s/soft", d_name);
-	if (access(filename, R_OK) !=3D 0)
-		return;
+	sprintf(filename, "%s/soft", d_name);
 	save_sysfs(filename);
 	rfkill_devices.push_back(filename);
 }
 =

 static void find_all_rfkill(void)
 {
-	process_directory("/sys/class/rfkill/", find_all_rfkill_callback);
+	process_subsystem("rfkill", find_all_rfkill_callback, 1, "+soft", NULL);
 }
 =

 static void rfkill_all_radios(void)
@@ -154,19 +139,16 @@ static void unrfkill_all_radios(void)
 static void find_backlight_callback(const char *d_name)
 {
 	char filename[4096];
-	sprintf(filename, "/sys/class/backlight/%s/brightness", d_name);
-	if (access(filename, R_OK) !=3D 0)
-		return;
-
+	sprintf(filename, "%s/brightness", d_name);
 	save_sysfs(filename);
 	backlight_devices.push_back(filename);
-	sprintf(filename, "/sys/class/backlight/%s/max_brightness", d_name);
+	sprintf(filename, "%s/max_brightness", d_name);
 	blmax =3D read_sysfs(filename);
 }
 =

 static void find_backlight(void)
 {
-	process_directory("/sys/class/backlight/", find_backlight_callback);
+	process_subsystem("backlight", find_backlight_callback, 1, "+brightness",=
 NULL);
 }
 =

 static void lower_backlight(void)
@@ -180,17 +162,15 @@ static void lower_backlight(void)
 static void find_scsi_link_callback(const char *d_name)
 {
 	char filename[4096];
-	sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_policy",=
 d_name);
-	if (access(filename, R_OK)!=3D0)
-		return;
-
+	sprintf(filename, "%s/link_power_management_policy", d_name);
 	save_sysfs(filename);
 	scsi_link_devices.push_back(filename);
 }
 =

 static void find_scsi_link(void)
 {
-	process_directory("/sys/class/scsi_host/", find_scsi_link_callback);
+	process_subsystem("scsi_host", find_scsi_link_callback, 1,
+			"+link_power_management_policy", NULL);
 }
 =

 static void set_scsi_link(const char *state)
-- =

2.4.1


--===============6362248331646210028==--

