Content-Type: multipart/mixed; boundary="===============3004463531618143006=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 16/19] hu_HU.po: re-generate Hungarian
 translation
Date: Wed, 03 Aug 2016 17:59:26 -0700
Message-ID: <1470272369-218664-17-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3004463531618143006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/hu_HU.po | 1003 ++++++++++++++++++++++++++++++++-----------------------=
----
 1 file changed, 540 insertions(+), 463 deletions(-)

diff --git a/po/hu_HU.po b/po/hu_HU.po
index 6c60cea47853..c3071c0d5351 100644
--- a/po/hu_HU.po
+++ b/po/hu_HU.po
@@ -11,7 +11,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2015-10-30 17:22-0700\n"
+"POT-Creation-Date: 2016-08-03 17:10-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Hungarian (Hungary) (http://www.transifex.com/projects/p/"
@@ -22,50 +22,74 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3D(n !=3D 1);\n"
 =

-#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
-msgid "Cannot save to file"
-msgstr "Nem lehet elmenteni a f=C3=A1jlba "
+#: src/calibrate/calibrate.cpp:238
+#, c-format
+msgid "Cannot create temp file\n"
+msgstr "Nem tudok l=C3=A9trehozni ideiglenes f=C3=A1jlt\n"
 =

-#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
-msgid "Cannot load from file"
-msgstr "Nem lehet bet=C3=B6lteni a f=C3=A1jlb=C3=B3l"
+#: src/calibrate/calibrate.cpp:258
+#, c-format
+msgid "Calibrating: CPU usage on %i threads\n"
+msgstr "Kalibr=C3=A1l=C3=A1s: CPU haszn=C3=A1lts=C3=A1g %i sz=C3=A1lon\n"
 =

-#: src/parameters/persistent.cpp:138
+#: src/calibrate/calibrate.cpp:273
 #, c-format
-msgid "Loaded %i prior measurements\n"
-msgstr "%i kor=C3=A1bbi m=C3=A9r=C3=A9s bet=C3=B6ltve\n"
+msgid "Calibrating: CPU wakeup power consumption\n"
+msgstr "Kalibr=C3=A1l=C3=A1s: CPU fel=C3=A9bred=C3=A9si teljes=C3=ADtm=C3=
=A9nyfelv=C3=A9tel\n"
 =

-#: src/parameters/persistent.cpp:181
-msgid ""
-"File will be loaded after taking minimum number of measurement(s) with "
-"battery only \n"
-msgstr ""
+#: src/calibrate/calibrate.cpp:290
+#, c-format
+msgid "Calibrating USB devices\n"
+msgstr "USB eszk=C3=B6z=C3=B6k kalibr=C3=A1l=C3=A1sa\n"
 =

-#: src/display.cpp:70
-msgid "Overview"
-msgstr "=C3=81ttekint=C3=A9s"
+#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
+#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
+#, c-format
+msgid ".... device %s \n"
+msgstr ".... %s eszk=C3=B6z \n"
 =

-#: src/display.cpp:71
-msgid "Idle stats"
-msgstr "=C3=9Cresj=C3=A1rat-statisztika"
+#: src/calibrate/calibrate.cpp:307
+#, c-format
+msgid "Calibrating radio devices\n"
+msgstr "R=C3=A1di=C3=B3s eszk=C3=B6z=C3=B6k kalibr=C3=A1l=C3=A1sa\n"
 =

-#: src/display.cpp:72
-msgid "Frequency stats"
-msgstr "Frekvenciastatisztika"
+#: src/calibrate/calibrate.cpp:331
+#, c-format
+msgid "Calibrating backlight\n"
+msgstr "H=C3=A1tt=C3=A9rvil=C3=A1g=C3=ADt=C3=A1s kalibr=C3=A1l=C3=A1sa\n"
 =

-#: src/display.cpp:73
-msgid "Device stats"
-msgstr "Eszk=C3=B6zstatisztika"
+#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#, c-format
+msgid "Calibrating idle\n"
+msgstr "=C3=9Cresj=C3=A1rat kalibr=C3=A1l=C3=A1sa\n"
 =

-#: src/display.cpp:131
-msgid "Exit"
-msgstr "Kil=C3=A9p=C3=A9s"
+#: src/calibrate/calibrate.cpp:378
+#, c-format
+msgid "Calibrating: disk usage \n"
+msgstr "Kalibr=C3=A1l=C3=A1s: lemezhaszn=C3=A1lat \n"
 =

-#: src/display.cpp:132
-msgid "Navigate"
+#: src/calibrate/calibrate.cpp:403
+msgid "Starting PowerTOP power estimate calibration \n"
+msgstr "PowerTop teljes=C3=ADtm=C3=A9nybecsl=C3=A9s kalibr=C3=A1l=C3=A1s i=
nd=C3=ADt=C3=A1sa \n"
+
+#: src/calibrate/calibrate.cpp:426
+msgid "Finishing PowerTOP power estimate calibration \n"
+msgstr "PowerTop teljes=C3=ADtm=C3=A9nybecsl=C3=A9s-kalibr=C3=A1l=C3=A1s b=
efejez=C3=A9se \n"
+
+#: src/calibrate/calibrate.cpp:430
+#, c-format
+msgid "Parameters after calibration:\n"
+msgstr "Param=C3=A9terek a kalibr=C3=A1l=C3=A1s ut=C3=A1n:\n"
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
@@ -92,45 +116,45 @@ msgstr ""
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
 #, fuzzy, c-format
 msgid "Core %d"
 msgstr "Mag %i"
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
 msgstr "a CPU =C3=BCresj=C3=A1ratesem=C3=A9ny nem adott vissza =C3=A1llapo=
