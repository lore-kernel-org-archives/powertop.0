Content-Type: multipart/mixed; boundary="===============8444178977280153848=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Move report.cpp and report.h to report/ directory
 (v4)
Date: Thu, 11 Oct 2012 16:49:49 +0400
Message-ID: <1349959789-25077-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8444178977280153848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move report.cpp and report.h to report/ directory to other report-related
files.
---
I hope this is the final version of the patch.
Never used "git mv" before.

 src/Makefile.am             |    4 ++--
 src/cpu/cpu.cpp             |    2 +-
 src/devices/device.cpp      |    2 +-
 src/devlist.cpp             |    2 +-
 src/main.cpp                |    2 +-
 src/process/do_process.cpp  |    2 +-
 src/{ =3D> report}/report.cpp |    2 +-
 src/{ =3D> report}/report.h   |    2 +-
 src/tuning/tuning.cpp       |    2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)
 rename src/{ =3D> report}/report.cpp (99%)
 rename src/{ =3D> report}/report.h (97%)

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

diff --git a/src/report.cpp b/src/report/report.cpp
similarity index 99%
rename from src/report.cpp
rename to src/report/report.cpp
index a2000c9..51bc6a7 100644
--- a/src/report.cpp
+++ b/src/report/report.cpp
@@ -26,7 +26,7 @@
 =

 #include "lib.h"
 #include "report.h"
-#include "report/report-maker.h"
+#include "report-maker.h"
 #include <errno.h>
 #include <string.h>
 #include <utility>
diff --git a/src/report.h b/src/report/report.h
similarity index 97%
rename from src/report.h
rename to src/report/report.h
index bf8f6de..77bf2d7 100644
--- a/src/report.h
+++ b/src/report/report.h
@@ -28,7 +28,7 @@
 #include <string>
 #include <stdio.h>
 =

-#include "report/report-maker.h"
+#include "report-maker.h"
 =

 using namespace std;
 =

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


--===============8444178977280153848==--

