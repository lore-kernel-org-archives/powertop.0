Content-Type: multipart/mixed; boundary="===============3974663259967292214=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 3/9] usb_tunable: use udev
Date: Mon, 01 Jun 2015 09:09:09 -0700
Message-ID: <1433174955-17349-4-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3974663259967292214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 src/tuning/tuningusb.cpp | 142 +++++++++++++++----------------------------=
----
 src/tuning/tuningusb.h   |   5 +-
 2 files changed, 47 insertions(+), 100 deletions(-)

diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
index d2a0c11..ea2d26b 100644
--- a/src/tuning/tuningusb.cpp
+++ b/src/tuning/tuningusb.cpp
@@ -25,132 +25,78 @@
 =

 #include "tuning.h"
 #include "tunable.h"
-#include "unistd.h"
 #include "tuningusb.h"
 #include <string.h>
-#include <dirent.h>
-#include <utility>
-#include <iostream>
-#include <fstream>
 =

-#include "../lib.h"
-
-usb_tunable::usb_tunable(const char *path, const char *name) : tunable("",=
 0.9, _("Good"), _("Bad"), _("Unknown"))
+usb_tunable::usb_tunable(struct udev_device *usb_dev) : tunable("", 0.9, _=
("Good"), _("Bad"), _("Unknown"))
 {
-	ifstream file;
-	char filename[4096];
-	char vendor[2048];
-	char product[2048];
-	string str1, str2;
-	sprintf(usb_path, "%s/power/control", path);
-
-	vendor[0] =3D 0;
-	product[0] =3D 0;
-
-	str1 =3D read_sysfs_string("%s/idVendor", path);
-	str2 =3D read_sysfs_string("%s/idProduct", path);
+	tun_dev =3D usb_dev;
+	udev_device_ref(tun_dev);
 =

-	sprintf(desc, _("Autosuspend for unknown USB device %s (%s:%s)"), name, s=
tr1.c_str(), str2.c_str());
+	const char * name =3D udev_device_get_sysname(usb_dev);
+	const char * vendor =3D udev_device_get_sysattr_value(usb_dev, "manufactu=
rer");
+	const char * product =3D udev_device_get_sysattr_value(usb_dev, "product"=
);
 =

-	sprintf(filename, "%s/manufacturer", path);
-	file.open(filename, ios::in);
-	if (file) {
-		file.getline(vendor, 2047);
-		if (strstr(vendor, "Linux "))
-			vendor[0] =3D 0;
-		file.close();
-	};
-	sprintf(filename, "%s/product", path);
-	file.open(filename, ios::in);
-	if (file) {
-		file.getline(product, 2040);
-		file.close();
-	};
-	if (strlen(vendor) && strlen(product))
+	if (vendor && product && strstr(vendor, "Linux "))
 		sprintf(desc, _("Autosuspend for USB device %s [%s]"), product, vendor);
-	else if (strlen(product))
+	else if (product)
 		sprintf(desc, _("Autosuspend for USB device %s [%s]"), product, name);
-	else if (strlen(vendor))
+	else if (vendor && strstr(vendor, "Linux "))
 		sprintf(desc, _("Autosuspend for USB device %s [%s]"), vendor, name);
+	else {
+		const char * str1 =3D udev_device_get_sysattr_value(usb_dev, "idVendor");
+		const char * str2 =3D udev_device_get_sysattr_value(usb_dev, "idProduct"=
);
+		sprintf(desc, _("Autosuspend for unknown USB device %s (%s:%s)"), name, =
str1, str2);
+	}
 =

-	sprintf(toggle_good, "echo 'auto' > '%s';", usb_path);
-	sprintf(toggle_bad, "echo 'on' > '%s';", usb_path);
+	const char * path =3D udev_device_get_syspath(usb_dev);
+	sprintf(toggle_good, "echo 'auto' > '%s/power/control';", path);
+	sprintf(toggle_bad, "echo 'on' > '%s/power/control';", path);
 }
 =

-int usb_tunable::good_bad(void)
+usb_tunable::~usb_tunable()
 {
-	string content;
-
-	content =3D read_sysfs_string(usb_path);
-
-	if (strcmp(content.c_str(), "auto") =3D=3D 0)
-		return TUNE_GOOD;
+	udev_device_unref(tun_dev);
+}
 =

-	return TUNE_BAD;
+int usb_tunable::good_bad(void)
+{
+	const char * str1 =3D udev_device_get_sysattr_value(tun_dev, "power/contr=
ol");
+	return strcmp(str1, "auto") =3D=3D 0 ? TUNE_GOOD : TUNE_BAD;
 }
 =

 void usb_tunable::toggle(void)
 {
-	int good;
-	good =3D good_bad();
-
-	if (good =3D=3D TUNE_GOOD) {
-		write_sysfs(usb_path, "on");
-		return;
-	}
-
-	write_sysfs(usb_path, "auto");
+	std::string str =3D good_bad() =3D=3D TUNE_GOOD ? "on" : "auto";
+	udev_device_set_sysattr_value(tun_dev, "power/control", &str[0]);
 }
 =

 const char *usb_tunable::toggle_script(void)
 {
-	int good;
-	good =3D good_bad();
-
-	if (good =3D=3D TUNE_GOOD) {
-		return toggle_bad;
-	}
-
-	return toggle_good;
+	return good_bad() =3D=3D TUNE_GOOD ? toggle_bad : toggle_good;
 }
 =

 static void add_usb_callback(const char *d_name)
 {
-	class usb_tunable *usb;
-	char filename[4096];
-	DIR *dir;
-
-	sprintf(filename, "/sys/bus/usb/devices/%s/power/control", d_name);
-	if (access(filename, R_OK) !=3D 0)
-		return;
-
-	sprintf(filename, "/sys/bus/usb/devices/%s/power/active_duration", d_name=
);
-	if (access(filename, R_OK)!=3D0)
-		return;
-
-	/* every interface of this device should support autosuspend */
-	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
-	if ((dir =3D opendir(filename))) {
-		struct dirent *entry;
-		while ((entry =3D readdir(dir))) {
-			/* dirname: <busnum>-<devnum>...:<config num>-<interface num> */
-			if (!isdigit(entry->d_name[0]))
-				continue;
-			sprintf(filename, "/sys/bus/usb/devices/%s/%s/supports_autosuspend", d_=
name, entry->d_name);
-			if (access(filename, R_OK) =3D=3D 0 && read_sysfs(filename) =3D=3D 0)
-				break;
-		}
-		closedir(dir);
-		if (entry)
-			return;
-	}
-
-	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
-	usb =3D new class usb_tunable(filename, d_name);
-	all_tunables.push_back(usb);
+	struct udev *udev =3D get_udev();
+	struct udev_device *dev =3D udev_device_new_from_syspath(udev, d_name);
+	struct udev_enumerate *dev_enumerate =3D udev_enumerate_new(udev);
+	udev_enumerate_add_match_parent(dev_enumerate, dev);
+	udev_enumerate_add_match_sysattr(dev_enumerate, "supports_autosuspend", "=
0");
+	udev_enumerate_scan_devices(dev_enumerate);
+
+	/* If no devices in tree lack autosuspend support, add to tunables */
+	if (udev_enumerate_get_list_entry(dev_enumerate) =3D=3D NULL)
+		all_tunables.push_back(new usb_tunable(dev));
+
+	/* Cleanup */
+	udev_device_unref(dev);
+	udev_enumerate_unref(dev_enumerate);
 }
 =

 void add_usb_tunables(void)
 {
-	process_directory("/sys/bus/usb/devices/", add_usb_callback);
+	process_subsystem("usb", add_usb_callback, 2,
+					  "+power/control", NULL,
+					  "+power/active_duration", NULL);
 }
diff --git a/src/tuning/tuningusb.h b/src/tuning/tuningusb.h
index a257904..3554b18 100644
--- a/src/tuning/tuningusb.h
+++ b/src/tuning/tuningusb.h
@@ -32,9 +32,10 @@
 using namespace std;
 =

 class usb_tunable : public tunable {
-	char usb_path[4096];
+	struct udev_device *tun_dev;
 public:
-	usb_tunable(const char *usb_path, const char *path);
+	usb_tunable(struct udev_device *usb_dev);
+	~usb_tunable();
 =

 	virtual int good_bad(void);
 =

-- =

2.4.1


--===============3974663259967292214==--