tot?\n"
 =

-#: src/cpu/cpu.cpp:1005
+#: src/cpu/cpu.cpp:999
 #, c-format
 msgid "power or cpu_frequency event returned no state?\n"
 msgstr ""
@@ -140,667 +164,595 @@ msgid "C0 polling"
 msgstr "C0 ciklikus lek=C3=A9rdez=C3=A9s"
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
 msgstr "C0 akt=C3=ADv"
 =

-#: src/cpu/intel_cpus.cpp:576
+#: src/cpu/intel_cpus.cpp:610
 #, c-format
-msgid "Actual"
-msgstr "Aktu=C3=A1lis"
-
-#: src/devlist.cpp:330
-msgid "Process"
-msgstr ""
-
-#: src/devlist.cpp:331 src/devices/runtime_pm.cpp:215
-#, fuzzy
-msgid "Device"
-msgstr "Eszk=C3=B6zstatisztika"
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
-msgstr "PS/2 tapipad / billenty=C5=B1zet / eg=C3=A9r"
-
-#: src/lib.cpp:410
-msgid "SATA controller"
-msgstr "SATA vez=C3=A9rl=C5=91"
-
-#: src/lib.cpp:411
-msgid "Intel built in USB hub"
-msgstr "Be=C3=A9p=C3=ADtett Intel USB hub"
+msgid "SATA link: %s"
+msgstr "SATA kapcsolat: %s"
 =

-#: src/lib.cpp:485 src/lib.cpp:517
+#: src/devices/ahci.cpp:156
 #, c-format
-msgid ""
-"Model-specific registers (MSR)\t\t\t not found (try enabling "
-"CONFIG_X86_MSR).\n"
-msgstr ""
+msgid "SATA disk: %s"
+msgstr "SATA lemez: %s"
 =

-#: src/process/do_process.cpp:818
-#, c-format
-msgid ""
-"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
-"\n"
+#: src/devices/ahci.cpp:374
+msgid "AHCI ALPM Residency Statistics - Not supported on this macine"
 msgstr ""
-"Becs=C3=BClt teljes=C3=ADtm=C3=A9ny: %5.1f    M=C3=A9rt teljes=C3=ADtm=C3=
=A9ny: %5.1f    =C3=96sszeg: %5.1f\n"
-"\n"
-
-#: src/process/do_process.cpp:829 src/devices/device.cpp:172
-#, c-format
-msgid "The battery reports a discharge rate of %sW\n"
-msgstr "Az akkumul=C3=A1tor %sW kis=C3=BCl=C3=A9si sebess=C3=A9get jelent\=
n"
-
-#: src/process/do_process.cpp:834
-#, c-format
-msgid "The estimated remaining time is %i hours, %i minutes\n"
-msgstr "Becs=C3=BClt h=C3=A1tral=C3=A9v=C5=91 id=C5=91 %i =C3=B3ra %i perc=
\n"
-
-#: src/process/do_process.cpp:842
-msgid "Summary"
-msgstr "=C3=96sszefoglal=C3=A1s"
-
-#: src/process/do_process.cpp:842
-msgid "wakeups/second"
-msgstr "fel=C3=A9bred=C3=A9s/m=C3=A1sodperc"
-
-#: src/process/do_process.cpp:842
-msgid "GPU ops/seconds"
-msgstr "GPU m=C5=B1velet/m=C3=A1sodperc"
-
-#: src/process/do_process.cpp:842
-msgid "VFS ops/sec and"
-msgstr "VFS m=C5=B1velet/m=C3=A1sodperc"
-
-#: src/process/do_process.cpp:842
-msgid "CPU use"
-msgstr "CPU haszn=C3=A1lts=C3=A1g"
-
-#: src/process/do_process.cpp:846
-msgid "Power est."
-msgstr "Becs=C3=BClt telj."
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:922 src/process/do_process.cpp:1073
-#: src/devices/device.cpp:270
-msgid "Usage"
-msgstr "Haszn=C3=A1lat"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:1074
-msgid "Events/s"
-msgstr "Esem=C3=A9ny/s"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:927 src/process/do_process.cpp:1075
-msgid "Category"
-msgstr "Kateg=C3=B3ria"
-
-#: src/process/do_process.cpp:846 src/process/do_process.cpp:848
-#: src/process/do_process.cpp:928 src/process/do_process.cpp:1076
-#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
-#: src/tuning/tuning.cpp:289
-msgid "Description"
-msgstr "Le=C3=ADr=C3=A1s"
-
-#: src/process/do_process.cpp:923
-msgid "Wakeups/s"
-msgstr "Fel=C3=A9bred=C3=A9s/s"
-
-#: src/process/do_process.cpp:924
-msgid "GPU ops/s"
-msgstr "GPU m=C5=B1velet/s"
 =

-#: src/process/do_process.cpp:925
-msgid "Disk IO/s"
-msgstr "Lemez BK/s"
-
-#: src/process/do_process.cpp:926
-msgid "GFX Wakeups/s"
-msgstr "GFX fel=C3=A9bred=C3=A9s/s"
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
-msgstr "Szofver teljes=C3=ADtm=C3=A9nyfogyaszt=C3=B3k =C3=A1ttekint=C3=A9s=
e"
+#: src/devices/ahci.cpp:390
+#, fuzzy
+msgid "Active"
+msgstr "C0 akt=C3=ADv"
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
-msgstr "Fel=C3=A9bred=C3=A9s/s"
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
-msgstr "Haszn=C3=A1lat"
+#: src/devices/alsa.cpp:77
+#, c-format
+msgid "Audio codec %s: %s (%s)"
+msgstr "Hangkodek %s: %s (%s)"
 =

