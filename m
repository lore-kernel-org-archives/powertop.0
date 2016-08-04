Content-Type: multipart/mixed; boundary="===============0778668813026418263=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 11/19] cs_CZ.po: re-generate Czech translation
Date: Wed, 03 Aug 2016 17:59:21 -0700
Message-ID: <1470272369-218664-12-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0778668813026418263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/cs_CZ.po | 1005 ++++++++++++++++++++++++++++++++-----------------------=
----
 1 file changed, 541 insertions(+), 464 deletions(-)

diff --git a/po/cs_CZ.po b/po/cs_CZ.po
index 986f27c98a37..5b960cfe48eb 100644
--- a/po/cs_CZ.po
+++ b/po/cs_CZ.po
@@ -9,7 +9,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:10-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Czech (Czech Republic) (http://www.transifex.com/projects/=
p/"
@@ -20,52 +20,74 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D3; plural=3D(n=3D=3D1) ? 0 : (n>=3D2 && n<=3D4) =
? 1 : 2;\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
-msgstr "Nelze ulo=C5=BEit soubor"
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
+msgstr "Nelze vytvo=C5=99it do=C4=8Dasn=C3=BD soubor\n"
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
-msgstr "Nelze na=C4=8D=C3=ADst ze souboru"
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
+msgstr "Kalibrace: CPU pou=C5=BEito na %i vl=C3=A1ken\n"
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
-msgstr ""
-"Nahr=C3=A1no %i m=C4=9B=C5=99en=C3=AD\n"
-"\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
+msgstr "Kalibrace: spot=C5=99eba energie na probuzen=C3=AD CPU\n"
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
-msgstr ""
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
+msgstr "Kalibrace USB za=C5=99=C3=ADzen=C3=AD\n"
 =

-#: src/display.cpp:70
-msgid "Overview"
-msgstr "P=C5=99ehled"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
+msgstr ".... za=C5=99=C3=ADzen=C3=AD %s \n"
 =

-#: src/display.cpp:71
-msgid "Idle stats"
-msgstr "Ne=C4=8Dinn=C3=A9"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
+msgstr "Kalibrace radio za=C5=99=C3=ADzen=C3=AD\n"
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
-msgstr "Frekvence"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
+msgstr "Kalibrace podsv=C3=ADcen=C3=AD\n"
 =

-#: src/display.cpp:73
-msgid "Device stats"
-msgstr "Za=C5=99=C3=ADzen=C3=AD"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
+msgstr "Kalibrace ne=C4=8Dinnosti\n"
 =

-#: src/display.cpp:131
-msgid "Exit"
-msgstr "Konec"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
+msgstr "Kalibrace: u=C5=BEit=C3=AD disku \n"
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr "Za=C4=8D=C3=ADn=C3=A1n=C3=AD kalibrace odhadov=C3=A1n=C3=AD energi=
e PowerTOP\n"
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr "Ukon=C4=8Dov=C3=A1n=C3=AD kalibrace odhadov=C3=A1n=C3=AD energie P=
owerTOP\n"
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr "Parametry po kalibraci:\n"
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
 msgstr "  J=C3=A1dro"
@@ -92,45 +114,45 @@ msgstr ""
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
 msgstr "Bal=C3=AD=C4=8Dek"
 =

-#: src/cpu/cpu.cpp:559 src/cpu/cpu.cpp:768
+#: src/cpu/cpu.cpp:553 src/cpu/cpu.cpp:762
 #, fuzzy, c-format
 msgid "Core %d"
 msgstr "J=C3=A1dro %i"
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
 msgstr "cpu_idle ud=C3=A1lost nevr=C3=A1tila stav?\n"
 =

-#: src/cpu/cpu.cpp:1005
+#: src/cpu/cpu.cpp:999
 #, c-format
 msgid "power or cpu_frequency event returned no state?\n"
 msgstr ""
@@ -142,665 +164,595 @@ msgid "C0 polling"
 msgstr "C0 sd=C3=ADlen=C3=AD"
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
 msgstr "  Bal=C3=AD=C4=8Dek"
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
 msgstr "C0 aktivn=C3=AD"
 =

-#: src/cpu/intel_cpus.cpp:576
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "Actual"
-msgstr "Aktu=C3=A1ln=C3=AD"
-
-#: src/devlist.cpp:330
-msgid "Process"
-msgstr ""
-
-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-#, fuzzy
-msgid "Device"
-msgstr "Za=C5=99=C3=ADzen=C3=AD"
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
-msgstr "PS/2 Touchpad / Kl=C3=A1vesnice / My=C5=A1"
-
-#: src/lib.cpp:410
-msgid "SATA controller"
-msgstr "SATA ovlada=C4=8D"
-
-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
-msgstr "Intel vestav=C4=9Bn=C3=BD v USB hubu"
+msgid "SATA link: %s"
+msgstr "SATA link: %s"
 =

-#: src/lib.cpp:485 src/lib.cpp:517
+#: src/devices/ahci.cpp:156
 #, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
-msgstr ""
+msgid "SATA disk: %s"
+msgstr "SATA disk: %s"
 =

-#: src/process/do_process.cpp:818
-#, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
-"Odhad energie: %5.1f    Zm=C4=9B=C5=99en=C3=A1 energie: %5.1f    Sou=C4=
=8Det: %5.1f\n"
-"\n"
-
-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
-#, c-format
-msgid "The battery reports a discharge rate of %sW\n"
-msgstr "Spot=C5=99eba p=C5=99i chodu na baterii: %sW\n"
-
-#: src/process/do_process.cpp:834
-#, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
-msgstr "Odhadovan=C3=BD zb=C3=BDvaj=C3=ADc=C3=AD =C4=8Das do vybit=C3=AD b=
aterie je %i hodin, %i minut\n"
-
-#: src/process/do_process.cpp:842
-msgid "Summary"
-msgstr "Souhrn"
-
-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
-msgstr "probuzen=C3=AD/sekund"
-
-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
-msgstr "GPU ops/sekund"
-
-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
-msgstr "VFS ops/sec a"
-
-#: src/process/do_process.cpp:842
-msgid "CPU use"
-msgstr "vyu=C5=BEit=C3=AD CPU"
-
-#: src/process/do_process.cpp:846
-msgid "Power est."
-msgstr "Energie zb=C3=BDv=C3=A1"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
-msgstr "Vyu=C5=BEit=C3=AD"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
-msgstr "Ud=C3=A1lost/i"
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
-msgstr "Popis"
-
-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
-msgstr "Probuzen=C3=AD/s"
-
-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
-msgstr "GPU ops/s"
-
-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
-msgstr "Disk IO/s"
-
-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
-msgstr "GFX Probuzen=C3=AD/s"
 =

-#: src/process/do_process.cpp:931 src/process/do_process.cpp:1078
-#: src/devices/device.cpp:273
-msgid "PW Estimate"
+#: src/devices/ahci.cpp:389
+msgid "Link"
 msgstr ""
 =

-#: src/process/do_process.cpp:1013
-msgid "Overview of Software Power Consumers"
-msgstr "P=C5=99ehled Software Power u=C5=BEivatel=C5=AF"
-
-#: src/process/do_process.cpp:1053
-msgid "Target:"
-msgstr ""
+#: src/devices/ahci.cpp:390
+#, fuzzy
+msgid "Active"
+msgstr "C0 aktivn=C3=AD"
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
-msgstr "Probuzen=C3=AD/s"
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
-msgstr "Vyu=C5=BEit=C3=AD"
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
-msgstr "GPU ops/s"
+#: src/devices/alsa.cpp:77
+#, c-format
+msgid "Audio codec %s: %s (%s)"
+msgstr "Audio kodek %s: %s (%s)"
 =

-#: src/process/do_process.cpp:1064
-msgid "GFX:"
-msgstr ""
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#, c-format
+msgid "Audio codec %s: %s"
+msgstr "Audio kodek %s: %s"
 =

-#: src/process/do_process.cpp:1066
+#: src/devices/devfreq.cpp:261
 #, fuzzy
-msgid " wakeups/s"
-msgstr "Probuzen=C3=AD/s"
+msgid "Device Freq stats"
+msgstr "Za=C5=99=C3=ADzen=C3=AD"
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
-msgstr "P=C5=99ehled Software Power u=C5=BEivatel=C5=AF"
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
-msgstr "PowerTOP %s pot=C5=99ebuje j=C3=A1dro k podpo=C5=99e 'perf' subsys=
t=C3=A9mu\n"
+msgid "The battery reports a discharge rate of %sW\n"
+msgstr "Spot=C5=99eba p=C5=99i chodu na baterii: %sW\n"
 =

-#: src/perf/perf.cpp:118
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
 #, c-format
-msgid "as well as support for trace points in the kernel:\n"
-msgstr "stejn=C4=9B jako podpora pro sledovan=C3=A9 body v j=C3=A1dru:\n"
+msgid "The power consumed was %sJ\n"
+msgstr ""
 =

-#: src/devices/device.cpp:178
+#: src/devices/device.cpp:180
 #, c-format
 msgid "System baseline power is estimated at %sW\n"
 msgstr "Syst=C3=A9m z=C3=A1kladn=C3=ADho nap=C3=A1jen=C3=AD je odhadov=C3=
=A1n na %sW\n"
 =

-#: src/devices/device.cpp:185
+#: src/devices/device.cpp:187
 msgid "Power est.    Usage     Device name\n"
 msgstr "Energie zb=C3=BDv=C3=A1   Pou=C5=BEit=C3=AD     Jm=C3=A9no za=C5=
=99=C3=ADzen=C3=AD\n"
 =

-#: src/devices/device.cpp:187
+#: src/devices/device.cpp:189
 msgid "              Usage     Device name\n"
 msgstr "              Pou=C5=BEit=C3=AD     Jm=C3=A9no za=C5=99=C3=ADzen=
=C3=AD\n"
 =

-#: src/devices/device.cpp:254
+#: src/devices/device.cpp:256
 #, fuzzy
 msgid "The battery reports a discharge rate of: "
 msgstr "Spot=C5=99eba p=C5=99i chodu na baterii: %sW\n"
 =

 #: src/devices/device.cpp:261
+msgid "The power consumed was : "
+msgstr ""
+
+#: src/devices/device.cpp:268
 #, fuzzy
 msgid "The system baseline power is estimated at: "
 msgstr "Syst=C3=A9m z=C3=A1kladn=C3=ADho nap=C3=A1jen=C3=AD je odhadov=C3=
=A1n na %sW\n"
 =

-#: src/devices/device.cpp:271
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
+msgstr "Vyu=C5=BEit=C3=AD"
+
+#: src/devices/device.cpp:278
 #, fuzzy
 msgid "Device Name"
 msgstr "Za=C5=99=C3=ADzen=C3=AD"
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
-msgstr "Audio kodek %s: %s (%s)"
+msgid "Network interface: %s (%s)"
+msgstr "S=C3=AD=C5=A5ov=C3=A9 rozhran=C3=AD: %s (%s)"
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
 #, c-format
-msgid "Audio codec %s: %s"
-msgstr "Audio kodek %s: %s"
+msgid "Radio device: %s"
+msgstr "Radio za=C5=99=C3=ADzen=C3=AD: %s"
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
+msgstr "Za=C5=99=C3=ADzen=C3=AD"
+
+#: src/devices/runtime_pm.cpp:241
 #, c-format
 msgid "PCI Device: %s"
 msgstr "PCI Za=C5=99=C3=ADzen=C3=AD: %s"
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
 msgid "USB device: %s"
 msgstr "USB za=C5=99=C3=ADzen=C3=AD: %s"
 =

-#: src/devices/usb.cpp:91
+#: src/devices/usb.cpp:94
 #, c-format
 msgid "USB device: %s (%s)"
 msgstr "USB za=C5=99=C3=ADzen=C3=AD: %s (%s)"
 =

-#: src/devices/ahci.cpp:154
-#, c-format
-msgid "SATA link: %s"
-msgstr "SATA link: %s"
-
-#: src/devices/ahci.cpp:156
-#, c-format
-msgid "SATA disk: %s"
-msgstr "SATA disk: %s"
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
-msgstr "C0 aktivn=C3=AD"
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
-msgstr "Radio za=C5=99=C3=ADzen=C3=AD: %s"
-
-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
-msgstr "S=C3=AD=C5=A5ov=C3=A9 rozhran=C3=AD: %s (%s)"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
-msgstr "Dobr=C3=A9"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
-msgstr "=C5=A0patn=C3=A9"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
-msgstr "Nezn=C3=A1m=C3=A9"
-
-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
-msgstr "Status rozhran=C3=AD za=C5=99=C3=ADzen=C3=AD Bluetooth"
-
-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
-msgstr "Zapnout spr=C3=A1vu nap=C3=A1jen=C3=AD audio kodeku"
-
-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
-msgstr "Hl=C3=ADdac=C3=AD pes NMI by m=C4=9Bl b=C3=BDt vypnut=C3=BD"
-
-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
-msgstr "Power Aware CPU pl=C3=A1nova=C4=8D"
-
-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
-msgstr "VM writeback timeout"
-
-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
-msgstr "Mo=C5=BEnosti vylad=C4=9Bn=C3=AD"
+#: src/display.cpp:70
+msgid "Overview"
+msgstr "P=C5=99ehled"
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
-msgstr " <ESC> Konec | <Enter> P=C5=99epnout zm=C4=9Bniteln=C3=A9 | <r> Ob=
novit okno"
+#: src/display.cpp:71
+msgid "Idle stats"
+msgstr "Ne=C4=8Dinn=C3=A9"
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
-msgstr ""
+#: src/display.cpp:72
+msgid "Frequency stats"
+msgstr "Frekvence"
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
-msgstr ""
+#: src/display.cpp:73
+msgid "Device stats"
+msgstr "Za=C5=99=C3=ADzen=C3=AD"
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
-msgstr ""
+#: src/display.cpp:131
+msgid "Exit"
+msgstr "Konec"
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
-msgstr "Wake-on-lan status za=C5=99=C3=ADzen=C3=AD %s"
-
-#: src/tuning/wifi.cpp:48
-#, c-format
-msgid "Wireless Power Saving for interface %s"
-msgstr "=C3=9Aspora energie bezdr=C3=A1tov=C3=BDch za=C5=99=C3=ADzen=C3=AD=
 %s"
-
-#: src/tuning/runtime.cpp:48
-#, c-format
-msgid "Runtime PM for %s device %s"
-msgstr "Runtime PM pro %s za=C5=99=C3=ADzen=C3=AD %s"
-
-#: src/tuning/runtime.cpp:50
-#, c-format
-msgid "%s device %s has no runtime power management"
-msgstr "%s za=C5=99=C3=ADzen=C3=AD %s nem=C3=A1 spustitelnou spr=C3=A1vu n=
ap=C3=A1jen=C3=AD"
-
-#: src/tuning/runtime.cpp:74
-#, c-format
-msgid "PCI Device %s has no runtime power management"
-msgstr "PCI Za=C5=99=C3=ADzen=C3=AD %s nem=C3=A1 spustitelnou spr=C3=A1vu =
nap=C3=A1jen=C3=AD"
-
-#: src/tuning/runtime.cpp:76
-#, c-format
-msgid "Runtime PM for PCI Device %s"
-msgstr "Trv=C3=A1n=C3=AD PM pro PCI za=C5=99=C3=ADzen=C3=AD %s"
-
-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
-msgstr "Automatick=C3=A9 usp=C3=A1n=C3=AD pro nezn=C3=A1m=C3=A9 USB za=C5=
=99=C3=ADzen=C3=AD %s (%s:%s)"
-
-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
-#, c-format
-msgid "Autosuspend for USB device %s [%s]"
-msgstr "Automatick=C3=A9 usp=C3=A1n=C3=AD pro USB za=C5=99=C3=ADzen=C3=AD =
%s [%s]"
-
-#: src/tuning/tuningsysfs.cpp:123
-#, fuzzy, c-format
-msgid "Enable SATA link power management for %s"
-msgstr "Zapnout spr=C3=A1vu nap=C3=A1jen=C3=AD SATA linku pro %s"
-
-#: src/calibrate/calibrate.cpp:238
+#: src/lib.cpp:288
 #, c-format
-msgid "Cannot create temp file\n"
-msgstr "Nelze vytvo=C5=99it do=C4=8Dasn=C3=BD soubor\n"
-
-#: src/calibrate/calibrate.cpp:258
-#, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
-msgstr "Kalibrace: CPU pou=C5=BEito na %i vl=C3=A1ken\n"
+msgid "%7sW"
+msgstr "%7sW"
 =

-#: src/calibrate/calibrate.cpp:273
+#: src/lib.cpp:291
 #, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
-msgstr "Kalibrace: spot=C5=99eba energie na probuzen=C3=AD CPU\n"
+msgid "    0 mW"
+msgstr "    0 mW"
 =

-#: src/calibrate/calibrate.cpp:290
-#, c-format
-msgid "Calibrating USB devices\n"
-msgstr "Kalibrace USB za=C5=99=C3=ADzen=C3=AD\n"
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
+msgstr "PS/2 Touchpad / Kl=C3=A1vesnice / My=C5=A1"
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
-#, c-format
-msgid ".... device %s \n"
-msgstr ".... za=C5=99=C3=ADzen=C3=AD %s \n"
+#: src/lib.cpp:411
+msgid "SATA controller"
+msgstr "SATA ovlada=C4=8D"
 =

-#: src/calibrate/calibrate.cpp:307
-#, c-format
-msgid "Calibrating radio devices\n"
-msgstr "Kalibrace radio za=C5=99=C3=ADzen=C3=AD\n"
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
+msgstr "Intel vestav=C4=9Bn=C3=BD v USB hubu"
 =

-#: src/calibrate/calibrate.cpp:331
+#: src/lib.cpp:467
 #, c-format
-msgid "Calibrating backlight\n"
-msgstr "Kalibrace podsv=C3=ADcen=C3=AD\n"
+msgid "glob returned GLOB_NOSPACE\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#: src/lib.cpp:471
 #, c-format
-msgid "Calibrating idle\n"
-msgstr "Kalibrace ne=C4=8Dinnosti\n"
+msgid "glob returned GLOB_ABORTED\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
+#: src/lib.cpp:475
 #, c-format
-msgid "Calibrating: disk usage \n"
-msgstr "Kalibrace: u=C5=BEit=C3=AD disku \n"
-
-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
-msgstr "Za=C4=8D=C3=ADn=C3=A1n=C3=AD kalibrace odhadov=C3=A1n=C3=AD energi=
e PowerTOP\n"
-
-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
-msgstr "Ukon=C4=8Dov=C3=A1n=C3=AD kalibrace odhadov=C3=A1n=C3=AD energie P=
owerTOP\n"
+msgid "glob returned GLOB_NOMATCH\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "Parameters after calibration:\n"
-msgstr "Parametry po kalibraci:\n"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
+msgstr ""
 =

-#: src/main.cpp:101
+#: src/main.cpp:102
 #, fuzzy, c-format
 msgid "PowerTOP version "
 msgstr "PowerTOP verze"
 =

-#: src/main.cpp:107
+#: src/main.cpp:108
 msgid "Set refresh time out"
 msgstr "Nastavit =C4=8Das obnoven=C3=AD"
 =

-#: src/main.cpp:120
+#: src/main.cpp:121
 msgid "Usage: powertop [OPTIONS]"
 msgstr "Pou=C5=BEit=C3=AD: powertop [VOLBY]"
 =

-#: src/main.cpp:121
+#: src/main.cpp:122
 msgid "sets all tunable options to their GOOD setting"
 msgstr ""
 =

-#: src/main.cpp:122
+#: src/main.cpp:123
 msgid "runs powertop in calibration mode"
 msgstr "spustit powertop v kalibra=C4=8Dn=C3=ADm re=C5=BEimu"
 =

-#: src/main.cpp:123 src/main.cpp:126
+#: src/main.cpp:124 src/main.cpp:127
 msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/main.cpp:123
+#: src/main.cpp:124
 msgid "generate a csv report"
 msgstr "vytvo=C5=99en=C3=AD csv hl=C3=A1=C5=A1en=C3=AD"
 =

-#: src/main.cpp:124
+#: src/main.cpp:125
 msgid "run in \"debug\" mode"
 msgstr "spustit v \"debug\" m=C3=B3du"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "[=3Ddevnode]"
 msgstr "[=3Ddevnode]"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "uses an Extech Power Analyzer for measurements"
 msgstr "vyu=C5=BEit=C3=AD Extech Power Analyz=C3=A9ru pro m=C4=9B=C5=99en=
=C3=AD"
 =

-#: src/main.cpp:126
+#: src/main.cpp:127
 msgid "generate a html report"
 msgstr "vytvo=C5=99en=C3=AD html hl=C3=A1=C5=A1en=C3=AD"
 =

-#: src/main.cpp:127
+#: src/main.cpp:128
 msgid "[=3Diterations] number of times to run each test"
 msgstr "[=3Diterace] po=C4=8Det spu=C5=A1t=C4=9Bn=C3=AD ka=C5=BEd=C3=A9ho =
testu"
 =

-#: src/main.cpp:128
+#: src/main.cpp:129
 msgid "suppress stderr output"
 msgstr ""
 =

-#: src/main.cpp:129
+#: src/main.cpp:130 src/main.cpp:131
 msgid "[=3Dseconds]"
 msgstr "[=3Dsekundy]"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
+msgstr ""
+
+#: src/main.cpp:131
 msgid "generate a report for 'x' seconds"
 msgstr "vytvo=C5=99en=C3=AD hl=C3=A1=C5=A1en=C3=AD pro \"x\" sekund"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "[=3Dworkload]"
 msgstr "[=3Dzat=C3=AD=C5=BEen=C3=AD]"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "file to execute for workload"
 msgstr "soubor ke spu=C5=A1t=C4=9Bn=C3=AD pro zat=C3=AD=C5=BEen=C3=AD"
 =

-#: src/main.cpp:131
+#: src/main.cpp:133
 msgid "print version information"
 msgstr "vyp=C3=AD=C5=A1e informace o verzi"
 =

-#: src/main.cpp:132
+#: src/main.cpp:134
 msgid "print this help menu"
 msgstr "vyp=C3=AD=C5=A1e tuto n=C3=A1pov=C4=9Bdu"
 =

-#: src/main.cpp:134
+#: src/main.cpp:136
 #, fuzzy
 msgid "For more help please refer to the 'man 8 powertop'"
 msgstr "Pro v=C3=ADce n=C3=A1pov=C4=9Bdy p=C5=99ejd=C4=9Bte pros=C3=ADm do=
 README"
 =

-#: src/main.cpp:212
+#: src/main.cpp:231
 #, c-format
 msgid "Unknown issue running workload!\n"
 msgstr "Nezn=C3=A1m=C3=BD probl=C3=A9m p=C5=99i spu=C5=A1t=C4=9Bn=C3=AD za=
t=C3=AD=C5=BEen=C3=AD!\n"
 =

-#: src/main.cpp:257
+#: src/main.cpp:288
 msgid "PowerTOP is out of memory. PowerTOP is Aborting"
 msgstr "PowerTOPu do=C5=A1la pam=C4=9B=C5=A5. Power TOP je p=C5=99eru=C5=
=A1en."
 =

-#: src/main.cpp:265
+#: src/main.cpp:296
 #, c-format
 msgid "Preparing to take measurements\n"
 msgstr "P=C5=99=C3=ADprava k m=C4=9B=C5=99en=C3=AD\n"
 =

-#: src/main.cpp:270
+#: src/main.cpp:301
 #, c-format
 msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
 msgstr "Zm=C4=9B=C5=99eno %d v=C3=BDsledk=C5=AF za dobu trv=C3=A1n=C3=AD %=
d vte=C5=99in ka=C5=BEd=C3=BD.\n"
 =

-#: src/main.cpp:272
+#: src/main.cpp:303
 #, c-format
 msgid "Measuring workload %s.\n"
 msgstr "M=C4=9B=C5=99en=C3=AD zat=C3=AD=C5=BEen=C3=AD %s.\n"
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
 msgstr "ukon=C4=8Duji...\n"
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
 msgstr "Selhalo p=C5=99ipojen=C3=AD debugfs!\n"
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
 msgstr "Selhal tich=C3=BD m=C3=B3d!\n"
 =

-#: src/main.cpp:514
+#: src/main.cpp:555
 msgid "Leaving PowerTOP"
 msgstr "Ukon=C4=8Duji PowerTOP"
 =

+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
+msgstr "Nelze ulo=C5=BEit soubor"
+
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
+msgstr "Nelze na=C4=8D=C3=ADst ze souboru"
+
+#: src/parameters/persistent.cpp:138
+#, c-format
+msgid "Loaded %i prior measurements\n"
+msgstr ""
+"Nahr=C3=A1no %i m=C4=9B=C5=99en=C3=AD\n"
+"\n"
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
+msgstr "PowerTOP %s pot=C5=99ebuje j=C3=A1dro k podpo=C5=99e 'perf' subsys=
t=C3=A9mu\n"
+
+#: src/perf/perf.cpp:118
+#, c-format
+msgid "as well as support for trace points in the kernel:\n"
+msgstr "stejn=C4=9B jako podpora pro sledovan=C3=A9 body v j=C3=A1dru:\n"
+
+#: src/process/do_process.cpp:819
+#, c-format
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
+msgstr ""
+"Odhad energie: %5.1f    Zm=C4=9B=C5=99en=C3=A1 energie: %5.1f    Sou=C4=
=8Det: %5.1f\n"
+"\n"
+
+#: src/process/do_process.cpp:838
+#, c-format
+msgid "The estimated remaining time is %i hours, %i minutes\n"
+msgstr "Odhadovan=C3=BD zb=C3=BDvaj=C3=ADc=C3=AD =C4=8Das do vybit=C3=AD b=
aterie je %i hodin, %i minut\n"
+
+#: src/process/do_process.cpp:846
+msgid "Summary"
+msgstr "Souhrn"
+
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
+msgstr "probuzen=C3=AD/sekund"
+
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
+msgstr "GPU ops/sekund"
+
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
+msgstr "VFS ops/sec a"
+
+#: src/process/do_process.cpp:846
+msgid "CPU use"
+msgstr "vyu=C5=BEit=C3=AD CPU"
+
+#: src/process/do_process.cpp:850
+msgid "Power est."
+msgstr "Energie zb=C3=BDv=C3=A1"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
+msgstr "Ud=C3=A1lost/i"
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
+msgstr "Popis"
+
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
+msgstr "Probuzen=C3=AD/s"
+
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
+msgstr "GPU ops/s"
+
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
+msgstr "Disk IO/s"
+
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
+msgstr "GFX Probuzen=C3=AD/s"
+
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
+msgstr "P=C5=99ehled Software Power u=C5=BEivatel=C5=AF"
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
+msgstr "Probuzen=C3=AD/s"
+
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
+msgstr ""
+
+#: src/process/do_process.cpp:1064
+#, fuzzy, c-format
+msgid "\\% usage"
+msgstr "Vyu=C5=BEit=C3=AD"
+
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
+msgstr ""
+
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+#, fuzzy
+msgid " ops/s"
+msgstr "GPU ops/s"
+
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
+msgstr ""
+
+#: src/process/do_process.cpp:1070
+#, fuzzy
+msgid " wakeups/s"
+msgstr "Probuzen=C3=AD/s"
+
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
+msgstr ""
+
+#: src/process/do_process.cpp:1139
+#, fuzzy
+msgid "Top 10 Power Consumers"
+msgstr "P=C5=99ehled Software Power u=C5=BEivatel=C5=AF"
+
 #: src/report/report.cpp:122
 #, fuzzy
 msgid "PowerTOP Version"
@@ -838,6 +790,131 @@ msgstr "Nelze vytvo=C5=99it do=C4=8Dasn=C3=BD soubor\=
n"
 msgid "PowerTOP outputing using base filename %s\n"
 msgstr ""
 =

+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
+msgstr "Dobr=C3=A9"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr "=C5=A0patn=C3=A9"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr "Nezn=C3=A1m=C3=A9"
+
+#: src/tuning/bluetooth.cpp:48
+#, c-format
+msgid "Bluetooth device interface status"
+msgstr "Status rozhran=C3=AD za=C5=99=C3=ADzen=C3=AD Bluetooth"
+
+#: src/tuning/ethernet.cpp:54
+#, c-format
+msgid "Wake-on-lan status for device %s"
+msgstr "Wake-on-lan status za=C5=99=C3=ADzen=C3=AD %s"
+
+#: src/tuning/runtime.cpp:48
+#, c-format
+msgid "Runtime PM for %s device %s"
+msgstr "Runtime PM pro %s za=C5=99=C3=ADzen=C3=AD %s"
+
+#: src/tuning/runtime.cpp:50
+#, c-format
+msgid "%s device %s has no runtime power management"
+msgstr "%s za=C5=99=C3=ADzen=C3=AD %s nem=C3=A1 spustitelnou spr=C3=A1vu n=
ap=C3=A1jen=C3=AD"
+
+#: src/tuning/runtime.cpp:74
+#, c-format
+msgid "PCI Device %s has no runtime power management"
+msgstr "PCI Za=C5=99=C3=ADzen=C3=AD %s nem=C3=A1 spustitelnou spr=C3=A1vu =
nap=C3=A1jen=C3=AD"
+
+#: src/tuning/runtime.cpp:76
+#, c-format
+msgid "Runtime PM for PCI Device %s"
+msgstr "Trv=C3=A1n=C3=AD PM pro PCI za=C5=99=C3=ADzen=C3=AD %s"
+
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
+msgstr "Zapnout spr=C3=A1vu nap=C3=A1jen=C3=AD audio kodeku"
+
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
+msgstr "Hl=C3=ADdac=C3=AD pes NMI by m=C4=9Bl b=C3=BDt vypnut=C3=BD"
+
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
+msgstr "Power Aware CPU pl=C3=A1nova=C4=8D"
+
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
+msgstr "VM writeback timeout"
+
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
+msgstr "Mo=C5=BEnosti vylad=C4=9Bn=C3=AD"
+
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+msgstr " <ESC> Konec | <Enter> P=C5=99epnout zm=C4=9Bniteln=C3=A9 | <r> Ob=
novit okno"
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
+msgstr "Runtime PM pro %s za=C5=99=C3=ADzen=C3=AD %s"
+
+#: src/tuning/tuningi2c.cpp:59
+#, fuzzy, c-format
+msgid "I2C %s %s has no runtime power management"
+msgstr "%s za=C5=99=C3=ADzen=C3=AD %s nem=C3=A1 spustitelnou spr=C3=A1vu n=
ap=C3=A1jen=C3=AD"
+
+#: src/tuning/tuningsysfs.cpp:123
+#, fuzzy, c-format
+msgid "Enable SATA link power management for %s"
+msgstr "Zapnout spr=C3=A1vu nap=C3=A1jen=C3=AD SATA linku pro %s"
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr "Automatick=C3=A9 usp=C3=A1n=C3=AD pro nezn=C3=A1m=C3=A9 USB za=C5=
=99=C3=ADzen=C3=AD %s (%s:%s)"
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr "Automatick=C3=A9 usp=C3=A1n=C3=AD pro USB za=C5=99=C3=ADzen=C3=AD =
%s [%s]"
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
+msgstr "=C3=9Aspora energie bezdr=C3=A1tov=C3=BDch za=C5=99=C3=ADzen=C3=AD=
 %s"
+
+#~ msgid "Actual"
+#~ msgstr "Aktu=C3=A1ln=C3=AD"
+
 #, fuzzy
 #~ msgid "I2C Device: %s"
 #~ msgstr "PCI Za=C5=99=C3=ADzen=C3=AD: %s"
-- =

1.8.3.1


--===============0778668813026418263==--

