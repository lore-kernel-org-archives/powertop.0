Content-Type: multipart/mixed; boundary="===============6980509042600404699=="
MIME-Version: 1.0
From: Daniel Leung <daniel.leung at linux.intel.com>
Subject: [Powertop] [PATCH 1/1] Add I2C runtime PM tunables
Date: Wed, 25 Feb 2015 16:38:04 -0800
Message-ID: <1424911084-10027-1-git-send-email-daniel.leung@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6980509042600404699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adds I2C adapters and devices into "Tunables" tab
for runtime PM.

Signed-off-by: Daniel Leung <daniel.leung(a)linux.intel.com>
---
 Android.mk                 |   1 +
 src/Makefile.am            |   2 +
 src/devices/runtime_pm.cpp |  12 +++--
 src/tuning/tuning.cpp      |   2 +
 src/tuning/tuningi2c.cpp   | 129 +++++++++++++++++++++++++++++++++++++++++=
++++
 src/tuning/tuningi2c.h     |  45 ++++++++++++++++
 6 files changed, 188 insertions(+), 3 deletions(-)
 create mode 100644 src/tuning/tuningi2c.cpp
 create mode 100644 src/tuning/tuningi2c.h

diff --git a/Android.mk b/Android.mk
index cf13fe8..2461233 100644
--- a/Android.mk
+++ b/Android.mk
@@ -42,6 +42,7 @@ LOCAL_SRC_FILES +=3D \
 	src/report.cpp \
 	src/main.cpp \
 	src/tuning/tuning.cpp \
+	src/tuning/tuningi2c.cpp \
 	src/tuning/usb.cpp \
 	src/tuning/bluetooth.cpp \
 	src/tuning/ethernet.cpp \
diff --git a/src/Makefile.am b/src/Makefile.am
index d2f1da7..820b6e1 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -118,6 +118,8 @@ powertop_SOURCES =3D \
 	tuning/tuningsysfs.h \
 	tuning/tuningusb.cpp \
 	tuning/tuningusb.h \
+	tuning/tuningi2c.cpp \
+	tuning/tuningi2c.h \
 	tuning/wifi.cpp \
 	tuning/wifi.h
 =

diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index cba34fc..eede027 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -196,16 +196,22 @@ static void do_bus(const char *bus)
 		dev =3D new class runtime_pmdevice(entry->d_name, filename);
 =

 		if (strcmp(bus, "i2c") =3D=3D 0) {
-			char devname[4096];
+			string devname;
 			char dev_name[4096];
+			bool is_adapter =3D false;
+
+			sprintf(filename, "/sys/bus/%s/devices/%s/new_device", bus, entry->d_na=
me);
+			if (access(filename, W_OK) =3D=3D 0)
+				is_adapter =3D true;
+
 			sprintf(filename, "/sys/bus/%s/devices/%s/name", bus, entry->d_name);
 			file.open(filename, ios::in);
 			if (file) {
-				file >> devname;
+				getline(file, devname);
 				file.close();
 			}
 =

-			sprintf(dev_name, _("I2C Device: %s"), devname);
+			sprintf(dev_name, _("I2C %s (%s): %s"), (is_adapter ? _("Adapter") : _(=
"Device")), entry->d_name, devname.c_str());
 			dev->set_human_name(dev_name);
 		}
 =

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 5414022..a701cdb 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -31,6 +31,7 @@
 =

 =

 #include "tuning.h"
+#include "tuningi2c.h"
 #include "tuningsysfs.h"
 #include "tuningusb.h"
 #include "runtime.h"
@@ -68,6 +69,7 @@ static void init_tuning(void)
 	add_ethernet_tunable();
 	add_bt_tunable();
 	add_wifi_tunables();
+	add_i2c_tunables();
 =

 	sort_tunables();
 }
