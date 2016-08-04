Content-Type: multipart/mixed; boundary="===============7814967032380825576=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 09/19] powertop.pot: xgettext refresh,
 attribution fix
Date: Wed, 03 Aug 2016 17:59:19 -0700
Message-ID: <1470272369-218664-10-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7814967032380825576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Refresh contents of powertop.pot with latest changes to AC_REVISION
(configure.ac) and POTFILES.in.

Also, use correct copyright attribution in the generated template.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/powertop.pot | 839 ++++++++++++++++++++++++++++++----------------------=
----
 1 file changed, 456 insertions(+), 383 deletions(-)

diff --git a/po/powertop.pot b/po/powertop.pot
index 702401adf91f..52cd8bc23965 100644
--- a/po/powertop.pot
+++ b/po/powertop.pot
@@ -1,14 +1,14 @@
-# SOME DESCRIPTIVE TITLE.
-# Copyright (C) YEAR Intel Corporation =

-# This file is distributed under the same license as the PACKAGE package.
-# FIRST AUTHOR <EMAIL(a)ADDRESS>, YEAR.
+# LANG translation for PowerTOP.
+# Copyright (C) 2016 Intel Corporation
+# This file is distributed under the same license as the PowerTOP package.
+# Arjan van de Ven <arjan(a)linux.intel.com>, 2010
 #
 #, fuzzy
 msgid ""
 msgstr ""
-"Project-Id-Version: powertop 2.8-rc4\n"
+"Project-Id-Version: powertop 2.9-pre\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:04-0700\n"
 "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
 "Last-Translator: FULL NAME <EMAIL(a)ADDRESS>\n"
 "Language-Team: LANGUAGE <LL(a)li.org>\n"
@@ -17,50 +17,74 @@ msgstr ""
 "Content-Type: text/plain; charset=3DCHARSET\n"
 "Content-Transfer-Encoding: 8bit\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
 msgstr ""
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
 msgstr ""
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
 msgstr ""
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
 msgstr ""
 =

-#: src/display.cpp:70
-msgid "Overview"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
 msgstr ""
 =

-#: src/display.cpp:71
-msgid "Idle stats"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
 msgstr ""
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
 msgstr ""
 =

-#: src/display.cpp:73
-msgid "Device stats"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
 msgstr ""
 =

-#: src/display.cpp:131
-msgid "Exit"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
 msgstr ""
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr ""
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr ""
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr ""
+
+#: src/cpu/abstract_cpu.cpp:74
+msgid "Idle"
+msgstr ""
+
+#: src/cpu/abstract_cpu.cpp:76
+msgid "Turbo Mode"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:37 src/cpu/cpu_core.cpp:93 src/cpu/intel_cpus.cpp:=
281
+#: src/cpu/cpu_core.cpp:37 src/cpu/cpu_core.cpp:93 src/cpu/intel_cpus.cpp:=
312
 #, c-format
 msgid "  Core"
 msgstr ""
@@ -87,44 +111,44 @@ msgstr ""
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
 msgstr ""
 =

-#: src/cpu/cpu.cpp:559 src/cpu/cpu.cpp:768
+#: src/cpu/cpu.cpp:553 src/cpu/cpu.cpp:762
 #, c-format
 msgid "Core %d"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:566
+#: src/cpu/cpu.cpp:560
 #, c-format
 msgid "GPU %d"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:587
+#: src/cpu/cpu.cpp:581
 msgid "CPU"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:669
+#: src/cpu/cpu.cpp:663
 msgid "Processor Frequency Report"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:789
+#: src/cpu/cpu.cpp:783
 #, c-format
 msgid "CPU %d"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:990
+#: src/cpu/cpu.cpp:984
 #, c-format
 msgid "cpu_idle event returned no state?\n"
 msgstr ""
 =

-#: src/cpu/cpu.cpp:1005
+#: src/cpu/cpu.cpp:999
 #, c-format
 msgid "power or cpu_frequency event returned no state?\n"
 msgstr ""
