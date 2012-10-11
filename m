Content-Type: multipart/mixed; boundary="===============1059704250807148768=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Move report.cpp and report.h to report/ directory.
Date: Thu, 11 Oct 2012 14:59:29 +0400
Message-ID: <1349953169-17112-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1059704250807148768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move report.cpp and report.h to report/ directory to other report-related
files.
---
 src/Makefile.am            |    4 +-
 src/cpu/cpu.cpp            |    2 +-
 src/devices/device.cpp     |    2 +-
 src/devlist.cpp            |    2 +-
 src/main.cpp               |    2 +-
 src/process/do_process.cpp |    2 +-
 src/report.cpp             |  195 ----------------------------------------=
----
 src/report.h               |   46 ----------
 src/tuning/tuning.cpp      |    2 +-
 9 files changed, 8 insertions(+), 249 deletions(-)
 delete mode 100644 src/report.cpp
 delete mode 100644 src/report.h

diff --git a/src/Makefile.am b/src/Makefile.am
index ccf3f0c..4c4a7c0 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -11,10 +11,10 @@ powertop_SOURCES =3D parameters/persistent.cpp paramete=
rs/learn.cpp parameters/par
 		parameters/parameters.h display.cpp cpu/cpu_core.cpp cpu/cpudevice.cpp  \
 		cpu/cpu.cpp cpu/cpu.h cpu/cpu_linux.cpp cpu/abstract_cpu.cpp cpu/intel_c=
pus.h \
 		cpu/cpu_package.cpp cpu/cpudevice.h cpu/intel_cpus.cpp devlist.h devlist=
.cpp \
-		lib.cpp report.cpp process/process.cpp process/interrupt.h process/timer=
.h  \
+		lib.cpp report/report.cpp process/process.cpp process/interrupt.h proces=
s/timer.h  \
 		process/processdevice.cpp process/powerconsumer.cpp process/work.h \
 		process/timer.cpp process/process.h process/work.cpp process/do_process.=
cpp \
-		process/processdevice.h process/interrupt.cpp process/powerconsumer.h re=
port.h \
+		process/processdevice.h process/interrupt.cpp process/powerconsumer.h re=
port/report.h \
 		perf/perf.cpp perf/perf_event.h perf/perf.h perf/perf_bundle.h perf/perf=
_bundle.cpp \
 		display.h devices/rfkill.h devices/i915-gpu.cpp devices/device.cpp devic=
es/alsa.cpp \
 		devices/runtime_pm.cpp devices/thinkpad-fan.cpp devices/usb.cpp devices/=
ahci.cpp \
diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 3d260d9..e65d828 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -36,7 +36,7 @@
 #include "../perf/perf_bundle.h"
 #include "../lib.h"
 #include "../display.h"
-#include "../report.h"
+#include "../report/report.h"
 #include "../report/report-maker.h"
 =

 static class abstract_cpu system_level;
diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index 01e37b4..00ec5e6 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -47,7 +47,7 @@ using namespace std;
 #include "../parameters/parameters.h"
 #include "../display.h"
 #include "../lib.h"
-#include "../report.h"
+#include "../report/report.h"
 #include "../report/report-maker.h"
 #include "../measurement/measurement.h"
 #include "../devlist.h"
diff --git a/src/devlist.cpp b/src/devlist.cpp
index c5d65e6..de5abff 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -42,7 +42,7 @@ using namespace std;
 =

 #include "devlist.h"
 #include "lib.h"
-#include "report.h"
+#include "report/report.h"
 #include "report/report-maker.h"
 =

 #include "process/process.h"
diff --git a/src/main.cpp b/src/main.cpp
index 7971f2b..e1dcb1c 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -56,7 +56,7 @@
 =

 #include "display.h"
 #include "devlist.h"
-#include "report.h"
+#include "report/report.h"
 =

 #define DEBUGFS_MAGIC          0x64626720
 =

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 7c61947..8f73083 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -28,7 +28,7 @@
 #include "work.h"
 #include "processdevice.h"
 #include "../lib.h"
-#include "../report.h"
+#include "../report/report.h"
 #include "../report/report-maker.h"
 #include "../devlist.h"
 =

