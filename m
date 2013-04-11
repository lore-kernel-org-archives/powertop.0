Content-Type: multipart/mixed; boundary="===============5865461533452419495=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 6/8] Added PP0 RAPL domain for CPU
Date: Thu, 11 Apr 2013 16:58:54 -0700
Message-ID: <1365724736-411-7-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1365724736-411-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5865461533452419495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added PP0 RAPL domain as core CPU power. This will display as
"cpu core" in the device stats.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
---
 src/Makefile.am             |  2 +-
 src/cpu/cpu.cpp             |  9 ++++++
 src/cpu/cpu_rapl_device.cpp | 74 +++++++++++++++++++++++++++++++++++++++++=
++++
 src/cpu/cpu_rapl_device.h   | 57 ++++++++++++++++++++++++++++++++++
 4 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 src/cpu/cpu_rapl_device.cpp
 create mode 100644 src/cpu/cpu_rapl_device.h

diff --git a/src/Makefile.am b/src/Makefile.am
index 0983b51..fde079a 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -32,7 +32,7 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		report/report-formatter-csv.cpp report/report-formatter-csv.h \
 		report/report-formatter-html.cpp report/report-formatter-html.h \
 		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
-		cpu/rapl/rapl_interface.cpp
+		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp
 =

 =

 powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -Wsh=
adow -Wformat $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_=
CFLAGS)
diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 1eb340c..5a11924 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -31,6 +31,7 @@
 #include <unistd.h>
 #include "cpu.h"
 #include "cpudevice.h"
+#include "cpu_rapl_device.h"
 #include "intel_cpus.h"
 #include "../parameters/parameters.h"
 =

@@ -59,6 +60,8 @@ static class abstract_cpu * new_package(int package, int =
cpu, char * vendor, int
 {
 	class abstract_cpu *ret =3D NULL;
 	class cpudevice *cpudev;
+	class cpu_rapl_device *cpu_rapl_dev;
+
 	char packagename[128];
 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0) {
 		if (family =3D=3D 6)
@@ -94,6 +97,12 @@ static class abstract_cpu * new_package(int package, int=
 cpu, char * vendor, int
 	sprintf(packagename, _("cpu package %i"), cpu);
 	cpudev =3D new class cpudevice(_("cpu package"), packagename, ret);
 	all_devices.push_back(cpudev);
+
+	sprintf(packagename, _("cpu rapl package %i"), cpu);
+	cpu_rapl_dev =3D new class cpu_rapl_device(cpudev, _("cpu rapl package"),=
 packagename, ret);
+	if (cpu_rapl_dev->device_present())
+		all_devices.push_back(cpu_rapl_dev);
+
 	return ret;
 }
 =

diff --git a/src/cpu/cpu_rapl_device.cpp b/src/cpu/cpu_rapl_device.cpp
new file mode 100644
index 0000000..be10d9e
--- /dev/null
+++ b/src/cpu/cpu_rapl_device.cpp
@@ -0,0 +1,74 @@
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
+ *	Srinivas Pandruvada<Srinivas.Pandruvada(a)linux.intel.com>
+ */
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include "../parameters/parameters.h"
+#include "cpu_rapl_device.h"
+
+cpu_rapl_device::cpu_rapl_device(cpudevice *parent, const char *classname,=
 const char *dev_name, class abstract_cpu *_cpu)
+	: cpudevice(classname, dev_name, _cpu),
+	  device_valid(false)
+{
+	if (_cpu)
+		rapl =3D new c_rapl_interface(cpu->get_first_cpu());
+	else
+		rapl =3D new c_rapl_interface(0);
+	last_time =3D time(NULL);
+	if (rapl->pp0_domain_present()) {
+		device_valid =3D true;
+		parent->add_child(this);
+		rapl->get_pp0_energy_status(&last_energy);
+	}
+}
+
+void cpu_rapl_device::start_measurement(void)
+{
+	last_time =3D time(NULL);
+
+	rapl->get_pp0_energy_status(&last_energy);
+}
+
+void cpu_rapl_device::end_measurement(void)
+{
+	time_t		curr_time =3D time(NULL);
+	double energy;
+
+	consumed_power =3D 0.0;
+	if ((curr_time - last_time) > 0) {
+		rapl->get_pp0_energy_status(&energy);
+		consumed_power =3D (energy-last_energy)/(curr_time-last_time);
+		last_energy =3D energy;
+		last_time =3D curr_time;
+	}
+}
+
+double cpu_rapl_device::power_usage(struct result_bundle *result, struct p=
arameter_bundle *bundle)
+{
+	if (rapl->pp0_domain_present())
+		return consumed_power;
+	else
+		return 0.0;
+}
diff --git a/src/cpu/cpu_rapl_device.h b/src/cpu/cpu_rapl_device.h
new file mode 100644
index 0000000..407f2da
--- /dev/null
+++ b/src/cpu/cpu_rapl_device.h
@@ -0,0 +1,57 @@
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
+#ifndef _INCLUDE_GUARD_CPU_RAPL_DEVICE_H
+#define _INCLUDE_GUARD_CPU_RAPL_DEVICE_H
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
+class cpu_rapl_device: public cpudevice {
+
+	c_rapl_interface *rapl;
+	time_t		last_time;
+	double		last_energy;
+	double 		consumed_power;
+	bool		device_valid;
+
+public:
+	cpu_rapl_device(cpudevice *parent, const char *classname =3D "cpu_core", =
const char *device_name =3D "cpu_core", class abstract_cpu *_cpu =3D NULL);
+	~cpu_rapl_device() { delete rapl; }
+	virtual const char * device_name(void) {return "CPU core";};
+	bool device_present() { return device_valid;}
+	virtual double power_usage(struct result_bundle *result, struct parameter=
_bundle *bundle);
+	virtual void start_measurement(void);
+	virtual void end_measurement(void);
+
+};
+
+
+#endif
-- =

1.7.11.7


--===============5865461533452419495==--

