Content-Type: multipart/mixed; boundary="===============3637322289368593863=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 19/19] zh_TW.po: re-generate Chinese (Taiwan)
 translation
Date: Wed, 03 Aug 2016 17:59:29 -0700
Message-ID: <1470272369-218664-20-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3637322289368593863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/zh_TW.po | 1001 ++++++++++++++++++++++++++++++++-----------------------=
----
 1 file changed, 539 insertions(+), 462 deletions(-)

diff --git a/po/zh_TW.po b/po/zh_TW.po
index 300cdf12dc6e..ea71dd93fd8f 100644
--- a/po/zh_TW.po
+++ b/po/zh_TW.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:10-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Chinese (Taiwan) (http://www.transifex.com/projects/p/"
@@ -19,50 +19,74 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D1; plural=3D0;\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
-msgstr "=E7=84=A1=E6=B3=95=E5=84=B2=E5=AD=98=E6=AA=94=E6=A1=88"
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
+msgstr "=E7=84=A1=E6=B3=95=E5=BB=BA=E7=AB=8B=E6=9A=AB=E5=AD=98=E6=AA=94=E6=
=A1=88\n"
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
-msgstr "=E7=84=A1=E6=B3=95=E8=AE=80=E5=8F=96=E6=AA=94=E6=A1=88"
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
+msgstr "=E6=A0=A1=E6=AD=A3: CPU =E4=BD=BF=E7=94=A8=E9=87=8F=E6=96=BC %i =
=E5=9F=B7=E8=A1=8C=E7=B7=92\n"
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
-msgstr "=E5=B7=B2=E8=BC=89=E5=85=A5 %i =E7=AD=86=E5=85=88=E5=89=8D=E9=87=
=8F=E6=B8=AC=E6=95=B8=E6=93=9A\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
+msgstr "=E6=A0=A1=E6=AD=A3: CPU =E5=96=9A=E9=86=92=E9=9B=BB=E6=BA=90=E4=BD=
=BF=E7=94=A8=E9=87=8F\n"
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
-msgstr ""
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
+msgstr "=E6=A0=A1=E6=AD=A3 USB =E8=A8=AD=E5=82=99\n"
 =

-#: src/display.cpp:70
-msgid "Overview"
-msgstr "=E7=B8=BD=E8=A6=BD"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
+msgstr ".... =E8=A3=9D=E7=BD=AE %s \n"
 =

-#: src/display.cpp:71
-msgid "Idle stats"
-msgstr "=E9=96=92=E7=BD=AE=E7=B5=B1=E8=A8=88"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
+msgstr "=E6=A0=A1=E6=AD=A3=E7=84=A1=E7=B7=9A=E9=9B=BB=E8=A8=AD=E5=82=99\n"
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
-msgstr "=E9=A0=BB=E7=8E=87=E7=B5=B1=E8=A8=88"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
+msgstr "=E6=A0=A1=E6=AD=A3=E8=9E=A2=E5=B9=95=E8=83=8C=E5=85=89\n"
 =

-#: src/display.cpp:73
-msgid "Device stats"
-msgstr "=E8=A8=AD=E5=82=99=E7=B5=B1=E8=A8=88"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
+msgstr "=E6=A0=A1=E6=AD=A3=E9=96=92=E7=BD=AE\n"
 =

-#: src/display.cpp:131
-msgid "Exit"
-msgstr "=E9=9B=A2=E9=96=8B"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
+msgstr "=E6=A0=A1=E6=AD=A3: =E7=A3=81=E7=A2=9F=E4=BD=BF=E7=94=A8\n"
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr "=E9=96=8B=E5=A7=8B PowerTOP =E9=9B=BB=E6=BA=90=E4=BC=B0=E8=A8=88=
=E6=A0=A1=E6=AD=A3 \n"
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr "=E5=AE=8C=E6=88=90 PowerTOP =E9=9B=BB=E6=BA=90=E4=BC=B0=E8=A8=88=
=E6=A0=A1=E6=AD=A3 \n"
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr "=E6=A0=A1=E6=AD=A3=E5=8F=96=E5=BE=97=E5=8F=83=E6=95=B8:\n"
+
+#: src/cpu/abstract_cpu.cpp:74
+msgid "Idle"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:37 src/cpu/cpu_core.cpp:93 src/cpu/intel_cpus.cpp:=
281
+#: src/cpu/abstract_cpu.cpp:76
+msgid "Turbo Mode"
+msgstr ""
+
+#: src/cpu/cpu_core.cpp:37 src/cpu/cpu_core.cpp:93 src/cpu/intel_cpus.cpp:=
312
 #, c-format
 msgid "  Core"
 msgstr "  =E6=A0=B8=E5=BF=83"
@@ -89,45 +113,45 @@ msgstr ""
 msgid "dram rapl package"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:464
+#: src/cpu/cpu.cpp:458
 msgid "Processor Idle State Report"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:528 src/cpu/cpu.cpp:746 src/cpu/cpu_package.cpp:47
+#: src/cpu/cpu.cpp:522 src/cpu/cpu.cpp:740 src/cpu/cpu_package.cpp:47
 #, c-format
 msgid "Package"
 msgstr "=E4=BB=A3=E8=99=9F"
 =

-#: src/cpu/cpu.cpp:559 src/cpu/cpu.cpp:768
+#: src/cpu/cpu.cpp:553 src/cpu/cpu.cpp:762
 #, fuzzy, c-format
 msgid "Core %d"
 msgstr "=E6=A0=B8=E5=BF=83 %i"
 =

-#: src/cpu/cpu.cpp:566
+#: src/cpu/cpu.cpp:560
 #, fuzzy, c-format
 msgid "GPU %d"
 msgstr "GPU %i"
 =

-#: src/cpu/cpu.cpp:587
+#: src/cpu/cpu.cpp:581
 #, fuzzy
 msgid "CPU"
 msgstr "CPU %i"
 =

-#: src/cpu/cpu.cpp:669
+#: src/cpu/cpu.cpp:663
 msgid "Processor Frequency Report"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:789
+#: src/cpu/cpu.cpp:783
 #, fuzzy, c-format
 msgid "CPU %d"
 msgstr "CPU %i"
 =

-#: src/cpu/cpu.cpp:990
+#: src/cpu/cpu.cpp:984
 #, c-format
 msgid "cpu_idle event returned no state?\n"
 msgstr "cpu_idle =E4=BA=8B=E4=BB=B6=E6=B2=92=E6=9C=89=E5=82=B3=E5=9B=9E=E7=
=8B=80=E6=85=8B=EF=BC=9F\n"
 =

-#: src/cpu/cpu.cpp:1005
+#: src/cpu/cpu.cpp:999
 #, c-format
 msgid "power or cpu_frequency event returned no state?\n"
 msgstr "power =E6=88=96 cpu_frequecny =E4=BA=8B=E4=BB=B6=E6=B2=92=E6=9C=89=
=E5=82=B3=E5=9B=9E=E7=8B=80=E6=85=8B=EF=BC=9F\n"
@@ -137,665 +161,593 @@ msgid "C0 polling"
 msgstr "C0 =E8=BC=AA=E5=B7=A1"
 =

 #: src/cpu/cpu_linux.cpp:242 src/cpu/cpu_linux.cpp:341
-#: src/cpu/intel_cpus.cpp:593
+#: src/cpu/intel_cpus.cpp:629
 #, c-format
 msgid " CPU %i"
 msgstr " CPU %i"
 =

-#: src/cpu/cpu_package.cpp:105 src/cpu/intel_cpus.cpp:357
+#: src/cpu/cpu_package.cpp:105 src/cpu/intel_cpus.cpp:390
 #, c-format
 msgid "  Package"
 msgstr "=E4=BB=A3=E8=99=9F"
 =

-#: src/cpu/intel_cpus.cpp:92
+#: src/cpu/intel_cpus.cpp:122
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:518
+#: src/cpu/intel_cpus.cpp:552
 msgid "C0 active"
 msgstr "C0 =E9=81=8B=E4=BD=9C=E4=B8=AD"
 =

-#: src/cpu/intel_cpus.cpp:576
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "Actual"
-msgstr "=E5=AF=A6=E9=9A=9B"
-
-#: src/devlist.cpp:330
-msgid "Process"
-msgstr ""
-
-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-#, fuzzy
-msgid "Device"
-msgstr "=E8=A8=AD=E5=82=99=E7=B5=B1=E8=A8=88"
-
-#: src/devlist.cpp:347
-msgid "Process Device Activity"
+msgid "Average"
 msgstr ""
 =

-#: src/lib.cpp:287
-#, c-format
-msgid "%7sW"
-msgstr "%7sW"
+#: src/cpu/intel_gpu.cpp:64
+#, fuzzy, c-format
+msgid "  GPU "
+msgstr "GPU %i"
 =

-#: src/lib.cpp:290
+#: src/devices/ahci.cpp:154
 #, c-format
-msgid "    0 mW"
-msgstr "    0 mW"
-
-#: src/lib.cpp:409
-msgid "PS/2 Touchpad / Keyboard / Mouse"
-msgstr "PS/2  =E8=A7=B8=E6=8E=A7=E6=9D=BF / =E9=8D=B5=E7=9B=A4 / =E6=BB=91=
=E9=BC=A0"
-
-#: src/lib.cpp:410
-msgid "SATA controller"
-msgstr "SATA =E6=8E=A7=E5=88=B6=E5=99=A8"
-
-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
-msgstr "Intel =E5=85=A7=E5=BB=BA USB =E9=9B=86=E7=B7=9A=E5=99=A8"
+msgid "SATA link: %s"
+msgstr "SATA =E9=80=A3=E7=B7=9A: %s"
 =

-#: src/lib.cpp:485 src/lib.cpp:517
+#: src/devices/ahci.cpp:156
 #, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
-msgstr ""
+msgid "SATA disk: %s"
+msgstr "SATA =E7=A3=81=E7=A2=9F: %s"
 =

-#: src/process/do_process.cpp:818
-#, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
-"=E9=A0=90=E4=BC=B0=E7=94=A8=E9=9B=BB=E9=87=8F: %5.1f         =E5=AF=A6=E6=
=B8=AC=E7=94=A8=E9=9B=BB=E9=87=8F: %5.1f        =E7=B8=BD=E8=A8=88: %5.1f\n"
-"\n"
-
-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
-#, c-format
-msgid "The battery reports a discharge rate of %sW\n"
-msgstr "=E9=9B=BB=E6=B1=A0=E5=9B=9E=E5=A0=B1=E6=94=BE=E9=9B=BB=E9=80=9F=E7=
=8E=87=E7=82=BA %sW\n"
-
-#: src/process/do_process.cpp:834
-#, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
-msgstr "=E4=BC=B0=E8=A8=88=E5=89=A9=E9=A4=98=E6=99=82=E9=96=93=E7=82=BA %i=
 =E5=B0=8F=E6=99=82 %i =E5=88=86=E9=90=98\n"
-
-#: src/process/do_process.cpp:842
-msgid "Summary"
-msgstr "=E7=B8=BD=E8=A6=BD"
-
-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
-msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
-
-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
-msgstr "GPU =E6=8C=87=E4=BB=A4 / =E7=A7=92"
-
-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
-msgstr "VFS =E6=8C=87=E4=BB=A4 / =E7=A7=92 =E4=BB=A5=E5=8F=8A"
-
-#: src/process/do_process.cpp:842
-msgid "CPU use"
-msgstr "CPU =E7=94=A8=E9=87=8F"
-
-#: src/process/do_process.cpp:846
-msgid "Power est."
-msgstr "=E9=9B=BB=E6=BA=90=E9=A0=90=E8=A8=88"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
-msgstr "=E7=94=A8=E6=B3=95"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
-msgstr "=E4=BA=8B=E4=BB=B6 / =E7=A7=92"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:927 src/process/do_process.cpp:1075
-msgid "Category"
-msgstr "=E5=88=86=E9=A1=9E"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:928 src/process/do_process.cpp:1076
-#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
-#: src/tuning/tuning.cpp:289
-msgid "Description"
-msgstr "=E6=8F=8F=E8=BF=B0"
-
-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
-msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
-
-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
-msgstr "GPU =E6=8C=87=E4=BB=A4 / =E7=A7=92"
 =

-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
-msgstr "=E7=A3=81=E7=A2=9F IO / =E7=A7=92"
-
-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
-msgstr "GFX =E5=96=9A=E9=86=92 / =E7=A7=92"
-
-#: src/process/do_process.cpp:931 src/process/do_process.cpp:1078
-#: src/devices/device.cpp:273
-msgid "PW Estimate"
+#: src/devices/ahci.cpp:389
+msgid "Link"
 msgstr ""
 =

-#: src/process/do_process.cpp:1013
-msgid "Overview of Software Power Consumers"
-msgstr "=E8=BB=9F=E9=AB=94=E8=80=97=E9=9B=BB=E9=87=8F=E5=A4=A7=E6=88=B6=E7=
=B8=BD=E8=A6=BD"
-
-#: src/process/do_process.cpp:1053
-msgid "Target:"
-msgstr ""
+#: src/devices/ahci.cpp:390
+#, fuzzy
+msgid "Active"
+msgstr "C0 =E9=81=8B=E4=BD=9C=E4=B8=AD"
 =

-#: src/process/do_process.cpp:1054
-msgid "1 units/s"
+#: src/devices/ahci.cpp:391
+msgid "Partial"
 msgstr ""
 =

-#: src/process/do_process.cpp:1055
-msgid "System: "
+#: src/devices/ahci.cpp:392
+msgid "Slumber"
 msgstr ""
 =

-#: src/process/do_process.cpp:1057
-#, fuzzy
-msgid " wakeup/s"
-msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
-
-#: src/process/do_process.cpp:1058
-msgid "CPU: "
+#: src/devices/ahci.cpp:393
+msgid "Devslp"
 msgstr ""
 =

-#: src/process/do_process.cpp:1060
-#, fuzzy, c-format
-msgid "\\% usage"
-msgstr "=E7=94=A8=E6=B3=95"
-
-#: src/process/do_process.cpp:1061
-msgid "GPU:"
+#: src/devices/ahci.cpp:399
+msgid "AHCI ALPM Residency Statistics"
 msgstr ""
 =

-#: src/process/do_process.cpp:1063 src/process/do_process.cpp:1069
-#, fuzzy
-msgid " ops/s"
-msgstr "GPU =E6=8C=87=E4=BB=A4 / =E7=A7=92"
+#: src/devices/alsa.cpp:77
+#, c-format
+msgid "Audio codec %s: %s (%s)"
+msgstr "=E9=9F=B3=E6=95=88=E8=A8=AD=E5=82=99 %s: %s (%s)"
 =

-#: src/process/do_process.cpp:1064
-msgid "GFX:"
-msgstr ""
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#, c-format
+msgid "Audio codec %s: %s"
+msgstr "=E9=9F=B3=E6=95=88=E8=A8=AD=E5=82=99 %s: %s"
 =

-#: src/process/do_process.cpp:1066
+#: src/devices/devfreq.cpp:261
 #, fuzzy
-msgid " wakeups/s"
-msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
+msgid "Device Freq stats"
+msgstr "=E8=A8=AD=E5=82=99=E7=B5=B1=E8=A8=88"
 =

-#: src/process/do_process.cpp:1067
-msgid "VFS:"
+#: src/devices/devfreq.cpp:279
+msgid " Devfreq is not enabled"
 msgstr ""
 =

-#: src/process/do_process.cpp:1135
-#, fuzzy
-msgid "Top 10 Power Consumers"
-msgstr "=E8=BB=9F=E9=AB=94=E8=80=97=E9=9B=BB=E9=87=8F=E5=A4=A7=E6=88=B6=E7=
=B8=BD=E8=A6=BD"
-
-#: src/perf/perf.cpp:115
-#, c-format
-msgid ""
-"Too many open files, please increase the limit of open file descriptors.\=
n"
+#: src/devices/devfreq.cpp:284
+msgid " No devfreq devices available"
 msgstr ""
 =

-#: src/perf/perf.cpp:117
+#: src/devices/device.cpp:172 src/process/do_process.cpp:831
 #, c-format
-msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
-msgstr "PowerTOP %s =E9=9C=80=E8=A6=81 Linux =E6=A0=B8=E5=BF=83 'perf' =E5=
=AD=90=E7=B3=BB=E7=B5=B1=E6=94=AF=E6=8F=B4\n"
+msgid "The battery reports a discharge rate of %sW\n"
+msgstr "=E9=9B=BB=E6=B1=A0=E5=9B=9E=E5=A0=B1=E6=94=BE=E9=9B=BB=E9=80=9F=E7=
=8E=87=E7=82=BA %sW\n"
 =

-#: src/perf/perf.cpp:118
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
 #, c-format
-msgid "as well as support for trace points in the kernel:\n"
-msgstr "=E4=BB=A5=E5=8F=8A Linux =E6=A0=B8=E5=BF=83=E4=B8=AD=E6=96=B7=E9=
=BB=9E (trace point) =E6=94=AF=E6=8F=B4:\n"
+msgid "The power consumed was %sJ\n"
+msgstr ""
 =

-#: src/devices/device.cpp:178
+#: src/devices/device.cpp:180
 #, c-format
 msgid "System baseline power is estimated at %sW\n"
 msgstr "=E9=A0=90=E6=9C=9F=E7=B3=BB=E7=B5=B1=E5=9F=BA=E7=A4=8E=E7=94=A8=E9=
=9B=BB=E9=87=8F=E7=82=BA %sW\n"
 =

-#: src/devices/device.cpp:185
+#: src/devices/device.cpp:187
 msgid "Power est.    Usage     Device name\n"
 msgstr "=E9=9B=BB=E6=BA=90=E9=A0=90=E4=BC=B0      =E4=BD=BF=E7=94=A8=E9=87=
=8F    =E8=A8=AD=E5=82=99=E5=90=8D=E7=A8=B1\n"
 =

-#: src/devices/device.cpp:187
+#: src/devices/device.cpp:189
 msgid "              Usage     Device name\n"
 msgstr "              =E4=BD=BF=E7=94=A8=E9=87=8F    =E8=A8=AD=E5=82=99=E5=
=90=8D=E7=A8=B1\n"
 =

-#: src/devices/device.cpp:254
+#: src/devices/device.cpp:256
 #, fuzzy
 msgid "The battery reports a discharge rate of: "
 msgstr "=E9=9B=BB=E6=B1=A0=E5=9B=9E=E5=A0=B1=E6=94=BE=E9=9B=BB=E9=80=9F=E7=
=8E=87=E7=82=BA %sW\n"
 =

 #: src/devices/device.cpp:261
+msgid "The power consumed was : "
+msgstr ""
+
+#: src/devices/device.cpp:268
 #, fuzzy
 msgid "The system baseline power is estimated at: "
 msgstr "=E9=A0=90=E6=9C=9F=E7=B3=BB=E7=B5=B1=E5=9F=BA=E7=A4=8E=E7=94=A8=E9=
=9B=BB=E9=87=8F=E7=82=BA %sW\n"
 =

-#: src/devices/device.cpp:271
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
+msgstr "=E7=94=A8=E6=B3=95"
+
+#: src/devices/device.cpp:278
 #, fuzzy
 msgid "Device Name"
 msgstr "=E8=A8=AD=E5=82=99=E7=B5=B1=E8=A8=88"
 =

-#: src/devices/device.cpp:310
+#: src/devices/device.cpp:280 src/process/do_process.cpp:935
+#: src/process/do_process.cpp:1082
+msgid "PW Estimate"
+msgstr ""
+
+#: src/devices/device.cpp:317
 msgid "Device Power Report"
 msgstr ""
 =

-#: src/devices/alsa.cpp:77
+#: src/devices/network.cpp:177
 #, c-format
-msgid "Audio codec %s: %s (%s)"
-msgstr "=E9=9F=B3=E6=95=88=E8=A8=AD=E5=82=99 %s: %s (%s)"
+msgid "Network interface: %s (%s)"
+msgstr "=E7=B6=B2=E8=B7=AF=E4=BB=8B=E9=9D=A2=E5=8D=A1: %s (%s)"
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
 #, c-format
-msgid "Audio codec %s: %s"
-msgstr "=E9=9F=B3=E6=95=88=E8=A8=AD=E5=82=99 %s: %s"
+msgid "Radio device: %s"
+msgstr "=E7=84=A1=E7=B7=9A=E9=9B=BB=E8=A8=AD=E5=82=99: %s"
 =

-#: src/devices/runtime_pm.cpp:215
+#: src/devices/runtime_pm.cpp:216
 #, c-format
 msgid "I2C %s (%s): %s"
 msgstr ""
 =

-#: src/devices/runtime_pm.cpp:215
+#: src/devices/runtime_pm.cpp:216 src/tuning/tuningi2c.cpp:57
+#: src/tuning/tuningi2c.cpp:59
 msgid "Adapter"
 msgstr ""
 =

-#: src/devices/runtime_pm.cpp:240
+#: src/devices/runtime_pm.cpp:216 src/devlist.cpp:331
+#: src/tuning/tuningi2c.cpp:57 src/tuning/tuningi2c.cpp:59
+#, fuzzy
+msgid "Device"
+msgstr "=E8=A8=AD=E5=82=99=E7=B5=B1=E8=A8=88"
+
+#: src/devices/runtime_pm.cpp:241
 #, c-format
 msgid "PCI Device: %s"
 msgstr "PCI =E8=A8=AD=E5=82=99: %s"
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
 msgid "USB device: %s"
 msgstr "USB =E8=A8=AD=E5=82=99: %s"
 =

-#: src/devices/usb.cpp:91
+#: src/devices/usb.cpp:94
 #, c-format
 msgid "USB device: %s (%s)"
 msgstr "USB =E8=A8=AD=E5=82=99: %s (%s)"
 =

-#: src/devices/ahci.cpp:154
-#, c-format
-msgid "SATA link: %s"
-msgstr "SATA =E9=80=A3=E7=B7=9A: %s"
-
-#: src/devices/ahci.cpp:156
-#, c-format
-msgid "SATA disk: %s"
-msgstr "SATA =E7=A3=81=E7=A2=9F: %s"
-
-#: src/devices/ahci.cpp:374
-msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
-msgstr ""
-
-#: src/devices/ahci.cpp:389
-msgid "Link"
-msgstr ""
-
-#: src/devices/ahci.cpp:390
-#, fuzzy
-msgid "Active"
-msgstr "C0 =E9=81=8B=E4=BD=9C=E4=B8=AD"
-
-#: src/devices/ahci.cpp:391
-msgid "Partial"
-msgstr ""
-
-#: src/devices/ahci.cpp:392
-msgid "Slumber"
-msgstr ""
-
-#: src/devices/ahci.cpp:393
-msgid "Devslp"
+#: src/devlist.cpp:330
+msgid "Process"
 msgstr ""
 =

-#: src/devices/ahci.cpp:399
-msgid "AHCI ALPM Residency Statistics"
+#: src/devlist.cpp:347
+msgid "Process Device Activity"
 msgstr ""
 =

-#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
-#, c-format
-msgid "Radio device: %s"
-msgstr "=E7=84=A1=E7=B7=9A=E9=9B=BB=E8=A8=AD=E5=82=99: %s"
-
-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
-msgstr "=E7=B6=B2=E8=B7=AF=E4=BB=8B=E9=9D=A2=E5=8D=A1: %s (%s)"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
-msgstr "=E5=A5=BD"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
-msgstr "=E5=A3=9E"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
-msgstr "=E6=9C=AA=E7=9F=A5"
-
-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
-msgstr "=E8=97=8D=E7=89=99=E8=A8=AD=E5=82=99=E4=BB=8B=E9=9D=A2=E7=8B=80=E6=
=85=8B"
-
-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
-msgstr "=E5=95=9F=E7=94=A8=E9=9F=B3=E6=95=88=E8=A8=AD=E5=82=99=E9=9B=BB=E6=
=BA=90=E7=AE=A1=E7=90=86=E5=8A=9F=E8=83=BD"
-
-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
-msgstr "NMI watchdog =E7=9B=A3=E6=8E=A7=E6=87=89=E8=A9=B2=E9=97=9C=E9=96=
=89"
-
-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
-msgstr "=E7=9C=81=E9=9B=BB=E5=9E=8B CPU =E6=8E=92=E7=A8=8B=E5=99=A8 "
-
-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
-msgstr "VM =E5=9B=9E=E5=AF=AB=E5=BB=B6=E6=99=82"
-
-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
-msgstr "=E5=8F=AF=E8=AA=BF=E9=81=B8=E9=A0=85"
+#: src/display.cpp:70
+msgid "Overview"
+msgstr "=E7=B8=BD=E8=A6=BD"
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
-msgstr " <ESC> =E9=9B=A2=E9=96=8B | <Enter> =E5=88=87=E6=8F=9B=E9=81=B8=E9=
=A0=85=E9=96=8B=E9=97=9C   | <r> =E6=9B=B4=E6=96=B0=E8=A6=96=E7=AA=97=E5=85=
=A7=E5=AE=B9"
+#: src/display.cpp:71
+msgid "Idle stats"
+msgstr "=E9=96=92=E7=BD=AE=E7=B5=B1=E8=A8=88"
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
-msgstr ""
+#: src/display.cpp:72
+msgid "Frequency stats"
+msgstr "=E9=A0=BB=E7=8E=87=E7=B5=B1=E8=A8=88"
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
-msgstr ""
+#: src/display.cpp:73
+msgid "Device stats"
+msgstr "=E8=A8=AD=E5=82=99=E7=B5=B1=E8=A8=88"
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
-msgstr ""
+#: src/display.cpp:131
+msgid "Exit"
+msgstr "=E9=9B=A2=E9=96=8B"
 =

-#: src/tuning/tuning.cpp:301
-msgid "Optimal Tuned Software Settings"
+#: src/display.cpp:132
+msgid "Navigate"
 msgstr ""
 =

-#: src/tuning/ethernet.cpp:54
-#, c-format
-msgid "Wake-on-lan status for device %s"
-msgstr "=E7=B6=B2=E8=B7=AF=E5=96=9A=E9=86=92=E5=95=9F=E7=94=A8=E7=8B=80=E6=
=85=8B=E6=96=BC=E8=A8=AD=E5=82=99 %s"
-
-#: src/tuning/wifi.cpp:48
-#, c-format
-msgid "Wireless Power Saving for interface %s"
-msgstr "=E7=84=A1=E7=B7=9A=E7=B6=B2=E8=B7=AF=E7=9C=81=E9=9B=BB=E7=8B=80=E6=
=85=8B=E6=96=BC=E8=A8=AD=E5=82=99 %s"
-
-#: src/tuning/runtime.cpp:48
-#, c-format
-msgid "Runtime PM for %s device %s"
-msgstr "=E5=9F=B7=E8=A1=8C=E6=99=82=E6=9C=9F=E7=9C=81=E9=9B=BB %s =E8=A8=
=AD=E5=82=99 %s"
-
-#: src/tuning/runtime.cpp:50
-#, c-format
-msgid "%s device %s has no runtime power management"
-msgstr "%s =E8=A8=AD=E5=82=99 %s =E6=B2=92=E6=9C=89=E5=9F=B7=E8=A1=8C=E6=
=99=82=E6=9C=9F=E9=9B=BB=E6=BA=90=E7=AE=A1=E7=90=86=E5=8A=9F=E8=83=BD"
-
-#: src/tuning/runtime.cpp:74
-#, c-format
-msgid "PCI Device %s has no runtime power management"
-msgstr "PCI =E8=A8=AD=E5=82=99 %s =E6=B2=92=E6=9C=89=E5=9F=B7=E8=A1=8C=E6=
=99=82=E6=9C=9F=E9=9B=BB=E6=BA=90=E7=AE=A1=E7=90=86=E5=8A=9F=E8=83=BD"
-
-#: src/tuning/runtime.cpp:76
-#, c-format
-msgid "Runtime PM for PCI Device %s"
-msgstr "PCI =E8=A8=AD=E5=82=99 %s =E9=9B=BB=E6=BA=90=E7=AE=A1=E7=90=86"
-
-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
-msgstr "=E8=87=AA=E5=8B=95=E9=96=92=E7=BD=AE=E6=96=BC=E6=9C=AA=E7=9F=A5=E7=
=9A=84 USB =E8=A8=AD=E5=82=99 %s (%s:%s)"
-
-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
+#: src/lib.cpp:288
 #, c-format
-msgid "Autosuspend for USB device %s [%s]"
-msgstr "=E8=87=AA=E5=8B=95=E9=96=92=E7=BD=AE=E6=96=BC USB =E8=A8=AD=E5=82=
=99 %s [%s]"
-
-#: src/tuning/tuningsysfs.cpp:123
-#, fuzzy, c-format
-msgid "Enable SATA link power management for %s"
-msgstr "=E5=95=9F=E7=94=A8 %s =E7=9A=84 SATA =E9=80=A3=E7=B7=9A=E9=9B=BB=
=E6=BA=90=E7=AE=A1=E7=90=86"
-
-#: src/calibrate/calibrate.cpp:238
-#, c-format
-msgid "Cannot create temp file\n"
-msgstr "=E7=84=A1=E6=B3=95=E5=BB=BA=E7=AB=8B=E6=9A=AB=E5=AD=98=E6=AA=94=E6=
=A1=88\n"
-
-#: src/calibrate/calibrate.cpp:258
-#, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
-msgstr "=E6=A0=A1=E6=AD=A3: CPU =E4=BD=BF=E7=94=A8=E9=87=8F=E6=96=BC %i =
=E5=9F=B7=E8=A1=8C=E7=B7=92\n"
+msgid "%7sW"
+msgstr "%7sW"
 =

-#: src/calibrate/calibrate.cpp:273
+#: src/lib.cpp:291
 #, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
-msgstr "=E6=A0=A1=E6=AD=A3: CPU =E5=96=9A=E9=86=92=E9=9B=BB=E6=BA=90=E4=BD=
=BF=E7=94=A8=E9=87=8F\n"
+msgid "    0 mW"
+msgstr "    0 mW"
 =

-#: src/calibrate/calibrate.cpp:290
-#, c-format
-msgid "Calibrating USB devices\n"
-msgstr "=E6=A0=A1=E6=AD=A3 USB =E8=A8=AD=E5=82=99\n"
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
+msgstr "PS/2  =E8=A7=B8=E6=8E=A7=E6=9D=BF / =E9=8D=B5=E7=9B=A4 / =E6=BB=91=
=E9=BC=A0"
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
-#, c-format
-msgid ".... device %s \n"
-msgstr ".... =E8=A3=9D=E7=BD=AE %s \n"
+#: src/lib.cpp:411
+msgid "SATA controller"
+msgstr "SATA =E6=8E=A7=E5=88=B6=E5=99=A8"
 =

-#: src/calibrate/calibrate.cpp:307
-#, c-format
-msgid "Calibrating radio devices\n"
-msgstr "=E6=A0=A1=E6=AD=A3=E7=84=A1=E7=B7=9A=E9=9B=BB=E8=A8=AD=E5=82=99\n"
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
+msgstr "Intel =E5=85=A7=E5=BB=BA USB =E9=9B=86=E7=B7=9A=E5=99=A8"
 =

-#: src/calibrate/calibrate.cpp:331
+#: src/lib.cpp:467
 #, c-format
-msgid "Calibrating backlight\n"
-msgstr "=E6=A0=A1=E6=AD=A3=E8=9E=A2=E5=B9=95=E8=83=8C=E5=85=89\n"
+msgid "glob returned GLOB_NOSPACE\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#: src/lib.cpp:471
 #, c-format
-msgid "Calibrating idle\n"
-msgstr "=E6=A0=A1=E6=AD=A3=E9=96=92=E7=BD=AE\n"
+msgid "glob returned GLOB_ABORTED\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
+#: src/lib.cpp:475
 #, c-format
-msgid "Calibrating: disk usage \n"
-msgstr "=E6=A0=A1=E6=AD=A3: =E7=A3=81=E7=A2=9F=E4=BD=BF=E7=94=A8\n"
-
-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
-msgstr "=E9=96=8B=E5=A7=8B PowerTOP =E9=9B=BB=E6=BA=90=E4=BC=B0=E8=A8=88=
=E6=A0=A1=E6=AD=A3 \n"
-
-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
-msgstr "=E5=AE=8C=E6=88=90 PowerTOP =E9=9B=BB=E6=BA=90=E4=BC=B0=E8=A8=88=
=E6=A0=A1=E6=AD=A3 \n"
+msgid "glob returned GLOB_NOMATCH\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "Parameters after calibration:\n"
-msgstr "=E6=A0=A1=E6=AD=A3=E5=8F=96=E5=BE=97=E5=8F=83=E6=95=B8:\n"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
+msgstr ""
 =

-#: src/main.cpp:101
+#: src/main.cpp:102
 #, fuzzy, c-format
 msgid "PowerTOP version "
 msgstr "PowerTop =E7=89=88=E6=9C=AC"
 =

-#: src/main.cpp:107
+#: src/main.cpp:108
 msgid "Set refresh time out"
 msgstr "=E8=A8=AD=E5=AE=9A=E6=9B=B4=E6=96=B0=E9=80=B1=E6=9C=9F"
 =

-#: src/main.cpp:120
+#: src/main.cpp:121
 msgid "Usage: powertop [OPTIONS]"
 msgstr "=E7=94=A8=E6=B3=95: powertop [=E9=81=B8=E9=A0=85]"
 =

-#: src/main.cpp:121
+#: src/main.cpp:122
 msgid "sets all tunable options to their GOOD setting"
 msgstr ""
 =

-#: src/main.cpp:122
+#: src/main.cpp:123
 msgid "runs powertop in calibration mode"
 msgstr "=E4=BB=A5=E6=A0=A1=E6=AD=A3=E6=A8=A1=E5=BC=8F=E5=9F=B7=E8=A1=8C po=
wertop"
 =

-#: src/main.cpp:123 src/main.cpp:126
+#: src/main.cpp:124 src/main.cpp:127
 msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/main.cpp:123
+#: src/main.cpp:124
 msgid "generate a csv report"
 msgstr "=E7=94=A2=E7=94=9F csv =E5=A0=B1=E5=91=8A"
 =

-#: src/main.cpp:124
+#: src/main.cpp:125
 msgid "run in \"debug\" mode"
 msgstr "=E4=BB=A5 \"debug\" =E6=A8=A1=E5=BC=8F=E5=9F=B7=E8=A1=8C"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "[=3Ddevnode]"
 msgstr "[=3D =E8=A8=AD=E5=82=99=E7=AF=80=E9=BB=9E]"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "uses an Extech Power Analyzer for measurements"
 msgstr "=E4=BD=BF=E7=94=A8 Extech =E9=9B=BB=E6=BA=90=E5=88=86=E6=9E=90=E5=
=84=80=E9=80=B2=E8=A1=8C=E9=87=8F=E6=B8=AC"
 =

-#: src/main.cpp:126
+#: src/main.cpp:127
 msgid "generate a html report"
 msgstr "=E7=94=A2=E7=94=9F html =E5=A0=B1=E5=91=8A"
 =

-#: src/main.cpp:127
+#: src/main.cpp:128
 msgid "[=3Diterations] number of times to run each test"
 msgstr "[=3Diterations] =E6=AF=8F=E6=AC=A1=E6=AA=A2=E9=A9=97=E9=80=B2=E8=
=A1=8C=E9=87=8F=E6=B8=AC=E6=AC=A1=E6=95=B8"
 =

-#: src/main.cpp:128
+#: src/main.cpp:129
 msgid "suppress stderr output"
 msgstr "=E9=97=9C=E9=96=89=E6=A8=99=E6=BA=96=E9=8C=AF=E8=AA=A4=E8=BC=B8=E5=
=87=BA"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130 src/main.cpp:131
 msgid "[=3Dseconds]"
 msgstr "[=3D =E7=A7=92]"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
+msgstr ""
+
+#: src/main.cpp:131
 msgid "generate a report for 'x' seconds"
 msgstr "=E7=94=A2=E7=94=9F=E8=92=90=E9=9B=86=E8=B3=87=E6=96=99 'x' =E7=A7=
=92=E9=90=98=E7=9A=84=E5=A0=B1=E5=91=8A"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "[=3Dworkload]"
 msgstr "[=3D=E5=B7=A5=E4=BD=9C=E8=B2=A0=E8=BC=89]"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "file to execute for workload"
 msgstr "=E5=B7=A5=E4=BD=9C=E8=B2=A0=E8=BC=89=E8=A6=81=E5=9F=B7=E8=A1=8C=E7=
=9A=84=E6=AA=94=E6=A1=88"
 =

-#: src/main.cpp:131
+#: src/main.cpp:133
 msgid "print version information"
 msgstr "=E9=A1=AF=E7=A4=BA=E7=89=88=E6=9C=AC=E8=B3=87=E8=A8=8A"
 =

-#: src/main.cpp:132
+#: src/main.cpp:134
 msgid "print this help menu"
 msgstr "=E9=A1=AF=E7=A4=BA=E6=AD=A4=E8=BC=94=E5=8A=A9=E8=AA=AA=E6=98=8E=E9=
=81=B8=E5=96=AE"
 =

-#: src/main.cpp:134
+#: src/main.cpp:136
 #, fuzzy
 msgid "For more help please refer to the 'man 8 powertop'"
 msgstr "=E6=9B=B4=E5=A4=9A=E7=9A=84=E8=BC=94=E5=8A=A9=E8=AA=AA=E6=98=8E=E8=
=AB=8B=E5=8F=83=E9=96=B1 README"
 =

-#: src/main.cpp:212
+#: src/main.cpp:231
 #, c-format
 msgid "Unknown issue running workload!\n"
 msgstr "=E5=9F=B7=E8=A1=8C=E5=B7=A5=E4=BD=9C=E8=B2=A0=E8=BC=89=E7=99=BC=E7=
=94=9F=E6=9C=AA=E7=9F=A5=E5=95=8F=E9=A1=8C=EF=BC=81\n"
 =

-#: src/main.cpp:257
+#: src/main.cpp:288
 msgid "PowerTOP is out of memory. PowerTOP is Aborting"
 msgstr "PowerTOP =E5=B7=B2=E8=80=97=E7=9B=A1=E8=A8=98=E6=86=B6=E9=AB=94=EF=
=BC=8C=E9=80=80=E5=87=BA=E4=B8=AD=E3=80=82"
 =

-#: src/main.cpp:265
+#: src/main.cpp:296
 #, c-format
 msgid "Preparing to take measurements\n"
 msgstr "=E9=87=8F=E6=B8=AC=E6=BA=96=E5=82=99=E4=B8=AD\n"
 =

-#: src/main.cpp:270
+#: src/main.cpp:301
 #, c-format
 msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
 msgstr "=E6=B8=AC=E9=87=8F %d =E6=AC=A1=E6=96=BC=E6=AF=8F %d =E7=A7=92=E3=
=80=82\n"
 =

-#: src/main.cpp:272
+#: src/main.cpp:303
 #, c-format
 msgid "Measuring workload %s.\n"
 msgstr "=E9=87=8F=E6=B8=AC=E5=B7=A5=E4=BD=9C=E8=B2=A0=E8=BC=89 %s =E3=80=
=82\n"
 =

-#: src/main.cpp:295
+#: src/main.cpp:326
 #, c-format
 msgid "PowerTOP "
 msgstr "PowerTOP "
 =

-#: src/main.cpp:296 src/main.cpp:343
+#: src/main.cpp:327 src/main.cpp:377
 #, c-format
 msgid "exiting...\n"
 msgstr "=E9=9B=A2=E9=96=8B=E4=B8=AD...\n"
 =

-#: src/main.cpp:330
+#: src/main.cpp:361
 #, c-format
 msgid "modprobe cpufreq_stats failed"
 msgstr ""
 =

-#: src/main.cpp:332
+#: src/main.cpp:364
 #, c-format
 msgid "modprobe msr failed"
 msgstr ""
 =

-#: src/main.cpp:342
+#: src/main.cpp:376 src/main.cpp:380
 #, c-format
 msgid "Failed to mount debugfs!\n"
 msgstr "debugfs =E6=8E=9B=E8=BC=89=E5=A4=B1=E6=95=97!\n"
 =

-#: src/main.cpp:425
+#: src/main.cpp:381
+#, c-format
+msgid "Should still be able to auto tune...\n"
+msgstr ""
+
+#: src/main.cpp:463
 #, c-format
 msgid "Invalid CSV filename\n"
 msgstr ""
 =

-#: src/main.cpp:441
+#: src/main.cpp:479
 #, c-format
 msgid "Invalid HTML filename\n"
 msgstr ""
 =

-#: src/main.cpp:450
+#: src/main.cpp:488
 #, fuzzy, c-format
 msgid "Quiet mode failed!\n"
 msgstr "=E9=80=B2=E5=85=A5=E5=AE=89=E9=9D=9C=E6=A8=A1=E5=BC=8F=E5=A4=B1=E6=
=95=97=EF=BC=81\n"
 =

-#: src/main.cpp:514
+#: src/main.cpp:555
 msgid "Leaving PowerTOP"
 msgstr "=E9=9B=A2=E9=96=8B PowerTOP"
 =

+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
+msgstr "=E7=84=A1=E6=B3=95=E5=84=B2=E5=AD=98=E6=AA=94=E6=A1=88"
+
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
+msgstr "=E7=84=A1=E6=B3=95=E8=AE=80=E5=8F=96=E6=AA=94=E6=A1=88"
+
+#: src/parameters/persistent.cpp:138
+#, c-format
+msgid "Loaded %i prior measurements\n"
+msgstr "=E5=B7=B2=E8=BC=89=E5=85=A5 %i =E7=AD=86=E5=85=88=E5=89=8D=E9=87=
=8F=E6=B8=AC=E6=95=B8=E6=93=9A\n"
+
+#: src/parameters/persistent.cpp:181
+msgid ""
+"File will be loaded after taking minimum number of measurement(s) with "
+"battery only \n"
+msgstr ""
+
+#: src/perf/perf.cpp:115
+#, c-format
+msgid ""
+"Too many open files, please increase the limit of open file descriptors.\=
n"
+msgstr ""
+
+#: src/perf/perf.cpp:117
+#, c-format
+msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
+msgstr "PowerTOP %s =E9=9C=80=E8=A6=81 Linux =E6=A0=B8=E5=BF=83 'perf' =E5=
=AD=90=E7=B3=BB=E7=B5=B1=E6=94=AF=E6=8F=B4\n"
+
+#: src/perf/perf.cpp:118
+#, c-format
+msgid "as well as support for trace points in the kernel:\n"
+msgstr "=E4=BB=A5=E5=8F=8A Linux =E6=A0=B8=E5=BF=83=E4=B8=AD=E6=96=B7=E9=
=BB=9E (trace point) =E6=94=AF=E6=8F=B4:\n"
+
+#: src/process/do_process.cpp:819
+#, c-format
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
+msgstr ""
+"=E9=A0=90=E4=BC=B0=E7=94=A8=E9=9B=BB=E9=87=8F: %5.1f         =E5=AF=A6=E6=
=B8=AC=E7=94=A8=E9=9B=BB=E9=87=8F: %5.1f        =E7=B8=BD=E8=A8=88: %5.1f\n"
+"\n"
+
+#: src/process/do_process.cpp:838
+#, c-format
+msgid "The estimated remaining time is %i hours, %i minutes\n"
+msgstr "=E4=BC=B0=E8=A8=88=E5=89=A9=E9=A4=98=E6=99=82=E9=96=93=E7=82=BA %i=
 =E5=B0=8F=E6=99=82 %i =E5=88=86=E9=90=98\n"
+
+#: src/process/do_process.cpp:846
+msgid "Summary"
+msgstr "=E7=B8=BD=E8=A6=BD"
+
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
+msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
+
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
+msgstr "GPU =E6=8C=87=E4=BB=A4 / =E7=A7=92"
+
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
+msgstr "VFS =E6=8C=87=E4=BB=A4 / =E7=A7=92 =E4=BB=A5=E5=8F=8A"
+
+#: src/process/do_process.cpp:846
+msgid "CPU use"
+msgstr "CPU =E7=94=A8=E9=87=8F"
+
+#: src/process/do_process.cpp:850
+msgid "Power est."
+msgstr "=E9=9B=BB=E6=BA=90=E9=A0=90=E8=A8=88"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
+msgstr "=E4=BA=8B=E4=BB=B6 / =E7=A7=92"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:931 src/process/do_process.cpp:1079
+msgid "Category"
+msgstr "=E5=88=86=E9=A1=9E"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:932 src/process/do_process.cpp:1080
+#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
+#: src/tuning/tuning.cpp:289
+msgid "Description"
+msgstr "=E6=8F=8F=E8=BF=B0"
+
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
+msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
+
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
+msgstr "GPU =E6=8C=87=E4=BB=A4 / =E7=A7=92"
+
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
+msgstr "=E7=A3=81=E7=A2=9F IO / =E7=A7=92"
+
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
+msgstr "GFX =E5=96=9A=E9=86=92 / =E7=A7=92"
+
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
+msgstr "=E8=BB=9F=E9=AB=94=E8=80=97=E9=9B=BB=E9=87=8F=E5=A4=A7=E6=88=B6=E7=
=B8=BD=E8=A6=BD"
+
+#: src/process/do_process.cpp:1057
+msgid "Target:"
+msgstr ""
+
+#: src/process/do_process.cpp:1058
+msgid "1 units/s"
+msgstr ""
+
+#: src/process/do_process.cpp:1059
+msgid "System: "
+msgstr ""
+
+#: src/process/do_process.cpp:1061
+#, fuzzy
+msgid " wakeup/s"
+msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
+
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
+msgstr ""
+
+#: src/process/do_process.cpp:1064
+#, fuzzy, c-format
+msgid "\\% usage"
+msgstr "=E7=94=A8=E6=B3=95"
+
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
+msgstr ""
+
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+#, fuzzy
+msgid " ops/s"
+msgstr "GPU =E6=8C=87=E4=BB=A4 / =E7=A7=92"
+
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
+msgstr ""
+
+#: src/process/do_process.cpp:1070
+#, fuzzy
+msgid " wakeups/s"
+msgstr "=E5=96=9A=E9=86=92 / =E7=A7=92"
+
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
+msgstr ""
+
+#: src/process/do_process.cpp:1139
+#, fuzzy
+msgid "Top 10 Power Consumers"
+msgstr "=E8=BB=9F=E9=AB=94=E8=80=97=E9=9B=BB=E9=87=8F=E5=A4=A7=E6=88=B6=E7=
=B8=BD=E8=A6=BD"
+
 #: src/report/report.cpp:122
 #, fuzzy
 msgid "PowerTOP Version"
@@ -833,6 +785,131 @@ msgstr "=E7=84=A1=E6=B3=95=E5=BB=BA=E7=AB=8B=E6=9A=AB=
=E5=AD=98=E6=AA=94=E6=A1=88\n"
 msgid "PowerTOP outputing using base filename %s\n"
 msgstr ""
 =

+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
+msgstr "=E5=A5=BD"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr "=E5=A3=9E"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr "=E6=9C=AA=E7=9F=A5"
+
+#: src/tuning/bluetooth.cpp:48
+#, c-format
+msgid "Bluetooth device interface status"
+msgstr "=E8=97=8D=E7=89=99=E8=A8=AD=E5=82=99=E4=BB=8B=E9=9D=A2=E7=8B=80=E6=
=85=8B"
+
+#: src/tuning/ethernet.cpp:54
+#, c-format
+msgid "Wake-on-lan status for device %s"
+msgstr "=E7=B6=B2=E8=B7=AF=E5=96=9A=E9=86=92=E5=95=9F=E7=94=A8=E7=8B=80=E6=
=85=8B=E6=96=BC=E8=A8=AD=E5=82=99 %s"
+
+#: src/tuning/runtime.cpp:48
+#, c-format
+msgid "Runtime PM for %s device %s"
+msgstr "=E5=9F=B7=E8=A1=8C=E6=99=82=E6=9C=9F=E7=9C=81=E9=9B=BB %s =E8=A8=
=AD=E5=82=99 %s"
+
+#: src/tuning/runtime.cpp:50
+#, c-format
+msgid "%s device %s has no runtime power management"
+msgstr "%s =E8=A8=AD=E5=82=99 %s =E6=B2=92=E6=9C=89=E5=9F=B7=E8=A1=8C=E6=
=99=82=E6=9C=9F=E9=9B=BB=E6=BA=90=E7=AE=A1=E7=90=86=E5=8A=9F=E8=83=BD"
+
+#: src/tuning/runtime.cpp:74
+#, c-format
+msgid "PCI Device %s has no runtime power management"
+msgstr "PCI =E8=A8=AD=E5=82=99 %s =E6=B2=92=E6=9C=89=E5=9F=B7=E8=A1=8C=E6=
=99=82=E6=9C=9F=E9=9B=BB=E6=BA=90=E7=AE=A1=E7=90=86=E5=8A=9F=E8=83=BD"
+
+#: src/tuning/runtime.cpp:76
+#, c-format
+msgid "Runtime PM for PCI Device %s"
+msgstr "PCI =E8=A8=AD=E5=82=99 %s =E9=9B=BB=E6=BA=90=E7=AE=A1=E7=90=86"
+
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
+msgstr "=E5=95=9F=E7=94=A8=E9=9F=B3=E6=95=88=E8=A8=AD=E5=82=99=E9=9B=BB=E6=
=BA=90=E7=AE=A1=E7=90=86=E5=8A=9F=E8=83=BD"
+
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
+msgstr "NMI watchdog =E7=9B=A3=E6=8E=A7=E6=87=89=E8=A9=B2=E9=97=9C=E9=96=
=89"
+
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
+msgstr "=E7=9C=81=E9=9B=BB=E5=9E=8B CPU =E6=8E=92=E7=A8=8B=E5=99=A8 "
+
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
+msgstr "VM =E5=9B=9E=E5=AF=AB=E5=BB=B6=E6=99=82"
+
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
+msgstr "=E5=8F=AF=E8=AA=BF=E9=81=B8=E9=A0=85"
+
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+msgstr " <ESC> =E9=9B=A2=E9=96=8B | <Enter> =E5=88=87=E6=8F=9B=E9=81=B8=E9=
=A0=85=E9=96=8B=E9=97=9C   | <r> =E6=9B=B4=E6=96=B0=E8=A6=96=E7=AA=97=E5=85=
=A7=E5=AE=B9"
+
+#: src/tuning/tuning.cpp:244
+msgid "Script"
+msgstr ""
+
+#: src/tuning/tuning.cpp:258
+msgid "Software Settings in Need of Tuning"
+msgstr ""
+
+#: src/tuning/tuning.cpp:277
+msgid "Untunable Software Issues"
+msgstr ""
+
+#: src/tuning/tuning.cpp:301
+msgid "Optimal Tuned Software Settings"
+msgstr ""
+
+#: src/tuning/tuningi2c.cpp:57
+#, fuzzy, c-format
+msgid "Runtime PM for I2C %s %s (%s)"
+msgstr "=E5=9F=B7=E8=A1=8C=E6=99=82=E6=9C=9F=E7=9C=81=E9=9B=BB %s =E8=A8=
=AD=E5=82=99 %s"
+
+#: src/tuning/tuningi2c.cpp:59
+#, fuzzy, c-format
+msgid "I2C %s %s has no runtime power management"
+msgstr "%s =E8=A8=AD=E5=82=99 %s =E6=B2=92=E6=9C=89=E5=9F=B7=E8=A1=8C=E6=
=99=82=E6=9C=9F=E9=9B=BB=E6=BA=90=E7=AE=A1=E7=90=86=E5=8A=9F=E8=83=BD"
+
+#: src/tuning/tuningsysfs.cpp:123
+#, fuzzy, c-format
+msgid "Enable SATA link power management for %s"
+msgstr "=E5=95=9F=E7=94=A8 %s =E7=9A=84 SATA =E9=80=A3=E7=B7=9A=E9=9B=BB=
=E6=BA=90=E7=AE=A1=E7=90=86"
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr "=E8=87=AA=E5=8B=95=E9=96=92=E7=BD=AE=E6=96=BC=E6=9C=AA=E7=9F=A5=E7=
=9A=84 USB =E8=A8=AD=E5=82=99 %s (%s:%s)"
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr "=E8=87=AA=E5=8B=95=E9=96=92=E7=BD=AE=E6=96=BC USB =E8=A8=AD=E5=82=
=99 %s [%s]"
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
+msgstr "=E7=84=A1=E7=B7=9A=E7=B6=B2=E8=B7=AF=E7=9C=81=E9=9B=BB=E7=8B=80=E6=
=85=8B=E6=96=BC=E8=A8=AD=E5=82=99 %s"
+
+#~ msgid "Actual"
+#~ msgstr "=E5=AF=A6=E9=9A=9B"
+
 #, fuzzy
 #~ msgid "I2C Device: %s"
 #~ msgstr "PCI =E8=A8=AD=E5=82=99: %s"
-- =

1.8.3.1


--===============3637322289368593863==--

