Content-Type: multipart/mixed; boundary="===============2468486278388962315=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 15/19] es_ES.po: re-generate Spanish (Spain)
 translation
Date: Wed, 03 Aug 2016 17:59:25 -0700
Message-ID: <1470272369-218664-16-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2468486278388962315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/es_ES.po | 1040 ++++++++++++++++++++++++++++++++-----------------------=
----
 1 file changed, 559 insertions(+), 481 deletions(-)

diff --git a/po/es_ES.po b/po/es_ES.po
index 2c706eba663c..78764be020d1 100644
--- a/po/es_ES.po
+++ b/po/es_ES.po
@@ -9,7 +9,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:10-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Spanish (Spain) (http://www.transifex.com/projects/p/Power=
TOP/"
@@ -20,50 +20,74 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3D(n !=3D 1);\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
-msgstr ""
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
+msgstr "No puede crear archivo temp\n"
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
-msgstr ""
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
+msgstr "Calibrando: uso de CPU en %i discusiones\n"
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
-msgstr "Cargado %i medidas previas\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
+msgstr "Calibrando: consumo de energ=C3=ADa del despertado de la CPU\n"
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
-msgstr ""
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
+msgstr "Calibrando dispositivos USB\n"
 =

-#: src/display.cpp:70
-msgid "Overview"
-msgstr "Informaci=C3=B3n general"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
+msgstr ".... dispositivo %s \n"
 =

-#: src/display.cpp:71
-msgid "Idle stats"
-msgstr "Estad=C3=ADsticas de parado"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
+msgstr "Calibrando dispositivos de radio\n"
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
-msgstr "Estad=C3=ADsticas de frecuencia"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
+msgstr "Calibrando luz trasera\n"
 =

-#: src/display.cpp:73
-msgid "Device stats"
-msgstr "Estad=C3=ADsticas del dispositivo"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
+msgstr "Calibrando parado\n"
 =

-#: src/display.cpp:131
-msgid "Exit"
-msgstr "Salida"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
+msgstr "Calibrando: uso de disco \n"
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr "Iniciando calibraci=C3=B3n de estimado de energ=C3=ADa PowerTOP \n"
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr "Finalizando calibraci=C3=B3n de estimaci=C3=B3n de energ=C3=ADa de=
 PowerTOP  \n"
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr "Par=C3=A1metros tras calibraci=C3=B3n:\n"
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
@@ -90,45 +114,45 @@ msgstr ""
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
 #, fuzzy, c-format
 msgid "GPU %d"
 msgstr " CPU %i"
 =

-#: src/cpu/cpu.cpp:587
+#: src/cpu/cpu.cpp:581
 #, fuzzy
 msgid "CPU"
 msgstr " CPU %i"
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
 msgstr " CPU %i"
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
@@ -138,661 +162,586 @@ msgid "C0 polling"
 msgstr "C0 sondeando"
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
 msgstr "C0 activo"
 =

-#: src/cpu/intel_cpus.cpp:576
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "Actual"
-msgstr "Actual"
-
-#: src/devlist.cpp:330
-msgid "Process"
+msgid "Average"
 msgstr ""
 =

-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-#, fuzzy
-msgid "Device"
-msgstr "Estad=C3=ADsticas del dispositivo"
-
-#: src/devlist.cpp:347
-msgid "Process Device Activity"
-msgstr ""
+#: src/cpu/intel_gpu.cpp:64
+#, fuzzy, c-format
+msgid "  GPU "
+msgstr " CPU %i"
 =

-#: src/lib.cpp:287
+#: src/devices/ahci.cpp:154
 #, c-format
-msgid "%7sW"
-msgstr "%7sW"
+msgid "SATA link: %s"
+msgstr "Enlace SATA: %s"
 =

-#: src/lib.cpp:290
+#: src/devices/ahci.cpp:156
 #, c-format
-msgid "    0 mW"
-msgstr "    0 mW"
-
-#: src/lib.cpp:409
-msgid "PS/2 Touchpad / Keyboard / Mouse"
-msgstr "PS/2 Touchpad / Teclado / Rat=C3=B3n"
-
-#: src/lib.cpp:410
-msgid "SATA controller"
-msgstr "Controlador SATA"
-
-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
-msgstr "Intel construido en concentrador USB"
+msgid "SATA disk: %s"
+msgstr "Disco SATA: %s"
 =

-#: src/lib.cpp:485 src/lib.cpp:517
-#, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
 =

-#: src/process/do_process.cpp:818
-#, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+#: src/devices/ahci.cpp:389
+msgid "Link"
 msgstr ""
-"Energ=C3=ADa estimada: %5.1f    Energ=C3=ADa medida: %5.1f    Sum: %5.1f\=
n"
-"\n"
 =

-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
-#, c-format
-msgid "The battery reports a discharge rate of %sW\n"
-msgstr "La bater=C3=ADa reporta una tasa de descarga de %sW\n"
+#: src/devices/ahci.cpp:390
+#, fuzzy
+msgid "Active"
+msgstr "C0 activo"
 =

-#: src/process/do_process.cpp:834
-#, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
+#: src/devices/ahci.cpp:391
+msgid "Partial"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "Summary"
-msgstr "Resumen"
-
-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
+#: src/devices/ahci.cpp:392
+msgid "Slumber"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
+#: src/devices/ahci.cpp:393
+msgid "Devslp"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
+#: src/devices/ahci.cpp:399
+msgid "AHCI ALPM Residency Statistics"
 msgstr ""
 =

-#: src/process/do_process.cpp:842
-msgid "CPU use"
-msgstr ""
+#: src/devices/alsa.cpp:77
+#, c-format
+msgid "Audio codec %s: %s (%s)"
+msgstr "Codec de audio %s: %s (%s)"
 =

-#: src/process/do_process.cpp:846
-msgid "Power est."
-msgstr ""
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#, c-format
+msgid "Audio codec %s: %s"
+msgstr "Codec de audio %s: %s"
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
-msgstr ""
+#: src/devices/devfreq.cpp:261
+#, fuzzy
+msgid "Device Freq stats"
+msgstr "Estad=C3=ADsticas del dispositivo"
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
+#: src/devices/devfreq.cpp:279
+msgid " Devfreq is not enabled"
 msgstr ""
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:927 src/process/do_process.cpp:1075
-msgid "Category"
+#: src/devices/devfreq.cpp:284
+msgid " No devfreq devices available"
 msgstr ""
 =

-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:928 src/process/do_process.cpp:1076
-#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
-#: src/tuning/tuning.cpp:289
-msgid "Description"
-msgstr ""
+#: src/devices/device.cpp:172 src/process/do_process.cpp:831
+#, c-format
+msgid "The battery reports a discharge rate of %sW\n"
+msgstr "La bater=C3=ADa reporta una tasa de descarga de %sW\n"
 =

-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
+#, c-format
+msgid "The power consumed was %sJ\n"
 msgstr ""
 =

-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
-msgstr ""
+#: src/devices/device.cpp:180
+#, c-format
+msgid "System baseline power is estimated at %sW\n"
+msgstr "Linea base de energ=C3=ADa del sistema es estimada en %sW\n"
 =

-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
-msgstr ""
+#: src/devices/device.cpp:187
+msgid "Power est.    Usage     Device name\n"
+msgstr "Power est.    Usage     Device name\n"
 =

-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
-msgstr ""
+#: src/devices/device.cpp:189
+msgid "              Usage     Device name\n"
+msgstr "              Uso     Nombre del dispositivo\n"
 =

-#: src/process/do_process.cpp:931 src/process/do_process.cpp:1078
-#: src/devices/device.cpp:273
-msgid "PW Estimate"
-msgstr ""
+#: src/devices/device.cpp:256
+#, fuzzy
+msgid "The battery reports a discharge rate of: "
+msgstr "La bater=C3=ADa reporta una tasa de descarga de %sW\n"
 =

-#: src/process/do_process.cpp:1013
-msgid "Overview of Software Power Consumers"
+#: src/devices/device.cpp:261
+msgid "The power consumed was : "
 msgstr ""
 =

-#: src/process/do_process.cpp:1053
-msgid "Target:"
-msgstr ""
+#: src/devices/device.cpp:268
+#, fuzzy
+msgid "The system baseline power is estimated at: "
+msgstr "Linea base de energ=C3=ADa del sistema es estimada en %sW\n"
 =

-#: src/process/do_process.cpp:1054
-msgid "1 units/s"
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
 msgstr ""
 =

-#: src/process/do_process.cpp:1055
-msgid "System: "
-msgstr ""
+#: src/devices/device.cpp:278
+#, fuzzy
+msgid "Device Name"
+msgstr "Estad=C3=ADsticas del dispositivo"
 =

-#: src/process/do_process.cpp:1057
-msgid " wakeup/s"
+#: src/devices/device.cpp:280 src/process/do_process.cpp:935
+#: src/process/do_process.cpp:1082
+msgid "PW Estimate"
 msgstr ""
 =

-#: src/process/do_process.cpp:1058
-msgid "CPU: "
+#: src/devices/device.cpp:317
+msgid "Device Power Report"
 msgstr ""
 =

-#: src/process/do_process.cpp:1060
+#: src/devices/network.cpp:177
 #, c-format
-msgid "\\% usage"
-msgstr ""
-
-#: src/process/do_process.cpp:1061
-msgid "GPU:"
-msgstr ""
+msgid "Network interface: %s (%s)"
+msgstr "Interfaz de red: %s (%s)"
 =

-#: src/process/do_process.cpp:1063 src/process/do_process.cpp:1069
-msgid " ops/s"
-msgstr ""
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
+#, c-format
+msgid "Radio device: %s"
+msgstr "Dispositivo de radio: %s"
 =

-#: src/process/do_process.cpp:1064
-msgid "GFX:"
+#: src/devices/runtime_pm.cpp:216
+#, c-format
+msgid "I2C %s (%s): %s"
 msgstr ""
 =

-#: src/process/do_process.cpp:1066
-msgid " wakeups/s"
+#: src/devices/runtime_pm.cpp:216 src/tuning/tuningi2c.cpp:57
+#: src/tuning/tuningi2c.cpp:59
+msgid "Adapter"
 msgstr ""
 =

-#: src/process/do_process.cpp:1067
-msgid "VFS:"
-msgstr ""
+#: src/devices/runtime_pm.cpp:216 src/devlist.cpp:331
+#: src/tuning/tuningi2c.cpp:57 src/tuning/tuningi2c.cpp:59
+#, fuzzy
+msgid "Device"
+msgstr "Estad=C3=ADsticas del dispositivo"
 =

-#: src/process/do_process.cpp:1135
-msgid "Top 10 Power Consumers"
-msgstr ""
+#: src/devices/runtime_pm.cpp:241
+#, c-format
+msgid "PCI Device: %s"
+msgstr "Dispositivo PCI: %s"
 =

-#: src/perf/perf.cpp:115
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
-msgid ""
-"Too many open files, please increase the limit of open file descriptors.\=
n"
-msgstr ""
+msgid "USB device: %s"
+msgstr "Dispositivo USB: %s"
 =

-#: src/perf/perf.cpp:117
+#: src/devices/usb.cpp:94
 #, c-format
-msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
-msgstr "PowerTOP %s necesita que el kernel soporte el subsistema 'perf'\n"
-
-#: src/perf/perf.cpp:118
-#, c-format
-msgid "as well as support for trace points in the kernel:\n"
-msgstr "as=C3=AD como soporte para puntos de seguimiento en el kernel:\n"
+msgid "USB device: %s (%s)"
+msgstr "Dispositivo USB: %s (%s)"
 =

-#: src/devices/device.cpp:178
-#, c-format
-msgid "System baseline power is estimated at %sW\n"
-msgstr "Linea base de energ=C3=ADa del sistema es estimada en %sW\n"
+#: src/devlist.cpp:330
+msgid "Process"
+msgstr ""
 =

-#: src/devices/device.cpp:185
-msgid "Power est.    Usage     Device name\n"
-msgstr "Power est.    Usage     Device name\n"
+#: src/devlist.cpp:347
+msgid "Process Device Activity"
+msgstr ""
 =

-#: src/devices/device.cpp:187
-msgid "              Usage     Device name\n"
-msgstr "              Uso     Nombre del dispositivo\n"
+#: src/display.cpp:70
+msgid "Overview"
+msgstr "Informaci=C3=B3n general"
 =

-#: src/devices/device.cpp:254
-#, fuzzy
-msgid "The battery reports a discharge rate of: "
-msgstr "La bater=C3=ADa reporta una tasa de descarga de %sW\n"
+#: src/display.cpp:71
+msgid "Idle stats"
+msgstr "Estad=C3=ADsticas de parado"
 =

-#: src/devices/device.cpp:261
-#, fuzzy
-msgid "The system baseline power is estimated at: "
-msgstr "Linea base de energ=C3=ADa del sistema es estimada en %sW\n"
+#: src/display.cpp:72
+msgid "Frequency stats"
+msgstr "Estad=C3=ADsticas de frecuencia"
 =

-#: src/devices/device.cpp:271
-#, fuzzy
-msgid "Device Name"
+#: src/display.cpp:73
+msgid "Device stats"
 msgstr "Estad=C3=ADsticas del dispositivo"
 =

-#: src/devices/device.cpp:310
-msgid "Device Power Report"
+#: src/display.cpp:131
+msgid "Exit"
+msgstr "Salida"
+
+#: src/display.cpp:132
+msgid "Navigate"
 msgstr ""
 =

-#: src/devices/alsa.cpp:77
+#: src/lib.cpp:288
 #, c-format
-msgid "Audio codec %s: %s (%s)"
-msgstr "Codec de audio %s: %s (%s)"
+msgid "%7sW"
+msgstr "%7sW"
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/lib.cpp:291
 #, c-format
-msgid "Audio codec %s: %s"
-msgstr "Codec de audio %s: %s"
+msgid "    0 mW"
+msgstr "    0 mW"
 =

-#: src/devices/runtime_pm.cpp:215
-#, c-format
-msgid "I2C %s (%s): %s"
-msgstr ""
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
+msgstr "PS/2 Touchpad / Teclado / Rat=C3=B3n"
 =

-#: src/devices/runtime_pm.cpp:215
-msgid "Adapter"
-msgstr ""
+#: src/lib.cpp:411
+msgid "SATA controller"
+msgstr "Controlador SATA"
 =

-#: src/devices/runtime_pm.cpp:240
-#, c-format
-msgid "PCI Device: %s"
-msgstr "Dispositivo PCI: %s"
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
+msgstr "Intel construido en concentrador USB"
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
+#: src/lib.cpp:467
 #, c-format
-msgid "USB device: %s"
-msgstr "Dispositivo USB: %s"
+msgid "glob returned GLOB_NOSPACE\n"
+msgstr ""
 =

-#: src/devices/usb.cpp:91
+#: src/lib.cpp:471
 #, c-format
-msgid "USB device: %s (%s)"
-msgstr "Dispositivo USB: %s (%s)"
+msgid "glob returned GLOB_ABORTED\n"
+msgstr ""
 =

-#: src/devices/ahci.cpp:154
+#: src/lib.cpp:475
 #, c-format
-msgid "SATA link: %s"
-msgstr "Enlace SATA: %s"
+msgid "glob returned GLOB_NOMATCH\n"
+msgstr ""
 =

-#: src/devices/ahci.cpp:156
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "SATA disk: %s"
-msgstr "Disco SATA: %s"
-
-#: src/devices/ahci.cpp:374
-msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
 msgstr ""
 =

-#: src/devices/ahci.cpp:389
-msgid "Link"
-msgstr ""
+#: src/main.cpp:102
+#, fuzzy, c-format
+msgid "PowerTOP version "
+msgstr "PowerTOP "
 =

-#: src/devices/ahci.cpp:390
-#, fuzzy
-msgid "Active"
-msgstr "C0 activo"
+#: src/main.cpp:108
+msgid "Set refresh time out"
+msgstr "Actualizaci=C3=B3n Set time out"
 =

-#: src/devices/ahci.cpp:391
-msgid "Partial"
+#: src/main.cpp:121
+msgid "Usage: powertop [OPTIONS]"
 msgstr ""
 =

-#: src/devices/ahci.cpp:392
-msgid "Slumber"
+#: src/main.cpp:122
+msgid "sets all tunable options to their GOOD setting"
 msgstr ""
 =

-#: src/devices/ahci.cpp:393
-msgid "Devslp"
+#: src/main.cpp:123
+msgid "runs powertop in calibration mode"
 msgstr ""
 =

-#: src/devices/ahci.cpp:399
-msgid "AHCI ALPM Residency Statistics"
+#: src/main.cpp:124 src/main.cpp:127
+msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
-#, c-format
-msgid "Radio device: %s"
-msgstr "Dispositivo de radio: %s"
-
-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
-msgstr "Interfaz de red: %s (%s)"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
-msgstr "Bueno"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
-msgstr "Malo"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
-msgstr "Desconocido"
-
-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
-msgstr "Estado de la interfaz de dispositivo Bluetooth"
-
-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
-msgstr "Habilitar administraci=C3=B3n de energ=C3=ADa del codec de Audio "
+#: src/main.cpp:124
+msgid "generate a csv report"
+msgstr ""
 =

-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
-msgstr "Vigilancia NMI se debe apagar"
+#: src/main.cpp:125
+msgid "run in \"debug\" mode"
+msgstr ""
 =

-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
-msgstr "Planificador de CPU Consciente de Energ=C3=ADa "
+#: src/main.cpp:126
+msgid "[=3Ddevnode]"
+msgstr ""
 =

-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
-msgstr "Tiempo l=C3=ADmite de reescritura VM"
+#: src/main.cpp:126
+msgid "uses an Extech Power Analyzer for measurements"
+msgstr ""
 =

-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
-msgstr "Optimizables"
+#: src/main.cpp:127
+msgid "generate a html report"
+msgstr ""
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+#: src/main.cpp:128
+msgid "[=3Diterations] number of times to run each test"
 msgstr ""
-" Salida de <ESC>| <Enter>Palanca ajustable | Actualizaci=C3=B3n de <r>ven=
tana"
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
+#: src/main.cpp:129
+msgid "suppress stderr output"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
+#: src/main.cpp:130 src/main.cpp:131
+msgid "[=3Dseconds]"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
 msgstr ""
 =

-#: src/tuning/tuning.cpp:301
-msgid "Optimal Tuned Software Settings"
+#: src/main.cpp:131
+msgid "generate a report for 'x' seconds"
 msgstr ""
 =

-#: src/tuning/ethernet.cpp:54
-#, c-format
-msgid "Wake-on-lan status for device %s"
-msgstr "Estado Wake-on-lan para dispositivo %s"
+#: src/main.cpp:132
+msgid "[=3Dworkload]"
+msgstr ""
 =

-#: src/tuning/wifi.cpp:48
-#, c-format
-msgid "Wireless Power Saving for interface %s"
-msgstr "Ahorro de Energ=C3=ADa Wireless para interfaz %s"
+#: src/main.cpp:132
+msgid "file to execute for workload"
+msgstr ""
 =

-#: src/tuning/runtime.cpp:48
-#, c-format
-msgid "Runtime PM for %s device %s"
-msgstr "Tiempo de ejecuci=C3=B3n PM para %s dispositivo %s"
+#: src/main.cpp:133
+msgid "print version information"
+msgstr ""
 =

-#: src/tuning/runtime.cpp:50
-#, c-format
-msgid "%s device %s has no runtime power management"
+#: src/main.cpp:134
+msgid "print this help menu"
 msgstr ""
-"%s dispositivo %s no tiene administraci=C3=B3n de energ=C3=ADa en tiempo =
de ejecuci=C3=B3n"
 =

-#: src/tuning/runtime.cpp:74
-#, c-format
-msgid "PCI Device %s has no runtime power management"
+#: src/main.cpp:136
+msgid "For more help please refer to the 'man 8 powertop'"
 msgstr ""
-"Dispositivo PCI %s no tiene administraci=C3=B3n de energ=C3=ADa en tiempo=
 de ejecuci=C3=B3n"
 =

-#: src/tuning/runtime.cpp:76
+#: src/main.cpp:231
 #, c-format
-msgid "Runtime PM for PCI Device %s"
-msgstr "Tiempo de ejecuci=C3=B3n PM para dispositivo PCI %s"
+msgid "Unknown issue running workload!\n"
+msgstr ""
 =

-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
-msgstr "Autosuspender para dispositivo USB desconocido %s (%s:%s)"
+#: src/main.cpp:288
+msgid "PowerTOP is out of memory. PowerTOP is Aborting"
+msgstr ""
 =

-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
+#: src/main.cpp:296
 #, c-format
-msgid "Autosuspend for USB device %s [%s]"
-msgstr "Autosuspender para dispositivo USB %s [%s]"
-
-#: src/tuning/tuningsysfs.cpp:123
-#, fuzzy, c-format
-msgid "Enable SATA link power management for %s"
-msgstr "Habilitar administraci=C3=B3n de energ=C3=ADa del codec de Audio "
+msgid "Preparing to take measurements\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:238
+#: src/main.cpp:301
 #, c-format
-msgid "Cannot create temp file\n"
-msgstr "No puede crear archivo temp\n"
+msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:258
+#: src/main.cpp:303
 #, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
-msgstr "Calibrando: uso de CPU en %i discusiones\n"
+msgid "Measuring workload %s.\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:273
+#: src/main.cpp:326
 #, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
-msgstr "Calibrando: consumo de energ=C3=ADa del despertado de la CPU\n"
+msgid "PowerTOP "
+msgstr "PowerTOP "
 =

-#: src/calibrate/calibrate.cpp:290
+#: src/main.cpp:327 src/main.cpp:377
 #, c-format
-msgid "Calibrating USB devices\n"
-msgstr "Calibrando dispositivos USB\n"
+msgid "exiting...\n"
+msgstr "saliendo...\n"
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#: src/main.cpp:361
 #, c-format
-msgid ".... device %s \n"
-msgstr ".... dispositivo %s \n"
+msgid "modprobe cpufreq_stats failed"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:307
+#: src/main.cpp:364
 #, c-format
-msgid "Calibrating radio devices\n"
-msgstr "Calibrando dispositivos de radio\n"
+msgid "modprobe msr failed"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:331
+#: src/main.cpp:376 src/main.cpp:380
 #, c-format
-msgid "Calibrating backlight\n"
-msgstr "Calibrando luz trasera\n"
+msgid "Failed to mount debugfs!\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#: src/main.cpp:381
 #, c-format
-msgid "Calibrating idle\n"
-msgstr "Calibrando parado\n"
+msgid "Should still be able to auto tune...\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
+#: src/main.cpp:463
 #, c-format
-msgid "Calibrating: disk usage \n"
-msgstr "Calibrando: uso de disco \n"
-
-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
-msgstr "Iniciando calibraci=C3=B3n de estimado de energ=C3=ADa PowerTOP \n"
-
-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
-msgstr "Finalizando calibraci=C3=B3n de estimaci=C3=B3n de energ=C3=ADa de=
 PowerTOP  \n"
+msgid "Invalid CSV filename\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
+#: src/main.cpp:479
 #, c-format
-msgid "Parameters after calibration:\n"
-msgstr "Par=C3=A1metros tras calibraci=C3=B3n:\n"
-
-#: src/main.cpp:101
-#, fuzzy, c-format
-msgid "PowerTOP version "
-msgstr "PowerTOP "
-
-#: src/main.cpp:107
-msgid "Set refresh time out"
-msgstr "Actualizaci=C3=B3n Set time out"
+msgid "Invalid HTML filename\n"
+msgstr ""
 =

-#: src/main.cpp:120
-msgid "Usage: powertop [OPTIONS]"
+#: src/main.cpp:488
+#, c-format
+msgid "Quiet mode failed!\n"
 msgstr ""
 =

-#: src/main.cpp:121
-msgid "sets all tunable options to their GOOD setting"
+#: src/main.cpp:555
+msgid "Leaving PowerTOP"
 msgstr ""
 =

-#: src/main.cpp:122
-msgid "runs powertop in calibration mode"
+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
 msgstr ""
 =

-#: src/main.cpp:123 src/main.cpp:126
-msgid "[=3Dfilename]"
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
 msgstr ""
 =

-#: src/main.cpp:123
-msgid "generate a csv report"
+#: src/parameters/persistent.cpp:138
+#, c-format
+msgid "Loaded %i prior measurements\n"
+msgstr "Cargado %i medidas previas\n"
+
+#: src/parameters/persistent.cpp:181
+msgid ""
+"File will be loaded after taking minimum number of measurement(s) with "
+"battery only \n"
 msgstr ""
 =

-#: src/main.cpp:124
-msgid "run in \"debug\" mode"
+#: src/perf/perf.cpp:115
+#, c-format
+msgid ""
+"Too many open files, please increase the limit of open file descriptors.\=
n"
 msgstr ""
 =

-#: src/main.cpp:125
-msgid "[=3Ddevnode]"
+#: src/perf/perf.cpp:117
+#, c-format
+msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
+msgstr "PowerTOP %s necesita que el kernel soporte el subsistema 'perf'\n"
+
+#: src/perf/perf.cpp:118
+#, c-format
+msgid "as well as support for trace points in the kernel:\n"
+msgstr "as=C3=AD como soporte para puntos de seguimiento en el kernel:\n"
+
+#: src/process/do_process.cpp:819
+#, c-format
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
 msgstr ""
+"Energ=C3=ADa estimada: %5.1f    Energ=C3=ADa medida: %5.1f    Sum: %5.1f\=
n"
+"\n"
 =

-#: src/main.cpp:125
-msgid "uses an Extech Power Analyzer for measurements"
+#: src/process/do_process.cpp:838
+#, c-format
+msgid "The estimated remaining time is %i hours, %i minutes\n"
 msgstr ""
 =

-#: src/main.cpp:126
-msgid "generate a html report"
+#: src/process/do_process.cpp:846
+msgid "Summary"
+msgstr "Resumen"
+
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
 msgstr ""
 =

-#: src/main.cpp:127
-msgid "[=3Diterations] number of times to run each test"
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
 msgstr ""
 =

-#: src/main.cpp:128
-msgid "suppress stderr output"
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
 msgstr ""
 =

-#: src/main.cpp:129
-msgid "[=3Dseconds]"
+#: src/process/do_process.cpp:846
+msgid "CPU use"
 msgstr ""
 =

-#: src/main.cpp:129
-msgid "generate a report for 'x' seconds"
+#: src/process/do_process.cpp:850
+msgid "Power est."
 msgstr ""
 =

-#: src/main.cpp:130
-msgid "[=3Dworkload]"
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
 msgstr ""
 =

-#: src/main.cpp:130
-msgid "file to execute for workload"
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:931 src/process/do_process.cpp:1079
+msgid "Category"
 msgstr ""
 =

-#: src/main.cpp:131
-msgid "print version information"
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:932 src/process/do_process.cpp:1080
+#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
+#: src/tuning/tuning.cpp:289
+msgid "Description"
 msgstr ""
 =

-#: src/main.cpp:132
-msgid "print this help menu"
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
 msgstr ""
 =

-#: src/main.cpp:134
-msgid "For more help please refer to the 'man 8 powertop'"
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
 msgstr ""
 =

-#: src/main.cpp:212
-#, c-format
-msgid "Unknown issue running workload!\n"
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
 msgstr ""
 =

-#: src/main.cpp:257
-msgid "PowerTOP is out of memory. PowerTOP is Aborting"
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
 msgstr ""
 =

-#: src/main.cpp:265
-#, c-format
-msgid "Preparing to take measurements\n"
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
 msgstr ""
 =

-#: src/main.cpp:270
-#, c-format
-msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
+#: src/process/do_process.cpp:1057
+msgid "Target:"
 msgstr ""
 =

-#: src/main.cpp:272
-#, c-format
-msgid "Measuring workload %s.\n"
+#: src/process/do_process.cpp:1058
+msgid "1 units/s"
 msgstr ""
 =

-#: src/main.cpp:295
-#, c-format
-msgid "PowerTOP "
-msgstr "PowerTOP "
+#: src/process/do_process.cpp:1059
+msgid "System: "
+msgstr ""
 =

-#: src/main.cpp:296 src/main.cpp:343
-#, c-format
-msgid "exiting...\n"
-msgstr "saliendo...\n"
+#: src/process/do_process.cpp:1061
+msgid " wakeup/s"
+msgstr ""
 =

-#: src/main.cpp:330
-#, c-format
-msgid "modprobe cpufreq_stats failed"
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
 msgstr ""
 =

-#: src/main.cpp:332
+#: src/process/do_process.cpp:1064
 #, c-format
-msgid "modprobe msr failed"
+msgid "\\% usage"
 msgstr ""
 =

-#: src/main.cpp:342
-#, c-format
-msgid "Failed to mount debugfs!\n"
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
 msgstr ""
 =

-#: src/main.cpp:425
-#, c-format
-msgid "Invalid CSV filename\n"
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+msgid " ops/s"
 msgstr ""
 =

-#: src/main.cpp:441
-#, c-format
-msgid "Invalid HTML filename\n"
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
 msgstr ""
 =

-#: src/main.cpp:450
-#, c-format
-msgid "Quiet mode failed!\n"
+#: src/process/do_process.cpp:1070
+msgid " wakeups/s"
 msgstr ""
 =

-#: src/main.cpp:514
-msgid "Leaving PowerTOP"
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
+msgstr ""
+
+#: src/process/do_process.cpp:1139
+msgid "Top 10 Power Consumers"
 msgstr ""
 =

 #: src/report/report.cpp:122
@@ -830,6 +779,135 @@ msgstr "No puede crear archivo temp\n"
 msgid "PowerTOP outputing using base filename %s\n"
 msgstr ""
 =

+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
+msgstr "Bueno"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr "Malo"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr "Desconocido"
+
+#: src/tuning/bluetooth.cpp:48
+#, c-format
+msgid "Bluetooth device interface status"
+msgstr "Estado de la interfaz de dispositivo Bluetooth"
+
+#: src/tuning/ethernet.cpp:54
+#, c-format
+msgid "Wake-on-lan status for device %s"
+msgstr "Estado Wake-on-lan para dispositivo %s"
+
+#: src/tuning/runtime.cpp:48
+#, c-format
+msgid "Runtime PM for %s device %s"
+msgstr "Tiempo de ejecuci=C3=B3n PM para %s dispositivo %s"
+
+#: src/tuning/runtime.cpp:50
+#, c-format
+msgid "%s device %s has no runtime power management"
+msgstr ""
+"%s dispositivo %s no tiene administraci=C3=B3n de energ=C3=ADa en tiempo =
de ejecuci=C3=B3n"
+
+#: src/tuning/runtime.cpp:74
+#, c-format
+msgid "PCI Device %s has no runtime power management"
+msgstr ""
+"Dispositivo PCI %s no tiene administraci=C3=B3n de energ=C3=ADa en tiempo=
 de ejecuci=C3=B3n"
+
+#: src/tuning/runtime.cpp:76
+#, c-format
+msgid "Runtime PM for PCI Device %s"
+msgstr "Tiempo de ejecuci=C3=B3n PM para dispositivo PCI %s"
+
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
+msgstr "Habilitar administraci=C3=B3n de energ=C3=ADa del codec de Audio "
+
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
+msgstr "Vigilancia NMI se debe apagar"
+
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
+msgstr "Planificador de CPU Consciente de Energ=C3=ADa "
+
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
+msgstr "Tiempo l=C3=ADmite de reescritura VM"
+
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
+msgstr "Optimizables"
+
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+msgstr ""
+" Salida de <ESC>| <Enter>Palanca ajustable | Actualizaci=C3=B3n de <r>ven=
tana"
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
+msgstr "Tiempo de ejecuci=C3=B3n PM para %s dispositivo %s"
+
+#: src/tuning/tuningi2c.cpp:59
+#, fuzzy, c-format
+msgid "I2C %s %s has no runtime power management"
+msgstr ""
+"%s dispositivo %s no tiene administraci=C3=B3n de energ=C3=ADa en tiempo =
de ejecuci=C3=B3n"
+
+#: src/tuning/tuningsysfs.cpp:123
+#, fuzzy, c-format
+msgid "Enable SATA link power management for %s"
+msgstr "Habilitar administraci=C3=B3n de energ=C3=ADa del codec de Audio "
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr "Autosuspender para dispositivo USB desconocido %s (%s:%s)"
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr "Autosuspender para dispositivo USB %s [%s]"
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
+msgstr "Ahorro de Energ=C3=ADa Wireless para interfaz %s"
+
+#~ msgid "Actual"
+#~ msgstr "Actual"
+
 #, fuzzy
 #~ msgid "I2C Device: %s"
 #~ msgstr "Dispositivo PCI: %s"
-- =

1.8.3.1


--===============2468486278388962315==--

