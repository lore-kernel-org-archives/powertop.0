Content-Type: multipart/mixed; boundary="===============0867536432946865583=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 03/12] clean up Makefile.am files
Date: Sat, 02 Aug 2014 12:54:08 +0100
Message-ID: <1406980457-19077-4-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0867536432946865583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use vertical rather than horizontal lists, and get rid of deprecated
ACLOCAL_AMFLAGS instruction.  The src/Makefile.am source file list also
needed sorting, as the items order seemed more or less random.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 Makefile.am     |  14 +++-
 src/Makefile.am | 193 +++++++++++++++++++++++++++++++++++++++++++---------=
----
 2 files changed, 161 insertions(+), 46 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index f5e466b..c8d0ae2 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,6 +1,14 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
-ACLOCAL_AMFLAGS =3D -I m4
 =

-SUBDIRS =3D traceevent src po doc
+SUBDIRS =3D \
+	traceevent \
+	src \
+	po \
+	doc
 =

-EXTRA_DIST =3D README TODO Android.mk COPYING autogen.sh =

+EXTRA_DIST =3D \
+	README \
+	TODO \
+	Android.mk \
+	COPYING \
+	autogen.sh
diff --git a/src/Makefile.am b/src/Makefile.am
index 6886388..311b75e 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,54 +1,161 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
-ACLOCAL_AMFLAGS =3D -I ../m4 =

 =

 sbin_PROGRAMS =3D powertop
 nodist_powertop_SOURCES =3D css.h
 =

-powertop_SOURCES =3D parameters/persistent.cpp parameters/learn.cpp parame=
ters/parameters.cpp \
-		parameters/parameters.h display.cpp cpu/cpu_core.cpp cpu/cpudevice.cpp  \
-		cpu/cpu.cpp cpu/cpu.h cpu/cpu_linux.cpp cpu/abstract_cpu.cpp cpu/intel_c=
pus.h \
-		cpu/cpu_package.cpp cpu/cpudevice.h cpu/intel_cpus.cpp devlist.h devlist=
.cpp \
-		lib.cpp report/report.cpp process/process.cpp process/interrupt.h proces=
s/timer.h  \
-		process/processdevice.cpp process/powerconsumer.cpp process/work.h \
-		process/timer.cpp process/process.h process/work.cpp process/do_process.=
cpp \
-		process/processdevice.h process/interrupt.cpp process/powerconsumer.h re=
port/report.h \
-		perf/perf.cpp perf/perf_event.h perf/perf.h perf/perf_bundle.h perf/perf=
_bundle.cpp \
-		display.h devices/rfkill.h devices/i915-gpu.cpp devices/device.cpp devic=
es/alsa.cpp \
-		devices/runtime_pm.cpp devices/thinkpad-fan.cpp devices/usb.cpp devices/=
ahci.cpp \
-		devices/thinkpad-light.cpp devices/ahci.h devices/i915-gpu.h devices/net=
work.h \
-		devices/rfkill.cpp devices/alsa.h devices/thinkpad-fan.h devices/device.=
h \
-		devices/usb.h devices/backlight.h devices/backlight.cpp devices/runtime_=
pm.h \
-		devices/thinkpad-light.h devices/network.cpp lib.h \
-		tuning/bluetooth.cpp tuning/tuning.cpp tuning/tuningusb.cpp \
-		tuning/ethernet.cpp tuning/bluetooth.h tuning/tuning.h tuning/ethernet.h=
 \
-		tuning/tunable.cpp tuning/nl80211.h tuning/iw.c tuning/wifi.cpp tuning/t=
uningsysfs.h \
-		tuning/tuningsysfs.cpp tuning/wifi.h tuning/runtime.cpp tuning/tunable.h=
 \
