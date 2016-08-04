Content-Type: multipart/mixed; boundary="===============3703380477627485245=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 10/19] ca.po: re-generate Catalan translation
Date: Wed, 03 Aug 2016 17:59:20 -0700
Message-ID: <1470272369-218664-11-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3703380477627485245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/ca.po | 989 ++++++++++++++++++++++++++++++++++-------------------------=
----
 1 file changed, 533 insertions(+), 456 deletions(-)

diff --git a/po/ca.po b/po/ca.po
index 4b3c705226d4..bcbbed8eb1a2 100644
--- a/po/ca.po
+++ b/po/ca.po
@@ -10,7 +10,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:10-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Catalan (http://www.transifex.com/projects/p/PowerTOP/"
@@ -21,50 +21,74 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3D(n !=3D 1);\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
-msgstr ""
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
+msgstr "No es pot crear el fitxer temporal\n"
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
-msgstr ""
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
+msgstr "Calibrant: =C3=BAs de CPU en %i discussions\n"
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
-msgstr "=C3=9Altimes mesuracions de %i carregades\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
+msgstr "Calibrant: consum d'energia de l'encesa de CPU\n"
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
-msgstr ""
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
+msgstr "Calibrant dispositius USB\n"
 =

-#: src/display.cpp:70
-msgid "Overview"
-msgstr "Informaci=C3=B3 general"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
+msgstr ".... dispositiu %s\n"
 =

-#: src/display.cpp:71
-msgid "Idle stats"
-msgstr "Estad=C3=ADstiques de rep=C3=B2s"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
+msgstr "Calibrant dispositius de r=C3=A0dio\n"
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
-msgstr "Estad=C3=ADstiques de freq=C3=BC=C3=A8ncia"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
+msgstr "Calibrant llum de fons\n"
 =

-#: src/display.cpp:73
-msgid "Device stats"
-msgstr "Estad=C3=ADstiques del dispositiu"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
+msgstr "Calibrant rep=C3=B2s\n"
 =

-#: src/display.cpp:131
-msgid "Exit"
-msgstr "Surt"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
+msgstr "Calibrant: =C3=BAs de disc\n"
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr "Iniciant calibrat d'estimaci=C3=B3 d'energia PowerTOP\n"
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr "Finalitzant calibraci=C3=B3 d'estimaci=C3=B3 d'energia de PowerTOP=
\n"
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr "Par=C3=A0metres despr=C3=A9s del calibrat:\n"
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
 msgstr ""
@@ -91,44 +115,44 @@ msgstr ""
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
 msgstr "l'event cpu_idle no ha retornat cap estat?\n"
 =

-#: src/cpu/cpu.cpp:1005
+#: src/cpu/cpu.cpp:999
 #, c-format
 msgid "power or cpu_frequency event returned no state?\n"
 msgstr ""
@@ -138,660 +162,588 @@ msgid "C0 polling"
 msgstr "C0 sondejant"
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
 msgstr "C0 actiu"
 =

-#: src/cpu/intel_cpus.cpp:576
-#, c-format
-msgid "Actual"
-msgstr "Aut=C3=A8ntic"
-
-#: src/devlist.cpp:330
-msgid "Process"
-msgstr ""
-
-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-#, fuzzy
-msgid "Device"
-msgstr "Estad=C3=ADstiques del dispositiu"
-
-#: src/devlist.cpp:347
-msgid "Process Device Activity"
-msgstr ""
-
-#: src/lib.cpp:287
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "%7sW"
-msgstr "%7sW"
-
-#: src/lib.cpp:290
-#, c-format
-msgid "    0 mW"
-msgstr "    0 mW"
-
-#: src/lib.cpp:409
-msgid "PS/2 Touchpad / Keyboard / Mouse"
-msgstr "PS/2 Touchpad / Teclat / Ratol=C3=AD"
-
-#: src/lib.cpp:410
-msgid "SATA controller"
-msgstr "Controlador SATA"
-
-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
-msgstr "Intel connectat a port USB"
-
-#: src/lib.cpp:485 src/lib.cpp:517
-#, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
+msgid "Average"
 msgstr ""
 =

-#: src/process/do_process.cpp:818
+#: src/cpu/intel_gpu.cpp:64
 #, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+msgid "  GPU "
 msgstr ""
-"Pot=C3=A8ncia estimada: %5.1f    Pot=C3=A8ncia mesurada: %5.1f    Suma: %=
5.1f\n"
-"\n"
 =

-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
+#: src/devices/ahci.cpp:154
 #, c-format
-msgid "The battery reports a discharge rate of %sW\n"
-msgstr "La bateria reporta un nivell de desc=C3=A0rrega de %sW\n"
+msgid "SATA link: %s"
+msgstr "Connexi=C3=B3 SATA: %s"
 =

-#: src/process/do_process.cpp:834
+#: src/devices/ahci.cpp:156
 #, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
-msgstr ""
-
-#: src/process/do_process.cpp:842
-msgid "Summary"
-msgstr ""
-
-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
-msgstr ""
-
-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
-msgstr ""
-
-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
-msgstr ""
-
-#: src/process/do_process.cpp:842
-msgid "CPU use"
-msgstr ""
-
-#: src/process/do_process.cpp:846
-msgid "Power est."
-msgstr ""
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
-msgstr ""
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
-msgstr ""
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:927 src/process/do_process.cpp:1075
-msgid "Category"
-msgstr ""
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:928 src/process/do_process.cpp:1076
-#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
-#: src/tuning/tuning.cpp:289
-msgid "Description"
-msgstr ""
-
-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
-msgstr ""
-
-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
-msgstr ""
-
-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
-msgstr ""
-
-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
-msgstr ""
+msgid "SATA disk: %s"
+msgstr "Disc SATA: %s"
 =

-#: src/process/do_process.cpp:931 src/process/do_process.cpp:1078
-#: src/devices/device.cpp:273
-msgid "PW Estimate"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
 =

-#: src/process/do_process.cpp:1013
-msgid "Overview of Software Power Consumers"
+#: src/devices/ahci.cpp:389
+msgid "Link"
 msgstr ""
 =

-#: src/process/do_process.cpp:1053
-msgid "Target:"
-msgstr ""
+#: src/devices/ahci.cpp:390
+#, fuzzy
+msgid "Active"
+msgstr "C0 actiu"
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
-msgid " wakeup/s"
+#: src/devices/ahci.cpp:393
+msgid "Devslp"
 msgstr ""
 =

-#: src/process/do_process.cpp:1058
-msgid "CPU: "
+#: src/devices/ahci.cpp:399
+msgid "AHCI ALPM Residency Statistics"
 msgstr ""
 =

-#: src/process/do_process.cpp:1060
+#: src/devices/alsa.cpp:77
 #, c-format
-msgid "\\% usage"
-msgstr ""
-
-#: src/process/do_process.cpp:1061
-msgid "GPU:"
-msgstr ""
-
-#: src/process/do_process.cpp:1063 src/process/do_process.cpp:1069
-msgid " ops/s"
-msgstr ""
-
-#: src/process/do_process.cpp:1064
-msgid "GFX:"
-msgstr ""
+msgid "Audio codec %s: %s (%s)"
+msgstr "C=C3=B2dec d'=C3=A0udio %s: %s (%s)"
 =

-#: src/process/do_process.cpp:1066
-msgid " wakeups/s"
-msgstr ""
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#, c-format
+msgid "Audio codec %s: %s"
+msgstr "C=C3=B2dec d'=C3=A0udio %s: %s"
 =

-#: src/process/do_process.cpp:1067
-msgid "VFS:"
-msgstr ""
+#: src/devices/devfreq.cpp:261
+#, fuzzy
+msgid "Device Freq stats"
+msgstr "Estad=C3=ADstiques del dispositiu"
 =

-#: src/process/do_process.cpp:1135
-msgid "Top 10 Power Consumers"
+#: src/devices/devfreq.cpp:279
+msgid " Devfreq is not enabled"
 msgstr ""
 =

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
-msgstr "PowerTOP %s necessita que el kernel suporti el subsistema 'perf'\n"
+msgid "The battery reports a discharge rate of %sW\n"
+msgstr "La bateria reporta un nivell de desc=C3=A0rrega de %sW\n"
 =

-#: src/perf/perf.cpp:118
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
 #, c-format
-msgid "as well as support for trace points in the kernel:\n"
-msgstr "aix=C3=AD com suport per a punts de seguiment en el kernel:\n"
+msgid "The power consumed was %sJ\n"
+msgstr ""
 =

-#: src/devices/device.cpp:178
+#: src/devices/device.cpp:180
 #, c-format
 msgid "System baseline power is estimated at %sW\n"
 msgstr "La l=C3=ADnia base d'energia del sistema est=C3=A0 estimada en %sW=
\n"
 =

-#: src/devices/device.cpp:185
+#: src/devices/device.cpp:187
 msgid "Power est.    Usage     Device name\n"
 msgstr "Energia est.    =C3=9As     Nom del dispositiu\n"
 =

-#: src/devices/device.cpp:187
+#: src/devices/device.cpp:189
 msgid "              Usage     Device name\n"
 msgstr "              =C3=9As     Nom del dispositiu\n"
 =

-#: src/devices/device.cpp:254
+#: src/devices/device.cpp:256
 #, fuzzy
 msgid "The battery reports a discharge rate of: "
 msgstr "La bateria reporta un nivell de desc=C3=A0rrega de %sW\n"
 =

 #: src/devices/device.cpp:261
+msgid "The power consumed was : "
+msgstr ""
+
+#: src/devices/device.cpp:268
 #, fuzzy
 msgid "The system baseline power is estimated at: "
 msgstr "La l=C3=ADnia base d'energia del sistema est=C3=A0 estimada en %sW=
\n"
 =

-#: src/devices/device.cpp:271
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
+msgstr ""
+
+#: src/devices/device.cpp:278
 #, fuzzy
 msgid "Device Name"
 msgstr "Estad=C3=ADstiques del dispositiu"
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
-msgstr "C=C3=B2dec d'=C3=A0udio %s: %s (%s)"
+msgid "Network interface: %s (%s)"
+msgstr "Interf=C3=ADcie de xarxa: %s(%s)"
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
 #, c-format
-msgid "Audio codec %s: %s"
-msgstr "C=C3=B2dec d'=C3=A0udio %s: %s"
+msgid "Radio device: %s"
+msgstr "Dispositiu de r=C3=A0dio: %s"
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
+msgstr "Estad=C3=ADstiques del dispositiu"
+
+#: src/devices/runtime_pm.cpp:241
 #, c-format
 msgid "PCI Device: %s"
 msgstr "Dispositiu PCI: %s"
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
 msgid "USB device: %s"
 msgstr "Dispositiu USB: %s"
 =

-#: src/devices/usb.cpp:91
+#: src/devices/usb.cpp:94
 #, c-format
 msgid "USB device: %s (%s)"
 msgstr "Dispositiu USB: %s (%s)"
 =

-#: src/devices/ahci.cpp:154
-#, c-format
-msgid "SATA link: %s"
-msgstr "Connexi=C3=B3 SATA: %s"
-
-#: src/devices/ahci.cpp:156
-#, c-format
-msgid "SATA disk: %s"
-msgstr "Disc SATA: %s"
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
-msgstr "C0 actiu"
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
-msgstr "Dispositiu de r=C3=A0dio: %s"
-
-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
-msgstr "Interf=C3=ADcie de xarxa: %s(%s)"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
-msgstr "Bo"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
-msgstr "Malament"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
-msgstr "Desconegut"
-
-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
-msgstr "Estat de la interf=C3=ADcie del dispositiu Bluetooth"
-
-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
-msgstr "Habilita administraci=C3=B3 d'energia del c=C3=B2dec d'=C3=A0udio"
-
-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
-msgstr "S'hauria d'apagar la vigil=C3=A0ncia NMI"
-
-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
-msgstr "Planificador de CPU conscient d'energia"
-
-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
-msgstr "Temps l=C3=ADmint de reescriptura VM"
-
-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
-msgstr "Optimitzables"
+#: src/display.cpp:70
+msgid "Overview"
+msgstr "Informaci=C3=B3 general"
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
-msgstr "<ESC> Sortir | <ENTRAR> canvia optimitzable | <r> Actualitza fines=
tra"
+#: src/display.cpp:71
+msgid "Idle stats"
+msgstr "Estad=C3=ADstiques de rep=C3=B2s"
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
-msgstr ""
+#: src/display.cpp:72
+msgid "Frequency stats"
+msgstr "Estad=C3=ADstiques de freq=C3=BC=C3=A8ncia"
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
-msgstr ""
+#: src/display.cpp:73
+msgid "Device stats"
+msgstr "Estad=C3=ADstiques del dispositiu"
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
-msgstr ""
+#: src/display.cpp:131
+msgid "Exit"
+msgstr "Surt"
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
-msgstr "Estat Wake-on-lan per a dispositiu %s"
-
-#: src/tuning/wifi.cpp:48
-#, c-format
-msgid "Wireless Power Saving for interface %s"
-msgstr "Estalvi d'energia sense cable per a interf=C3=ADcie %s"
-
-#: src/tuning/runtime.cpp:48
-#, c-format
-msgid "Runtime PM for %s device %s"
-msgstr "Temps d'execuci=C3=B3 PM per %s dispositiu %s"
-
-#: src/tuning/runtime.cpp:50
-#, c-format
-msgid "%s device %s has no runtime power management"
-msgstr "%s dispositiu %s no t=C3=A9 administraci=C3=B3 d'energia en el fun=
cionament"
-
-#: src/tuning/runtime.cpp:74
-#, c-format
-msgid "PCI Device %s has no runtime power management"
-msgstr "El dispositiu PCI %s no t=C3=A9 administraci=C3=B3 d'energia en te=
mps d'execuci=C3=B3"
-
-#: src/tuning/runtime.cpp:76
-#, c-format
-msgid "Runtime PM for PCI Device %s"
-msgstr "Temps d'execuci=C3=B3 PM per dispositiu PCI %s"
-
-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
-msgstr "Autosusp=C3=A8s per a dispositiu USB desconegut %s (%s:%s)"
-
-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
-#, c-format
-msgid "Autosuspend for USB device %s [%s]"
-msgstr "Autosusp=C3=A8s per a dipositiu USB %s [%s]"
-
-#: src/tuning/tuningsysfs.cpp:123
-#, fuzzy, c-format
-msgid "Enable SATA link power management for %s"
-msgstr "Habilita administraci=C3=B3 d'energia del c=C3=B2dec d'=C3=A0udio"
-
-#: src/calibrate/calibrate.cpp:238
-#, c-format
-msgid "Cannot create temp file\n"
-msgstr "No es pot crear el fitxer temporal\n"
-
-#: src/calibrate/calibrate.cpp:258
+#: src/lib.cpp:288
 #, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
-msgstr "Calibrant: =C3=BAs de CPU en %i discussions\n"
+msgid "%7sW"
+msgstr "%7sW"
 =

-#: src/calibrate/calibrate.cpp:273
+#: src/lib.cpp:291
 #, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
-msgstr "Calibrant: consum d'energia de l'encesa de CPU\n"
+msgid "    0 mW"
+msgstr "    0 mW"
 =

-#: src/calibrate/calibrate.cpp:290
-#, c-format
-msgid "Calibrating USB devices\n"
-msgstr "Calibrant dispositius USB\n"
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
+msgstr "PS/2 Touchpad / Teclat / Ratol=C3=AD"
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
-#, c-format
-msgid ".... device %s \n"
-msgstr ".... dispositiu %s\n"
+#: src/lib.cpp:411
+msgid "SATA controller"
+msgstr "Controlador SATA"
 =

-#: src/calibrate/calibrate.cpp:307
-#, c-format
-msgid "Calibrating radio devices\n"
-msgstr "Calibrant dispositius de r=C3=A0dio\n"
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
+msgstr "Intel connectat a port USB"
 =

-#: src/calibrate/calibrate.cpp:331
+#: src/lib.cpp:467
 #, c-format
-msgid "Calibrating backlight\n"
-msgstr "Calibrant llum de fons\n"
+msgid "glob returned GLOB_NOSPACE\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#: src/lib.cpp:471
 #, c-format
-msgid "Calibrating idle\n"
-msgstr "Calibrant rep=C3=B2s\n"
+msgid "glob returned GLOB_ABORTED\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
+#: src/lib.cpp:475
 #, c-format
-msgid "Calibrating: disk usage \n"
-msgstr "Calibrant: =C3=BAs de disc\n"
-
-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
-msgstr "Iniciant calibrat d'estimaci=C3=B3 d'energia PowerTOP\n"
-
-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
-msgstr "Finalitzant calibraci=C3=B3 d'estimaci=C3=B3 d'energia de PowerTOP=
\n"
+msgid "glob returned GLOB_NOMATCH\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "Parameters after calibration:\n"
-msgstr "Par=C3=A0metres despr=C3=A9s del calibrat:\n"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
+msgstr ""
 =

-#: src/main.cpp:101
+#: src/main.cpp:102
 #, fuzzy, c-format
 msgid "PowerTOP version "
 msgstr "PowerTOP "
 =

-#: src/main.cpp:107
+#: src/main.cpp:108
 msgid "Set refresh time out"
 msgstr ""
 =

-#: src/main.cpp:120
+#: src/main.cpp:121
 msgid "Usage: powertop [OPTIONS]"
 msgstr ""
 =

-#: src/main.cpp:121
+#: src/main.cpp:122
 msgid "sets all tunable options to their GOOD setting"
 msgstr ""
 =

-#: src/main.cpp:122
+#: src/main.cpp:123
 msgid "runs powertop in calibration mode"
 msgstr ""
 =

-#: src/main.cpp:123 src/main.cpp:126
+#: src/main.cpp:124 src/main.cpp:127
 msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/main.cpp:123
+#: src/main.cpp:124
 msgid "generate a csv report"
 msgstr ""
 =

-#: src/main.cpp:124
+#: src/main.cpp:125
 msgid "run in \"debug\" mode"
 msgstr ""
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "[=3Ddevnode]"
 msgstr ""
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "uses an Extech Power Analyzer for measurements"
 msgstr ""
 =

-#: src/main.cpp:126
+#: src/main.cpp:127
 msgid "generate a html report"
 msgstr ""
 =

-#: src/main.cpp:127
+#: src/main.cpp:128
 msgid "[=3Diterations] number of times to run each test"
 msgstr ""
 =

-#: src/main.cpp:128
+#: src/main.cpp:129
 msgid "suppress stderr output"
 msgstr ""
 =

-#: src/main.cpp:129
+#: src/main.cpp:130 src/main.cpp:131
 msgid "[=3Dseconds]"
 msgstr ""
 =

-#: src/main.cpp:129
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
+msgstr ""
+
+#: src/main.cpp:131
 msgid "generate a report for 'x' seconds"
 msgstr ""
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "[=3Dworkload]"
 msgstr ""
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "file to execute for workload"
 msgstr ""
 =

-#: src/main.cpp:131
+#: src/main.cpp:133
 msgid "print version information"
 msgstr ""
 =

-#: src/main.cpp:132
+#: src/main.cpp:134
 msgid "print this help menu"
 msgstr ""
 =

-#: src/main.cpp:134
+#: src/main.cpp:136
 msgid "For more help please refer to the 'man 8 powertop'"
 msgstr ""
 =

-#: src/main.cpp:212
+#: src/main.cpp:231
 #, c-format
 msgid "Unknown issue running workload!\n"
 msgstr ""
 =

-#: src/main.cpp:257
+#: src/main.cpp:288
 msgid "PowerTOP is out of memory. PowerTOP is Aborting"
 msgstr ""
 =

-#: src/main.cpp:265
+#: src/main.cpp:296
 #, c-format
 msgid "Preparing to take measurements\n"
 msgstr ""
 =

-#: src/main.cpp:270
+#: src/main.cpp:301
 #, c-format
 msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
 msgstr ""
 =

-#: src/main.cpp:272
+#: src/main.cpp:303
 #, c-format
 msgid "Measuring workload %s.\n"
 msgstr ""
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
 msgstr "sortint...\n"
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
 msgstr ""
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
 #, c-format
 msgid "Quiet mode failed!\n"
 msgstr ""
 =

-#: src/main.cpp:514
+#: src/main.cpp:555
 msgid "Leaving PowerTOP"
 msgstr ""
 =

+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
+msgstr ""
+
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
+msgstr ""
+
+#: src/parameters/persistent.cpp:138
+#, c-format
+msgid "Loaded %i prior measurements\n"
+msgstr "=C3=9Altimes mesuracions de %i carregades\n"
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
+msgstr "PowerTOP %s necessita que el kernel suporti el subsistema 'perf'\n"
+
+#: src/perf/perf.cpp:118
+#, c-format
+msgid "as well as support for trace points in the kernel:\n"
+msgstr "aix=C3=AD com suport per a punts de seguiment en el kernel:\n"
+
+#: src/process/do_process.cpp:819
+#, c-format
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
+msgstr ""
+"Pot=C3=A8ncia estimada: %5.1f    Pot=C3=A8ncia mesurada: %5.1f    Suma: %=
5.1f\n"
+"\n"
+
+#: src/process/do_process.cpp:838
+#, c-format
+msgid "The estimated remaining time is %i hours, %i minutes\n"
+msgstr ""
+
+#: src/process/do_process.cpp:846
+msgid "Summary"
+msgstr ""
+
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
+msgstr ""
+
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
+msgstr ""
+
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
+msgstr ""
+
+#: src/process/do_process.cpp:846
+msgid "CPU use"
+msgstr ""
+
+#: src/process/do_process.cpp:850
+msgid "Power est."
+msgstr ""
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
+msgstr ""
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:931 src/process/do_process.cpp:1079
+msgid "Category"
+msgstr ""
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:932 src/process/do_process.cpp:1080
+#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
+#: src/tuning/tuning.cpp:289
+msgid "Description"
+msgstr ""
+
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
+msgstr ""
+
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
+msgstr ""
+
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
+msgstr ""
+
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
+msgstr ""
+
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
+msgstr ""
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
+msgid " wakeup/s"
+msgstr ""
+
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
+msgstr ""
+
+#: src/process/do_process.cpp:1064
+#, c-format
+msgid "\\% usage"
+msgstr ""
+
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
+msgstr ""
+
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+msgid " ops/s"
+msgstr ""
+
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
+msgstr ""
+
+#: src/process/do_process.cpp:1070
+msgid " wakeups/s"
+msgstr ""
+
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
+msgstr ""
+
+#: src/process/do_process.cpp:1139
+msgid "Top 10 Power Consumers"
+msgstr ""
+
 #: src/report/report.cpp:122
 #, fuzzy
 msgid "PowerTOP Version"
@@ -827,6 +779,131 @@ msgstr "No es pot crear el fitxer temporal\n"
 msgid "PowerTOP outputing using base filename %s\n"
 msgstr ""
 =

+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
+msgstr "Bo"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr "Malament"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr "Desconegut"
+
+#: src/tuning/bluetooth.cpp:48
+#, c-format
+msgid "Bluetooth device interface status"
+msgstr "Estat de la interf=C3=ADcie del dispositiu Bluetooth"
+
+#: src/tuning/ethernet.cpp:54
+#, c-format
+msgid "Wake-on-lan status for device %s"
+msgstr "Estat Wake-on-lan per a dispositiu %s"
+
+#: src/tuning/runtime.cpp:48
+#, c-format
+msgid "Runtime PM for %s device %s"
+msgstr "Temps d'execuci=C3=B3 PM per %s dispositiu %s"
+
+#: src/tuning/runtime.cpp:50
+#, c-format
+msgid "%s device %s has no runtime power management"
+msgstr "%s dispositiu %s no t=C3=A9 administraci=C3=B3 d'energia en el fun=
cionament"
+
+#: src/tuning/runtime.cpp:74
+#, c-format
+msgid "PCI Device %s has no runtime power management"
+msgstr "El dispositiu PCI %s no t=C3=A9 administraci=C3=B3 d'energia en te=
mps d'execuci=C3=B3"
+
+#: src/tuning/runtime.cpp:76
+#, c-format
+msgid "Runtime PM for PCI Device %s"
+msgstr "Temps d'execuci=C3=B3 PM per dispositiu PCI %s"
+
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
+msgstr "Habilita administraci=C3=B3 d'energia del c=C3=B2dec d'=C3=A0udio"
+
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
+msgstr "S'hauria d'apagar la vigil=C3=A0ncia NMI"
+
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
+msgstr "Planificador de CPU conscient d'energia"
+
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
+msgstr "Temps l=C3=ADmint de reescriptura VM"
+
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
+msgstr "Optimitzables"
+
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+msgstr "<ESC> Sortir | <ENTRAR> canvia optimitzable | <r> Actualitza fines=
tra"
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
+msgstr "Temps d'execuci=C3=B3 PM per %s dispositiu %s"
+
+#: src/tuning/tuningi2c.cpp:59
+#, fuzzy, c-format
+msgid "I2C %s %s has no runtime power management"
+msgstr "%s dispositiu %s no t=C3=A9 administraci=C3=B3 d'energia en el fun=
cionament"
+
+#: src/tuning/tuningsysfs.cpp:123
+#, fuzzy, c-format
+msgid "Enable SATA link power management for %s"
+msgstr "Habilita administraci=C3=B3 d'energia del c=C3=B2dec d'=C3=A0udio"
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr "Autosusp=C3=A8s per a dispositiu USB desconegut %s (%s:%s)"
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr "Autosusp=C3=A8s per a dipositiu USB %s [%s]"
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
+msgstr "Estalvi d'energia sense cable per a interf=C3=ADcie %s"
+
+#~ msgid "Actual"
+#~ msgstr "Aut=C3=A8ntic"
+
 #, fuzzy
 #~ msgid "I2C Device: %s"
 #~ msgstr "Dispositiu PCI: %s"
-- =

1.8.3.1


--===============3703380477627485245==--