@@ -134,683 +158,732 @@ msgid "C0 polling"
 msgstr ""
 =

 #: src/cpu/cpu_linux.cpp:242 src/cpu/cpu_linux.cpp:341
-#: src/cpu/intel_cpus.cpp:593
+#: src/cpu/intel_cpus.cpp:629
 #, c-format
 msgid " CPU %i"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:105 src/cpu/intel_cpus.cpp:357
+#: src/cpu/cpu_package.cpp:105 src/cpu/intel_cpus.cpp:390
 #, c-format
 msgid "  Package"
 msgstr ""
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
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:576
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "Actual"
+msgid "Average"
 msgstr ""
 =

-#: src/devlist.cpp:330
-msgid "Process"
+#: src/cpu/intel_gpu.cpp:64
+#, c-format
+msgid "  GPU "
 msgstr ""
 =

-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-msgid "Device"
+#: src/devices/ahci.cpp:154
+#, c-format
+msgid "SATA link: %s"
 msgstr ""
 =

-#: src/devlist.cpp:347
-msgid "Process Device Activity"
+#: src/devices/ahci.cpp:156
+#, c-format
+msgid "SATA disk: %s"
 msgstr ""
 =

-#: src/lib.cpp:287
-#, c-format
-msgid "%7sW"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
 =

-#: src/lib.cpp:290
-#, c-format
-msgid "    0 mW"
+#: src/devices/ahci.cpp:389
+msgid "Link"
 msgstr ""
 =

-#: src/lib.cpp:409
-msgid "PS/2 Touchpad / Keyboard / Mouse"
+#: src/devices/ahci.cpp:390
+msgid "Active"
 msgstr ""
 =

-#: src/lib.cpp:410
-msgid "SATA controller"
+#: src/devices/ahci.cpp:391
+msgid "Partial"
 msgstr ""
 =

-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
+#: src/devices/ahci.cpp:392
+msgid "Slumber"
 msgstr ""
 =

-#: src/lib.cpp:485 src/lib.cpp:517
-#, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
+#: src/devices/ahci.cpp:393
+msgid "Devslp"
 msgstr ""
 =

-#: src/process/do_process.cpp:818
-#, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+#: src/devices/ahci.cpp:399
+msgid "AHCI ALPM Residency Statistics"
 msgstr ""
 =

-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
+#: src/devices/alsa.cpp:77
 #, c-format
-msgid "The battery reports a discharge rate of %sW\n"
+msgid "Audio codec %s: %s (%s)"
 msgstr ""
 =

-#: src/process/do_process.cpp:834
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
 #, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
+msgid "Audio codec %s: %s"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "Summary"
+#: src/devices/devfreq.cpp:261
+msgid "Device Freq stats"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
+#: src/devices/devfreq.cpp:279
+msgid " Devfreq is not enabled"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
+#: src/devices/devfreq.cpp:284
+msgid " No devfreq devices available"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
+#: src/devices/device.cpp:172 src/process/do_process.cpp:831
+#, c-format
+msgid "The battery reports a discharge rate of %sW\n"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "CPU use"
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
+#, c-format
+msgid "The power consumed was %sJ\n"
 msgstr ""
 =

-#: src/process/do_process.cpp:846
-msgid "Power est."
+#: src/devices/device.cpp:180
+#, c-format
+msgid "System baseline power is estimated at %sW\n"
 msgstr ""
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
+#: src/devices/device.cpp:187
+msgid "Power est.    Usage     Device name\n"
 msgstr ""
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
+#: src/devices/device.cpp:189
+msgid "              Usage     Device name\n"
 msgstr ""
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:927 src/process/do_process.cpp:1075
-msgid "Category"
+#: src/devices/device.cpp:256
+msgid "The battery reports a discharge rate of: "
 msgstr ""
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:928 src/process/do_process.cpp:1076
-#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
-#: src/tuning/tuning.cpp:289
-msgid "Description"
+#: src/devices/device.cpp:261
+msgid "The power consumed was : "
 msgstr ""
 =