-		tuning/runtime.h tuning/tuningusb.h tuning/iw.h calibrate/calibrate.cpp \
-		calibrate/calibrate.h measurement/measurement.cpp \
-		measurement/measurement.h measurement/acpi.cpp measurement/sysfs.h measu=
rement/sysfs.cpp \
-		measurement/acpi.h measurement/extech.cpp measurement/extech.h \
-		report/report-maker.cpp report/report-maker.h report/report-formatter.h \
-		report/report-formatter-base.cpp report/report-formatter-base.h \
-		report/report-formatter-csv.cpp report/report-formatter-csv.h \
-		report/report-formatter-html.cpp report/report-formatter-html.h \
-		report/report-data-html.cpp report/report-data-html.h \
-		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
-		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp cpu/rapl/rapl_interf=
ace.h\
-		cpu/dram_rapl_device.cpp devices/gpu_rapl_device.cpp cpu/cpu_rapl_device=
.h \
-		cpu/dram_rapl_device.h devices/gpu_rapl_device.h
-
-
-powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -Wsh=
adow -Wformat $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_=
CFLAGS)
-
-
-powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_CFLAGS) $(PCIUTILS_C=
FLAGS) $(LIBNL_CFLAGS) $(GLIB2_CFLAGS) $(LIBZ_CFLAGS) -DLOCALEDIR=3D\"$(loc=
aledir)\"
-
-powertop_LDADD =3D ../traceevent/libtraceevnet.la
-
-AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(LIBNL_LIBS) $(LI=
BZ_LIBS) $(PTHREAD_LIBS)  $(RESOLV_LIBS)
+powertop_SOURCES =3D \
+	css.h \
+	devlist.cpp \
+	devlist.h \
+	display.cpp \
+	display.h \
+	lib.cpp \
+	lib.h \
+	main.cpp \
+	powertop.css \
+	\
+	calibrate/calibrate.cpp \
+	calibrate/calibrate.h \
+	cpu/abstract_cpu.cpp \
+	cpu/cpu.cpp \
+	cpu/cpu.h \
+	cpu/cpu_core.cpp \
+	cpu/cpu_linux.cpp \
+	cpu/cpu_package.cpp \
+	cpu/cpu_rapl_device.cpp \
+	cpu/cpu_rapl_device.h \
+	cpu/cpudevice.cpp \
+	cpu/cpudevice.h \
+	cpu/dram_rapl_device.cpp \
+	cpu/dram_rapl_device.h \
+	cpu/intel_cpus.cpp \
+	cpu/intel_cpus.h \
+	cpu/intel_gpu.cpp \
+	cpu/rapl/rapl_interface.cpp \
+	cpu/rapl/rapl_interface.h \
+	devices/ahci.cpp \
+	devices/ahci.h \
+	devices/alsa.cpp \
+	devices/alsa.h \
+	devices/backlight.cpp \
+	devices/backlight.h \
+	devices/device.cpp \
+	devices/device.h \
+	devices/gpu_rapl_device.cpp \
+	devices/gpu_rapl_device.h \
+	devices/i915-gpu.cpp \
+	devices/i915-gpu.h \
+	devices/network.cpp \
+	devices/network.h \
+	devices/rfkill.cpp \
+	devices/rfkill.h \
+	devices/runtime_pm.cpp \
+	devices/runtime_pm.h \
+	devices/thinkpad-fan.cpp \
+	devices/thinkpad-fan.h \
+	devices/thinkpad-light.cpp \
+	devices/thinkpad-light.h \
+	devices/usb.cpp \
+	devices/usb.h \
+	measurement/acpi.cpp \
+	measurement/acpi.h \
+	measurement/extech.cpp \
+	measurement/extech.h \
+	measurement/measurement.cpp \
+	measurement/measurement.h \
+	measurement/sysfs.cpp \
+	measurement/sysfs.h \
+	parameters/learn.cpp \
+	parameters/parameters.cpp \
+	parameters/parameters.h \
+	parameters/persistent.cpp \
+	perf/perf.cpp \
+	perf/perf.h \
+	perf/perf_bundle.cpp \
+	perf/perf_bundle.h \
+	perf/perf_event.h \
+	process/do_process.cpp \
+	process/interrupt.cpp \
+	process/interrupt.h \
+	process/powerconsumer.cpp \
+	process/powerconsumer.h \
+	process/process.cpp \
+	process/process.h \
+	process/processdevice.cpp \
+	process/processdevice.h \
+	process/timer.cpp \
+	process/timer.h \
+	process/work.cpp \
+	process/work.h \
+	report/report-data-html.cpp \
+	report/report-data-html.h \
+	report/report-formatter-base.cpp \
+	report/report-formatter-base.h \
+	report/report-formatter-csv.cpp \
+	report/report-formatter-csv.h \
+	report/report-formatter-html.cpp \
+	report/report-formatter-html.h \
+	report/report-formatter.h \
+	report/report-maker.cpp \
+	report/report-maker.h \
+	report/report.cpp \
+	report/report.h \
+	tuning/bluetooth.cpp \
+	tuning/bluetooth.h \
+	tuning/ethernet.cpp \
+	tuning/ethernet.h \
+	tuning/iw.c \
+	tuning/iw.h \
+	tuning/nl80211.h \
+	tuning/runtime.cpp \
+	tuning/runtime.h \
+	tuning/tunable.cpp \
+	tuning/tunable.h \
+	tuning/tuning.cpp \
+	tuning/tuning.h \
+	tuning/tuningsysfs.cpp \
+	tuning/tuningsysfs.h \
+	tuning/tuningusb.cpp \
+	tuning/tuningusb.h \
+	tuning/wifi.cpp \
+	tuning/wifi.h
+
+powertop_CXXFLAGS =3D \
+	-Wall \
+	-Wformat \
+	-Wshadow \
+	-fno-omit-frame-pointer \
+	-fstack-protector \
+	$(GLIB2_CFLAGS) \
+	$(LIBNL_CFLAGS) \
+	$(NCURSES_CFLAGS) \
+	$(PCIUTILS_CFLAGS)
+
+
+powertop_CPPFLAGS =3D \
+	-DLOCALEDIR=3D\"$(localedir)\" \
+	-D_FORTIFY_SOURCE=3D2 \
+	$(GLIB2_CFLAGS) \
+	$(LIBNL_CFLAGS) \
+	$(LIBZ_CFLAGS) \
+	$(NCURSES_CFLAGS) \
+	$(PCIUTILS_CFLAGS)
+
+powertop_LDADD =3D \
+	../traceevent/libtraceevnet.la
+
+AM_LDFLAGS =3D \
+	$(LIBNL_LIBS) \
+	$(LIBS) \
+	$(LIBZ_LIBS) \
+	$(NCURSES_LIBS) \
+	$(PCIUTILS_LIBS) \
+	$(PTHREAD_LIBS) \
+	$(RESOLV_LIBS)
 =

 BUILT_SOURCES =3D css.h
 CLEANFILES =3D css.h
+
 css.h: powertop.css
 	$(SHELL) ${srcdir}/csstoh.sh ${srcdir}/powertop.css css.h
 =

-- =

2.0.3


--===============0867536432946865583==--