diff --git a/src/report.cpp b/src/report.cpp
deleted file mode 100644
index a2000c9..0000000
--- a/src/report.cpp
+++ /dev/null
@@ -1,195 +0,0 @@
-/*
- * Copyright 2011, Intel Corporation
- *
- * This file is part of PowerTOP
- *
- * This program file is free software; you can redistribute it and/or modi=
fy it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but WIT=
HOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program in a file named COPYING; if not, write to the
- * Free Software Foundation, Inc,
- * 51 Franklin Street, Fifth Floor,
- * Boston, MA 02110-1301 USA
- * or just google for it.
- *
- * Authors:
- *	Arjan van de Ven <arjan(a)linux.intel.com>
- *  Chris Ferron <chris.e.ferron(a)linux.intel.com>
- */
-
-#include "lib.h"
-#include "report.h"
-#include "report/report-maker.h"
-#include <errno.h>
-#include <string.h>
-#include <utility>
-#include <iostream>
-#include <fstream>
-#include <string.h>
-#include <malloc.h>
-#include <unistd.h>
-
-using namespace std;
-
-struct reportstream reportout;
-report_type reporttype =3D REPORT_OFF;
-report_maker report(REPORT_OFF);
-
-string cpu_model(void)
-{
-	ifstream file;
-
-	file.open("/proc/cpuinfo", ios::in);
-
-	if (!file)
-		return "";
-
-	while (file) {
-		char line[4096];
-		file.getline(line, 4096);
-		if (strstr(line, "model name")) {
-			char *c;
-			c =3D strchr(line, ':');
-			if (c) {
-				file.close();
-				c++;
-				return c;
-			}
-		}
-	}
-	file.close();
-	return "";
-}
-
-static string read_os_release(const string &filename)
-{
-	ifstream file;
-	char content[4096];
-	char *c;
-	const char *pname =3D "PRETTY_NAME=3D";
-	string os("");
-
-	file.open(filename.c_str(), ios::in);
-	if (!file)
-		return "";
-	while (file.getline(content, 4096)) {
-		if (strncasecmp(pname, content, strlen(pname)) =3D=3D 0) {
-			c =3D strchr(content, '=3D');
-			if (!c)
-				break;
-			c +=3D 1;
-			if (*c =3D=3D '"' || *c =3D=3D '\'')
-				c +=3D 1;
-			*strchrnul(c, '"') =3D 0;
-			*strchrnul(c, '\'') =3D 0;
-			os =3D c;
-			break;
-		}
-	}
-	file.close();
-	return os;
-}
-
-static void system_info(void)
-{
-	string str, str2, str3;
-
-	report.begin_section(SECTION_SYSINFO);
-	report.add_header("System Information");
-	report.begin_table();
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell(CELL_SYSINFO);
-	report.add("PowerTOP Version");
-	report.begin_cell();
-	report.add(POWERTOP_VERSION);
-
-	str =3D read_sysfs_string("/proc/version");
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("Kernel Version");
-	report.begin_cell();
-	report.add(str.c_str());
-
-	str  =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_vendor");
-	str2 =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_name");
-	str3 =3D read_sysfs_string("/sys/devices/virtual/dmi/id/product_version");
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("System Name");
-	report.begin_cell();
-	report.addf("%s %s %s", str.c_str(), str2.c_str(), str3.c_str());
-
-	str =3D cpu_model();
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("CPU Information");
-	report.begin_cell();
-	report.addf("%lix %s", sysconf(_SC_NPROCESSORS_ONLN), str.c_str());
-
-	str =3D read_sysfs_string("/etc/system-release");
-	if (str.length() < 1)
-		str =3D read_sysfs_string("/etc/redhat-release");
-	if (str.length() < 1)
-		str =3D read_os_release("/etc/os-release");
-
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("OS Information");
-	report.begin_cell();
-	report.add(str.c_str());
-}
-
-void init_report_output(char *filename_str, int iterations)
-{
-	size_t period;
-	char file_prefix[4096];
-	char file_postfix[8];
-	time_t stamp;
-	char datestr[200];
-
-	string mystring =3D string(filename_str);
-	sprintf(file_postfix, "%s",
-		(reporttype =3D=3D REPORT_HTML ? "html" : "csv"));
-	period=3Dmystring.find_last_of(".");
-	sprintf(file_prefix, "%s",mystring.substr(0,period).c_str());
-	memset(&datestr, 0, 200);
-	memset(&stamp, 0, sizeof(time_t));
-	stamp=3Dtime(NULL);
-	strftime(datestr, sizeof(datestr), "%Y%m%d-%H%M%S", localtime(&stamp));
-
-	if (iterations !=3D 1)
-		sprintf(reportout.filename, "%s-%s.%s",
-			file_prefix, datestr,file_postfix);
-	else
-		sprintf(reportout.filename, "%s.%s",
-			file_prefix, file_postfix);
-
-	reportout.report_file =3D fopen(reportout.filename, "wm");
-	if (!reportout.report_file) {
-		fprintf(stderr, _("Cannot open output file %s (%s)\n"),
-			reportout.filename, strerror(errno));
-	}
-
-	report.set_type(reporttype);
-	system_info();
-}
-
-void finish_report_output(void)
-{
-	fprintf(stderr, _("PowerTOP outputing using base filename %s\n"), reporto=
ut.filename);
-	if (reporttype =3D=3D REPORT_OFF)
-		return;
-
-	report.finish_report();
-	fputs(report.get_result(), reportout.report_file);
-	fdatasync(fileno(reportout.report_file));
-	fclose(reportout.report_file);
-	report.clear_result();
-}
diff --git a/src/report.h b/src/report.h
deleted file mode 100644
index bf8f6de..0000000
--- a/src/report.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/*
- * Copyright 2010, Intel Corporation
- *
- * This file is part of PowerTOP
- *
- * This program file is free software; you can redistribute it and/or modi=
fy it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but WIT=
HOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program in a file named COPYING; if not, write to the
- * Free Software Foundation, Inc,
- * 51 Franklin Street, Fifth Floor,
- * Boston, MA 02110-1301 USA
- * or just google for it.
- *
- * Authors:
- *	Arjan van de Ven <arjan(a)linux.intel.com>
- */
-#ifndef __INCLUDE_GUARD_REPORT_H_
-#define __INCLUDE_GUARD_REPORT_H_
-
-#include <string>
-#include <stdio.h>
-
-#include "report/report-maker.h"
-
-using namespace std;
-
-struct reportstream {
-	FILE *report_file;
-	char filename[4096];
-};
-
-extern report_type reporttype;
-extern report_maker report;
-extern struct reportstream reportout;
-extern void init_report_output(char *filename_str, int iterations);
-extern void finish_report_output(void);
-
-#endif
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 69f0783..ebb4ac8 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -39,7 +39,7 @@
 #include "ethernet.h"
 #include "wifi.h"
 #include "../display.h"
-#include "../report.h"
+#include "../report/report.h"
 #include "../report/report-maker.h"
 #include "../lib.h"
 =

-- =

1.7.5.4


--===============1059704250807148768==--

