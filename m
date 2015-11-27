Content-Type: multipart/mixed; boundary="===============7164546449203321167=="
MIME-Version: 1.0
From: Stewart Smith <stewart at linux.vnet.ibm.com>
Subject: [Powertop] [PATCH 2/2] Add support for power consumption sensors
 through opal-sensors sysfs
Date: Fri, 27 Nov 2015 11:07:29 +1100
Message-ID: <1448582849-1707-3-git-send-email-stewart@linux.vnet.ibm.com>
In-Reply-To: 1448582849-1707-1-git-send-email-stewart@linux.vnet.ibm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7164546449203321167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The OPAL firmware on PowerNV (non-virtualized POWER) may export
certain sensors in the system through sysfs entries.

While arguably we *should* go and support the more standard locations
in sysfs to put power information (which existing powertop code would
pick up without modification), existing systems do have this interface
and the extra code needed to get information from it is minimal.

With this patch, on a powernv system that has a power consumption
sensor (e.g. an IBM S822L), powertop will display current power
usage.

Signed-off-by: Stewart Smith <stewart(a)linux.vnet.ibm.com>
---
 src/Makefile.am                  |  2 ++
 src/measurement/measurement.cpp  | 14 +++++++++++
 src/measurement/opal-sensors.cpp | 50 ++++++++++++++++++++++++++++++++++++=
++++
 src/measurement/opal-sensors.h   | 41 ++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 src/measurement/opal-sensors.cpp
 create mode 100644 src/measurement/opal-sensors.h

diff --git a/src/Makefile.am b/src/Makefile.am
index 87d8469b2e01..8357bae831d3 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -67,6 +67,8 @@ powertop_SOURCES =3D \
 	measurement/measurement.h \
 	measurement/sysfs.cpp \
 	measurement/sysfs.h \
+	measurement/opal-sensors.cpp \
+	measurement/opal-sensors.h \
 	parameters/learn.cpp \
 	parameters/parameters.cpp \
 	parameters/parameters.h \
diff --git a/src/measurement/measurement.cpp b/src/measurement/measurement.=
cpp
index efbdc1e6041a..68c41fef3163 100644
--- a/src/measurement/measurement.cpp
+++ b/src/measurement/measurement.cpp
@@ -26,6 +26,7 @@
 #include "acpi.h"
 #include "extech.h"
 #include "sysfs.h"
+#include "opal-sensors.h"
 #include "../parameters/parameters.h"
 #include "../lib.h"
 =

@@ -130,9 +131,22 @@ void acpi_power_meters_callback(const char *d_name)
 		power_meters.push_back(meter);
 }
 =

+void sysfs_opal_sensors_callback(const char *d_name)
+{
+	class opal_sensors_power_meter *meter;
+
+	if (strncmp(d_name, "power", 5) !=3D 0)
+		return;
+
+	meter =3D new(std::nothrow) class opal_sensors_power_meter(d_name);
+	if (meter)
+		power_meters.push_back(meter);
+}
+
 void detect_power_meters(void)
 {
 	process_directory("/sys/class/power_supply", sysfs_power_meters_callback);
+	process_directory("/sys/devices/platform/opal-sensor/hwmon/hwmon0", sysfs=
_opal_sensors_callback);
 	if (power_meters.size() =3D=3D 0) {
 		process_directory("/proc/acpi/battery", acpi_power_meters_callback);
 	}
diff --git a/src/measurement/opal-sensors.cpp b/src/measurement/opal-sensor=
s.cpp
new file mode 100644
index 000000000000..4198b63aa5c1
--- /dev/null
+++ b/src/measurement/opal-sensors.cpp
@@ -0,0 +1,50 @@
+/*
+ * Copyright (c) 2015 IBM Corp.
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
+ * You should have received a copy of the GNU General Public License
+ * along with this program in a file named COPYING; if not, write to the
+ * Free Software Foundation, Inc,
+ * 51 Franklin Street, Fifth Floor,
+ * Boston, MA 02110-1301 USA
+ * or just google for it.
+ *
+ * Authors:
+ *	Stewart Smith <stewart(a)linux.vnet.ibm.com>
+ */
+#include "measurement.h"
+#include "opal-sensors.h"
+#include "../lib.h"
+#include <string.h>
+#include <stdio.h>
+#include <limits.h>
+
+opal_sensors_power_meter::opal_sensors_power_meter(const char *power_suppl=
y_name)
+{
+	strncpy(name, power_supply_name, sizeof(name));
+}
+
+double opal_sensors_power_meter::joules_consumed(void)
+{
+	char filename[PATH_MAX];
+	bool ok;
+	int value;
+	double r =3D 0;
+
+	snprintf(filename, sizeof(filename), "/sys/devices/platform/opal-sensor/h=
wmon/hwmon0/%s", name);
+	value =3D read_sysfs(filename, &ok);
+
+	if(ok)
+		r =3D value / 1000000.0;
+	return r;
+}
diff --git a/src/measurement/opal-sensors.h b/src/measurement/opal-sensors.h
new file mode 100644
index 000000000000..d8aa5e2e554e
--- /dev/null
+++ b/src/measurement/opal-sensors.h
@@ -0,0 +1,41 @@
+/*
+ * Copyright (c) 2015 IBM Corp.
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
+ * You should have received a copy of the GNU General Public License
+ * along with this program in a file named COPYING; if not, write to the
+ * Free Software Foundation, Inc,
+ * 51 Franklin Street, Fifth Floor,
+ * Boston, MA 02110-1301 USA
+ * or just google for it.
+ *
+ * Authors:
+ *	Stewart Smith <stewart(a)linux.vnet.ibm.com>
+ */
+#ifndef INCLUDE_GUARD_OPAL_SENSORS_H
+#define INCLUDE_GUARD_OPAL_SENSORS_H
+
+#include "measurement.h"
+
+class opal_sensors_power_meter: public power_meter {
+	char name[256];
+public:
+	opal_sensors_power_meter(const char *power_supply_name);
+	virtual void start_measurement(void) {};
+	virtual void end_measurement(void) {};
+
+	virtual double joules_consumed(void);
+	virtual double dev_capacity(void) { return 0.0; }
+};
+
+#endif
-- =

2.1.4


--===============7164546449203321167==--

