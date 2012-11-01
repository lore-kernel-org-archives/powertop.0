Content-Type: multipart/mixed; boundary="===============8094114305002252667=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [FYI][RFC][PATCH 1/2] Introducing process scanner facility
Date: Thu, 01 Nov 2012 16:00:38 +0400
Message-ID: <1351771239-18925-2-git-send-email-i.zhbanov@samsung.com>
In-Reply-To: 1351771239-18925-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8094114305002252667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds the ablity to scan process list instead of sleeping
to collect information about new processes.

This could allow to powertop to display more verbose information
about processes.

The reason for this patch is that not all captured trace events contain
process name and command line. Some of them contain only PID and others
contain only 16-byte shortened executable name. And when some process
was started after the Powertop begin to sleep and was terminated before
Powertop wakes up, then it would be impossible to get information about
this process from /proc/PID/. So we scan the process list for new processes
with one-second interval.

Reviewed-by: Kyungmin Park <kyungmin.park(a)samsung.com>
---
 src/Makefile.am                        |    1 +
 src/main.cpp                           |    9 +-
 src/mali-internal-events/proc-scan.cpp |  316 ++++++++++++++++++++++++++++=
++++
 src/mali-internal-events/proc-scan.h   |   59 ++++++
 src/process/process.cpp                |   43 +++++
 5 files changed, 426 insertions(+), 2 deletions(-)
 create mode 100644 src/mali-internal-events/proc-scan.cpp
 create mode 100644 src/mali-internal-events/proc-scan.h

diff --git a/src/Makefile.am b/src/Makefile.am
index f60426a..e3eb6c2 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -28,6 +28,7 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		tuning/tuningsysfs.cpp tuning/wifi.h tuning/runtime.cpp tuning/tunable.h=
 \
 		tuning/runtime.h tuning/tuningusb.h tuning/iw.h calibrate/calibrate.cpp \
 		calibrate/calibrate.h measurement/measurement.cpp measurement/power_supp=
ly.cpp \
+		mali-internal-events/proc-scan.cpp mali-internal-events/proc-scan.h \
 		measurement/measurement.h measurement/acpi.cpp measurement/sysfs.h measu=
rement/sysfs.cpp \
 		measurement/acpi.h measurement/extech.cpp measurement/power_supply.h mea=
surement/extech.h \
 		report/report-maker.cpp report/report-maker.h report/report-formatter.h \
diff --git a/src/main.cpp b/src/main.cpp
index e6036ae..83adfad 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -60,6 +60,8 @@
 =

 #define DEBUGFS_MAGIC          0x64626720
 =

+#include "mali-internal-events/proc-scan.h"
+
 int debug_learning =3D 0;
 unsigned time_out =3D 20;
 int leave_powertop =3D 0;
@@ -124,7 +126,7 @@ static void do_sleep(int seconds)
 	int delta;
 =

 	if (!ncurses_initialized()) {
-		sleep(seconds);
+		scanproc(seconds, 1);
 		return;
 	}
 	target =3D time(NULL) + seconds;
