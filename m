Content-Type: multipart/mixed; boundary="===============4669564254254481013=="
MIME-Version: 1.0
From: Vinicius Costa Gomes <vcgomes at gmail.com>
Subject: [Powertop] [RFC 1/2] build: wrap Makefile.am to a more reasonable
 line length
Date: Wed, 16 May 2012 00:47:35 -0300
Message-ID: <1337140056-4037-1-git-send-email-vcgomes@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4669564254254481013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This was causing git send-email to fail because a line had a length
superior to 998 characters.
---

Just for information, I had to use an undocumented feature of git send-email
(--no-validate) to send this patch.

 src/Makefile.am |   28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index 0f9e172..935bdab 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -7,8 +7,32 @@ csstoh_SOURCES =3D csstoh.c
 sbin_PROGRAMS =3D powertop
 nodist_powertop_SOURCES =3D css.h

-powertop_SOURCES =3D parameters/persistent.cpp parameters/learn.cpp parame=
ters/parameters.cpp parameters/parameters.h display.cpp cpu/cpu_core.cpp cp=
u/cpudevice.cpp cpu/cpu.cpp cpu/cpu.h cpu/cpu_linux.cpp cpu/abstract_cpu.cp=
p cpu/intel_cpus.h cpu/cpu_package.cpp cpu/cpudevice.h cpu/intel_cpus.cpp d=
evlist.h devlist.cpp lib.cpp report.cpp process/process.cpp process/interru=
pt.h process/timer.h process/processdevice.cpp process/powerconsumer.cpp pr=
ocess/work.h  process/timer.cpp process/process.h process/work.cpp process/=
do_process.cpp process/processdevice.h process/interrupt.cpp process/powerc=
onsumer.h report.h perf/perf.cpp perf/perf_event.h perf/perf.h perf/perf_bu=
ndle.h perf/perf_bundle.cpp display.h devices/rfkill.h devices/i915-gpu.cpp=
 devices/device.cpp devices/alsa.cpp devices/runtime_pm.cpp devices/thinkpa=
d-fan.cpp devices/usb.cpp devices/ahci.cpp devices/thinkpad-light.cpp devic=
es/ahci.h devices/i915-gpu.h devices/network.h devices/rfkill.cpp devices/a=
lsa.h devices/thinkpad-fan.h devices/device.h devices/usb.h devices/backlig=
ht.h devices/backlight.cpp devices/runtime_pm.h devices/thinkpad-light.h de=
vices/network.cpp lib.h tuning tuning/cpufreq.h tuning/bluetooth.cpp tuning=
/cpufreq.cpp tuning/tuning.cpp tuning/tuningusb.cpp tuning/ethernet.cpp tun=
ing/bluetooth.h tuning/tuning.h tuning/ethernet.h tuning/tunable.cpp tuning=
/nl80211.h tuning/iw.c tuning/wifi.cpp tuning/tuningsysfs.h tuning/tuningsy=
sfs.cpp tuning/wifi.h tuning/runtime.cpp tuning/tunable.h tuning/runtime.h =
tuning/tuningusb.h tuning/iw.h calibrate/calibrate.cpp calibrate/calibrate.=
h measurement/measurement.cpp measurement/power_supply.cpp measurement/meas=
urement.h measurement/acpi.cpp measurement/sysfs.h measurement/sysfs.cpp me=
asurement/acpi.h measurement/extech.cpp measurement/power_supply.h measurem=
ent/extech.h main.cpp css.h powertop.css
-
+powertop_SOURCES =3D parameters/persistent.cpp parameters/learn.cpp parame=
ters/parameters.cpp \
+		parameters/parameters.h display.cpp cpu/cpu_core.cpp cpu/cpudevice.cpp \
+		cpu/cpu.cpp cpu/cpu.h cpu/cpu_linux.cpp cpu/abstract_cpu.cpp cpu/intel_c=
pus.h \
+		cpu/cpu_package.cpp cpu/cpudevice.h cpu/intel_cpus.cpp devlist.h devlist=
.cpp \
+		lib.cpp report.cpp process/process.cpp process/interrupt.h process/timer=
.h \
+		process/processdevice.cpp process/powerconsumer.cpp process/work.h  \
+		process/timer.cpp process/process.h process/work.cpp process/do_process.=
cpp \
+		process/processdevice.h process/interrupt.cpp process/powerconsumer.h re=
port.h \
+		perf/perf.cpp perf/perf_event.h perf/perf.h perf/perf_bundle.h \
+		perf/perf_bundle.cpp display.h devices/rfkill.h devices/i915-gpu.cpp \
+		devices/device.cpp devices/alsa.cpp devices/runtime_pm.cpp \
+		devices/thinkpad-fan.cpp devices/usb.cpp devices/ahci.cpp \
+		devices/thinkpad-light.cpp devices/ahci.h devices/i915-gpu.h \
+		devices/network.h devices/rfkill.cpp devices/alsa.h devices/thinkpad-fan=
.h \
+		devices/device.h devices/usb.h devices/backlight.h devices/backlight.cpp=
 \
+		devices/runtime_pm.h devices/thinkpad-light.h devices/network.cpp lib.h \
+		tuning tuning/cpufreq.h tuning/bluetooth.cpp tuning/cpufreq.cpp \
+		tuning/tuning.cpp tuning/tuningusb.cpp tuning/ethernet.cpp tuning/blueto=
oth.h \
+		tuning/tuning.h tuning/ethernet.h tuning/tunable.cpp tuning/nl80211.h \
+		tuning/iw.c tuning/wifi.cpp tuning/tuningsysfs.h tuning/tuningsysfs.cpp \
+		tuning/wifi.h tuning/runtime.cpp tuning/tunable.h tuning/runtime.h \
+		tuning/tuningusb.h tuning/iw.h calibrate/calibrate.cpp \
+		calibrate/calibrate.h measurement/measurement.cpp measurement/power_supp=
ly.cpp \
+		measurement/measurement.h measurement/acpi.cpp measurement/sysfs.h \
+		measurement/sysfs.cpp measurement/acpi.h measurement/extech.cpp \
+		measurement/power_supply.h measurement/extech.h main.cpp css.h powertop.=
css

 powertop_CXXFLAGS =3D -O2 -g -fno-omit-frame-pointer -fstack-protector -Wa=
ll -Wshadow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $=
(LIBNL_CFLAGS) $(GLIB2_CFLAGS)

--
1.7.10.2


--===============4669564254254481013==--