diff --git a/src/tuning/tuningi2c.cpp b/src/tuning/tuningi2c.cpp
new file mode 100644
index 0000000..2a272a4
--- /dev/null
+++ b/src/tuning/tuningi2c.cpp
@@ -0,0 +1,129 @@
+/*
+ * Copyright 2015, Intel Corporation
+ *
+ * This file is part of PowerTOP
+ *
+ * This program file is free software; you can redistribute it and/or modi=
fy it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ *
+ * Authors:
+ *	Arjan van de Ven <arjan(a)linux.intel.com>
+ *	Daniel Leung <daniel.leung(a)linux.intel.com>
+ */
+
+#include "tuning.h"
+#include "tunable.h"
+#include "unistd.h"
+#include "tuningi2c.h"
+#include <string.h>
+#include <dirent.h>
+#include <utility>
+#include <iostream>
+#include <fstream>
+#include <ctype.h>
+
+#include "../lib.h"
+#include "../devices/runtime_pm.h"
+
+i2c_tunable::i2c_tunable(const char *path, const char *name, bool is_adapt=
er) : tunable("", 0.9, _("Good"), _("Bad"), _("Unknown"))
+{
+	ifstream file;
+	char filename[4096];
+	string devname;
+
+	sprintf(filename, "%s/name", path);
+	file.open(filename, ios::in);
+	if (file) {
+		getline(file, devname);
+		file.close();
+	}
+
+	if (is_adapter) {
+		sprintf(i2c_path, "%s/device/power/control", path);
+		sprintf(filename, "%s/device", path);
+	} else {
+		sprintf(i2c_path, "%s/power/control", path);
+		sprintf(filename, "%s/device", path);
+	}
+
+	if (device_has_runtime_pm(filename))
+		sprintf(desc, _("Runtime PM for I2C %s %s (%s)"), (is_adapter ? _("Adapt=
er") : _("Device")), name, (devname.empty() ? "" : devname.c_str()));
+	else
+		sprintf(desc, _("I2C %s %s has no runtime power management"), (is_adapte=
r ? _("Adapter") : _("Device")), name);
+
+	sprintf(toggle_good, "echo 'auto' > '%s';", i2c_path);
+	sprintf(toggle_bad, "echo 'on' > '%s';", i2c_path);
+}
+
+int i2c_tunable::good_bad(void)
+{
+	string content;
+
+	content =3D read_sysfs_string(i2c_path);
+
+	if (strcmp(content.c_str(), "auto") =3D=3D 0)
+		return TUNE_GOOD;
+
+	return TUNE_BAD;
+}
+
+void i2c_tunable::toggle(void)
+{
+	int good;
+	good =3D good_bad();
+
+	if (good =3D=3D TUNE_GOOD) {
+		write_sysfs(i2c_path, "on");
+		return;
+	}
+
+	write_sysfs(i2c_path, "auto");
+}
+
+const char *i2c_tunable::toggle_script(void)
+{
+	int good;
+	good =3D good_bad();
+
+	if (good =3D=3D TUNE_GOOD) {
+		return toggle_bad;
+	}
+
+	return toggle_good;
+}
+
+static void add_i2c_callback(const char *d_name)
+{
+	class i2c_tunable *i2c;
+	char filename[4096];
+	DIR *dir;
+	bool is_adapter =3D false;
+
+	sprintf(filename, "/sys/bus/i2c/devices/%s/new_device", d_name);
+	if (access(filename, W_OK) =3D=3D 0)
+		is_adapter =3D true;
+
+	sprintf(filename, "/sys/bus/i2c/devices/%s", d_name);
+	i2c =3D new class i2c_tunable(filename, d_name, is_adapter);
+
+	if (is_adapter)
+		sprintf(filename, "/sys/bus/i2c/devices/%s/device", d_name);
+	else
+		sprintf(filename, "/sys/bus/i2c/devices/%s", d_name);
+
+	if (device_has_runtime_pm(filename))
+		all_tunables.push_back(i2c);
+	else
+		all_untunables.push_back(i2c);
+}
+
+void add_i2c_tunables(void)
+{
+	process_directory("/sys/bus/i2c/devices/", add_i2c_callback);
+}
diff --git a/src/tuning/tuningi2c.h b/src/tuning/tuningi2c.h
new file mode 100644
index 0000000..a970faf
--- /dev/null
+++ b/src/tuning/tuningi2c.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright 2015, Intel Corporation
+ *
+ * This file is part of PowerTOP
+ *
+ * This program file is free software; you can redistribute it and/or modi=
fy it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ *
+ * Authors:
+ *	Arjan van de Ven <arjan(a)linux.intel.com>
+ *	Daniel Leung <daniel.leung(a)linux.intel.com>
+ */
+
+#ifndef _INCLUDE_GUARD_I2C_TUNE_H
+#define _INCLUDE_GUARD_I2C_TUNE_H
+
+#include <vector>
+
+#include "tunable.h"
+
+using namespace std;
+
+class i2c_tunable : public tunable {
+	char i2c_path[4096];
+public:
+	i2c_tunable(const char *path, const char *name, bool is_adapter);
+
+	virtual int good_bad(void);
+
+	virtual void toggle(void);
+
+	virtual const char *toggle_script(void);
+
+};
+
+extern void add_i2c_tunables(void);
+
+
+#endif
-- =

1.8.3.2


--===============6980509042600404699==--