-#: src/process/do_process.cpp:1061
-msgid "GPU:"
-msgstr ""
+#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#, c-format
+msgid "Audio codec %s: %s"
+msgstr "Hangkodek %s: %s"
 =

-#: src/process/do_process.cpp:1063 src/process/do_process.cpp:1069
+#: src/devices/devfreq.cpp:261
 #, fuzzy
-msgid " ops/s"
-msgstr "GPU m=C5=B1velet/s"
+msgid "Device Freq stats"
+msgstr "Eszk=C3=B6zstatisztika"
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
-msgstr "Fel=C3=A9bred=C3=A9s/s"
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
-msgstr "Szofver teljes=C3=ADtm=C3=A9nyfogyaszt=C3=B3k =C3=A1ttekint=C3=A9s=
e"
-
-#: src/perf/perf.cpp:115
+#: src/devices/device.cpp:172 src/process/do_process.cpp:831
 #, c-format
-msgid ""
-"Too many open files, please increase the limit of open file descriptors.\=
n"
-msgstr ""
+msgid "The battery reports a discharge rate of %sW\n"
+msgstr "Az akkumul=C3=A1tor %sW kis=C3=BCl=C3=A9si sebess=C3=A9get jelent\=
n"
 =

-#: src/perf/perf.cpp:117
+#: src/devices/device.cpp:174 src/process/do_process.cpp:833
 #, c-format
-msgid "PowerTOP %s needs the kernel to support the 'perf' subsystem\n"
+msgid "The power consumed was %sJ\n"
 msgstr ""
-"A PowerTOP %s verzi=C3=B3j=C3=A1nak sz=C3=BCks=C3=A9ge van arra, hogy a r=
endszermag t=C3=A1mogassa a "
-"=E2=80=9Eperf=E2=80=9D alrendszert\n"
-
-#: src/perf/perf.cpp:118
-#, c-format
-msgid "as well as support for trace points in the kernel:\n"
-msgstr "valamint a nyomk=C3=B6vet=C3=A9si pontokra is a rendszermagban:\n"
 =

-#: src/devices/device.cpp:178
+#: src/devices/device.cpp:180
 #, c-format
 msgid "System baseline power is estimated at %sW\n"
 msgstr "%sW a rendszer becs=C3=BClt alapteljes=C3=ADtm=C3=A9nye\n"
 =

-#: src/devices/device.cpp:185
+#: src/devices/device.cpp:187
 msgid "Power est.    Usage     Device name\n"
 msgstr "Becs=C3=BClt telj.   Haszn=C3=A1lat   Eszk=C3=B6z n=C3=A9v\n"
 =

-#: src/devices/device.cpp:187
+#: src/devices/device.cpp:189
 msgid "              Usage     Device name\n"
 msgstr "                Haszn=C3=A1lat   Eszk=C3=B6z n=C3=A9v\n"
 =

-#: src/devices/device.cpp:254
+#: src/devices/device.cpp:256
 #, fuzzy
 msgid "The battery reports a discharge rate of: "
 msgstr "Az akkumul=C3=A1tor %sW kis=C3=BCl=C3=A9si sebess=C3=A9get jelent\=
n"
 =

 #: src/devices/device.cpp:261
+msgid "The power consumed was : "
+msgstr ""
+
+#: src/devices/device.cpp:268
 #, fuzzy
 msgid "The system baseline power is estimated at: "
 msgstr "%sW a rendszer becs=C3=BClt alapteljes=C3=ADtm=C3=A9nye\n"
 =

-#: src/devices/device.cpp:271
+#: src/devices/device.cpp:277 src/process/do_process.cpp:850
+#: src/process/do_process.cpp:852 src/process/do_process.cpp:926
+#: src/process/do_process.cpp:1077
+msgid "Usage"
+msgstr "Haszn=C3=A1lat"
+
+#: src/devices/device.cpp:278
 #, fuzzy
 msgid "Device Name"
 msgstr "Eszk=C3=B6zstatisztika"
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
-msgstr "Hangkodek %s: %s (%s)"
+msgid "Network interface: %s (%s)"
+msgstr "H=C3=A1l=C3=B3zati csatol=C3=B3: %s (%s)"
 =

-#: src/devices/alsa.cpp:79 src/devices/alsa.cpp:81
+#: src/devices/rfkill.cpp:65 src/devices/rfkill.cpp:69
 #, c-format
-msgid "Audio codec %s: %s"
-msgstr "Hangkodek %s: %s"
+msgid "Radio device: %s"
+msgstr "R=C3=A1di=C3=B3s eszk=C3=B6z: %s"
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
+msgstr "Eszk=C3=B6zstatisztika"
+
+#: src/devices/runtime_pm.cpp:241
 #, c-format
 msgid "PCI Device: %s"
 msgstr "PCI eszk=C3=B6z: %s"
 =

-#: src/devices/usb.cpp:50 src/devices/usb.cpp:93 src/devices/usb.cpp:95
+#: src/devices/usb.cpp:51 src/devices/usb.cpp:96 src/devices/usb.cpp:98
 #, c-format
 msgid "USB device: %s"
 msgstr "USB eszk=C3=B6z: %s"
 =

-#: src/devices/usb.cpp:91
+#: src/devices/usb.cpp:94
 #, c-format
 msgid "USB device: %s (%s)"
 msgstr "USB eszk=C3=B6z: %s (%s)"
 =

