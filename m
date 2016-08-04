Content-Type: multipart/mixed; boundary="===============4638136104271916839=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 12/19] de_DE.po: re-generate German translation
Date: Wed, 03 Aug 2016 17:59:22 -0700
Message-ID: <1470272369-218664-13-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4638136104271916839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/de_DE.po | 1011 ++++++++++++++++++++++++++++++++-----------------------=
----
 1 file changed, 544 insertions(+), 467 deletions(-)

diff --git a/po/de_DE.po b/po/de_DE.po
index c59b80cbe50a..4549f9f21b18 100644
--- a/po/de_DE.po
+++ b/po/de_DE.po
@@ -10,7 +10,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:10-0700\n"
 "PO-Revision-Date: 2013-11-05 19:48+0000\n"
 "Last-Translator: Ettore Atalan <atalanttore(a)googlemail.com>\n"
 "Language-Team: German (Germany) (http://www.transifex.com/projects/p/"
@@ -21,50 +21,74 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3D(n !=3D 1);\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
-msgstr "Kann Datei nicht abspeichern"
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
+msgstr "Tempor=C3=A4re Datei konnte nicht erzeugt werden\n"
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
-msgstr "Kann nicht von Datei laden"
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
+msgstr "Kalibriere CPU-Auslastung bei %i Thread\n"
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
-msgstr "%i geladene vorherige Messungen\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
+msgstr "Kalibriere CPU-Aufwach-Leistungsaufnahme\n"
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
-msgstr ""
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
+msgstr "Kalibriere USB-Ger=C3=A4te\n"
 =

-#: src/display.cpp:70
-msgid "Overview"
-msgstr "=C3=9Cbersicht"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
+msgstr ".... Ger=C3=A4t %s\n"
 =

-#: src/display.cpp:71
-msgid "Idle stats"
-msgstr "Leerlauf-Statistiken"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
+msgstr "Kalibriere Funkvorrichtungen\n"
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
-msgstr "Frequenz-Statistiken"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
+msgstr "Kalibriere Hintergrundbeleuchtung\n"
 =

-#: src/display.cpp:73
-msgid "Device stats"
-msgstr "Ger=C3=A4t-Statistiken"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
+msgstr "Kalibriere Leerlauf\n"
 =

-#: src/display.cpp:131
-msgid "Exit"
-msgstr "Beenden"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
+msgstr "Kalibriere Festplattennutzung\n"
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr "Starte Kalibrierung der PowerTOP-Leistungssch=C3=A4tzung\n"
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr "Schlie=C3=9Fe Kalibrierung der PowerTOP-Leistungssch=C3=A4tzung ab=
\n"
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr "Parameter nach der Kalibrierung:\n"
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
 msgstr "Kern"
@@ -91,45 +115,45 @@ msgstr ""
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
 msgstr "Paket"
 =

-#: src/cpu/cpu.cpp:559 src/cpu/cpu.cpp:768
+#: src/cpu/cpu.cpp:553 src/cpu/cpu.cpp:762
 #, fuzzy, c-format
 msgid "Core %d"
 msgstr "Kern %i"
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
 msgstr "GPU %i"
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
 msgstr "GPU %i"
 =

-#: src/cpu/cpu.cpp:990
+#: src/cpu/cpu.cpp:984
 #, c-format
 msgid "cpu_idle event returned no state?\n"
 msgstr "cpu_idle-Ereignis gab keinen Status zur=C3=BCck?\n"
 =

-#: src/cpu/cpu.cpp:1005
+#: src/cpu/cpu.cpp:999
 #, c-format
 msgid "power or cpu_frequency event returned no state?\n"
 msgstr "power- oder cpu_frequency-Ereignis gab kein Status zur=C3=BCck?\n"
@@ -139,675 +163,601 @@ msgid "C0 polling"
 msgstr "C0 sammeln"
 =

 #: src/cpu/cpu_linux.cpp:242 src/cpu/cpu_linux.cpp:341
