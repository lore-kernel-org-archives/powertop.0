Content-Type: multipart/mixed; boundary="===============7525301880503318210=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 29/31] tunables: removed on-demand cpu frequency
 governor
Date: Fri, 15 Nov 2013 16:29:16 -0800
Message-ID: <1384561758-21516-30-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7525301880503318210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove suggestion to use the on-demand cpu frequency governor from
PowerTOP tunables as that is no longer a good suggestion since the
P-State driver is the Intel recommended replacement.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/Makefile.am        |    4 +-
 src/tuning/cpufreq.cpp |  213 --------------------------------------------=
----
 src/tuning/cpufreq.h   |   50 ------------
 src/tuning/tuning.cpp  |    2 -
 4 files changed, 2 insertions(+), 267 deletions(-)
 delete mode 100644 src/tuning/cpufreq.cpp
 delete mode 100644 src/tuning/cpufreq.h

diff --git a/src/Makefile.am b/src/Makefile.am
index e19b606..0fe3c04 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -18,8 +18,8 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		devices/thinkpad-light.cpp devices/ahci.h devices/i915-gpu.h devices/net=
work.h \
 		devices/rfkill.cpp devices/alsa.h devices/thinkpad-fan.h devices/device.=
h \
 		devices/usb.h devices/backlight.h devices/backlight.cpp devices/runtime_=
pm.h \
-		devices/thinkpad-light.h devices/network.cpp lib.h tuning tuning/cpufreq=
.h \
-		tuning/bluetooth.cpp tuning/cpufreq.cpp tuning/tuning.cpp tuning/tuningu=
sb.cpp \
+		devices/thinkpad-light.h devices/network.cpp lib.h tuning \
+		tuning/bluetooth.cpp tuning/tuning.cpp tuning/tuningusb.cpp \
 		tuning/ethernet.cpp tuning/bluetooth.h tuning/tuning.h tuning/ethernet.h=
 \
 		tuning/tunable.cpp tuning/nl80211.h tuning/iw.c tuning/wifi.cpp tuning/t=
uningsysfs.h \
 		tuning/tuningsysfs.cpp tuning/wifi.h tuning/runtime.cpp tuning/tunable.h=
 \
diff --git a/src/tuning/cpufreq.cpp b/src/tuning/cpufreq.cpp
deleted file mode 100644
index e870559..0000000
--- a/src/tuning/cpufreq.cpp
+++ /dev/null
@@ -1,213 +0,0 @@
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
-
-#include "tuning.h"
-#include "tunable.h"
-#include <unistd.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <utility>
-#include <iostream>
-#include <fstream>
-#include <unistd.h>
-#include <dirent.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <ctype.h>
-
-#include "../lib.h"
-#include "cpufreq.h"
-
-cpufreq_tunable::cpufreq_tunable(void) : tunable("", 0.3, _("Good"), _("Ba=
d"), _("Unknown"))
-{
-	string str;
-	sprintf(desc, _("Using 'ondemand' cpufreq governor"));
-
-	str =3D read_sysfs_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_g=
overnor");
-	strcpy(original, str.c_str());
-	if (strlen(original) < 1)
-		strcpy(original, "ondemand");
-}
-
-
-int cpufreq_tunable::good_bad(void)
-{
-	DIR *dir;
-	struct dirent *dirent;
-	FILE *file;
-	char filename[PATH_MAX];
-	char line[1024];
-
-	char gov[1024];
-	int ret =3D TUNE_GOOD;
-
-
-	gov[0] =3D 0;
-
-
-	dir =3D opendir("/sys/devices/system/cpu");
-	if (!dir)
-		return ret;
-
-	while ((dirent =3D readdir(dir))) {
-		if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_name[=
3]))
-			continue;
-		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor",=
 dirent->d_name);
-		file =3D fopen(filename, "r");
-		if (!file)
-			continue;
-		memset(line, 0, 1024);
-		if (fgets(line, 1023,file)=3D=3DNULL) {
-			fclose(file);
-			continue;
-		}
-		if (strlen(gov)=3D=3D0)
-			strcpy(gov, line);
-		else
-			/* if the governors are inconsistent, warn */
-			if (strcmp(gov, line))
-				ret =3D TUNE_BAD;
-		fclose(file);
-	}
-
-	closedir(dir);
-
-	/* if the governor is set to userspace, also warn */
-	if (strstr(gov, "userspace"))
-		ret =3D TUNE_BAD;
-
-	/* if the governor is set to performance, also warn */
-	/* FIXME: check if this is fair on all cpus */
-	if (strstr(gov, "performance"))
-		ret =3D TUNE_BAD;
-
-	return ret;
-}
-
-void cpufreq_tunable::toggle(void)
-{
-	DIR *dir;
-	struct dirent *dirent;
-	FILE *file;
-	char filename[PATH_MAX];
-	int good;
-	good =3D good_bad();
-
-	system("/sbin/modprobe cpufreq_ondemand > /dev/null 2>&1");
-
-	if (good =3D=3D TUNE_GOOD) {
-		dir =3D opendir("/sys/devices/system/cpu");
-		if (!dir)
-			return;
-
-		while ((dirent =3D readdir(dir))) {
-			if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_name=
[3]))
-				continue;
-			sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor"=
, dirent->d_name);
-			file =3D fopen(filename, "w");
-			if (!file)
-				continue;
-			fprintf(file, "%s\n", original);
-			fclose(file);
-		}
-
-		closedir(dir);
-		return;
-	}
-	dir =3D opendir("/sys/devices/system/cpu");
-	if (!dir)
-		return;
-
-	while ((dirent =3D readdir(dir))) {
-		if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_name[=
3]))
-			continue;
-		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor",=
 dirent->d_name);
