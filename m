Content-Type: multipart/mixed; boundary="===============7582240185601164878=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 6/8] usb: use process_directory()
Date: Thu, 19 Sep 2013 15:44:31 +0300
Message-ID: <20130919124431.GF2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7582240185601164878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

use process_directory() helper

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/devices/usb.cpp | 79 +++++++++++++++++++++----------------------------=
----
 1 file changed, 31 insertions(+), 48 deletions(-)

diff --git a/src/devices/usb.cpp b/src/devices/usb.cpp
index e7542a8..2c5d38b 100644
--- a/src/devices/usb.cpp
+++ b/src/devices/usb.cpp
@@ -25,11 +25,9 @@
 #include "usb.h"
 =

 #include <string.h>
-
 #include <stdio.h>
 #include <unistd.h>
 #include <sys/types.h>
-#include <dirent.h>
 =

 #include "../lib.h"
 #include "../parameters/parameters.h"
@@ -186,57 +184,42 @@ double usbdevice::power_usage(struct result_bundle *r=
esult, struct parameter_bun
 	return power;
 }
 =

-
-void create_all_usb_devices(void)
+static void create_all_usb_devices_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
-
-	dir =3D opendir("/sys/bus/usb/devices/");
-	if (!dir)
+	ifstream file;
+	class usbdevice *usb;
+	char device_name[4096];
+	char vendorid[64], devid[64];
+	char devid_name[4096];
+
+	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
+	sprintf(device_name, "%s/power/active_duration", filename);
+	if (access(device_name, R_OK) !=3D 0)
 		return;
-	while (1) {
-		ifstream file;
-		class usbdevice *usb;
-		char device_name[4096];
-		char vendorid[64], devid[64];
-		char devid_name[4096];
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		sprintf(filename, "/sys/bus/usb/devices/%s", entry->d_name);
-
-		sprintf(device_name, "%s/power/active_duration", filename);
-		if (access(device_name, R_OK)!=3D0)
-			continue;
-
-		sprintf(device_name, "%s/idVendor", filename);
-		file.open(device_name, ios::in);
-		if (file)
-			file.getline(vendorid, 64);
-		file.close();
-		sprintf(device_name, "%s/idProduct", filename);
-		file.open(device_name, ios::in);
-		if (file)
-			file.getline(devid, 64);
-		file.close();
-
-		sprintf(devid_name, "usb-device-%s-%s", vendorid, devid);
 =

-		sprintf(device_name, "usb-device-%s-%s-%s", entry->d_name, vendorid, dev=
id);
+	sprintf(device_name, "%s/idVendor", filename);
+	file.open(device_name, ios::in);
+	if (file)
+		file.getline(vendorid, 64);
+	file.close();
+	sprintf(device_name, "%s/idProduct", filename);
+	file.open(device_name, ios::in);
+	if (file)
+		file.getline(devid, 64);
+	file.close();
 =

-		if (result_device_exists(device_name))
-			continue;
+	sprintf(devid_name, "usb-device-%s-%s", vendorid, devid);
+	sprintf(device_name, "usb-device-%s-%s-%s", d_name, vendorid, devid);
+	if (result_device_exists(device_name))
+		return;
 =

-		usb =3D new class usbdevice(device_name, filename, devid_name);
-		all_devices.push_back(usb);
+	usb =3D new class usbdevice(device_name, filename, devid_name);
+	all_devices.push_back(usb);
+	register_parameter(devid_name, 0.1);
+}
 =

-		register_parameter(devid_name, 0.1);
-	}
-	closedir(dir);
+void create_all_usb_devices(void)
+{
+	process_directory("/sys/bus/usb/devices/", create_all_usb_devices_callbac=
k);
 }

--===============7582240185601164878==--