-#: src/devices/ahci.cpp:154
-#, c-format
-msgid "SATA link: %s"
-msgstr "SATA kapcsolat: %s"
-
-#: src/devices/ahci.cpp:156
-#, c-format
-msgid "SATA disk: %s"
-msgstr "SATA lemez: %s"
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
-msgstr "C0 akt=C3=ADv"
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
-msgstr "R=C3=A1di=C3=B3s eszk=C3=B6z: %s"
-
-#: src/devices/network.cpp:176
-#, c-format
-msgid "Network interface: %s (%s)"
-msgstr "H=C3=A1l=C3=B3zati csatol=C3=B3: %s (%s)"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:48 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Good"
-msgstr "J=C3=B3"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:49 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Bad"
-msgstr "Rossz"
-
-#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
-#: src/tuning/tunable.cpp:50 src/tuning/wifi.cpp:45 src/tuning/runtime.cpp=
:42
-#: src/tuning/tuningusb.cpp:39 src/tuning/tuningsysfs.cpp:45
-msgid "Unknown"
-msgstr "Ismeretlen"
-
-#: src/tuning/bluetooth.cpp:48
-#, c-format
-msgid "Bluetooth device interface status"
-msgstr "Bluetooth eszk=C3=B6zcsatol=C3=B3 =C3=A1llapota"
-
-#: src/tuning/tuning.cpp:62
-msgid "Enable Audio codec power management"
-msgstr "A hang kodek energiagazd=C3=A1lkod=C3=A1s=C3=A1nak enged=C3=A9lyez=
=C3=A9se"
-
-#: src/tuning/tuning.cpp:63
-msgid "NMI watchdog should be turned off"
-msgstr "NMI fel=C3=BCgyeletnek (watchdog) kikapcsolva kellene lennie"
-
-#: src/tuning/tuning.cpp:64
-msgid "Power Aware CPU scheduler"
-msgstr "Teljes=C3=ADtm=C3=A9nyt figyelembevev=C5=91 CPU =C3=BCtemez=C5=91"
-
-#: src/tuning/tuning.cpp:65
-msgid "VM writeback timeout"
-msgstr "VM vissza=C3=ADr=C3=A1s id=C5=91t=C3=BAll=C3=A9p=C3=A9se"
-
-#: src/tuning/tuning.cpp:82
-msgid "Tunables"
-msgstr "Hangol=C3=A1sok"
+#: src/display.cpp:70
+msgid "Overview"
+msgstr "=C3=81ttekint=C3=A9s"
 =

-#: src/tuning/tuning.cpp:82
-msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
-msgstr " <ESC> Kil=C3=A9p=C3=A9s | <Enter> Hangol=C3=A1s =C3=A1tkapcsol=C3=
=A1sa | <r> Ablak friss=C3=ADt=C3=A9se"
+#: src/display.cpp:71
+msgid "Idle stats"
+msgstr "=C3=9Cresj=C3=A1rat-statisztika"
 =

-#: src/tuning/tuning.cpp:244
-msgid "Script"
-msgstr ""
+#: src/display.cpp:72
+msgid "Frequency stats"
+msgstr "Frekvenciastatisztika"
 =

-#: src/tuning/tuning.cpp:258
-msgid "Software Settings in Need of Tuning"
-msgstr ""
+#: src/display.cpp:73
+msgid "Device stats"
+msgstr "Eszk=C3=B6zstatisztika"
 =

-#: src/tuning/tuning.cpp:277
-msgid "Untunable Software Issues"
-msgstr ""
+#: src/display.cpp:131
+msgid "Exit"
+msgstr "Kil=C3=A9p=C3=A9s"
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
-msgstr "Fel=C3=A9bred=C3=A9s h=C3=A1l=C3=B3zati esem=C3=A9nyre (wake-on-la=
n) =C3=A1llapot a(z) %s eszk=C3=B6z=C3=B6n"
-
-#: src/tuning/wifi.cpp:48
-#, c-format
-msgid "Wireless Power Saving for interface %s"
-msgstr "Vezet=C3=A9k n=C3=A9lk=C3=BCli teljes=C3=ADtm=C3=A9nymegtakar=C3=
=ADt=C3=A1s a(z) %s illeszt=C5=91egys=C3=A9gen"
-
-#: src/tuning/runtime.cpp:48
-#, c-format
-msgid "Runtime PM for %s device %s"
-msgstr "Fut=C3=A1sidej=C5=B1 energiagazd=C3=A1lkod=C3=A1s a(z) %s buszon =
=C3=A9s %s eszk=C3=B6z=C3=B6n"
-
-#: src/tuning/runtime.cpp:50
-#, c-format
-msgid "%s device %s has no runtime power management"
-msgstr "A(z) %s busz %s eszk=C3=B6z=C3=A9nek nincs fut=C3=A1sidej=C5=B1 en=
ergiagazd=C3=A1lkod=C3=A1sa"
-
-#: src/tuning/runtime.cpp:74
-#, c-format
-msgid "PCI Device %s has no runtime power management"
-msgstr "A(z) %s PCI eszk=C3=B6znek nincs fut=C3=A1sidej=C5=B1 energiagazd=
=C3=A1lkod=C3=A1sa"
-
-#: src/tuning/runtime.cpp:76
-#, c-format
-msgid "Runtime PM for PCI Device %s"
-msgstr "Fut=C3=A1sidej=C5=B1 energiagazd=C3=A1lkod=C3=A1s a(z) %s PCI eszk=
=C3=B6z=C3=B6n"
-
-#: src/tuning/tuningusb.cpp:54
-#, c-format
-msgid "Autosuspend for unknown USB device %s (%s:%s)"
-msgstr "Automatikus felf=C3=BCggeszt=C3=A9s a(z) %s (%s:%s) ismeretlen USB=
 eszk=C3=B6z=C3=B6n"