-#: src/cpu/intel_cpus.cpp:593
+#: src/cpu/intel_cpus.cpp:629
 #, c-format
 msgid " CPU %i"
 msgstr "CPU %i"
 =

-#: src/cpu/cpu_package.cpp:105 src/cpu/intel_cpus.cpp:357
+#: src/cpu/cpu_package.cpp:105 src/cpu/intel_cpus.cpp:390
 #, c-format
 msgid "  Package"
 msgstr "Paket"
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
 msgstr "C0 aktiv"
 =

-#: src/cpu/intel_cpus.cpp:576
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "Actual"
-msgstr "Aktuell"
-
-#: src/devlist.cpp:330
-msgid "Process"
-msgstr ""
-
-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-#, fuzzy
-msgid "Device"
-msgstr "Ger=C3=A4t-Statistiken"
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
-msgstr "PS/2-Tastfeld / Tastatur / Maus"
-
-#: src/lib.cpp:410
-msgid "SATA controller"
-msgstr "SATA-Controller"
-
-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
-msgstr "Intel integrierter USB Hub"
+msgid "SATA link: %s"
+msgstr "SATA-Verbindung: %s"
 =

-#: src/lib.cpp:485 src/lib.cpp:517
+#: src/devices/ahci.cpp:156
 #, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
-msgstr ""
+msgid "SATA disk: %s"
+msgstr "SATA-Festplatte: %s"
 =

-#: src/process/do_process.cpp:818
-#, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
-"Gesch=C3=A4tzter Stromverbrauch: %5.1f    Gemessener Stromverbrauch: %5.1=
f    "
-"Summe: %5.1f\\n\n"
-
-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
-#, c-format
-msgid "The battery reports a discharge rate of %sW\n"
-msgstr "Die Batterie meldet eine Entladungsrate von %sW\n"
-
-#: src/process/do_process.cpp:834
-#, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
-msgstr "Die gesch=C3=A4tzte Restzeit betr=C3=A4gt %i Stunden, %i Minuten\n"
-
-#: src/process/do_process.cpp:842
-msgid "Summary"
-msgstr "Zusammenfassung"
-
-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
-msgstr "Aufwachvorg=C3=A4nge/Sekunde"
-
-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
-msgstr "GPU-Operationen/Sekunde"
-
-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
-msgstr "VFS-Operationen/Sekunde und"
-
-#: src/process/do_process.cpp:842
-msgid "CPU use"
-msgstr "CPU-Nutzung"
-
-#: src/process/do_process.cpp:846
-msgid "Power est."
-msgstr "Gesch. Leistung"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
-msgstr "Auslastung"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
-msgstr "Ereignisse/s"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:927 src/process/do_process.cpp:1075
-msgid "Category"
-msgstr "Kategorie"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:928 src/process/do_process.cpp:1076
-#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
-#: src/tuning/tuning.cpp:289
-msgid "Description"
-msgstr "Beschreibung"
-
-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
-msgstr "Aufwachvorg=C3=A4nge/s"
-
-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
-msgstr "GPU-Operationen/s"
 =

-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
-msgstr "Platten-Ein-/Ausgabe/s"
-
-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
-msgstr "GFX-Aufwachvorg=C3=A4nge/s"
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
-msgstr "=C3=9Cbersicht der Software-Leistungsverbraucher"
+#: src/devices/ahci.cpp:390
+#, fuzzy
+msgid "Active"
+msgstr "C0 aktiv"
 =

-#: src/process/do_process.cpp:1053
-msgid "Target:"
+#: src/devices/ahci.cpp:391
+msgid "Partial"
 msgstr ""
 =

-#: src/process/do_process.cpp:1054
-msgid "1 units/s"
+#: src/devices/ahci.cpp:392
+msgid "Slumber"
 msgstr ""
 =

-#: src/process/do_process.cpp:1055
-msgid "System: "
+#: src/devices/ahci.cpp:393
+msgid "Devslp"
 msgstr ""
 =

