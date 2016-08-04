Content-Type: multipart/mixed; boundary="===============6928251888459369608=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 08/19] POTFILES.in: refresh files with strings
Date: Wed, 03 Aug 2016 17:59:18 -0700
Message-ID: <1470272369-218664-9-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6928251888459369608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Renamed output from scripts/regenerate-potfiles-in to po/POTFILES.in.
This will enable more string translation possibilities.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/POTFILES.in | 47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/po/POTFILES.in b/po/POTFILES.in
index acb2913c3224..aa853f0df87b 100644
--- a/po/POTFILES.in
+++ b/po/POTFILES.in
@@ -1,38 +1,41 @@
 # List of source files which contain translatable strings.
 =

-traceevent/parse-utils.c
-src/parameters/persistent.cpp
-src/display.cpp
+src/calibrate/calibrate.cpp
+src/cpu/abstract_cpu.cpp
 src/cpu/cpu_core.cpp
 src/cpu/cpu.cpp
 src/cpu/cpu_linux.cpp
 src/cpu/cpu_package.cpp
 src/cpu/intel_cpus.cpp
-src/devlist.cpp
-src/lib.cpp
-src/process/do_process.cpp
-src/process/process.cpp
-src/perf/perf.cpp
-src/perf/perf_bundle.cpp
-src/devices/device.cpp
+src/cpu/intel_gpu.cpp
+src/devices/ahci.cpp
 src/devices/alsa.cpp
+src/devices/devfreq.cpp
+src/devices/device.cpp
+src/devices/network.cpp
+src/devices/rfkill.cpp
 src/devices/runtime_pm.cpp
 src/devices/usb.cpp
-src/devices/ahci.cpp
-src/devices/rfkill.cpp
-src/devices/network.cpp
+src/devlist.cpp
+src/display.cpp
+src/lib.cpp
 src/lib.h
+src/main.cpp
+src/parameters/persistent.cpp
+src/perf/perf_bundle.cpp
+src/perf/perf.cpp
+src/process/do_process.cpp
+src/report/report.cpp
+src/report/report-maker.h
 src/tuning/bluetooth.cpp
-src/tuning/tuning.cpp
 src/tuning/ethernet.cpp
-src/tuning/tunable.cpp
 src/tuning/nl80211.h
-src/tuning/wifi.cpp
 src/tuning/runtime.cpp
-src/tuning/tuningusb.cpp
+src/tuning/tunable.cpp
+src/tuning/tuning.cpp
+src/tuning/tuningi2c.cpp
 src/tuning/tuningsysfs.cpp
-src/calibrate/calibrate.cpp
-src/main.cpp
-src/report/report.cpp
-src/report/report-formatter-csv.cpp
-src/report/report-formatter-html.cpp
+src/tuning/tuningusb.cpp
+src/tuning/wifi.cpp
+traceevent/event-parse.h
+traceevent/parse-utils.c
-- =

1.8.3.1


--===============6928251888459369608==--

