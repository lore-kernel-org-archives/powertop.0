Content-Type: multipart/mixed; boundary="===============6715147374823580794=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Report accurate wakeup numbers for hyper-threaded
 CPU
Date: Wed, 18 Jul 2012 18:53:04 +0400
Message-ID: <1342623184-30437-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6715147374823580794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is the commit 0f7e6dd0ab7b1b02ef7e55749d6a34d6801c3973 from Linaro's
PowerTOP repository.
Author: John Mathew <johnx.mathew(a)intel.com>

Intel hyperthreaded cores does not exactly behave like if it was 2 real cor=
es.
-   Actual HW cstate is roughly minimal cstate of the 2 threads.
As most of the resources are shared, HW resources are only really powered
down when both threads are idle.
-   Interrupts always wakes up the 2 threads. i.e. terminate the 2 mwait.
So in case of an hyperthreaded core a wakeup event is affecting power only =
when
both the threads are asleep. A wakeup event that occurs when one of
the thread is active should not be considered as a wakeup event.

In case of hyperthreaded cores the thread ids that execute on the same core
will be reported in the sys/devices/system/cpu/cpu%i/topology/thread_siblin=
gs_list.
A table is initially created with this thread sibling information correspon=
ding to
a cpu. When powertop gets a power_end event on a thread the thread_sibling =
table
is looked up to identify the siblings of the cpu and each sibling is checke=
d it
has a wakeup pending. If any one sibling does not have a wakeup event pendi=
ng
the power end event is ignored.
---
 src/cpu/cpu.cpp            |   28 ++++++++++++++++++++++++++++
 src/cpu/cpu.h              |    7 +++++++
 src/process/do_process.cpp |   24 ++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 941bcff..ab7e724 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -28,6 +28,7 @@
 #include <string.h>
 #include <stdlib.h>
 #include <ncurses.h>
+#include <sstream>
 =

 #include "cpu.h"
 #include "cpudevice.h"
@@ -38,12 +39,15 @@
 #include "../display.h"
 #include "../report.h"
 =

+using namespace std;
+
 static class abstract_cpu system_level;
 =

 vector<class abstract_cpu *> all_cpus;
 =

 static	class perf_bundle * perf_events;
 =

+vector<struct thread_sibling_info *> thread_sibling_table;
 =

 =

 class perf_power_bundle: public perf_bundle
@@ -163,6 +167,7 @@ static void handle_one_cpu(unsigned int number, char *v=
endor, int family, int mo
 	unsigned int package_number =3D 0;
 	unsigned int core_number =3D 0;
 	class abstract_cpu *package, *core, *cpu;
+	vector<unsigned int> thread_siblings;
 =

 	sprintf(filename, "/sys/devices/system/cpu/cpu%i/topology/core_id", numbe=
r);
 	file.open(filename, ios::in);
@@ -180,6 +185,29 @@ static void handle_one_cpu(unsigned int number, char *=
vendor, int family, int mo
 		file.close();
 	}
 =

+	sprintf(filename,
+		"/sys/devices/system/cpu/cpu%i/topology/thread_siblings_list",
+		number);
+	file.open(filename, ios::in);
+	if (file) {
+		string line;
+		getline(file,line);
+		istringstream linestream(line);
+		string item;
+		struct thread_sibling_info *info;
+
+		while (getline(linestream, item, '-'))
+			thread_siblings.push_back(atoi(item.c_str()));
+
+		if (thread_siblings.size() > 1) {
+			info =3D new struct thread_sibling_info;
+			info->cpunum =3D number;
+			info->thread_siblings =3D thread_siblings;
+			thread_sibling_table.push_back(info);
+		}
+
+		file.close();
+	}
 =

 	if (system_level.children.size() <=3D package_number)
 		system_level.children.resize(package_number + 1, NULL);
diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index b48ada9..54da093 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -39,6 +39,13 @@ class abstract_cpu;
 #define LEVEL_C0 -1
 #define LEVEL_HEADER -2
 =

+struct thread_sibling_info {
+	unsigned int cpunum;
+	vector<unsigned int> thread_siblings;
+};
+
+extern vector<struct thread_sibling_info *> thread_sibling_table;
+
 #define PSTATE 1
 #define CSTATE 2
 =

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 731fe3e..60bc790 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -44,6 +44,7 @@
 #include "../parameters/parameters.h"
 #include "../display.h"
 #include "../measurement/measurement.h"
+#include "../cpu/cpu.h"
 =

 static  class perf_bundle * perf_events;
 =

@@ -147,6 +148,27 @@ static void change_blame(unsigned int cpu, class power=
_consumer *consumer, int l
 	cpu_level[cpu] =3D level;
 }
 =

+static bool sibling_wakeup_pending(unsigned int cpu)
+{
+	unsigned int i, j;
+	struct thread_sibling_info *info;
+	bool wakeup_pending =3D true;
+
+	for (i =3D 0; i < thread_sibling_table.size(); i++) {
+		info =3D thread_sibling_table[i];
+		if (cpu !=3D info->cpunum)
+			continue;
+
+		for (j =3D 0; j < info->thread_siblings.size(); j++)
+			if (!get_wakeup_pending(info->thread_siblings[j])) {
+				wakeup_pending =3D false;
+				break;
+			}
+	}
+
+	return wakeup_pending;
+}
+
 static void consume_blame(unsigned int cpu)
 {
 	if (!get_wakeup_pending(cpu))
@@ -157,6 +179,8 @@ static void consume_blame(unsigned int cpu)
 		return;
 	if (!cpu_blame[cpu])
 		return;
+	if (!sibling_wakeup_pending(cpu))
+		return;
 =

 	cpu_blame[cpu]->wake_ups++;
 	cpu_blame[cpu] =3D NULL;
-- =

1.7.5.4


--===============6715147374823580794==--