-#: src/process/do_process.cpp:1057
-#, fuzzy
-msgid " wakeup/s"
-msgstr "Aufwachvorg=C3=A4nge/s"
-
-#: src/process/do_process.cpp:1058
-msgid "CPU: "
+#: src/devices/ahci.cpp:399
+msgid "AHCI ALPM Residency Statistics"
 msgstr ""
 =

-#: src/process/do_process.cpp:1060
-#, fuzzy, c-format
-msgid "\\% usage"
-msgstr "Auslastung"
+#: src/devices/alsa.cpp:77
+#, c-format
+msgid "Audio codec %s: %s (%s)"
+msgstr "Audiocodec %s: %s (%s)"
 =

-#: src/process/do_process.cpp:1061
-msgid "GPU:"
-msgstr ""
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#, c-format
+msgid "Audio codec %s: %s"
+msgstr "Audiocodec %s: %s"
 =

-#: src/process/do_process.cpp:1063 src/process/do_process.cpp:1069
+#: src/devices/devfreq.cpp:261
 #, fuzzy
-msgid " ops/s"
-msgstr "GPU-Operationen/s"
+msgid "Device Freq stats"
+msgstr "Ger=C3=A4t-Statistiken"
 =

-#: src/process/do_process.cpp:1064
-msgid "GFX:"
+#: src/devices/devfreq.cpp:279
+msgid " Devfreq is not enabled"
 msgstr ""
 =

-#: src/process/do_process.cpp:1066
-#, fuzzy
-msgid " wakeups/s"
-msgstr "Aufwachvorg=C3=A4nge/s"
-
-#: src/process/do_process.cpp:1067
-msgid "VFS:"
+#: src/devices/devfreq.cpp:284
+msgid " No devfreq devices available"
 msgstr ""
 =

-#: src/process/do_process.cpp:1135
-#, fuzzy
-msgid "Top 10 Power Consumers"
-msgstr "=C3=9Cbersicht der Software-Leistungsverbraucher"
-
-#: src/perf/perf.cpp:115
+#: src/devices/device.cpp:172 src/process/do_process.cpp:831
 #, c-format
-msgid ""
-"Too many open files, please increase the limit of open file descriptors.\=
n"
-msgstr ""
-"Zu viele offene Dateien. Bitte erh=C3=B6hen Sie die Begrenzung von offene=
n "
-"Dateideskriptoren.\n"
+msgid "The battery reports a discharge rate of %sW\n"
+msgstr "Die Batterie meldet eine Entladungsrate von %sW\n"
 =

-#: src/perf/perf.cpp:117
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
 #, c-format
-msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
+msgid "The power consumed was %sJ\n"
 msgstr ""
-"PowerTOP %s ben=C3=B6tigt einen Kernel der das 'perf'-Subsystem unterst=
=C3=BCtzt\n"
 =

-#: src/perf/perf.cpp:118
-#, c-format
-msgid "as well as support for trace points in the kernel:\n"
-msgstr "sowie Unterst=C3=BCtzung f=C3=BCr Ablaufverfolgungspunkte im Kerne=
l:\n"
-
-#: src/devices/device.cpp:178
+#: src/devices/device.cpp:180
 #, c-format
 msgid "System baseline power is estimated at %sW\n"
 msgstr "Leistungsaufnahme bei Grundauslastung betr=C3=A4gt %sW\n"
 =

-#: src/devices/device.cpp:185
+#: src/devices/device.cpp:187
 msgid "Power est.    Usage     Device name\n"
 msgstr "Gesch. Leistung    Auslastung     Ger=C3=A4tename\n"
 =

-#: src/devices/device.cpp:187
+#: src/devices/device.cpp:189
 msgid "              Usage     Device name\n"
 msgstr "              Auslastung     Ger=C3=A4tename\n"
 =

-#: src/devices/device.cpp:254
+#: src/devices/device.cpp:256
 #, fuzzy
 msgid "The battery reports a discharge rate of: "
 msgstr "Die Batterie meldet eine Entladungsrate von %sW\n"
 =

 #: src/devices/device.cpp:261