-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
+#: src/devices/device.cpp:268
+msgid "The system baseline power is estimated at: "
 msgstr ""
 =

-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
 msgstr ""
 =

-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
+#: src/devices/device.cpp:278
+msgid "Device Name"
 msgstr ""
 =

-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
+#: src/devices/device.cpp:280 src/process/do_process.cpp:935
+#: src/process/do_process.cpp:1082
+msgid "PW Estimate"
 msgstr ""
 =

-#: src/process/do_process.cpp:931 src/process/do_process.cpp:1078
-#: src/devices/device.cpp:273
-msgid "PW Estimate"
+#: src/devices/device.cpp:317
+msgid "Device Power Report"
 msgstr ""
 =

-#: src/process/do_process.cpp:1013
-msgid "Overview of Software Power Consumers"
+#: src/devices/network.cpp:177
+#, c-format
+msgid "Network interface: %s (%s)"
 msgstr ""
 =

-#: src/process/do_process.cpp:1053
-msgid "Target:"
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
+#, c-format
+msgid "Radio device: %s"
 msgstr ""
 =

-#: src/process/do_process.cpp:1054
-msgid "1 units/s"
+#: src/devices/runtime_pm.cpp:216
+#, c-format
+msgid "I2C %s (%s): %s"
 msgstr ""
 =

-#: src/process/do_process.cpp:1055
-msgid "System: "
+#: src/devices/runtime_pm.cpp:216 src/tuning/tuningi2c.cpp:57
+#: src/tuning/tuningi2c.cpp:59
+msgid "Adapter"
 msgstr ""
 =

-#: src/process/do_process.cpp:1057
-msgid " wakeup/s"
+#: src/devices/runtime_pm.cpp:216 src/devlist.cpp:331
+#: src/tuning/tuningi2c.cpp:57 src/tuning/tuningi2c.cpp:59
+msgid "Device"
 msgstr ""
 =

-#: src/process/do_process.cpp:1058
-msgid "CPU: "
+#: src/devices/runtime_pm.cpp:241
+#, c-format
+msgid "PCI Device: %s"
 msgstr ""
 =

-#: src/process/do_process.cpp:1060
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
-msgid "\\% usage"
+msgid "USB device: %s"
 msgstr ""
 =

-#: src/process/do_process.cpp:1061
-msgid "GPU:"
+#: src/devices/usb.cpp:94
+#, c-format
+msgid "USB device: %s (%s)"
 msgstr ""
 =

-#: src/process/do_process.cpp:1063 src/process/do_process.cpp:1069
-msgid " ops/s"
+#: src/devlist.cpp:330
+msgid "Process"
 msgstr ""
 =

-#: src/process/do_process.cpp:1064
-msgid "GFX:"
+#: src/devlist.cpp:347
+msgid "Process Device Activity"
 msgstr ""
 =

-#: src/process/do_process.cpp:1066
-msgid " wakeups/s"
+#: src/display.cpp:70
+msgid "Overview"
 msgstr ""
 =

-#: src/process/do_process.cpp:1067
-msgid "VFS:"
+#: src/display.cpp:71
+msgid "Idle stats"
 msgstr ""
 =

-#: src/process/do_process.cpp:1135
-msgid "Top 10 Power Consumers"
+#: src/display.cpp:72
+msgid "Frequency stats"
 msgstr ""
 =

-#: src/perf/perf.cpp:115
-#, c-format
-msgid ""
-"Too many open files, please increase the limit of open file descriptors.\=
n"
+#: src/display.cpp:73
+msgid "Device stats"
 msgstr ""
 =

-#: src/perf/perf.cpp:117
-#, c-format
-msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
+#: src/display.cpp:131
+msgid "Exit"
 msgstr ""
 =

-#: src/perf/perf.cpp:118
-#, c-format
-msgid "as well as support for trace points in the kernel:\n"
+#: src/display.cpp:132
+msgid "Navigate"
 msgstr ""
 =

-#: src/devices/device.cpp:178
+#: src/lib.cpp:288
 #, c-format
