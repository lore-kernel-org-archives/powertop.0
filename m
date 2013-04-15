Content-Type: multipart/mixed; boundary="===============8451358728324559361=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 8/8] Add RAPL PP1 domain for GPU
Date: Mon, 15 Apr 2013 09:09:29 -0700
Message-ID: <1366042169-14523-9-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1366042169-14523-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8451358728324559361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added RAPL PP1 domain as GPU core power. This will show "GPU misc" and
"GPU core" in device stats, if PP1 domain is present.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
---
 src/Makefile.am                 |  2 +-
 src/devices/gpu_rapl_device.cpp | 70 +++++++++++++++++++++++++++++++++++++=
++++
 src/devices/gpu_rapl_device.h   | 57 +++++++++++++++++++++++++++++++++
 src/devices/i915-gpu.cpp        | 21 +++++++++++++
 src/devices/i915-gpu.h          |  6 +++-
 5 files changed, 154 insertions(+), 2 deletions(-)
 create mode 100644 src/devices/gpu_rapl_device.cpp
 create mode 100644 src/devices/gpu_rapl_device.h

diff --git a/src/Makefile.am b/src/Makefile.am
index cc4b6d7..7c37356 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -33,7 +33,7 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		report/report-formatter-html.cpp report/report-formatter-html.h \
 		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
 		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp \
-		cpu/dram_rapl_device.cpp
+		cpu/dram_rapl_device.cpp devices/gpu_rapl_device.cpp
 =

 =

 powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -Wsh=
adow -Wformat $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_=
CFLAGS)
diff --git a/src/devices/gpu_rapl_device.cpp b/src/devices/gpu_rapl_device.=
cpp
new file mode 100644
index 0000000..71d71a0
--- /dev/null
+++ b/src/devices/gpu_rapl_device.cpp
@@ -0,0 +1,70 @@
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
+#include "gpu_rapl_device.h"
+
+gpu_rapl_device::gpu_rapl_device(i915gpu *parent)
+	: i915gpu(),
+	  device_valid(false)
+{
+	last_time =3D time(NULL);
+	if (rapl.pp1_domain_present()) {
+		device_valid =3D true;
+		parent->add_child(this);
+		rapl.get_pp1_energy_status(&last_energy);
+	}
+}
+
+void gpu_rapl_device::start_measurement(void)
+{
+	last_time =3D time(NULL);
+
+	rapl.get_pp1_energy_status(&last_energy);
+}
+
+void gpu_rapl_device::end_measurement(void)
+{
+	time_t		curr_time =3D time(NULL);
+	double energy;
+
+	consumed_power =3D 0.0;
+	if ((curr_time - last_time) > 0) {
+		rapl.get_pp1_energy_status(&energy);
+		consumed_power =3D (energy-last_energy)/(curr_time-last_time);
+		last_energy =3D energy;
+		last_time =3D curr_time;
+	}
+}
+
+double gpu_rapl_device::power_usage(struct result_bundle *result, struct p=
arameter_bundle *bundle)
+{
+	if (rapl.pp1_domain_present())
+		return consumed_power;
+	else
+		return 0.0;
+}
diff --git a/src/devices/gpu_rapl_device.h b/src/devices/gpu_rapl_device.h
new file mode 100644
index 0000000..fbde246
--- /dev/null
+++ b/src/devices/gpu_rapl_device.h
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
+#ifndef _INCLUDE_GUARD_GPU_RAPL_DEVICE_H
+#define _INCLUDE_GUARD_GPU_RAPL_DEVICE_H
+
+#include <vector>
+#include <string>
+
+using namespace std;
+
+#include <sys/time.h>
+#include "i915-gpu.h"
+#include "cpu/rapl/rapl_interface.h"
+
+class gpu_rapl_device: public i915gpu {
+
+	c_rapl_interface rapl;
+	time_t		last_time;
+	double		last_energy;
+	double 		consumed_power;
+	bool		device_valid;
+
+public:
+	gpu_rapl_device(i915gpu *parent);
+	virtual const char * class_name(void) { return "GPU core";};
+	virtual const char * device_name(void) { return "GPU core";};
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
diff --git a/src/devices/i915-gpu.cpp b/src/devices/i915-gpu.cpp
index bcc07cc..a2cfaa5 100644
--- a/src/devices/i915-gpu.cpp
+++ b/src/devices/i915-gpu.cpp
@@ -37,6 +37,7 @@ using namespace std;
 #include "i915-gpu.h"
 #include "../parameters/parameters.h"
 #include "../process/powerconsumer.h"
+#include "gpu_rapl_device.h"
 =

 #include <string.h>
 #include <unistd.h>
@@ -47,6 +48,14 @@ i915gpu::i915gpu(): device()
 	rindex =3D get_result_index("gpu-operations");
 }
 =

+const char * i915gpu::device_name(void)
+{
+	if (child_devices.size())
+		return "GPU misc";
+	else
+		return "GPU";
+}
+
 void i915gpu::start_measurement(void)
 {
 }
@@ -66,6 +75,7 @@ void create_i915_gpu(void)
 {
 	char filename[4096];
 	class i915gpu *gpu;
+	gpu_rapl_device *rapl_dev;
 =

 	strcpy(filename, "/sys/kernel/debug/tracing/events/i915/i915_gem_ring_dis=
patch/format");
 =

@@ -80,6 +90,10 @@ void create_i915_gpu(void)
 =

 	gpu =3D new class i915gpu();
 	all_devices.push_back(gpu);
+
+	rapl_dev =3D new class gpu_rapl_device(gpu);
+	if (rapl_dev->device_present())
+		all_devices.push_back(rapl_dev);
 }
 =

 =

@@ -89,11 +103,18 @@ double i915gpu::power_usage(struct result_bundle *resu=
lt, struct parameter_bundl
 	double power;
 	double factor;
 	double util;
+	double child_power;
 =

 	power =3D 0;
 	factor =3D get_parameter_value(index, bundle);
 	util =3D get_result_value(rindex, result);
 =

 	power +=3D util * factor / 100.0;
+	for (unsigned int i =3D 0; i < child_devices.size(); ++i) {
+		child_power =3D child_devices[i]->power_usage(result, bundle);
+		if ((power - child_power) > 0.0)
+			power -=3D child_power;
+	}
+
 	return power;
 }
diff --git a/src/devices/i915-gpu.h b/src/devices/i915-gpu.h
index 25cf748..7653b94 100644
--- a/src/devices/i915-gpu.h
+++ b/src/devices/i915-gpu.h
@@ -31,6 +31,8 @@
 class i915gpu: public device {
 	int index;
 	int rindex;
+	vector<device *>child_devices;
+
 public:
 =

 	i915gpu();
@@ -42,10 +44,12 @@ public:
 =

 	virtual const char * class_name(void) { return "GPU";};
 =

-	virtual const char * device_name(void) { return "GPU";};
+	virtual const char * device_name(void);
 	virtual double power_usage(struct result_bundle *result, struct parameter=
_bundle *bundle);
 	virtual bool show_in_list(void) {return false;};
 	virtual const char * util_units(void) { return " ops/s"; };
+
+	virtual void add_child(device *dev_ptr) { child_devices.push_back(dev_ptr=
);}
 };
 =

 extern void create_i915_gpu(void);
-- =

1.7.11.7


--===============8451358728324559361==--