-#, fuzzy
+msgid "The power consumed was : "
+msgstr ""
+
+#: src/devices/device.cpp:268
+#, fuzzy
 msgid "The system baseline power is estimated at: "
 msgstr "Leistungsaufnahme bei Grundauslastung betr=C3=A4gt %sW\n"
 =

-#: src/devices/device.cpp:271
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
+msgstr "Auslastung"
+
+#: src/devices/device.cpp:278
 #, fuzzy
 msgid "Device Name"
 msgstr "Ger=C3=A4t-Statistiken"
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
-msgstr "Audiocodec %s: %s (%s)"
+msgid "Network interface: %s (%s)"
+msgstr "Netzwerkschnittstelle: %s (%s)"
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
 #, c-format
-msgid "Audio codec %s: %s"
-msgstr "Audiocodec %s: %s"
+msgid "Radio device: %s"
+msgstr "Funk-Ger=C3=A4t:%s"
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
+msgstr "Ger=C3=A4t-Statistiken"
+
+#: src/devices/runtime_pm.cpp:241
 #, c-format
 msgid "PCI Device: %s"
 msgstr "PCI-Ger=C3=A4t: %s"
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
 msgid "USB device: %s"
 msgstr "USB-Ger=C3=A4t: %s"
 =

-#: src/devices/usb.cpp:91
+#: src/devices/usb.cpp:94
 #, c-format
 msgid "USB device: %s (%s)"
 msgstr "USB-Ger=C3=A4t: %s (%s)"
 =

-#: src/devices/ahci.cpp:154
-#, c-format
-msgid "SATA link: %s"
-msgstr "SATA-Verbindung: %s"
-
-#: src/devices/ahci.cpp:156
-#, c-format
-msgid "SATA disk: %s"
-msgstr "SATA-Festplatte: %s"
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
-msgstr "C0 aktiv"
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
-msgstr "Funk-Ger=C3=A4t:%s"
-
-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
-msgstr "Netzwerkschnittstelle: %s (%s)"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
-msgstr "Gut"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
-msgstr "Schlecht"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
-msgstr "Unbekannt"
-
-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
-msgstr "Bluetooth-Ger=C3=A4t Schnittstellenstatus"
-
-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
-msgstr "Energieverwaltung f=C3=BCr Audiocodec aktivieren"
-
-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
-msgstr "NMI watchdog sollte ausgeschaltet sein"
-
-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
-msgstr "Leistungsbewusster CPU-Scheduler"
-
-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
-msgstr "Zeit=C3=BCberschreitung beim VM zur=C3=BCckschreiben"
-
-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
-msgstr "Abstimmbare Optionen"
+#: src/display.cpp:70
+msgid "Overview"
+msgstr "=C3=9Cbersicht"
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
-msgstr ""
-" <ESC> Beenden | <Enter> Abstimmbare Option umschalten | <r> Fenster "
-"aktualisieren"
+#: src/display.cpp:71
+msgid "Idle stats"
+msgstr "Leerlauf-Statistiken"
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
-msgstr ""
+#: src/display.cpp:72
+msgid "Frequency stats"
+msgstr "Frequenz-Statistiken"
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
-msgstr ""
+#: src/display.cpp:73
+msgid "Device stats"
+msgstr "Ger=C3=A4t-Statistiken"
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
-msgstr ""
+#: src/display.cpp:131
+msgid "Exit"
+msgstr "Beenden"
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
-msgstr "Wake-On-LAN-Status f=C3=BCr Ger=C3=A4t %s"
-
-#: src/tuning/wifi.cpp:48
-#, c-format
-msgid "Wireless Power Saving for interface %s"
-msgstr "Drahtloses Stromsparen f=C3=BCr Schnittstelle %s"
-
-#: src/tuning/runtime.cpp:48
-#, c-format
-msgid "Runtime PM for %s device %s"
-msgstr "Laufzeit-Energieverwaltung f=C3=BCr %s Ger=C3=A4t %s"
-
-#: src/tuning/runtime.cpp:50
-#, c-format
-msgid "%s device %s has no runtime power management"
-msgstr "%s Ger=C3=A4t %s hat keine Energieverwaltung zur Laufzeit"
-
-#: src/tuning/runtime.cpp:74
-#, c-format
-msgid "PCI Device %s has no runtime power management"
-msgstr "PCI-Ger=C3=A4t %s hat keine Energieverwaltung zur Laufzeit"
-
-#: src/tuning/runtime.cpp:76
-#, c-format
-msgid "Runtime PM for PCI Device %s"
-msgstr "Laufzeit-Energieverwaltung f=C3=BCr PCI-Ger=C3=A4t %s"
-
-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
-msgstr "AutoSuspend f=C3=BCr unbekanntes USB-Ger=C3=A4t %s (%s:%s)"
-
-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
-#, c-format
-msgid "Autosuspend for USB device %s [%s]"
-msgstr "AutoSuspend f=C3=BCr USB-Ger=C3=A4t %s [%s]"
-
-#: src/tuning/tuningsysfs.cpp:123
-#, fuzzy, c-format
-msgid "Enable SATA link power management for %s"
-msgstr "Energieverwaltung f=C3=BCr SATA-Verbindung %s aktivieren"
-
-#: src/calibrate/calibrate.cpp:238
-#, c-format
-msgid "Cannot create temp file\n"
-msgstr "Tempor=C3=A4re Datei konnte nicht erzeugt werden\n"
-
-#: src/calibrate/calibrate.cpp:258
+#: src/lib.cpp:288
 #, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