-msgid "System baseline power is estimated at %sW\n"
+msgid "%7sW"
 msgstr ""
 =

-#: src/devices/device.cpp:185
-msgid "Power est.    Usage     Device name\n"
+#: src/lib.cpp:291
+#, c-format
+msgid "    0 mW"
 msgstr ""
 =

-#: src/devices/device.cpp:187
-msgid "              Usage     Device name\n"
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
 msgstr ""
 =

-#: src/devices/device.cpp:254
-msgid "The battery reports a discharge rate of: "
+#: src/lib.cpp:411
+msgid "SATA controller"
 msgstr ""
 =

-#: src/devices/device.cpp:261
-msgid "The system baseline power is estimated at: "
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
 msgstr ""
 =

-#: src/devices/device.cpp:271
-msgid "Device Name"
+#: src/lib.cpp:467
+#, c-format
+msgid "glob returned GLOB_NOSPACE\n"
 msgstr ""
 =

-#: src/devices/device.cpp:310
-msgid "Device Power Report"
+#: src/lib.cpp:471
+#, c-format
+msgid "glob returned GLOB_ABORTED\n"
 msgstr ""
 =

-#: src/devices/alsa.cpp:77
+#: src/lib.cpp:475
 #, c-format
-msgid "Audio codec %s: %s (%s)"
+msgid "glob returned GLOB_NOMATCH\n"
 msgstr ""
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "Audio codec %s: %s"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
 msgstr ""
 =

-#: src/devices/runtime_pm.cpp:215
+#: src/main.cpp:102
 #, c-format
-msgid "I2C %s (%s): %s"
+msgid "PowerTOP version "
 msgstr ""
 =

-#: src/devices/runtime_pm.cpp:215
-msgid "Adapter"
+#: src/main.cpp:108
+msgid "Set refresh time out"
 msgstr ""
 =

-#: src/devices/runtime_pm.cpp:240
-#, c-format
-msgid "PCI Device: %s"
+#: src/main.cpp:121
+msgid "Usage: powertop [OPTIONS]"
 msgstr ""
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
-#, c-format
-msgid "USB device: %s"
+#: src/main.cpp:122
+msgid "sets all tunable options to their GOOD setting"
 msgstr ""
 =

-#: src/devices/usb.cpp:91
-#, c-format
-msgid "USB device: %s (%s)"
+#: src/main.cpp:123
+msgid "runs powertop in calibration mode"
 msgstr ""
 =

-#: src/devices/ahci.cpp:154
-#, c-format
-msgid "SATA link: %s"
+#: src/main.cpp:124 src/main.cpp:127
+msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/devices/ahci.cpp:156
-#, c-format
-msgid "SATA disk: %s"
+#: src/main.cpp:124
+msgid "generate a csv report"
 msgstr ""
 =

-#: src/devices/ahci.cpp:374
-msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
+#: src/main.cpp:125
+msgid "run in \"debug\" mode"
 msgstr ""
 =

-#: src/devices/ahci.cpp:389
-msgid "Link"
+#: src/main.cpp:126
+msgid "[=3Ddevnode]"
 msgstr ""
 =

-#: src/devices/ahci.cpp:390
-msgid "Active"
+#: src/main.cpp:126
+msgid "uses an Extech Power Analyzer for measurements"
 msgstr ""
 =

-#: src/devices/ahci.cpp:391
-msgid "Partial"
+#: src/main.cpp:127
+msgid "generate a html report"
 msgstr ""
 =

-#: src/devices/ahci.cpp:392
-msgid "Slumber"
+#: src/main.cpp:128
+msgid "[=3Diterations] number of times to run each test"
 msgstr ""
 =

-#: src/devices/ahci.cpp:393
-msgid "Devslp"
+#: src/main.cpp:129
+msgid "suppress stderr output"
 msgstr ""
 =

-#: src/devices/ahci.cpp:399
-msgid "AHCI ALPM Residency Statistics"
+#: src/main.cpp:130 src/main.cpp:131
+msgid "[=3Dseconds]"
 msgstr ""
 =

