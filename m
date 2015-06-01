Content-Type: multipart/mixed; boundary="===============5174616893034399291=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 5/9] runtime_tunable: use udev
Date: Mon, 01 Jun 2015 09:09:11 -0700
Message-ID: <1433174955-17349-6-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5174616893034399291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 src/devices/runtime_pm.cpp |   7 +++
 src/devices/runtime_pm.h   |   1 +
 src/tuning/runtime.cpp     | 140 ++++++++++++++---------------------------=
----
 src/tuning/runtime.h       |   6 +-
 4 files changed, 56 insertions(+), 98 deletions(-)

diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index eede027..3dfebf4 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -143,6 +143,13 @@ void runtime_pmdevice::set_human_name(char *_name)
 	strcpy(humanname, _name);
 }
 =

+int udevice_has_runtime_pm(struct udev_device* udevice)
+{
+	const char *sus_t =3D udev_device_get_sysattr_value(udevice, "power/runti=
me_suspended_time");
+	const char *act_t =3D udev_device_get_sysattr_value(udevice, "power/runti=
me_active_time");
+	return (sus_t !=3D NULL &&
+			(atoi(sus_t) || (act_t !=3D NULL && atoi(act_t))));
+}
 =

 int device_has_runtime_pm(const char *sysfs_path)
 {
diff --git a/src/devices/runtime_pm.h b/src/devices/runtime_pm.h
index ea09dac..0676ca3 100644
--- a/src/devices/runtime_pm.h
+++ b/src/devices/runtime_pm.h
@@ -60,6 +60,7 @@ public:
 extern void create_all_runtime_pm_devices(void);
 =

 extern int device_has_runtime_pm(const char *sysfs_path);
+extern int udevice_has_runtime_pm(struct udev_device* udevice);
 =

 =

 #endif
\ No newline at end of file
diff --git a/src/tuning/runtime.cpp b/src/tuning/runtime.cpp
index 3201fdd..463372d 100644
--- a/src/tuning/runtime.cpp
+++ b/src/tuning/runtime.cpp
@@ -25,135 +25,83 @@
 =

 #include "tuning.h"
 #include "tunable.h"
-#include "unistd.h"
 #include "runtime.h"
 #include <string.h>
 #include <utility>
-#include <iostream>
-#include <fstream>
 #include <unistd.h>
 #include <sys/types.h>
-#include <dirent.h>
 =

 #include "../lib.h"
 #include "../devices/runtime_pm.h"
 =

-runtime_tunable::runtime_tunable(const char *path, const char *bus, const =
char *dev) : tunable("", 0.4, _("Good"), _("Bad"), _("Unknown"))
+runtime_tunable::runtime_tunable(struct udev_device* udev_device) :
+	tunable("", 0.4, _("Good"), _("Bad"), _("Unknown")), tun_dev(udev_device)
 {
-	ifstream file;
-	sprintf(runtime_path, "%s/power/control", path);
-
-
-	sprintf(desc, _("Runtime PM for %s device %s"), bus, dev);
-	if (!device_has_runtime_pm(path))
-		sprintf(desc, _("%s device %s has no runtime power management"), bus, de=
v);
+	udev_device_ref(tun_dev);
+	const char *bus =3D udev_device_get_subsystem(udev_device);
+	const char *dev =3D udev_device_get_sysname(udev_device);
 =

+	/* Give more accurate descriptions for PCI devices */
 	if (strcmp(bus, "pci") =3D=3D 0) {
-		char filename[4096];
-		uint16_t vendor =3D 0, device =3D 0;
-
-		sprintf(filename, "/sys/bus/%s/devices/%s/vendor", bus, dev);
-
-		file.open(filename, ios::in);
-		if (file) {
-			file >> hex >> vendor;
-			file.close();
-		}
-
-
-		sprintf(filename, "/sys/bus/%s/devices/%s/device", bus, dev);
-		file.open(filename, ios::in);
-		if (file) {
-			file >> hex >> device;
-			file.close();
-		}
-
+		const char *uvendor =3D udev_device_get_sysattr_value(udev_device, "vend=
or");
+		const char *udevice =3D udev_device_get_sysattr_value(udev_device, "devi=
ce");
+		uint16_t vendor =3D stoul(string(uvendor), NULL, 16);
+		uint16_t device =3D stoul(string(udevice), NULL, 16);
+		bus =3D "PCI";
 		if (vendor && device) {
-			if (!device_has_runtime_pm(path))
-				sprintf(desc, _("PCI Device %s has no runtime power management"), pci_=
id_to_name(vendor, device, filename, 4095));
-			else
-				sprintf(desc, _("Runtime PM for PCI Device %s"), pci_id_to_name(vendor=
, device, filename, 4095));
+			char filename[4096];
+			dev =3D pci_id_to_name(vendor, device, filename, 4095);
 		}
+	}
 =

+	if (!udevice_has_runtime_pm(udev_device))
+		sprintf(desc, _("%s device %s has no runtime power management"), bus, de=
v);
+	else
+		sprintf(desc, _("Runtime PM for %s device %s"), bus, dev);
 =

-	}
-	sprintf(toggle_good, "echo 'auto' > '%s';", runtime_path);
-	sprintf(toggle_bad, "echo 'on' > '%s';", runtime_path);
+	const char *path =3D udev_device_get_syspath(udev_device);
+	sprintf(toggle_good, "echo 'auto' > '%s/power/control';", path);
+	sprintf(toggle_bad, "echo 'on' > '%s/power/control';", path);
 }
 =

-int runtime_tunable::good_bad(void)
+runtime_tunable::~runtime_tunable()
 {
-	string content;
-
-	content =3D read_sysfs_string(runtime_path);
+	udev_device_unref(tun_dev);
+}
 =

-	if (strcmp(content.c_str(), "auto") =3D=3D 0)
-		return TUNE_GOOD;
 =

-	return TUNE_BAD;
+int runtime_tunable::good_bad(void)
+{
+	const char * str1 =3D udev_device_get_sysattr_value(tun_dev, "power/contr=
ol");
+	return strcmp(str1, "auto") =3D=3D 0 ? TUNE_GOOD : TUNE_BAD;
 }
 =

 void runtime_tunable::toggle(void)
 {
-	int good;
-	good =3D good_bad();
-
-	if (good =3D=3D TUNE_GOOD) {
-		write_sysfs(runtime_path, "on");
-		return;
-	}
-
-	write_sysfs(runtime_path, "auto");
+	std::string str =3D good_bad() =3D=3D TUNE_GOOD ? "on" : "auto";
+	udev_device_set_sysattr_value(tun_dev, "power/control", &str[0]);
 }
 =

 const char *runtime_tunable::toggle_script(void)
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

-
-void add_runtime_tunables(const char *bus)
+static void add_runtime_callback(const char *path)
 {
-	struct dirent *entry;
-	DIR *dir;
-	char filename[4096];
-
-	sprintf(filename, "/sys/bus/%s/devices/", bus);
-	dir =3D opendir(filename);
-	if (!dir)
-		return;
-	while (1) {
-		class runtime_tunable *runtime;
-
-		entry =3D readdir(dir);
+	struct udev_device *dev =3D udev_device_new_from_syspath(get_udev(), path=
);
+	runtime_tunable *runtime =3D new runtime_tunable(dev);
 =

-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
+	if (!udevice_has_runtime_pm(dev))
+		all_untunables.push_back(runtime);
+	else
+		all_tunables.push_back(runtime);
 =

-		sprintf(filename, "/sys/bus/%s/devices/%s/power/control", bus, entry->d_=
name);
-
-		if (access(filename, R_OK) !=3D 0)
-			continue;
-
-
-		sprintf(filename, "/sys/bus/%s/devices/%s", bus, entry->d_name);
-
-		runtime =3D new class runtime_tunable(filename, bus, entry->d_name);
-
-		if (!device_has_runtime_pm(filename))
-			all_untunables.push_back(runtime);
-		else
-			all_tunables.push_back(runtime);
+	/* Cleanup */
+	udev_device_unref(dev);
+}
 =

-	}
-	closedir(dir);
+void add_runtime_tunables(const char *bus)
+{
+	process_subsystem(bus, add_runtime_callback, 1, "+power/control", NULL);
 }
diff --git a/src/tuning/runtime.h b/src/tuning/runtime.h
index a3c3e20..29307dd 100644
--- a/src/tuning/runtime.h
+++ b/src/tuning/runtime.h
@@ -31,9 +31,11 @@
 using namespace std;
 =

 class runtime_tunable : public tunable {
-	char runtime_path[4096];
+	struct udev_device *tun_dev;
 public:
-	runtime_tunable(const char *runtime_path, const char *bus, const char *de=
v);
+	runtime_tunable(struct udev_device* udev);
+
+	~runtime_tunable(void);
 =

 	virtual int good_bad(void);
 =

-- =

2.4.1


--===============5174616893034399291==--

