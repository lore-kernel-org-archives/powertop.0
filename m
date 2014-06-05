Content-Type: multipart/mixed; boundary="===============0720033125791192492=="
MIME-Version: 1.0
From: Rajanikanth H.V <rajanikanthhv at gmail.com>
Subject: [Powertop] need help on building powertop as standalone application:
 static build
Date: Thu, 05 Jun 2014 18:21:38 +0530
Message-ID: <CAGT5jKMFx95r8tMCNHCwNQ=tEQAGvFMHRAbe6crwuap9yt9Seg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0720033125791192492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to statically build latest version of powertop for x86_64
target,  I see  link time issue as:
/usr/bin/ld: cannot find -lnl-genl-3
/usr/bin/ld: cannot find -lnl-3

The last verbose command line is:
libtool: link: g++ -fno-omit-frame-pointer -fstack-protector -Wall
-Wshadow -Wformat -I/usr/include/ncursesw -I/usr/include/libnl3
--static -o powertop parameters/powertop-persistent.o
parameters/powertop-learn.o parameters/powertop-parameters.o
powertop-display.o cpu/powertop-cpu_core.o cpu/powertop-cpudevice.o
cpu/powertop-cpu.o cpu/powertop-cpu_linux.o
cpu/powertop-abstract_cpu.o cpu/powertop-cpu_package.o
cpu/powertop-intel_cpus.o powertop-devlist.o powertop-lib.o
report/powertop-report.o process/powertop-process.o
process/powertop-processdevice.o process/powertop-powerconsumer.o
process/powertop-timer.o process/powertop-work.o
process/powertop-do_process.o process/powertop-interrupt.o
perf/powertop-perf.o perf/powertop-perf_bundle.o
devices/powertop-i915-gpu.o devices/powertop-device.o
devices/powertop-alsa.o devices/powertop-runtime_pm.o
devices/powertop-thinkpad-fan.o devices/powertop-usb.o
devices/powertop-ahci.o devices/powertop-thinkpad-light.o
devices/powertop-rfkill.o devices/powertop-backlight.o
devices/powertop-network.o tuning/powertop-bluetooth.o
tuning/powertop-tuning.o tuning/powertop-tuningusb.o
tuning/powertop-ethernet.o tuning/powertop-tunable.o
tuning/powertop-iw.o tuning/powertop-wifi.o
tuning/powertop-tuningsysfs.o tuning/powertop-runtime.o
calibrate/powertop-calibrate.o measurement/powertop-measurement.o
measurement/powertop-acpi.o measurement/powertop-sysfs.o
measurement/powertop-extech.o report/powertop-report-maker.o
report/powertop-report-formatter-base.o
report/powertop-report-formatter-csv.o
report/powertop-report-formatter-html.o
report/powertop-report-data-html.o powertop-main.o
cpu/powertop-intel_gpu.o cpu/rapl/powertop-rapl_interface.o
cpu/powertop-cpu_rapl_device.o cpu/powertop-dram_rapl_device.o
devices/powertop-gpu_rapl_device.o  -lncursesw -lncurses -ltinfo -lpci
-lnl-genl-3 -lnl-3 ../traceevent/.libs/libtraceevnet.a -lpthread

Note: I have installed
libnl-genl-3-200
libnl-genl-3-dev

Configure options are:
export CXXFLAGS=3D"--static"; ./configure --prefix=3D${PWD}/__install_path
--without-libintl-prefix --disable-nls

I tried with --enable-static configure option as wll

>From config.log i see libnl check succeeds:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
configure:20146: checking for LIBNL
configure:20153: $PKG_CONFIG --exists --print-errors "libnl-3.0 >=3D 3.0
libnl-genl-3.0 >=3D 3.0"
configure:20156: $? =3D 0
configure:20170: $PKG_CONFIG --exists --print-errors "libnl-3.0 >=3D 3.0
libnl-genl-3.0 >=3D 3.0"
configure:20173: $? =3D 0
configure:20637: result: yes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

Any help to build this application statically will be helpful.

Thanks in advance,
Raj

--===============0720033125791192492==--