-
-#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
-#: src/tuning/tuningusb.cpp:75
-#, c-format
-msgid "Autosuspend for USB device %s [%s]"
-msgstr "Automatikus felf=C3=BCggeszt=C3=A9s a(z) %s [%s] USB eszk=C3=B6z=
=C3=B6n"
-
-#: src/tuning/tuningsysfs.cpp:123
-#, fuzzy, c-format
-msgid "Enable SATA link power management for %s"
-msgstr "SATA link energiaszab=C3=A1lyoz=C3=A1s enged=C3=A9lyez=C3=A9se %s =
sz=C3=A1m=C3=A1ra"
-
-#: src/calibrate/calibrate.cpp:238
+#: src/lib.cpp:288
 #, c-format
-msgid "Cannot create temp file\n"
-msgstr "Nem tudok l=C3=A9trehozni ideiglenes f=C3=A1jlt\n"
+msgid "%7sW"
+msgstr "%7sW"
 =

-#: src/calibrate/calibrate.cpp:258
+#: src/lib.cpp:291
 #, c-format
-msgid "Calibrating: CPU usage on %i threads\n"
-msgstr "Kalibr=C3=A1l=C3=A1s: CPU haszn=C3=A1lts=C3=A1g %i sz=C3=A1lon\n"
-
-#: src/calibrate/calibrate.cpp:273
-#, c-format
-msgid "Calibrating: CPU wakeup power consumption\n"
-msgstr "Kalibr=C3=A1l=C3=A1s: CPU fel=C3=A9bred=C3=A9si teljes=C3=ADtm=C3=
=A9nyfelv=C3=A9tel\n"
+msgid "    0 mW"
+msgstr "    0 mW"
 =

-#: src/calibrate/calibrate.cpp:290
-#, c-format
-msgid "Calibrating USB devices\n"
-msgstr "USB eszk=C3=B6z=C3=B6k kalibr=C3=A1l=C3=A1sa\n"
+#: src/lib.cpp:410
+msgid "PS/2 Touchpad / Keyboard / Mouse"
+msgstr "PS/2 tapipad / billenty=C5=B1zet / eg=C3=A9r"
 =

-#: src/calibrate/calibrate.cpp:292 src/calibrate/calibrate.cpp:309
-#: src/calibrate/calibrate.cpp:317 src/calibrate/calibrate.cpp:334
-#, c-format
-msgid ".... device %s \n"
-msgstr ".... %s eszk=C3=B6z \n"
+#: src/lib.cpp:411
+msgid "SATA controller"
+msgstr "SATA vez=C3=A9rl=C5=91"
 =

-#: src/calibrate/calibrate.cpp:307
-#, c-format
-msgid "Calibrating radio devices\n"
-msgstr "R=C3=A1di=C3=B3s eszk=C3=B6z=C3=B6k kalibr=C3=A1l=C3=A1sa\n"
+#: src/lib.cpp:412
+msgid "Intel built in USB hub"
+msgstr "Be=C3=A9p=C3=ADtett Intel USB hub"
 =

-#: src/calibrate/calibrate.cpp:331
+#: src/lib.cpp:467
 #, c-format
-msgid "Calibrating backlight\n"
-msgstr "H=C3=A1tt=C3=A9rvil=C3=A1g=C3=ADt=C3=A1s kalibr=C3=A1l=C3=A1sa\n"
+msgid "glob returned GLOB_NOSPACE\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:355 src/calibrate/calibrate.cpp:365
+#: src/lib.cpp:471
 #, c-format
-msgid "Calibrating idle\n"
-msgstr "=C3=9Cresj=C3=A1rat kalibr=C3=A1l=C3=A1sa\n"
+msgid "glob returned GLOB_ABORTED\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:378
+#: src/lib.cpp:475
 #, c-format
-msgid "Calibrating: disk usage \n"
-msgstr "Kalibr=C3=A1l=C3=A1s: lemezhaszn=C3=A1lat \n"
-
-#: src/calibrate/calibrate.cpp:403
-msgid "Starting PowerTOP power estimate calibration \n"
-msgstr "PowerTop teljes=C3=ADtm=C3=A9nybecsl=C3=A9s kalibr=C3=A1l=C3=A1s i=
nd=C3=ADt=C3=A1sa \n"
-
-#: src/calibrate/calibrate.cpp:426
-msgid "Finishing PowerTOP power estimate calibration \n"
-msgstr "PowerTop teljes=C3=ADtm=C3=A9nybecsl=C3=A9s-kalibr=C3=A1l=C3=A1s b=
efejez=C3=A9se \n"
+msgid "glob returned GLOB_NOMATCH\n"
+msgstr ""
 =

-#: src/calibrate/calibrate.cpp:430
+#: src/lib.cpp:513 src/lib.cpp:549
 #, c-format
-msgid "Parameters after calibration:\n"
-msgstr "Param=C3=A9terek a kalibr=C3=A1l=C3=A1s ut=C3=A1n:\n"
+msgid ""
+"Model-specific registers (MSR)\t\t\t not found (try enabling "
+"CONFIG_X86_MSR).\n"
+msgstr ""
 =

-#: src/main.cpp:101
+#: src/main.cpp:102
 #, fuzzy, c-format
 msgid "PowerTOP version "
 msgstr "PowerTOP verzi=C3=B3"
 =

-#: src/main.cpp:107
+#: src/main.cpp:108
 msgid "Set refresh time out"
 msgstr "Friss=C3=ADt=C3=A9s id=C5=91korl=C3=A1t letelt=C3=A9nek be=C3=A1ll=
=C3=ADt=C3=A1sa"
 =

-#: src/main.cpp:120
+#: src/main.cpp:121
 msgid "Usage: powertop [OPTIONS]"
 msgstr "Haszn=C3=A1lat: powertop [OPCI=C3=93K]"
 =