-msgstr "Kalibriere CPU-Auslastung bei %i Thread\n"
+msgid "%7sW"
+msgstr "%7sW"
 =

-#: src/calibrate/calibrate.cpp:273
+#: src/lib.cpp:291
 #, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
-msgstr "Kalibriere CPU-Aufwach-Leistungsaufnahme\n"
+msgid "    0 mW"
+msgstr "    0 mW"
 =

-#: src/calibrate/calibrate.cpp:290
-#, c-format
-msgid "Calibrating USB devices\n"
-msgstr "Kalibriere USB-Ger=C3=A4te\n"
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
+msgstr "PS/2-Tastfeld / Tastatur / Maus"
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
-#, c-format
-msgid ".... device %s \n"
-msgstr ".... Ger=C3=A4t %s\n"
+#: src/lib.cpp:411
+msgid "SATA controller"
+msgstr "SATA-Controller"
 =

-#: src/calibrate/calibrate.cpp:307
-#, c-format
-msgid "Calibrating radio devices\n"
-msgstr "Kalibriere Funkvorrichtungen\n"
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
+msgstr "Intel integrierter USB Hub"
 =

-#: src/calibrate/calibrate.cpp:331
+#: src/lib.cpp:467
 #, c-format
-msgid "Calibrating backlight\n"
-msgstr "Kalibriere Hintergrundbeleuchtung\n"
+msgid "glob returned GLOB_NOSPACE\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#: src/lib.cpp:471
 #, c-format
-msgid "Calibrating idle\n"
-msgstr "Kalibriere Leerlauf\n"
+msgid "glob returned GLOB_ABORTED\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
+#: src/lib.cpp:475
 #, c-format
-msgid "Calibrating: disk usage \n"
-msgstr "Kalibriere Festplattennutzung\n"
-
-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
-msgstr "Starte Kalibrierung der PowerTOP-Leistungssch=C3=A4tzung\n"
-
-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
-msgstr "Schlie=C3=9Fe Kalibrierung der PowerTOP-Leistungssch=C3=A4tzung ab=
\n"
+msgid "glob returned GLOB_NOMATCH\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "Parameters after calibration:\n"
-msgstr "Parameter nach der Kalibrierung:\n"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
+msgstr ""
 =