-#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
-#, c-format
-msgid "Radio device: %s"
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
 msgstr ""
 =

-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
+#: src/main.cpp:131
+msgid "generate a report for 'x' seconds"
 msgstr ""
 =

-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
+#: src/main.cpp:132
+msgid "[=3Dworkload]"
 msgstr ""
 =

-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
+#: src/main.cpp:132
+msgid "file to execute for workload"
 msgstr ""
 =

-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
+#: src/main.cpp:133
+msgid "print version information"
 msgstr ""
 =

-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
+#: src/main.cpp:134
+msgid "print this help menu"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
+#: src/main.cpp:136
+msgid "For more help please refer to the 'man 8 powertop'"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
+#: src/main.cpp:231
+#, c-format
+msgid "Unknown issue running workload!\n"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
+#: src/main.cpp:288
+msgid "PowerTOP is out of memory. PowerTOP is Aborting"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
+#: src/main.cpp:296
+#, c-format
+msgid "Preparing to take measurements\n"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
+#: src/main.cpp:301
+#, c-format
+msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+#: src/main.cpp:303
+#, c-format
+msgid "Measuring workload %s.\n"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
+#: src/main.cpp:326
+#, c-format
+msgid "PowerTOP "
 msgstr ""
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
+#: src/main.cpp:327 src/main.cpp:377
+#, c-format
+msgid "exiting...\n"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
+#: src/main.cpp:361
+#, c-format
+msgid "modprobe cpufreq_stats failed"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:301
-msgid "Optimal Tuned Software Settings"
+#: src/main.cpp:364
+#, c-format
+msgid "modprobe msr failed"
 msgstr ""
 =

-#: src/tuning/ethernet.cpp:54
+#: src/main.cpp:376 src/main.cpp:380
 #, c-format
-msgid "Wake-on-lan status for device %s"
+msgid "Failed to mount debugfs!\n"
 msgstr ""
 =

-#: src/tuning/wifi.cpp:48
+#: src/main.cpp:381
 #, c-format
-msgid "Wireless Power Saving for interface %s"
+msgid "Should still be able to auto tune...\n"
 msgstr ""
 =

-#: src/tuning/runtime.cpp:48
+#: src/main.cpp:463
 #, c-format
-msgid "Runtime PM for %s device %s"
+msgid "Invalid CSV filename\n"
 msgstr ""
 =

-#: src/tuning/runtime.cpp:50
+#: src/main.cpp:479
 #, c-format
-msgid "%s device %s has no runtime power management"
+msgid "Invalid HTML filename\n"
 msgstr ""
 =

-#: src/tuning/runtime.cpp:74
+#: src/main.cpp:488
 #, c-format
-msgid "PCI Device %s has no runtime power management"
+msgid "Quiet mode failed!\n"
 msgstr ""
 =

-#: src/tuning/runtime.cpp:76
-#, c-format
-msgid "Runtime PM for PCI Device %s"
+#: src/main.cpp:555
+msgid "Leaving PowerTOP"
 msgstr ""
 =

-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
 msgstr ""
 =

-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
-#, c-format
-msgid "Autosuspend for USB device %s [%s]"
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
 msgstr ""
 =

-#: src/tuning/tuningsysfs.cpp:123
+#: src/parameters/persistent.cpp:138
 #, c-format
-msgid "Enable SATA link power management for %s"
+msgid "Loaded %i prior measurements\n"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:238
-#, c-format
-msgid "Cannot create temp file\n"
+#: src/parameters/persistent.cpp:181
+msgid ""
+"File will be loaded after taking minimum number of measurement(s) with "
+"battery only \n"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:258
+#: src/perf/perf.cpp:115
 #, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
+msgid ""
+"Too many open files, please increase the limit of open file descriptors.\=
n"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:273
+#: src/perf/perf.cpp:117
 #, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
+msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:290
+#: src/perf/perf.cpp:118
 #, c-format
-msgid "Calibrating USB devices\n"
+msgid "as well as support for trace points in the kernel:\n"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#: src/process/do_process.cpp:819
 #, c-format
