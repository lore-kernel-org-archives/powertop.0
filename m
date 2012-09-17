Content-Type: multipart/mixed; boundary="===============0591369118461242037=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH 2/2] Add stubs to support Android platform
Date: Mon, 17 Sep 2012 20:04:09 +0530
Message-ID: <1347892449-10484-2-git-send-email-rajagopal.venkat@linaro.org>
In-Reply-To: 1347892449-10484-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0591369118461242037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds stubs for features that are not supported
by Andriod. An header file which defines all stubs is
included only for Android builds.

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 Android.mk          |   33 +++++++++++++++++++++++++++------
 src/android_stubs.h |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 src/lib.h           |    4 ++++
 3 files changed, 78 insertions(+), 6 deletions(-)
 create mode 100644 src/android_stubs.h

diff --git a/Android.mk b/Android.mk
index a52ecfd..081f470 100644
--- a/Android.mk
+++ b/Android.mk
@@ -1,17 +1,36 @@
 LOCAL_PATH :=3D $(call my-dir)
 include $(CLEAR_VARS)
 =

+LOCAL_MODULE :=3D powertop
+
 LOCAL_MODULE_TAGS :=3D debug
 LOCAL_SHARED_LIBRARIES :=3D libstlport \
 			  libnl \
 			  libpci \
-			  libtraceevnet \
-LOCAL_MODULE :=3D powertop  =

+
+LOCAL_STATIC_LIBRARIES :=3D libncurses
+
+CSSTOH_SOURCE :=3D $(LOCAL_PATH)/src/csstoh.c
+POWERTOP_CSS_SOURCE :=3D $(LOCAL_PATH)/src/powertop.css
+GEN_CSSTOH :=3D $(LOCAL_PATH)/src/csstoh
+GEN_CSS_H :=3D $(LOCAL_PATH)/src/css.h
+$(GEN_CSS_H):
+	$(CC) -o $(GEN_CSSTOH) $(CSSTOH_SOURCE)
+	./$(GEN_CSSTOH) $(POWERTOP_CSS_SOURCE) $@
+
+LOCAL_GENERATED_SOURCES +=3D $(GEN_CSS_H)
 =

 #LOCAL_CFLAGS +=3D -Wall -O2 -g -fno-omit-frame-pointer -fstack-protector =
-Wshadow -Wformat -D_FORTIFY_SOURCE=3D2
 #LOCAL_CPPFLAGS +=3D -Wall -O2 -g -fno-omit-frame-pointer
 =

-LOCAL_C_INCLUDES +=3D external/stlport/stlport/ external/stlport/stlport/s=
tl external/stlport/stlport/using/h/  bionic external/libnl/include/
+LOCAL_C_INCLUDES +=3D external/stlport/stlport/ \
+	external/stlport/stlport/stl \
+	external/stlport/stlport/using/h/ \
+	bionic \
+	external/libnl/include/ \
+	external/ncurses/include \
+	external/elfutils/bionic-fixup \
+	$(LOCAL_PATH)/src
 =

 LOCAL_SRC_FILES +=3D \
 	src/parameters/parameters.cpp \
@@ -21,10 +40,11 @@ LOCAL_SRC_FILES +=3D \
 	src/process/work.cpp \
 	src/process/process.cpp \
 	src/process/timer.cpp \
-	src/process/device.cpp \
+	src/process/processdevice.cpp \
 	src/process/interrupt.cpp \
 	src/process/do_process.cpp \
 	src/cpu/intel_cpus.cpp \
+	src/cpu/intel_gpu.cpp \
 	src/cpu/cpu.cpp \
 	src/cpu/cpu_linux.cpp \
 	src/cpu/cpudevice.cpp \
@@ -33,20 +53,21 @@ LOCAL_SRC_FILES +=3D \
 	src/cpu/abstract_cpu.cpp \
 	src/measurement/measurement.cpp \
 	src/measurement/acpi.cpp \
+	src/measurement/sysfs.cpp \
 	src/measurement/extech.cpp \
 	src/measurement/power_supply.cpp \
 	src/display.cpp \
 	src/report.cpp \
 	src/main.cpp \
 	src/tuning/tuning.cpp \
-	src/tuning/usb.cpp \
+	src/tuning/tuningusb.cpp \
 	src/tuning/bluetooth.cpp \
 	src/tuning/ethernet.cpp \
 	src/tuning/runtime.cpp \
 	src/tuning/iw.c \
 	src/tuning/iw.h \
 	src/tuning/tunable.cpp \
-	src/tuning/sysfs.cpp \
+	src/tuning/tuningsysfs.cpp \
 	src/tuning/cpufreq.cpp \
 	src/tuning/wifi.cpp \
 	src/perf/perf_bundle.cpp \
diff --git a/src/android_stubs.h b/src/android_stubs.h
new file mode 100644
index 0000000..60b1e29
--- /dev/null
+++ b/src/android_stubs.h
@@ -0,0 +1,47 @@
+#include <linux/ethtool.h>
+#include <sys/socket.h>
+
+/* Android doesn't provide locale support int its C and C++
+ * runtime. Handled at higher level in application stack.
+ * So define stubs for gettext funtions used.
+ */
+#define PACKAGE			0
+#define LOCALEDIR		0
+#define bindtextdomain(x, y)
+#define textdomain(x)
+#define gettext(x)		(x)
+
+/* Android C++ new operator does not throw exception on failure */
+#define set_new_handler(x)
+
+/* define stubs for C++ exception handling */
+#define try     	if (true)
+#define catch(x) 	if (false)
+
+/* Define __NR_perf_event_open if not already defined */
+#if __arm__
+#ifndef __NR_perf_event_open
+#define __NR_perf_event_open    364
+#endif
+#endif
+
+/* Implement missing functions */
+static inline void ethtool_cmd_speed_set(struct ethtool_cmd *ep,
+						__u32 speed)
+{
+
+	ep->speed =3D (__u16)speed;
+	ep->speed_hi =3D (__u16)(speed >> 16);
+}
+
+static inline __u32 ethtool_cmd_speed(struct ethtool_cmd *ep)
+{
+	return (ep->speed_hi << 16) | ep->speed;
+}
+
+static inline char *strchrnul(const char *s, int c)
+{
+	while (*s && (*s !=3D c))
+		s++;
+	return (char *)s;
+}
diff --git a/src/lib.h b/src/lib.h
index 8cf4632..6772904 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -33,6 +33,10 @@
 #include "config.h"
 #endif
 =

+#ifdef __ANDROID__
+#include "android_stubs.h"
+#endif
+
 #define _(STRING)    gettext(STRING)
 =

 #define POWERTOP_VERSION "v2.1"
-- =

1.7.9.5


--===============0591369118461242037==--