-#: src/main.cpp:121
+#: src/main.cpp:122
 msgid "sets all tunable options to their GOOD setting"
 msgstr ""
 =

-#: src/main.cpp:122
+#: src/main.cpp:123
 msgid "runs powertop in calibration mode"
 msgstr "a powertop futtat=C3=A1sa kalibr=C3=A1ci=C3=B3s m=C3=B3dban"
 =

-#: src/main.cpp:123 src/main.cpp:126
+#: src/main.cpp:124 src/main.cpp:127
 msgid "[=3Dfilename]"
 msgstr ""
 =

-#: src/main.cpp:123
+#: src/main.cpp:124
 msgid "generate a csv report"
 msgstr "CSV jelent=C3=A9s k=C3=A9sz=C3=ADt=C3=A9se"
 =

-#: src/main.cpp:124
+#: src/main.cpp:125
 msgid "run in \"debug\" mode"
 msgstr "futtat=C3=A1s hibakeres=C3=A9si m=C3=B3dban"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "[=3Ddevnode]"
 msgstr "[=3Deszk=C3=B6zn=C3=A9v]"
 =

-#: src/main.cpp:125
+#: src/main.cpp:126
 msgid "uses an Extech Power Analyzer for measurements"
 msgstr "Extech Power Analyzer eszk=C3=B6z haszn=C3=A1lata a m=C3=A9r=C3=A9=
sekhez"
 =

-#: src/main.cpp:126
+#: src/main.cpp:127
 msgid "generate a html report"
 msgstr "HTML jelent=C3=A9s k=C3=A9sz=C3=ADt=C3=A9se"
 =

-#: src/main.cpp:127
+#: src/main.cpp:128
 msgid "[=3Diterations] number of times to run each test"
 msgstr "[=3Diter=C3=A1ci=C3=B3k] ennyiszer fusson le minden egyes teszt"
 =

-#: src/main.cpp:128
+#: src/main.cpp:129
 msgid "suppress stderr output"
 msgstr "szabv=C3=A1nyos hibakimenet elnyom=C3=A1sa"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130 src/main.cpp:131
 msgid "[=3Dseconds]"
 msgstr "[=3Dm=C3=A1sodperc]"
 =

-#: src/main.cpp:129
+#: src/main.cpp:130
+msgid "interval for power consumption measurement"
+msgstr ""
+
+#: src/main.cpp:131
 msgid "generate a report for 'x' seconds"
 msgstr "ennyi m=C3=A1sodpercig k=C3=A9sz=C3=BClj=C3=B6n a jelent=C3=A9s"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "[=3Dworkload]"
 msgstr "[=3Dterhel=C3=A9s]"
 =

-#: src/main.cpp:130
+#: src/main.cpp:132
 msgid "file to execute for workload"
 msgstr "v=C3=A9grehajtand=C3=B3 f=C3=A1jl a terhel=C3=A9shez"
 =

-#: src/main.cpp:131
+#: src/main.cpp:133
 msgid "print version information"
 msgstr "verzi=C3=B3-inform=C3=A1ci=C3=B3 ki=C3=ADrat=C3=A1sa"
 =

-#: src/main.cpp:132
+#: src/main.cpp:134
 msgid "print this help menu"
 msgstr "e s=C3=BAg=C3=B3 ki=C3=ADrat=C3=A1sa"
 =

-#: src/main.cpp:134
+#: src/main.cpp:136
 #, fuzzy
 msgid "For more help please refer to the 'man 8 powertop'"
 msgstr "Tov=C3=A1bbi inform=C3=A1ci=C3=B3k a README f=C3=A1jlban tal=C3=A1=
lhat=C3=B3k"
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
 msgstr "Nincs el=C3=A9g mem=C3=B3ria a PowerTOP-nak. A PowerTOP fut=C3=A1s=
a megszakad"
 =

-#: src/main.cpp:265
+#: src/main.cpp:296
 #, c-format
 msgid "Preparing to take measurements\n"
 msgstr "El=C5=91k=C3=A9sz=C3=BCl=C3=A9s a m=C3=A9r=C3=A9sek elv=C3=A9gz=C3=
=A9s=C3=A9hez\n"
 =

-#: src/main.cpp:270
+#: src/main.cpp:301
 #, c-format
 msgid "Taking %d measurement(s) for a duration of %d second(s) each.\n"
 msgstr "%d darab, egyenk=C3=A9nt %d m=C3=A1sodperces m=C3=A9r=C3=A9s k=C3=
=A9sz=C3=ADt=C3=A9se.\n"
 =

-#: src/main.cpp:272
+#: src/main.cpp:303
 #, c-format
 msgid "Measuring workload %s.\n"
 msgstr "Terhel=C3=A9s m=C3=A9r=C3=A9se %s.\n"
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
 msgstr "kil=C3=A9p=C3=A9s...\n"
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
 msgstr "Nem tudtam csatolni a debugfs-t!\n"
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
 msgstr "A PowerTOP elhagy=C3=A1sa"
 =

