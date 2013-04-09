Content-Type: multipart/mixed; boundary="===============5082607869650981385=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 4/5] Add RAPL DRAM domain
Date: Tue, 09 Apr 2013 09:20:10 -0700
Message-ID: <1365524411-11566-5-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1365524411-11566-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5082607869650981385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added DRAM RAPL domain as core CPU power. This will display as
"DRAM" in the device stats, if present.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
---
 src/Makefile.am              |  3 +-
 src/cpu/cpu.cpp              |  7 +++++
 src/cpu/dram_rapl_device.cpp | 71 ++++++++++++++++++++++++++++++++++++++++=
++++
 src/cpu/dram_rapl_device.h   | 56 ++++++++++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 src/cpu/dram_rapl_device.cpp
 create mode 100644 src/cpu/dram_rapl_device.h

diff --git a/src/Makefile.am b/src/Makefile.am
index fde079a..72971d8 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -32,7 +32,8 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		report/report-formatter-csv.cpp report/report-formatter-csv.h \
 		report/report-formatter-html.cpp report/report-formatter-html.h \
 		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
-		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp
+		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp \
+		cpu/dram_rapl_device.cpp =

 =

 =

 powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -Wsh=
adow -Wformat $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_=
CFLAGS)
diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 5a11924..0ef4e9e 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -32,6 +32,7 @@
 #include "cpu.h"
 #include "cpudevice.h"
 #include "cpu_rapl_device.h"
+#include "dram_rapl_device.h"
 #include "intel_cpus.h"
 #include "../parameters/parameters.h"
 =

@@ -61,6 +62,7 @@ static class abstract_cpu * new_package(int package, int =
cpu, char * vendor, int
 	class abstract_cpu *ret =3D NULL;
 	class cpudevice *cpudev;
 	class cpu_rapl_device *cpu_rapl_dev;
+	class dram_rapl_device *dram_rapl_dev;
 =

 	char packagename[128];
 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0) {
@@ -103,6 +105,11 @@ static class abstract_cpu * new_package(int package, i=
nt cpu, char * vendor, int
 	if (cpu_rapl_dev->device_present())
 		all_devices.push_back(cpu_rapl_dev);
 =

+	sprintf(packagename, _("dram rapl package %i"), cpu);
+	dram_rapl_dev =3D new class dram_rapl_device(cpudev, _("dram rapl package=
"), packagename, ret);
+	if (dram_rapl_dev->device_present())
+		all_devices.push_back(dram_rapl_dev);
+
 	return ret;
 }
 =

diff --git a/src/cpu/dram_rapl_device.cpp b/src/cpu/dram_rapl_device.cpp
new file mode 100644
index 0000000..a4a58eb
--- /dev/null
+++ b/src/cpu/dram_rapl_device.cpp
@@ -0,0 +1,71 @@
+/*
+ * Copyright 2010, Intel Corporation
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
+ *	Srinivas Pandruvada <Srinivas.Pandruvada(a)linux.intel.com>
+ */
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include "../parameters/parameters.h"
+#include "dram_rapl_device.h"
+
+
+dram_rapl_device::dram_rapl_device(cpudevice *parent, const char *classnam=
e, const char *dev_name, class abstract_cpu *_cpu)
+	: cpudevice(classname, dev_name, _cpu),
+	  device_valid(false)
+{
+	last_time =3D time(NULL);
+	if (rapl.dram_domain_present()) {
+		device_valid =3D true;
+		parent->add_child(this);
+		rapl.get_dram_energy_status(&last_energy);
+	}
+}
+
+void dram_rapl_device::start_measurement(void)
+{
+	last_time =3D time(NULL);
+
+	rapl.get_dram_energy_status(&last_energy);
+}
+
+void dram_rapl_device::end_measurement(void)
+{
+	time_t		curr_time =3D time(NULL);
+	double energy;
+
+	consumed_power =3D 0.0;
+	if ((curr_time - last_time) > 0) {
+		rapl.get_dram_energy_status(&energy);
+		consumed_power =3D (energy-last_energy)/(curr_time-last_time);
+		last_energy =3D energy;
+		last_time =3D curr_time;
+	}
+}
+
+double dram_rapl_device::power_usage(struct result_bundle *result, struct =
parameter_bundle *bundle)
+{
+	if (rapl.dram_domain_present())
+		return consumed_power;
+	else
+		return 0.0;
+}
diff --git a/src/cpu/dram_rapl_device.h b/src/cpu/dram_rapl_device.h
new file mode 100644
index 0000000..0d98be8
--- /dev/null
+++ b/src/cpu/dram_rapl_device.h
@@ -0,0 +1,56 @@
+/*
+ * Copyright 2010, Intel Corporation
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
+ *	Srinivas Pandruvada <Srinivas.Pandruvada(a)linux.intel.com>
+ */
+#ifndef _INCLUDE_GUARD_DRAM_RAPL_DEVICE_H
+#define _INCLUDE_GUARD_DRAM_RAPL_DEVICE_H
+
+#include <vector>
+#include <string>
+
+using namespace std;
+
+#include <sys/time.h>
+#include "cpudevice.h"
+#include "rapl/rapl_interface.h"
+
+class dram_rapl_device: public cpudevice {
+
+	c_rapl_interface rapl;
+	time_t		last_time;
+	double		last_energy;
+	double 		consumed_power;
+	bool		device_valid;
+
+public:
+	dram_rapl_device(cpudevice *parent, const char *classname =3D "dram_core"=
, const char *device_name =3D "dram_core", class abstract_cpu *_cpu =3D NUL=
L);
+	virtual const char * device_name(void) {return "DRAM";};
+	bool device_present() { return device_valid;}
+	virtual double power_usage(struct result_bundle *result, struct parameter=
_bundle *bundle);
+	void start_measurement(void);
+	void end_measurement(void);
+
+};
+
+
+#endif
-- =

1.7.11.7


--===============5082607869650981385==--