-msgid ".... device %s \n"
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:307
+#: src/process/do_process.cpp:838
 #, c-format
-msgid "Calibrating radio devices\n"
+msgid "The estimated remaining time is %i hours, %i minutes\n"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:331
-#, c-format
-msgid "Calibrating backlight\n"
+#: src/process/do_process.cpp:846
+msgid "Summary"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
-#, c-format
-msgid "Calibrating idle\n"
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
-#, c-format
-msgid "Calibrating: disk usage \n"
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
+#: src/process/do_process.cpp:846
+msgid "CPU use"
 msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
-#, c-format
-msgid "Parameters after calibration:\n"
+#: src/process/do_process.cpp:850
+msgid "Power est."
 msgstr ""
 =

-#: src/main.cpp:101
-#, c-format
-msgid "PowerTOP version "
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
 msgstr ""
 =

-#: src/main.cpp:107
-msgid "Set refresh time out"
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:931 src/process/do_process.cpp:1079
+msgid "Category"
 msgstr ""
 =

-#: src/main.cpp:120
-msgid "Usage: powertop [OPTIONS]"
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:932 src/process/do_process.cpp:1080
+#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
+#: src/tuning/tuning.cpp:289
+msgid "Description"
 msgstr ""
 =

-#: src/main.cpp:121
-msgid "sets all tunable options to their GOOD setting"
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
 msgstr ""
 =

-#: src/main.cpp:122
-msgid "runs powertop in calibration mode"
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
 msgstr ""
 =

-#: src/main.cpp:123 src/main.cpp:126
-msgid "[=3Dfilename]"
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
 msgstr ""
 =

-#: src/main.cpp:123
-msgid "generate a csv report"
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
 msgstr ""
 =

-#: src/main.cpp:124
-msgid "run in \"debug\" mode"
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
 msgstr ""
 =

-#: src/main.cpp:125
-msgid "[=3Ddevnode]"
+#: src/process/do_process.cpp:1057
+msgid "Target:"
 msgstr ""
 =

-#: src/main.cpp:125
-msgid "uses an Extech Power Analyzer for measurements"
+#: src/process/do_process.cpp:1058
+msgid "1 units/s"
 msgstr ""
 =

-#: src/main.cpp:126
-msgid "generate a html report"
+#: src/process/do_process.cpp:1059
+msgid "System: "
 msgstr ""
 =

-#: src/main.cpp:127
-msgid "[=3Diterations] number of times to run each test"
+#: src/process/do_process.cpp:1061
+msgid " wakeup/s"
 msgstr ""
 =

-#: src/main.cpp:128
-msgid "suppress stderr output"
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
 msgstr ""
 =

-#: src/main.cpp:129
-msgid "[=3Dseconds]"
+#: src/process/do_process.cpp:1064
+#, c-format
+msgid "\\% usage"
 msgstr ""
 =

-#: src/main.cpp:129
-msgid "generate a report for 'x' seconds"
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
 msgstr ""
 =

-#: src/main.cpp:130
-msgid "[=3Dworkload]"
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+msgid " ops/s"
 msgstr ""
 =

-#: src/main.cpp:130
-msgid "file to execute for workload"
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
 msgstr ""
 =

-#: src/main.cpp:131
-msgid "print version information"
+#: src/process/do_process.cpp:1070
+msgid " wakeups/s"
 msgstr ""
 =

-#: src/main.cpp:132
-msgid "print this help menu"
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
 msgstr ""
 =

-#: src/main.cpp:134
-msgid "For more help please refer to the 'man 8 powertop'"
+#: src/process/do_process.cpp:1139
+msgid "Top 10 Power Consumers"
 msgstr ""
 =

-#: src/main.cpp:212
-#, c-format
-msgid "Unknown issue running workload!\n"
+#: src/report/report.cpp:122
+msgid "PowerTOP Version"
 msgstr ""
 =

-#: src/main.cpp:257
-msgid "PowerTOP is out of memory. PowerTOP is Aborting"
+#: src/report/report.cpp:131
+msgid "Kernel Version"
 msgstr ""
 =