-#: src/main.cpp:101
+#: src/main.cpp:102
 #, fuzzy, c-format
 msgid "PowerTOP version "
 msgstr "PowerTOP-Version"
 =

-#: src/main.cpp:107
+#: src/main.cpp:108
 msgid "Set refresh time out"
 msgstr "Aktualisierungs-Zeit=C3=BCberschreitung festlegen"
 =

-#: src/main.cpp:120
+#: src/main.cpp:121
 msgid "Usage: powertop [OPTIONS]"
 msgstr "Verwendung: powertop [OPTIONEN]"
 =

-#: src/main.cpp:121
+#: src/main.cpp:122
 #, fuzzy
 msgid "sets all tunable options to their GOOD setting"
 msgstr "Legt f=C3=BCr alle einstellbaren Optionen die jeweils GUTE Einstel=
lung fest"
 =

-#: src/main.cpp:122
+#: src/main.cpp:123
 msgid "runs powertop in calibration mode"
 msgstr "f=C3=BChrt Powertop im Kalibrierungsmodus aus"
 =

-#: src/main.cpp:123 src/main.cpp:126
+#: src/main.cpp:124 src/main.cpp:127
 msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/main.cpp:123
+#: src/main.cpp:124
 msgid "generate a csv report"
 msgstr "Einen CSV-Bericht generieren"
 =

-#: src/main.cpp:124
+#: src/main.cpp:125
 msgid "run in \"debug\" mode"
 msgstr "in \"Debug\"-Modus ausf=C3=BChren"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "[=3Ddevnode]"
 msgstr "[=3DEntwicklungsmodus]"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "uses an Extech Power Analyzer for measurements"
 msgstr "verwendet einen Extech Leistungsanalysator f=C3=BCr Messungen"
 =

-#: src/main.cpp:126
+#: src/main.cpp:127
 msgid "generate a html report"
 msgstr "Einen HTML-Bericht generieren"
 =

-#: src/main.cpp:127
+#: src/main.cpp:128
 msgid "[=3Diterations] number of times to run each test"
 msgstr "[=3DWiederholungen] Anzahl der Wiederholungen f=C3=BCr jeden Testl=
auf"
 =

-#: src/main.cpp:128
+#: src/main.cpp:129
 msgid "suppress stderr output"
 msgstr "stderr-Ausgabe unterdr=C3=BCcken"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130 src/main.cpp:131
 msgid "[=3Dseconds]"
 msgstr "[=3DSekunden]"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
+msgstr ""
+
+#: src/main.cpp:131
 msgid "generate a report for 'x' seconds"
 msgstr "Einen Bericht f=C3=BCr 'x'-Sekunden generieren"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "[=3Dworkload]"
 msgstr "[=3DAuslastung]"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "file to execute for workload"
 msgstr "F=C3=BCr Auslastung auszuf=C3=BChrende Datei"
 =

-#: src/main.cpp:131
+#: src/main.cpp:133
 msgid "print version information"
 msgstr "Versionsinformation ausgeben"
 =

-#: src/main.cpp:132
+#: src/main.cpp:134
 msgid "print this help menu"
 msgstr "Dieses Hilfemen=C3=BC ausgeben"
 =

-#: src/main.cpp:134
+#: src/main.cpp:136
 #, fuzzy
 msgid "For more help please refer to the 'man 8 powertop'"
 msgstr "F=C3=BCr weitere Hilfe ziehen Sie bitte die README zu Rate"
 =

-#: src/main.cpp:212
+#: src/main.cpp:231
 #, c-format
 msgid "Unknown issue running workload!\n"
 msgstr "Unbekanntes Ergebnis beim Ausf=C3=BChren der Arbeitsbelastung\n"
 =

-#: src/main.cpp:257
+#: src/main.cpp:288
 msgid "PowerTOP is out of memory. PowerTOP is Aborting"
 msgstr ""
 "PowerTOP hat keinen Speicherplatz mehr im Hauptspeicher. PowerTOP wird "
 "abgebrochen"
 =