@@ -132,7 +134,7 @@ static void do_sleep(int seconds)
 	do {
 		int c;
 		usleep(6000);
-		halfdelay(delta * 10);
+		scanproc(delta, 1);
 =

 		c =3D getch();
 		switch (c) {
@@ -191,8 +193,11 @@ void one_measurement(int seconds, char *workload)
 	start_cpu_measurement();
 =

 	if (workload && workload[0]) {
+		scanproc(0, 0);
 		if (!system(workload))
 			fprintf(stderr, _("Unknown issue running workload!\n"));
+
+		scanproc(0, 0);
 	} else {
 		do_sleep(seconds);
 	}
diff --git a/src/mali-internal-events/proc-scan.cpp b/src/mali-internal-eve=
nts/proc-scan.cpp
new file mode 100644
index 0000000..58ecaf2
--- /dev/null
+++ b/src/mali-internal-events/proc-scan.cpp
@@ -0,0 +1,316 @@
+/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *	http://www.samsung.com/
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
+ * Process list scanner.
+ * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>,
+ * Alina Litvinova <alina.litvinova(a)gmail.com>
+ * 2012.07 */
+
+#include <ctype.h>
+#include <stdio.h>
+#include <dirent.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/types.h>
+
+#include <map>
+#include <vector>
+#include <algorithm>
+
+#include "../lib.h"
+#include "../display.h" /* For ncurses_initialized() */
+#include "proc-scan.h"
+
+#ifndef DISABLE_NCURSES
+#include <ncurses.h>
+#endif /* !DISABLE_NCURSES */
+
+#ifdef __arm__
+
+using namespace std;
+
+static process_map procs;
+
+/* ***********************************************************************=
* */
+
+static int
+is_digit_name(const char *name)
+{
+	int i =3D 0;
+
+	while (name[i])
+		if (!isdigit(name[i++]))
+			return 0;
+
+	return 1;
+}
+
+/* ***********************************************************************=
* */
+
+static int
+read_proc_file(pid_t pid, const char *fname, char *buf, size_t bufsize)
+{
+	FILE *f;
+	char name[4096];
+	size_t len;
+
+	snprintf(name, sizeof(name), "/proc/%d/%s", pid, fname);
+
+	f =3D fopen(name, "r");
+	if (!f) {
+/* 		fprintf(stderr, "Can't open '%s'.\n", name);*/
+		return -1; /* Process already died */
+	}
+
+	len =3D fread(buf, 1, bufsize, f);
+	fclose(f);
+
+	return len;
+}
+
+/* ***********************************************************************=
* */
+
+static int
+fill_process_info(process_info *proc)
+{
+	size_t len, i;
+	char comm[32];
+
+	len =3D read_proc_file(proc->pid, "comm", comm, sizeof(comm));
+	if (len < 1) {
+/*		fprintf(stderr, "Can't read '/proc/%d/comm'.\n", proc->pid);*/
+		return -1; /* Process already died */
+	}
+
+	comm[len - 1] =3D '\0'; /* Cut end-of-line */
+	len =3D read_proc_file(proc->pid, "cmdline", proc->cmdline,
+			     sizeof(proc->cmdline));
+	if (len > 0) {
+		strcpy(proc->comm, comm);
+		proc->cmdline[sizeof(proc->cmdline) - 1] =3D '\0';
+		proc->cmdline[len] =3D '\0';
+		while (len)
+			if (proc->cmdline[len - 1] =3D=3D '\0' ||
+			    proc->cmdline[len - 1] =3D=3D ' ')
+				len--;
+			else
+				break;
+
+		for (i =3D 0; i < len - 1; i++)
+			if (proc->cmdline[i] =3D=3D '\0')
+				proc->cmdline[i] =3D ' ';
+	} else {
+		snprintf(proc->cmdline, sizeof(proc->cmdline),
+			 "[%s] (Kernel thread)", comm);
+		comm[sizeof(comm) - 2] =3D '\0'; /* Space for bracket */
+		snprintf(proc->comm, sizeof(proc->comm), "[%s]", comm);
+	}
+
+/*	fprintf(stderr, "New process %d: '%s' '%s'\n", proc->pid, proc->comm,
+		proc->cmdline);*/
+
+	return 0;
+}
+
+/* ***********************************************************************=
* */
+
+static int
+update_proc(const char *str)
+{
+	pid_t pid;
+	process_map::iterator it;
+
+	pid =3D atoi(str);
+
+	it =3D procs.find(pid); /* Already known */
+	/* Here we can update the command line. It is possible that we could
+	 * catch a process in between of fork()/execve() calls, so we will
+	 * store only parent's name. We could monitor /proc/pid/stat for flag
+	 * describing whether this process did execve() call. But it will
+	 * cost extra open()/read()/close() calls.*/
+	if (it !=3D procs.end())
+		return 0;
+
+	process_info &newproc =3D procs[pid];
+
+	/* New process */
+	newproc.pid =3D pid;
+	newproc.power =3D 0;
+	newproc.unknown_name =3D false;
+	if (fill_process_info(&newproc) =3D=3D -1) { /* Process already died */
+		procs.erase(pid);
+		return -1;
+	}
+
+	return 0;
+}
+
+/* ***********************************************************************=
* */
+
+void
+add_unknown_proc(pid_t pid, double power)
+{
+	process_map::iterator it;
+
+	it =3D procs.find(pid);
+	if (it !=3D procs.end()) /* Already known process */
+		return;
+
+	process_info &newproc =3D procs[pid];
+
+	/* New process */
+	newproc.pid =3D pid;
+	newproc.power =3D power;
+	newproc.unknown_name =3D true;
+	strncpy(newproc.comm, "(Unknown name)", sizeof(newproc.comm));
+	strncpy(newproc.cmdline, "(Unknown name)", sizeof(newproc.cmdline));
+	return;
+}
+
+/* ***********************************************************************=
* */
+
+int
+scanproc(int sleeptime, int delay)
+{
+	DIR *dir;
+	int time =3D 0;
+
+	dir =3D opendir("/proc");
+	if (!dir) {
+		fprintf(stderr, "Can't open /proc.\n");
+		/* Fallback to sleep() */
+#ifdef DISABLE_NCURSES
+		sleep(sleeptime);
+#else /* !DISABLE_NCURSES */
+		if (!ncurses_initialized())
+			sleep(sleeptime);
+		else
+			halfdelay(10 * sleeptime);
+#endif /* !DISABLE_NCURSES */
+		return 1;
+	}
+
+	while (1) {
+		struct dirent *entry;
+
+		rewinddir(dir);
+		while ((entry =3D readdir(dir)) !=3D NULL) {
+			if (entry->d_type !=3D DT_DIR)
+				continue;
+
+			if (!is_digit_name(entry->d_name))
+				continue;
+
+			update_proc(entry->d_name);
+		}
+
+		if (time >=3D sleeptime)
+			break;
+
+#ifdef DISABLE_NCURSES
+		sleep(delay);
+#else /* !DISABLE_NCURSES */
+		if (!ncurses_initialized())
+			sleep(delay);
+		else
+			halfdelay(10 * delay);
+#endif /* !DISABLE_NCURSES */
+		time +=3D delay;
+	}
+
+	closedir(dir);
+	return 0;
+}
+
+/* ***********************************************************************=
* */
+
+void
+clear_procs_info()
+{
+	procs.clear();
+}
+
+/* ***********************************************************************=
* */
+
+process_info *
+get_proc_info(pid_t pid)
+{
+	process_map::iterator it;
+
+	it =3D procs.find(pid);
+	if (it =3D=3D procs.end())
+		return NULL;
+
+	return &it->second;
+}
+
+/* ***********************************************************************=
* */
+
+static bool
+procs_comp(const process_info *left, const process_info *right)
+{
+	if (left->power =3D=3D right->power)
+		return (strcoll(left->comm, right->comm) < 0);
+
+	return left->power > right->power; /* Reverse order */
+}
+
+/* ***********************************************************************=
* */
+
+void
+print_sorted_procs(procs_callback func, void *data)
+{
+	vector <process_info *> procs_sorted;
+	vector <process_info *>::iterator sit;
+	process_map::iterator it;
+
+	for (it =3D procs.begin(); it !=3D procs.end(); it++)
+ 		procs_sorted.push_back(&it->second);
+
+	if (procs_sorted.size() > 1)
+		sort(procs_sorted.begin(), procs_sorted.end(), procs_comp);
+
+	for (sit =3D procs_sorted.begin(); sit !=3D procs_sorted.end(); sit++)
+ 		func(*sit, data);
+}
+
+/* ***********************************************************************=
* */
+
+#else /* !ARM */
+
+/* ***********************************************************************=
* */
+
+int
+scanproc(int sleeptime UNUSED, int delay UNUSED)
+{
+#ifdef DISABLE_NCURSES
+	sleep(sleeptime);
+#else /* !DISABLE_NCURSES */
+	if (!ncurses_initialized())
+		sleep(sleeptime);
+	else
+		halfdelay(10 * sleeptime);
+#endif /* !DISABLE_NCURSES */
+	return 0;
+}
+
+#endif /* !ARM */
diff --git a/src/mali-internal-events/proc-scan.h b/src/mali-internal-event=
s/proc-scan.h
new file mode 100644
index 0000000..ce4a851
--- /dev/null
+++ b/src/mali-internal-events/proc-scan.h
@@ -0,0 +1,59 @@
+/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *	http://www.samsung.com/
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
+ * Process list scanner header.
+ * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>,
+ * Alina Litvinova <alina.litvinova(a)gmail.com>
+ * 2012.10 */
+
+#ifndef _PROC_SCAN_H_
+#define _PROC_SCAN_H_
+
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/types.h>
+
+#include <map>
+
+using namespace std;
+
+struct process_info {
+	pid_t pid;
+	char comm[16];
+	char cmdline[256];
+	double power;
+	bool unknown_name;
+};
+
+typedef map <pid_t, process_info> process_map;
+typedef bool (*procs_callback)(const process_info *pinfo, void *data);
+
+int scanproc(int sleeptime, int delay);
+void add_unknown_proc(pid_t pid, double power);
+process_info *get_proc_info(pid_t pid);
+void clear_procs_info();
+void print_sorted_procs(procs_callback func, void *data);
+
+#ifndef UNUSED
+#define UNUSED __attribute__((unused))
+#endif /* UNUSED */
+
+#endif /* _PROC_SCAN_H_ */
diff --git a/src/process/process.cpp b/src/process/process.cpp
index 34dc68d..0032598 100644
--- a/src/process/process.cpp
+++ b/src/process/process.cpp
@@ -241,3 +241,46 @@ void clear_processes(void)
 		it =3D all_processes.erase(it);
 	}
 }
+
+/* pid     -- PID of the process to lookup.
+ * name    -- Name of the process. Will not be asssigned if NULL.
+ * cmdline -- Command line of the process. Will not be assigned if NULL.
+ * This function return true on success and false if process was not found=
. */
+bool
+get_pt_proc_info(int pid, const char **name, const char **cmdline)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < all_power.size(); i++) {
+		process *p;
+
+		if (strncmp(all_power[i]->type(), "Process",
+			    sizeof("Process")))
+			continue;
+
+		p =3D (process *)all_power[i];
+		if (p->pid =3D=3D pid) {
+			if (cmdline)
+				*cmdline =3D p->desc;
+
+			if (name)
+				*name =3D p->comm;
+
+			return true;
+		}
+	}
+
+	for (i =3D 0; i < all_processes.size(); i++) {
+		if (all_processes[i]->pid =3D=3D pid) {
+			if (cmdline)
+				*cmdline =3D all_processes[i]->desc;
+
+			if (name)
+				*name =3D all_processes[i]->comm;
+
+			return true;
+		}
+	}
+
+	return false;
+}
-- =

1.7.5.4


--===============8094114305002252667==--