-#: src/main.cpp:265
-#, c-format
-msgid "Preparing to take measurements\n"
+#: src/report/report.cpp:135
+msgid "System Name"
 msgstr ""
 =

-#: src/main.cpp:270
-#, c-format
-msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
+#: src/report/report.cpp:142
+msgid "CPU Information"
 msgstr ""
 =

-#: src/main.cpp:272
-#, c-format
-msgid "Measuring workload %s.\n"
+#: src/report/report.cpp:154
+msgid "OS Information"
+msgstr ""
+
+#: src/report/report.cpp:161
+msgid "System Information"
 msgstr ""
 =

-#: src/main.cpp:295
+#: src/report/report.cpp:195
 #, c-format
-msgid "PowerTOP "
+msgid "Cannot open output file %s (%s)\n"
 msgstr ""
 =

-#: src/main.cpp:296 src/main.cpp:343
+#: src/report/report.cpp:211
 #, c-format
-msgid "exiting...\n"
+msgid "PowerTOP outputing using base filename %s\n"
+msgstr ""
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
 msgstr ""
 =

-#: src/main.cpp:330
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr ""
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr ""
+
+#: src/tuning/bluetooth.cpp:48
 #, c-format
-msgid "modprobe cpufreq_stats failed"
+msgid "Bluetooth device interface status"
 msgstr ""
 =

-#: src/main.cpp:332
+#: src/tuning/ethernet.cpp:54
 #, c-format
-msgid "modprobe msr failed"
+msgid "Wake-on-lan status for device %s"
 msgstr ""
 =

-#: src/main.cpp:342
+#: src/tuning/runtime.cpp:48
 #, c-format
-msgid "Failed to mount debugfs!\n"
+msgid "Runtime PM for %s device %s"
 msgstr ""
 =

-#: src/main.cpp:425
+#: src/tuning/runtime.cpp:50
 #, c-format
-msgid "Invalid CSV filename\n"
+msgid "%s device %s has no runtime power management"
 msgstr ""
 =

-#: src/main.cpp:441
+#: src/tuning/runtime.cpp:74
 #, c-format
-msgid "Invalid HTML filename\n"
+msgid "PCI Device %s has no runtime power management"
 msgstr ""
 =

-#: src/main.cpp:450
+#: src/tuning/runtime.cpp:76
 #, c-format
-msgid "Quiet mode failed!\n"
+msgid "Runtime PM for PCI Device %s"
 msgstr ""
 =

-#: src/main.cpp:514
-msgid "Leaving PowerTOP"
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
 msgstr ""
 =

-#: src/report/report.cpp:122
-msgid "PowerTOP Version"
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
 msgstr ""
 =

-#: src/report/report.cpp:131
-msgid "Kernel Version"
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
 msgstr ""
 =

-#: src/report/report.cpp:135
-msgid "System Name"
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
 msgstr ""
 =

-#: src/report/report.cpp:142
-msgid "CPU Information"
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
 msgstr ""
 =

-#: src/report/report.cpp:154
-msgid "OS Information"
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
 msgstr ""
 =

-#: src/report/report.cpp:161
-msgid "System Information"
+#: src/tuning/tuning.cpp:244
+msgid "Script"
 msgstr ""
 =

-#: src/report/report.cpp:195
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
 #, c-format
-msgid "Cannot open output file %s (%s)\n"
+msgid "Runtime PM for I2C %s %s (%s)"
 msgstr ""
 =

-#: src/report/report.cpp:211
+#: src/tuning/tuningi2c.cpp:59
 #, c-format
-msgid "PowerTOP outputing using base filename %s\n"
+msgid "I2C %s %s has no runtime power management"
+msgstr ""
+
+#: src/tuning/tuningsysfs.cpp:123
+#, c-format
+msgid "Enable SATA link power management for %s"
+msgstr ""
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr ""
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr ""
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
 msgstr ""
-- =

1.8.3.1


--===============7814967032380825576==--