+#: src/parameters/persistent.cpp:46 src/parameters/persistent.cpp:155
+msgid "Cannot save to file"
+msgstr "Nem lehet elmenteni a f=C3=A1jlba "
+
+#: src/parameters/persistent.cpp:89 src/parameters/persistent.cpp:180
+msgid "Cannot load from file"
+msgstr "Nem lehet bet=C3=B6lteni a f=C3=A1jlb=C3=B3l"
+
+#: src/parameters/persistent.cpp:138
+#, c-format
+msgid "Loaded %i prior measurements\n"
+msgstr "%i kor=C3=A1bbi m=C3=A9r=C3=A9s bet=C3=B6ltve\n"
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
+msgstr ""
+"A PowerTOP %s verzi=C3=B3j=C3=A1nak sz=C3=BCks=C3=A9ge van arra, hogy a r=
endszermag t=C3=A1mogassa a "
+"=E2=80=9Eperf=E2=80=9D alrendszert\n"
+
+#: src/perf/perf.cpp:118
+#, c-format
+msgid "as well as support for trace points in the kernel:\n"
+msgstr "valamint a nyomk=C3=B6vet=C3=A9si pontokra is a rendszermagban:\n"
+
+#: src/process/do_process.cpp:819
+#, c-format
+msgid ""
+"Estimated power: %5.1f    Measured power: %5.1f    Sum: %5.1f\n"
+"\n"
+msgstr ""
+"Becs=C3=BClt teljes=C3=ADtm=C3=A9ny: %5.1f    M=C3=A9rt teljes=C3=ADtm=C3=
=A9ny: %5.1f    =C3=96sszeg: %5.1f\n"
+"\n"
+
+#: src/process/do_process.cpp:838
+#, c-format
+msgid "The estimated remaining time is %i hours, %i minutes\n"
+msgstr "Becs=C3=BClt h=C3=A1tral=C3=A9v=C5=91 id=C5=91 %i =C3=B3ra %i perc=
\n"
+
+#: src/process/do_process.cpp:846
+msgid "Summary"
+msgstr "=C3=96sszefoglal=C3=A1s"
+
+#: src/process/do_process.cpp:846
+msgid "wakeups/second"
+msgstr "fel=C3=A9bred=C3=A9s/m=C3=A1sodperc"
+
+#: src/process/do_process.cpp:846
+msgid "GPU ops/seconds"
+msgstr "GPU m=C5=B1velet/m=C3=A1sodperc"
+
+#: src/process/do_process.cpp:846
+msgid "VFS ops/sec and"
+msgstr "VFS m=C5=B1velet/m=C3=A1sodperc"
+
+#: src/process/do_process.cpp:846
+msgid "CPU use"
+msgstr "CPU haszn=C3=A1lts=C3=A1g"
+
+#: src/process/do_process.cpp:850
+msgid "Power est."
+msgstr "Becs=C3=BClt telj."
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:1078
+msgid "Events/s"
+msgstr "Esem=C3=A9ny/s"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:931 src/process/do_process.cpp:1079
+msgid "Category"
+msgstr "Kateg=C3=B3ria"
+
+#: src/process/do_process.cpp:850 src/process/do_process.cpp:852
+#: src/process/do_process.cpp:932 src/process/do_process.cpp:1080
+#: src/tuning/tuning.cpp:243 src/tuning/tuning.cpp:271
+#: src/tuning/tuning.cpp:289
+msgid "Description"
+msgstr "Le=C3=ADr=C3=A1s"
+
+#: src/process/do_process.cpp:927
+msgid "Wakeups/s"
+msgstr "Fel=C3=A9bred=C3=A9s/s"
+
+#: src/process/do_process.cpp:928
+msgid "GPU ops/s"
+msgstr "GPU m=C5=B1velet/s"
+
+#: src/process/do_process.cpp:929
+msgid "Disk IO/s"
+msgstr "Lemez BK/s"
+
+#: src/process/do_process.cpp:930
+msgid "GFX Wakeups/s"
+msgstr "GFX fel=C3=A9bred=C3=A9s/s"
+
+#: src/process/do_process.cpp:1017
+msgid "Overview of Software Power Consumers"
+msgstr "Szofver teljes=C3=ADtm=C3=A9nyfogyaszt=C3=B3k =C3=A1ttekint=C3=A9s=
e"
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
+msgstr "Fel=C3=A9bred=C3=A9s/s"
+
+#: src/process/do_process.cpp:1062
+msgid "CPU: "
+msgstr ""
+
+#: src/process/do_process.cpp:1064
+#, fuzzy, c-format
+msgid "\\% usage"
+msgstr "Haszn=C3=A1lat"
+
+#: src/process/do_process.cpp:1065
+msgid "GPU:"
+msgstr ""
+
+#: src/process/do_process.cpp:1067 src/process/do_process.cpp:1073
+#, fuzzy
+msgid " ops/s"
+msgstr "GPU m=C5=B1velet/s"
+
+#: src/process/do_process.cpp:1068
+msgid "GFX:"
+msgstr ""
+
+#: src/process/do_process.cpp:1070
+#, fuzzy
+msgid " wakeups/s"
+msgstr "Fel=C3=A9bred=C3=A9s/s"
+
+#: src/process/do_process.cpp:1071
+msgid "VFS:"
+msgstr ""
+
+#: src/process/do_process.cpp:1139
+#, fuzzy
+msgid "Top 10 Power Consumers"
+msgstr "Szofver teljes=C3=ADtm=C3=A9nyfogyaszt=C3=B3k =C3=A1ttekint=C3=A9s=
e"
+
 #: src/report/report.cpp:122
 #, fuzzy
 msgid "PowerTOP Version"
@@ -838,6 +790,131 @@ msgstr "Nem tudok l=C3=A9trehozni ideiglenes f=C3=A1j=
lt\n"
 msgid "PowerTOP outputing using base filename %s\n"
 msgstr ""
 =