-#: src/main.cpp:265
+#: src/main.cpp:296
 #, c-format
 msgid "Preparing to take measurements\n"
 msgstr "Das Vornehmen von Messungen wird vorbereitet\n"
 =

-#: src/main.cpp:270
+#: src/main.cpp:301
 #, c-format
 msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
 msgstr ""
 "%d Messung(en) mit einer Dauer von je %d Sekunde(n) wird/werden "
 "vorgenommen.\n"
 =

-#: src/main.cpp:272
+#: src/main.cpp:303
 #, c-format
 msgid "Measuring workload %s.\n"
 msgstr "Auslastung %s wird gemessen.\n"
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
 msgstr "Verlassen ...\n"
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
 msgstr "Das Einh=C3=A4ngen von debugfs ist gescheitert!\n"
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
 msgstr "PowerTOP wird verlassen"
 =

+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
+msgstr "Kann Datei nicht abspeichern"
+
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
+msgstr "Kann nicht von Datei laden"
+
+#: src/parameters/persistent.cpp:138
+#, c-format
+msgid "Loaded %i prior measurements\n"
+msgstr "%i geladene vorherige Messungen\n"
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
+"Zu viele offene Dateien. Bitte erh=C3=B6hen Sie die Begrenzung von offene=
n "
+"Dateideskriptoren.\n"
+
+#: src/perf/perf.cpp:117
+#, c-format
+msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
+msgstr ""
+"PowerTOP %s ben=C3=B6tigt einen Kernel der das 'perf'-Subsystem unterst=
=C3=BCtzt\n"
+
+#: src/perf/perf.cpp:118
+#, c-format
+msgid "as well as support for trace points in the kernel:\n"
+msgstr "sowie Unterst=C3=BCtzung f=C3=BCr Ablaufverfolgungspunkte im Kerne=
l:\n"
+
+#: src/process/do_process.cpp:819
+#, c-format
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
+msgstr ""
+"Gesch=C3=A4tzter Stromverbrauch: %5.1f    Gemessener Stromverbrauch: %5.1=
f    "
+"Summe: %5.1f\\n\n"
+
+#: src/process/do_process.cpp:838
+#, c-format
+msgid "The estimated remaining time is %i hours, %i minutes\n"
+msgstr "Die gesch=C3=A4tzte Restzeit betr=C3=A4gt %i Stunden, %i Minuten\n"
+
+#: src/process/do_process.cpp:846
+msgid "Summary"
+msgstr "Zusammenfassung"
+
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
+msgstr "Aufwachvorg=C3=A4nge/Sekunde"
+
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
+msgstr "GPU-Operationen/Sekunde"
+
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
+msgstr "VFS-Operationen/Sekunde und"
+
+#: src/process/do_process.cpp:846
+msgid "CPU use"
+msgstr "CPU-Nutzung"
+
+#: src/process/do_process.cpp:850
+msgid "Power est."
+msgstr "Gesch. Leistung"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
+msgstr "Ereignisse/s"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:931 src/process/do_process.cpp:1079
+msgid "Category"
+msgstr "Kategorie"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:932 src/process/do_process.cpp:1080
+#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
+#: src/tuning/tuning.cpp:289
+msgid "Description"
+msgstr "Beschreibung"
+
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
+msgstr "Aufwachvorg=C3=A4nge/s"
+
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
+msgstr "GPU-Operationen/s"
+
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
+msgstr "Platten-Ein-/Ausgabe/s"
+
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
+msgstr "GFX-Aufwachvorg=C3=A4nge/s"
+
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
+msgstr "=C3=9Cbersicht der Software-Leistungsverbraucher"
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
+msgstr "Aufwachvorg=C3=A4nge/s"
+
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
+msgstr ""
+
+#: src/process/do_process.cpp:1064
+#, fuzzy, c-format
+msgid "\\% usage"
+msgstr "Auslastung"
+
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
+msgstr ""
+
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+#, fuzzy
+msgid " ops/s"
+msgstr "GPU-Operationen/s"
+
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
+msgstr ""
+
+#: src/process/do_process.cpp:1070
+#, fuzzy
+msgid " wakeups/s"
+msgstr "Aufwachvorg=C3=A4nge/s"
+
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
+msgstr ""
+
+#: src/process/do_process.cpp:1139
+#, fuzzy
+msgid "Top 10 Power Consumers"
+msgstr "=C3=9Cbersicht der Software-Leistungsverbraucher"
+
 #: src/report/report.cpp:122
 #, fuzzy
 msgid "PowerTOP Version"
