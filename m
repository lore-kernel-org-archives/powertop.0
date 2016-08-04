Content-Type: multipart/mixed; boundary="===============8499849399319633548=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 17/19] id_ID.po: re-generate Indonesian
 translation
Date: Wed, 03 Aug 2016 17:59:27 -0700
Message-ID: <1470272369-218664-18-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8499849399319633548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/id_ID.po | 1001 ++++++++++++++++++++++++++++++++-----------------------=
----
 1 file changed, 539 insertions(+), 462 deletions(-)

diff --git a/po/id_ID.po b/po/id_ID.po
index 5ac4a1c4fec1..35bab7b12aba 100644
--- a/po/id_ID.po
+++ b/po/id_ID.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:10-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Indonesian (Indonesia) (http://www.transifex.com/projects/=
p/"
@@ -19,50 +19,74 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D1; plural=3D0;\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
-msgstr "Tak bisa menyimpan ke berkas"
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
+msgstr "Tak bisa membuat berkas temp\n"
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
-msgstr "Tak bisa memuat dari berkas"
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
+msgstr "Kalibrasi: Pemakaian CPU pada %i thread \n"
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
-msgstr "Dimuat %i pengukuran sebelumnya\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
+msgstr "Kalibrasi: Konsumsi daya CPU bangun \n"
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
-msgstr ""
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
+msgstr "Kalibrasi perangkat USB \n"
 =

-#: src/display.cpp:70
-msgid "Overview"
-msgstr "Ringkasan"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
+msgstr ".... perangkat %s \n"
 =

-#: src/display.cpp:71
-msgid "Idle stats"
-msgstr "Stat menganggur"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
+msgstr "Kalibrasi perangkat radio \n"
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
-msgstr "Stat frekuensi"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
+msgstr "Kalibrasi cahaya latar \n"
 =

-#: src/display.cpp:73
-msgid "Device stats"
-msgstr "Stat perangkat"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
+msgstr "Kalibrasi menganggur \n"
 =

-#: src/display.cpp:131
-msgid "Exit"
-msgstr "Keluar"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
+msgstr "Kalibrasi: pemakaian disk \n"
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr "Memulai kalibrasi estimasi daya PowerTop \n"
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr "Mengakhiri kalibrasi estimasi daya PowerTop \n"
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr "Parameter setelah kalibrasi:\n"
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
 msgstr "  Core"
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
 msgstr "Paket"
 =

-#: src/cpu/cpu.cpp:559 src/cpu/cpu.cpp:768
+#: src/cpu/cpu.cpp:553 src/cpu/cpu.cpp:762
 #, fuzzy, c-format
 msgid "Core %d"
 msgstr "Core %i"
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
 msgstr "kejadian cpu_idle tak mengembalikan keadaan?\n"
 =

-#: src/cpu/cpu.cpp:1005
+#: src/cpu/cpu.cpp:999
 #, c-format
 msgid "power or cpu_frequency event returned no state?\n"
 msgstr "kejadian power atau cpu_frequency tak mengembalikan keadaan?\n"
@@ -137,665 +161,593 @@ msgid "C0 polling"
 msgstr "C0 polling"
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
 msgstr "C0 aktif"
 =

-#: src/cpu/intel_cpus.cpp:576
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "Actual"
-msgstr "Aktual"
-
-#: src/devlist.cpp:330
-msgid "Process"
-msgstr ""
-
-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-#, fuzzy
-msgid "Device"
-msgstr "Stat perangkat"
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
-msgstr "PS/2 Touchpad / Keyboard / Mouse"
-
-#: src/lib.cpp:410
-msgid "SATA controller"
-msgstr "Pengendali SATA"
-
-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
-msgstr "Hub USB built in Intel"
+msgid "SATA link: %s"
+msgstr "Link SATA: %s"
 =

-#: src/lib.cpp:485 src/lib.cpp:517
+#: src/devices/ahci.cpp:156
 #, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
-msgstr ""
+msgid "SATA disk: %s"
+msgstr "Disk SATA: %s"
 =

-#: src/process/do_process.cpp:818
-#, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
-"Perkiraan daya: %5.1f    Daya terukur: %5.1f    Jumlah: %5.1f\n"
-"\n"
-
-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
-#, c-format
-msgid "The battery reports a discharge rate of %sW\n"
-msgstr "Baterai melaporkan laju pengosongan %sW\n"
-
-#: src/process/do_process.cpp:834
-#, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
-msgstr "Perkiraan sisa waktu adalah %i jam, %i menit\n"
-
-#: src/process/do_process.cpp:842
-msgid "Summary"
-msgstr "Ringkasan"
-
-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
-msgstr "bangun/detik"
-
-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
-msgstr "op GPU/detik"
-
-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
-msgstr "op VFS/detik"
-
-#: src/process/do_process.cpp:842
-msgid "CPU use"
-msgstr "pakai CPU"
-
-#: src/process/do_process.cpp:846
-msgid "Power est."
-msgstr "Est. daya"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
-msgstr "Pakai"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
-msgstr "Kejadian/d"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:927 src/process/do_process.cpp:1075
-msgid "Category"
-msgstr "Kategori"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:928 src/process/do_process.cpp:1076
-#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
-#: src/tuning/tuning.cpp:289
-msgid "Description"
-msgstr "Deskripsi"
-
-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
-msgstr "Bangun/d"
-
-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
-msgstr "Op GPU/d"
 =

-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
-msgstr "IO Disk/d"
-
-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
-msgstr "GFX Bangun/d"
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
-msgstr "Ringkasan Pemakai Daya Perangkat Lunak"
-
-#: src/process/do_process.cpp:1053
-msgid "Target:"
-msgstr ""
+#: src/devices/ahci.cpp:390
+#, fuzzy
+msgid "Active"
+msgstr "C0 aktif"
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
-msgstr "Bangun/d"
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
-msgstr "Pakai"
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
-msgstr "Op GPU/d"
+#: src/devices/alsa.cpp:77
+#, c-format
+msgid "Audio codec %s: %s (%s)"
+msgstr "Codec audio %s: %s (%s)"
 =

-#: src/process/do_process.cpp:1064
-msgid "GFX:"
-msgstr ""
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#, c-format
+msgid "Audio codec %s: %s"
+msgstr "Codec audio %s: %s"
 =

-#: src/process/do_process.cpp:1066
+#: src/devices/devfreq.cpp:261
 #, fuzzy
-msgid " wakeups/s"
-msgstr "Bangun/d"
+msgid "Device Freq stats"
+msgstr "Stat perangkat"
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
-msgstr "Ringkasan Pemakai Daya Perangkat Lunak"
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
-msgstr "PowerTop %s memerlukan kernel yang mendukung subsistem 'perf'\n"
+msgid "The battery reports a discharge rate of %sW\n"
+msgstr "Baterai melaporkan laju pengosongan %sW\n"
 =

-#: src/perf/perf.cpp:118
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
 #, c-format
-msgid "as well as support for trace points in the kernel:\n"
-msgstr "dan juga dukungan trace point dalam kernel:\n"
+msgid "The power consumed was %sJ\n"
+msgstr ""
 =

-#: src/devices/device.cpp:178
+#: src/devices/device.cpp:180
 #, c-format
 msgid "System baseline power is estimated at %sW\n"
 msgstr "Daya baseline sistem diperkirakan %sW\n"
 =

-#: src/devices/device.cpp:185
+#: src/devices/device.cpp:187
 msgid "Power est.    Usage     Device name\n"
 msgstr "Est. daya     Pakai     Nama perangkat\n"
 =

-#: src/devices/device.cpp:187
+#: src/devices/device.cpp:189
 msgid "              Usage     Device name\n"
 msgstr "              Pakai     Nama perangkat\n"
 =

-#: src/devices/device.cpp:254
+#: src/devices/device.cpp:256
 #, fuzzy
 msgid "The battery reports a discharge rate of: "
 msgstr "Baterai melaporkan laju pengosongan %sW\n"
 =

 #: src/devices/device.cpp:261
+msgid "The power consumed was : "
+msgstr ""
+
+#: src/devices/device.cpp:268
 #, fuzzy
 msgid "The system baseline power is estimated at: "
 msgstr "Daya baseline sistem diperkirakan %sW\n"
 =

-#: src/devices/device.cpp:271
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
+msgstr "Pakai"
+
+#: src/devices/device.cpp:278
 #, fuzzy
 msgid "Device Name"
 msgstr "Stat perangkat"
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
-msgstr "Codec audio %s: %s (%s)"
+msgid "Network interface: %s (%s)"
+msgstr "Antarmuka jaringa: %s (%s)"
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
 #, c-format
-msgid "Audio codec %s: %s"
-msgstr "Codec audio %s: %s"
+msgid "Radio device: %s"
+msgstr "Perangkat radio: %s"
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
+msgstr "Stat perangkat"
+
+#: src/devices/runtime_pm.cpp:241
 #, c-format
 msgid "PCI Device: %s"
 msgstr "Perangkat PCI: %s"
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
 msgid "USB device: %s"
 msgstr "Perangkat USB: %s"
 =

-#: src/devices/usb.cpp:91
+#: src/devices/usb.cpp:94
 #, c-format
 msgid "USB device: %s (%s)"
 msgstr "Perangkat USB: %s (%s)"
 =

-#: src/devices/ahci.cpp:154
-#, c-format
-msgid "SATA link: %s"
-msgstr "Link SATA: %s"
-
-#: src/devices/ahci.cpp:156
-#, c-format
-msgid "SATA disk: %s"
-msgstr "Disk SATA: %s"
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
-msgstr "C0 aktif"
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
-msgstr "Perangkat radio: %s"
-
-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
-msgstr "Antarmuka jaringa: %s (%s)"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
-msgstr "Baik"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
-msgstr "Buruk"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
-msgstr "Tak diketahui"
-
-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
-msgstr "Status antarmuka perangkat Bluetooth"
-
-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
-msgstr "Aktifkan manajemen daya codec audio"
-
-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
-msgstr "Watchdog NMI mesti dimatikan"
-
-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
-msgstr "Scheduler CPU Sadar Daya"
-
-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
-msgstr "Tenggang waktu writeback VM"
-
-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
-msgstr "Tunables"
+#: src/display.cpp:70
+msgid "Overview"
+msgstr "Ringkasan"
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
-msgstr " <ESC> Keluar | <Enter> Jungkit tunable | <r> Segarkan jendela"
+#: src/display.cpp:71
+msgid "Idle stats"
+msgstr "Stat menganggur"
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
-msgstr ""
+#: src/display.cpp:72
+msgid "Frequency stats"
+msgstr "Stat frekuensi"
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
-msgstr ""
+#: src/display.cpp:73
+msgid "Device stats"
+msgstr "Stat perangkat"
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
-msgstr ""
+#: src/display.cpp:131
+msgid "Exit"
+msgstr "Keluar"
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
-msgstr "Status wake-on-lan bagi perangkat %s"
-
-#: src/tuning/wifi.cpp:48
-#, c-format
-msgid "Wireless Power Saving for interface %s"
-msgstr "Penghematan Daya Nirkabel bagi antarmuka %s"
-
-#: src/tuning/runtime.cpp:48
-#, c-format
-msgid "Runtime PM for %s device %s"
-msgstr "PM runtime bagi %s perangkat %s"
-
-#: src/tuning/runtime.cpp:50
-#, c-format
-msgid "%s device %s has no runtime power management"
-msgstr "%s perangkat %s tak memiliki manajemen daya runtime"
-
-#: src/tuning/runtime.cpp:74
-#, c-format
-msgid "PCI Device %s has no runtime power management"
-msgstr "Perangkat PCI %s tak memiliki manajemen daya runtime"
-
-#: src/tuning/runtime.cpp:76
-#, c-format
-msgid "Runtime PM for PCI Device %s"
-msgstr "PM runtime bagi Perangkat PCI %s"
-
-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
-msgstr "Suspensi otomatis bagi perangkat USB tak dikenal %s (%s:%s)"
-
-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
+#: src/lib.cpp:288
 #, c-format
-msgid "Autosuspend for USB device %s [%s]"
-msgstr "Suspensi otomatis bagi perangkat USB %s [%s]"
-
-#: src/tuning/tuningsysfs.cpp:123
-#, fuzzy, c-format
-msgid "Enable SATA link power management for %s"
-msgstr "Fungsikan Manajemen daya link SATA bagi %s"
-
-#: src/calibrate/calibrate.cpp:238
-#, c-format
-msgid "Cannot create temp file\n"
-msgstr "Tak bisa membuat berkas temp\n"
-
-#: src/calibrate/calibrate.cpp:258
-#, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
-msgstr "Kalibrasi: Pemakaian CPU pada %i thread \n"
+msgid "%7sW"
+msgstr "%7sW"
 =

-#: src/calibrate/calibrate.cpp:273
+#: src/lib.cpp:291
 #, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
-msgstr "Kalibrasi: Konsumsi daya CPU bangun \n"
+msgid "    0 mW"
+msgstr "    0 mW"
 =

-#: src/calibrate/calibrate.cpp:290
-#, c-format
-msgid "Calibrating USB devices\n"
-msgstr "Kalibrasi perangkat USB \n"
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
+msgstr "PS/2 Touchpad / Keyboard / Mouse"
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
-#, c-format
-msgid ".... device %s \n"
-msgstr ".... perangkat %s \n"
+#: src/lib.cpp:411
+msgid "SATA controller"
+msgstr "Pengendali SATA"
 =

-#: src/calibrate/calibrate.cpp:307
-#, c-format
-msgid "Calibrating radio devices\n"
-msgstr "Kalibrasi perangkat radio \n"
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
+msgstr "Hub USB built in Intel"
 =

-#: src/calibrate/calibrate.cpp:331
+#: src/lib.cpp:467
 #, c-format
-msgid "Calibrating backlight\n"
-msgstr "Kalibrasi cahaya latar \n"
+msgid "glob returned GLOB_NOSPACE\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#: src/lib.cpp:471
 #, c-format
-msgid "Calibrating idle\n"
-msgstr "Kalibrasi menganggur \n"
+msgid "glob returned GLOB_ABORTED\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
+#: src/lib.cpp:475
 #, c-format
-msgid "Calibrating: disk usage \n"
-msgstr "Kalibrasi: pemakaian disk \n"
-
-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
-msgstr "Memulai kalibrasi estimasi daya PowerTop \n"
-
-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
-msgstr "Mengakhiri kalibrasi estimasi daya PowerTop \n"
+msgid "glob returned GLOB_NOMATCH\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "Parameters after calibration:\n"
-msgstr "Parameter setelah kalibrasi:\n"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
+msgstr ""
 =

-#: src/main.cpp:101
+#: src/main.cpp:102
 #, fuzzy, c-format
 msgid "PowerTOP version "
 msgstr "PowerTop versi"
 =

-#: src/main.cpp:107
+#: src/main.cpp:108
 msgid "Set refresh time out"
 msgstr "Tata tenggang waktu penyegaran"
 =

-#: src/main.cpp:120
+#: src/main.cpp:121
 msgid "Usage: powertop [OPTIONS]"
 msgstr "Cara pakai: powertop [OPSI]"
 =

-#: src/main.cpp:121
+#: src/main.cpp:122
 msgid "sets all tunable options to their GOOD setting"
 msgstr ""
 =

-#: src/main.cpp:122
+#: src/main.cpp:123
 msgid "runs powertop in calibration mode"
 msgstr "jalankan powertop dalam mode kalibrasi"
 =

-#: src/main.cpp:123 src/main.cpp:126
+#: src/main.cpp:124 src/main.cpp:127
 msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/main.cpp:123
+#: src/main.cpp:124
 msgid "generate a csv report"
 msgstr "buat laporan csv"
 =

-#: src/main.cpp:124
+#: src/main.cpp:125
 msgid "run in \"debug\" mode"
 msgstr "jalankan dalam mode \"debug\""
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "[=3Ddevnode]"
 msgstr "[=3Ddevnode]"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "uses an Extech Power Analyzer for measurements"
 msgstr "pakai Extech Power Analyzer untuk pengukuran"
 =

-#: src/main.cpp:126
+#: src/main.cpp:127
 msgid "generate a html report"
 msgstr "buat laporan html"
 =

-#: src/main.cpp:127
+#: src/main.cpp:128
 msgid "[=3Diterations] number of times to run each test"
 msgstr "[=3Diterasi] berapa kali menjalankan tiap tes"
 =

-#: src/main.cpp:128
+#: src/main.cpp:129
 msgid "suppress stderr output"
 msgstr "redam keluaran stderr"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130 src/main.cpp:131
 msgid "[=3Dseconds]"
 msgstr "[=3Ddetik]"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
+msgstr ""
+
+#: src/main.cpp:131
 msgid "generate a report for 'x' seconds"
 msgstr "buat laporan untuk 'x' detik"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "[=3Dworkload]"
 msgstr "[=3Dbeban kerja]"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "file to execute for workload"
 msgstr "berkas yang akan dieksekusi untuk beban kerja"
 =

-#: src/main.cpp:131
+#: src/main.cpp:133
 msgid "print version information"
 msgstr "cetak informasi versi"
 =

-#: src/main.cpp:132
+#: src/main.cpp:134
 msgid "print this help menu"
 msgstr "cetik menu bantuan ini"
 =

-#: src/main.cpp:134
+#: src/main.cpp:136
 #, fuzzy
 msgid "For more help please refer to the 'man 8 powertop'"
 msgstr "Untuk bantuan lebih lanjut lihatlah README"
 =

-#: src/main.cpp:212
+#: src/main.cpp:231
 #, c-format
 msgid "Unknown issue running workload!\n"
 msgstr "Masalah tak dikenal saat menjalankan beban!\n"
 =

-#: src/main.cpp:257
+#: src/main.cpp:288
 msgid "PowerTOP is out of memory. PowerTOP is Aborting"
 msgstr "PowerTop kehabisan memori. PowerTop digugurkan."
 =

-#: src/main.cpp:265
+#: src/main.cpp:296
 #, c-format
 msgid "Preparing to take measurements\n"
 msgstr "Bersiap melakukan pengkukuran\n"
 =

-#: src/main.cpp:270
+#: src/main.cpp:301
 #, c-format
 msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
 msgstr "Melakukan %d pengukuran selama masing-masing %d detik.\n"
 =

-#: src/main.cpp:272
+#: src/main.cpp:303
 #, c-format
 msgid "Measuring workload %s.\n"
 msgstr "Mengukur beban kerja %s.\n"
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
 msgstr "keluar...\n"
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
 msgstr "Gagal mengait debugfs!\n"
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
 msgstr "Mode hening gagal!\n"
 =

-#: src/main.cpp:514
+#: src/main.cpp:555
 msgid "Leaving PowerTOP"
 msgstr "Meninggalkan PowerTop"
 =

+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
+msgstr "Tak bisa menyimpan ke berkas"
+
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
+msgstr "Tak bisa memuat dari berkas"
+
+#: src/parameters/persistent.cpp:138
+#, c-format
+msgid "Loaded %i prior measurements\n"
+msgstr "Dimuat %i pengukuran sebelumnya\n"
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
+msgstr "PowerTop %s memerlukan kernel yang mendukung subsistem 'perf'\n"
+
+#: src/perf/perf.cpp:118
+#, c-format
+msgid "as well as support for trace points in the kernel:\n"
+msgstr "dan juga dukungan trace point dalam kernel:\n"
+
+#: src/process/do_process.cpp:819
+#, c-format
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
+msgstr ""
+"Perkiraan daya: %5.1f    Daya terukur: %5.1f    Jumlah: %5.1f\n"
+"\n"
+
+#: src/process/do_process.cpp:838
+#, c-format
+msgid "The estimated remaining time is %i hours, %i minutes\n"
+msgstr "Perkiraan sisa waktu adalah %i jam, %i menit\n"
+
+#: src/process/do_process.cpp:846
+msgid "Summary"
+msgstr "Ringkasan"
+
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
+msgstr "bangun/detik"
+
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
+msgstr "op GPU/detik"
+
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
+msgstr "op VFS/detik"
+
+#: src/process/do_process.cpp:846
+msgid "CPU use"
+msgstr "pakai CPU"
+
+#: src/process/do_process.cpp:850
+msgid "Power est."
+msgstr "Est. daya"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
+msgstr "Kejadian/d"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:931 src/process/do_process.cpp:1079
+msgid "Category"
+msgstr "Kategori"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:932 src/process/do_process.cpp:1080
+#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
+#: src/tuning/tuning.cpp:289
+msgid "Description"
+msgstr "Deskripsi"
+
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
+msgstr "Bangun/d"
+
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
+msgstr "Op GPU/d"
+
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
+msgstr "IO Disk/d"
+
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
+msgstr "GFX Bangun/d"
+
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
+msgstr "Ringkasan Pemakai Daya Perangkat Lunak"
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
+msgstr "Bangun/d"
+
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
+msgstr ""
+
+#: src/process/do_process.cpp:1064
+#, fuzzy, c-format
+msgid "\\% usage"
+msgstr "Pakai"
+
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
+msgstr ""
+
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+#, fuzzy
+msgid " ops/s"
+msgstr "Op GPU/d"
+
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
+msgstr ""
+
+#: src/process/do_process.cpp:1070
+#, fuzzy
+msgid " wakeups/s"
+msgstr "Bangun/d"
+
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
+msgstr ""
+
+#: src/process/do_process.cpp:1139
+#, fuzzy
+msgid "Top 10 Power Consumers"
+msgstr "Ringkasan Pemakai Daya Perangkat Lunak"
+
 #: src/report/report.cpp:122
 #, fuzzy
 msgid "PowerTOP Version"
@@ -833,6 +785,131 @@ msgstr "Tak bisa membuat berkas temp\n"
 msgid "PowerTOP outputing using base filename %s\n"
 msgstr ""
 =

+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
+msgstr "Baik"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr "Buruk"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr "Tak diketahui"
+
+#: src/tuning/bluetooth.cpp:48
+#, c-format
+msgid "Bluetooth device interface status"
+msgstr "Status antarmuka perangkat Bluetooth"
+
+#: src/tuning/ethernet.cpp:54
+#, c-format
+msgid "Wake-on-lan status for device %s"
+msgstr "Status wake-on-lan bagi perangkat %s"
+
+#: src/tuning/runtime.cpp:48
+#, c-format
+msgid "Runtime PM for %s device %s"
+msgstr "PM runtime bagi %s perangkat %s"
+
+#: src/tuning/runtime.cpp:50
+#, c-format
+msgid "%s device %s has no runtime power management"
+msgstr "%s perangkat %s tak memiliki manajemen daya runtime"
+
+#: src/tuning/runtime.cpp:74
+#, c-format
+msgid "PCI Device %s has no runtime power management"
+msgstr "Perangkat PCI %s tak memiliki manajemen daya runtime"
+
+#: src/tuning/runtime.cpp:76
+#, c-format
+msgid "Runtime PM for PCI Device %s"
+msgstr "PM runtime bagi Perangkat PCI %s"
+
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
+msgstr "Aktifkan manajemen daya codec audio"
+
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
+msgstr "Watchdog NMI mesti dimatikan"
+
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
+msgstr "Scheduler CPU Sadar Daya"
+
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
+msgstr "Tenggang waktu writeback VM"
+
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
+msgstr "Tunables"
+
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+msgstr " <ESC> Keluar | <Enter> Jungkit tunable | <r> Segarkan jendela"
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
+msgstr "PM runtime bagi %s perangkat %s"
+
+#: src/tuning/tuningi2c.cpp:59
+#, fuzzy, c-format
+msgid "I2C %s %s has no runtime power management"
+msgstr "%s perangkat %s tak memiliki manajemen daya runtime"
+
+#: src/tuning/tuningsysfs.cpp:123
+#, fuzzy, c-format
+msgid "Enable SATA link power management for %s"
+msgstr "Fungsikan Manajemen daya link SATA bagi %s"
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr "Suspensi otomatis bagi perangkat USB tak dikenal %s (%s:%s)"
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr "Suspensi otomatis bagi perangkat USB %s [%s]"
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
+msgstr "Penghematan Daya Nirkabel bagi antarmuka %s"
+
+#~ msgid "Actual"
+#~ msgstr "Aktual"
+
 #, fuzzy
 #~ msgid "I2C Device: %s"
 #~ msgstr "Perangkat PCI: %s"
-- =

1.8.3.1


--===============8499849399319633548==--