+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:49
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Good"
+msgstr "J=C3=B3"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:50
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Bad"
+msgstr "Rossz"
+
+#: src/tuning/bluetooth.cpp:46 src/tuning/ethernet.cpp:50
+#: src/tuning/runtime.cpp:42 src/tuning/tunable.cpp:51
+#: src/tuning/tuningi2c.cpp:35 src/tuning/tuningsysfs.cpp:45
+#: src/tuning/tuningusb.cpp:39 src/tuning/wifi.cpp:45
+msgid "Unknown"
+msgstr "Ismeretlen"
+
+#: src/tuning/bluetooth.cpp:48
+#, c-format
+msgid "Bluetooth device interface status"
+msgstr "Bluetooth eszk=C3=B6zcsatol=C3=B3 =C3=A1llapota"
+
+#: src/tuning/ethernet.cpp:54
+#, c-format
+msgid "Wake-on-lan status for device %s"
+msgstr "Fel=C3=A9bred=C3=A9s h=C3=A1l=C3=B3zati esem=C3=A9nyre (wake-on-la=
n) =C3=A1llapot a(z) %s eszk=C3=B6z=C3=B6n"
+
+#: src/tuning/runtime.cpp:48
+#, c-format
+msgid "Runtime PM for %s device %s"
+msgstr "Fut=C3=A1sidej=C5=B1 energiagazd=C3=A1lkod=C3=A1s a(z) %s buszon =
=C3=A9s %s eszk=C3=B6z=C3=B6n"
+
+#: src/tuning/runtime.cpp:50
+#, c-format
+msgid "%s device %s has no runtime power management"
+msgstr "A(z) %s busz %s eszk=C3=B6z=C3=A9nek nincs fut=C3=A1sidej=C5=B1 en=
ergiagazd=C3=A1lkod=C3=A1sa"
+
+#: src/tuning/runtime.cpp:74
+#, c-format
+msgid "PCI Device %s has no runtime power management"
+msgstr "A(z) %s PCI eszk=C3=B6znek nincs fut=C3=A1sidej=C5=B1 energiagazd=
=C3=A1lkod=C3=A1sa"
+
+#: src/tuning/runtime.cpp:76
+#, c-format
+msgid "Runtime PM for PCI Device %s"
+msgstr "Fut=C3=A1sidej=C5=B1 energiagazd=C3=A1lkod=C3=A1s a(z) %s PCI eszk=
=C3=B6z=C3=B6n"
+
+#: src/tuning/tuning.cpp:62
+msgid "Enable Audio codec power management"
+msgstr "A hang kodek energiagazd=C3=A1lkod=C3=A1s=C3=A1nak enged=C3=A9lyez=
=C3=A9se"
+
+#: src/tuning/tuning.cpp:63
+msgid "NMI watchdog should be turned off"
+msgstr "NMI fel=C3=BCgyeletnek (watchdog) kikapcsolva kellene lennie"
+
+#: src/tuning/tuning.cpp:64
+msgid "Power Aware CPU scheduler"
+msgstr "Teljes=C3=ADtm=C3=A9nyt figyelembevev=C5=91 CPU =C3=BCtemez=C5=91"
+
+#: src/tuning/tuning.cpp:65
+msgid "VM writeback timeout"
+msgstr "VM vissza=C3=ADr=C3=A1s id=C5=91t=C3=BAll=C3=A9p=C3=A9se"
+
+#: src/tuning/tuning.cpp:82
+msgid "Tunables"
+msgstr "Hangol=C3=A1sok"
+
+#: src/tuning/tuning.cpp:82
+msgid " <ESC> Exit | <Enter> Toggle tunable | <r> Window refresh"
+msgstr " <ESC> Kil=C3=A9p=C3=A9s | <Enter> Hangol=C3=A1s =C3=A1tkapcsol=C3=
=A1sa | <r> Ablak friss=C3=ADt=C3=A9se"
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
+msgstr "Fut=C3=A1sidej=C5=B1 energiagazd=C3=A1lkod=C3=A1s a(z) %s buszon =
=C3=A9s %s eszk=C3=B6z=C3=B6n"
+
+#: src/tuning/tuningi2c.cpp:59
+#, fuzzy, c-format
+msgid "I2C %s %s has no runtime power management"
+msgstr "A(z) %s busz %s eszk=C3=B6z=C3=A9nek nincs fut=C3=A1sidej=C5=B1 en=
ergiagazd=C3=A1lkod=C3=A1sa"
+
+#: src/tuning/tuningsysfs.cpp:123
+#, fuzzy, c-format
+msgid "Enable SATA link power management for %s"
+msgstr "SATA link energiaszab=C3=A1lyoz=C3=A1s enged=C3=A9lyez=C3=A9se %s =
sz=C3=A1m=C3=A1ra"
+
+#: src/tuning/tuningusb.cpp:54
+#, c-format
+msgid "Autosuspend for unknown USB device %s (%s:%s)"
+msgstr "Automatikus felf=C3=BCggeszt=C3=A9s a(z) %s (%s:%s) ismeretlen USB=
 eszk=C3=B6z=C3=B6n"
+
+#: src/tuning/tuningusb.cpp:71 src/tuning/tuningusb.cpp:73
+#: src/tuning/tuningusb.cpp:75
+#, c-format
+msgid "Autosuspend for USB device %s [%s]"
+msgstr "Automatikus felf=C3=BCggeszt=C3=A9s a(z) %s [%s] USB eszk=C3=B6z=
=C3=B6n"
+
+#: src/tuning/wifi.cpp:48
+#, c-format
+msgid "Wireless Power Saving for interface %s"
+msgstr "Vezet=C3=A9k n=C3=A9lk=C3=BCli teljes=C3=ADtm=C3=A9nymegtakar=C3=
=ADt=C3=A1s a(z) %s illeszt=C5=91egys=C3=A9gen"
+
+#~ msgid "Actual"
+#~ msgstr "Aktu=C3=A1lis"
+
 #, fuzzy
 #~ msgid "I2C Device: %s"
 #~ msgstr "PCI eszk=C3=B6z: %s"
-- =

1.8.3.1


--===============3004463531618143006==--