@@ -845,6 +795,133 @@ msgstr "Tempor=C3=A4re Datei konnte nicht erzeugt wer=
den\n"
 msgid "PowerTOP outputing using base filename %s\n"
 msgstr ""
 =

+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
+msgstr "Gut"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr "Schlecht"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr "Unbekannt"
+
+#: src/tuning/bluetooth.cpp:48
+#, c-format
+msgid "Bluetooth device interface status"
+msgstr "Bluetooth-Ger=C3=A4t Schnittstellenstatus"
+
+#: src/tuning/ethernet.cpp:54
+#, c-format
+msgid "Wake-on-lan status for device %s"
+msgstr "Wake-On-LAN-Status f=C3=BCr Ger=C3=A4t %s"
+
+#: src/tuning/runtime.cpp:48
+#, c-format
+msgid "Runtime PM for %s device %s"
+msgstr "Laufzeit-Energieverwaltung f=C3=BCr %s Ger=C3=A4t %s"
+
+#: src/tuning/runtime.cpp:50
+#, c-format
+msgid "%s device %s has no runtime power management"
+msgstr "%s Ger=C3=A4t %s hat keine Energieverwaltung zur Laufzeit"
+
+#: src/tuning/runtime.cpp:74
+#, c-format
+msgid "PCI Device %s has no runtime power management"
+msgstr "PCI-Ger=C3=A4t %s hat keine Energieverwaltung zur Laufzeit"
+
+#: src/tuning/runtime.cpp:76
+#, c-format
+msgid "Runtime PM for PCI Device %s"
+msgstr "Laufzeit-Energieverwaltung f=C3=BCr PCI-Ger=C3=A4t %s"
+
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
+msgstr "Energieverwaltung f=C3=BCr Audiocodec aktivieren"
+
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
+msgstr "NMI watchdog sollte ausgeschaltet sein"
+
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
+msgstr "Leistungsbewusster CPU-Scheduler"
+
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
+msgstr "Zeit=C3=BCberschreitung beim VM zur=C3=BCckschreiben"
+
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
+msgstr "Abstimmbare Optionen"
+
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+msgstr ""
+" <ESC> Beenden | <Enter> Abstimmbare Option umschalten | <r> Fenster "
+"aktualisieren"
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
+msgstr "Laufzeit-Energieverwaltung f=C3=BCr %s Ger=C3=A4t %s"
+
+#: src/tuning/tuningi2c.cpp:59
+#, fuzzy, c-format
+msgid "I2C %s %s has no runtime power management"
+msgstr "%s Ger=C3=A4t %s hat keine Energieverwaltung zur Laufzeit"
+
+#: src/tuning/tuningsysfs.cpp:123
+#, fuzzy, c-format
+msgid "Enable SATA link power management for %s"
+msgstr "Energieverwaltung f=C3=BCr SATA-Verbindung %s aktivieren"
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr "AutoSuspend f=C3=BCr unbekanntes USB-Ger=C3=A4t %s (%s:%s)"
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr "AutoSuspend f=C3=BCr USB-Ger=C3=A4t %s [%s]"
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
+msgstr "Drahtloses Stromsparen f=C3=BCr Schnittstelle %s"
+
+#~ msgid "Actual"
+#~ msgstr "Aktuell"
+
 #, fuzzy
 #~ msgid "I2C Device: %s"
 #~ msgstr "PCI-Ger=C3=A4t: %s"
-- =

1.8.3.1


--===============4638136104271916839==--