-		file =3D fopen(filename, "w");
-		if (!file)
-			continue;
-		fprintf(file, "ondemand\n");
-		fclose(file);
-	}
-
-	closedir(dir);
-}
-
-const char *cpufreq_tunable::toggle_script(void) {
-	DIR *dir;
-	struct dirent *dirent;
-	char filename[PATH_MAX];
-	char tmp[4096];
-	struct stat statbuf;
-	int good;
-	good =3D good_bad();
-
-	strcpy(toggle_good, "/sbin/modprobe cpufreq_ondemand > /dev/null 2>&1\n");
-
-	if (good =3D=3D TUNE_GOOD) {
-		dir =3D opendir("/sys/devices/system/cpu");
-		if (!dir)
-			return NULL;
-
-		while ((dirent =3D readdir(dir))) {
-			if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_name=
[3]))
-				continue;
-			sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor"=
, dirent->d_name);
-			if (stat(filename, &statbuf) =3D=3D -1)
-				continue;
-			sprintf(tmp, "echo '%s' > '%s';\n", original, filename);
-			strcat(toggle_good, tmp);
-		}
-
-		closedir(dir);
-		return toggle_good;
-	}
-
-	dir =3D opendir("/sys/devices/system/cpu");
-	if (!dir)
-		return NULL;
-
-	while ((dirent =3D readdir(dir))) {
-		if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_name[=
3]))
-			continue;
-		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor",=
 dirent->d_name);
-		if (stat(filename, &statbuf) =3D=3D -1)
-			continue;
-		sprintf(tmp, "echo 'ondemand' > '%s';\n", filename);
-		strcat(toggle_good, tmp);
-	}
-
-	closedir(dir);
-	return toggle_good;
-}
-
-
-void add_cpufreq_tunable(void)
-{
-	class cpufreq_tunable *cf;
-
-	cf =3D new class cpufreq_tunable();
-	all_tunables.push_back(cf);
-}
diff --git a/src/tuning/cpufreq.h b/src/tuning/cpufreq.h
deleted file mode 100644
index 983f813..0000000
--- a/src/tuning/cpufreq.h
+++ /dev/null
@@ -1,50 +0,0 @@
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
-#ifndef _INCLUDE_GUARD_CPUFREQ_TUNE_H
-#define _INCLUDE_GUARD_CPUFREQ_TUNE_H
-
-#include <vector>
-
-#include "tunable.h"
-
-using namespace std;
-
-class cpufreq_tunable : public tunable {
-	char original[4096];
-public:
-	cpufreq_tunable(void);
-
-	virtual int good_bad(void);
-
-	virtual void toggle(void);
-
-	virtual const char *toggle_script(void);
-
-};
-
-extern void add_cpufreq_tunable(void);
-
-
-#endif
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 67d604f..ec7d2ad 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -35,7 +35,6 @@
 #include "tuningusb.h"
 #include "runtime.h"
 #include "bluetooth.h"
-#include "cpufreq.h"
 #include "ethernet.h"
 #include "wifi.h"
 #include "../display.h"
@@ -67,7 +66,6 @@ static void init_tuning(void)
 	add_ethernet_tunable();
 	add_bt_tunable();
 	add_wifi_tunables();
-	add_cpufreq_tunable();
 =

 	sort_tunables();
 }
-- =

1.7.9.5


--===============7525301880503318210==--

