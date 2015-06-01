Content-Type: multipart/mixed; boundary="===============7767151717442266567=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 7/9] runtime_pm: use udev
Date: Mon, 01 Jun 2015 09:09:13 -0700
Message-ID: <1433174955-17349-8-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7767151717442266567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 src/devices/runtime_pm.cpp | 98 +++++++++++++-----------------------------=
----
 1 file changed, 27 insertions(+), 71 deletions(-)

diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index 3dfebf4..edcfb0f 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -29,7 +29,6 @@
 #include <stdio.h>
 #include <unistd.h>
 #include <sys/types.h>
-#include <dirent.h>
 =

 #include "../parameters/parameters.h"
 #include "../lib.h"
@@ -178,85 +177,42 @@ int device_has_runtime_pm(const char *sysfs_path)
 	return 0;
 }
 =

-static void do_bus(const char *bus)
+static void do_bus(const char *filename)
 {
 	/* /sys/bus/pci/devices/0000\:00\:1f.0/power/runtime_suspended_time */
+	struct udev_device *udevice =3D udev_device_new_from_syspath(get_udev(), =
filename);
+	const char * name =3D udev_device_get_sysname(udevice);
+	const char * bus =3D udev_device_get_subsystem(udevice);
+	runtime_pmdevice *dev =3D new runtime_pmdevice(name, filename);
+
+	if (strcmp(bus, "i2c") =3D=3D 0) {
+		char dev_name[4096];
+		const char *new_dev =3D udev_device_get_sysattr_value(udevice, "new_devi=
ce");
+		const char *devname =3D udev_device_get_sysattr_value(udevice, "name");
+		sprintf(dev_name, _("I2C Device: %s"), devname);
+		sprintf(dev_name, _("I2C %s (%s): %s"), (new_dev ? _("Adapter") : _("Dev=
ice")), name, devname);
+		dev->set_human_name(dev_name);
+	}
 =

-	struct dirent *entry;
-	DIR *dir;
-	char filename[4096];
+	if (strcmp(bus, "pci") =3D=3D 0) {
+		char dev_name[4096];
+		char devname[4096];
 =

-	sprintf(filename, "/sys/bus/%s/devices/", bus);
-	dir =3D opendir(filename);
-	if (!dir)
-		return;
-	while (1) {
-		ifstream file;
-		class runtime_pmdevice *dev;
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		dev =3D new class runtime_pmdevice(entry->d_name, filename);
-
-		if (strcmp(bus, "i2c") =3D=3D 0) {
-			string devname;
-			char dev_name[4096];
-			bool is_adapter =3D false;
-
-			sprintf(filename, "/sys/bus/%s/devices/%s/new_device", bus, entry->d_na=
me);
-			if (access(filename, W_OK) =3D=3D 0)
-				is_adapter =3D true;
-
-			sprintf(filename, "/sys/bus/%s/devices/%s/name", bus, entry->d_name);
-			file.open(filename, ios::in);
-			if (file) {
-				getline(file, devname);
-				file.close();
-			}
-
-			sprintf(dev_name, _("I2C %s (%s): %s"), (is_adapter ? _("Adapter") : _(=
"Device")), entry->d_name, devname.c_str());
+		if (upci_id_to_name(udevice, devname)) {
+			sprintf(dev_name, _("PCI Device: %s"), devname);
 			dev->set_human_name(dev_name);
 		}
-
-		if (strcmp(bus, "pci") =3D=3D 0) {
-			uint16_t vendor =3D 0, device =3D 0;
-
-			sprintf(filename, "/sys/bus/%s/devices/%s/vendor", bus, entry->d_name);
-
-			file.open(filename, ios::in);
-			if (file) {
-				file >> hex >> vendor;
-				file.close();
-			}
-
-
-			sprintf(filename, "/sys/bus/%s/devices/%s/device", bus, entry->d_name);
-			file.open(filename, ios::in);
-			if (file) {
-				file >> hex >> device;
-				file.close();
-			}
-
-			if (vendor && device) {
-				char devname[4096];
-				sprintf(devname, _("PCI Device: %s"),
-					pci_id_to_name(vendor, device, filename, 4095));
-				dev->set_human_name(devname);
-			}
-		}
-		all_devices.push_back(dev);
 	}
-	closedir(dir);
+	all_devices.push_back(dev);
+
+	/* Cleanup */
+	udev_device_unref(udevice);
 }
 =

 void create_all_runtime_pm_devices(void)
 {
-	do_bus("pci");
-	do_bus("spi");
-	do_bus("platform");
-	do_bus("i2c");
+	process_subsystem("pci", do_bus, 0);
+	process_subsystem("spi", do_bus, 0);
+	process_subsystem("platform", do_bus, 0);
+	process_subsystem("i2c", do_bus, 0);
 }
-- =

2.4.1


--===============7767151717442266567==--

