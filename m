Content-Type: multipart/mixed; boundary="===============8287523533208508896=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH] po: update translation files and template
Date: Fri, 17 Apr 2020 10:00:46 -0700
Message-ID: <20200417170046.21048-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8287523533208508896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Use gettext makefile script to update all translation files in
preparation for next release.

The template (POT) file need not be manually updated as we did in an
earlier commit, so let gettext update it without manual intervention.

Fixes: 4da1908824f6 ("powertop.pot: Update powertop.pot")
Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/ca.po        | 14 +++++++-------
 po/cs_CZ.po     | 14 +++++++-------
 po/de_DE.po     | 14 +++++++-------
 po/en_GB.po     | 14 +++++++-------
 po/en_US.po     | 14 +++++++-------
 po/es_ES.po     | 14 +++++++-------
 po/hu_HU.po     | 14 +++++++-------
 po/id_ID.po     | 14 +++++++-------
 po/nl_NL.po     | 14 +++++++-------
 po/powertop.pot | 12 ++++++------
 po/zh_TW.po     | 14 +++++++-------
 11 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/po/ca.po b/po/ca.po
index 2c824e2a97c5..acfacfa69432 100644
--- a/po/ca.po
+++ b/po/ca.po
@@ -10,7 +10,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Catalan (http://www.transifex.com/projects/p/PowerTOP/"
@@ -98,7 +98,7 @@ msgstr ""
 msgid " Core(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr ""
@@ -175,7 +175,7 @@ msgstr "C0 sondejant"
 msgid " CPU(OS) %i"
 msgstr ""
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr ""
@@ -190,21 +190,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 actiu"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/cs_CZ.po b/po/cs_CZ.po
index 731f3697d50c..6386c0c34c16 100644
--- a/po/cs_CZ.po
+++ b/po/cs_CZ.po
@@ -9,7 +9,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Czech (Czech Republic) (http://www.transifex.com/projects/=
p/"
@@ -97,7 +97,7 @@ msgstr "  J=C3=A1dro"
 msgid " Core(OS)"
 msgstr "  J=C3=A1dro"
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr "  J=C3=A1dro"
@@ -177,7 +177,7 @@ msgstr "C0 sd=C3=ADlen=C3=AD"
 msgid " CPU(OS) %i"
 msgstr " CPU %i"
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr " CPU %i"
@@ -192,21 +192,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr "  Bal=C3=AD=C4=8Dek"
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 aktivn=C3=AD"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/de_DE.po b/po/de_DE.po
index dcf675856900..60506d44a858 100644
--- a/po/de_DE.po
+++ b/po/de_DE.po
@@ -10,7 +10,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 19:48+0000\n"
 "Last-Translator: Ettore Atalan <atalanttore(a)googlemail.com>\n"
 "Language-Team: German (Germany) (http://www.transifex.com/projects/p/"
@@ -98,7 +98,7 @@ msgstr "Kern"
 msgid " Core(OS)"
 msgstr "Kern"
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr "Kern"
@@ -176,7 +176,7 @@ msgstr "C0 sammeln"
 msgid " CPU(OS) %i"
 msgstr "CPU %i"
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr "CPU %i"
@@ -191,21 +191,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr "Paket"
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 aktiv"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/en_GB.po b/po/en_GB.po
index 6f9e94930e03..aa569d8250d2 100644
--- a/po/en_GB.po
+++ b/po/en_GB.po
@@ -9,7 +9,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: English (United Kingdom) (http://www.transifex.com/project=
s/p/"
@@ -97,7 +97,7 @@ msgstr ""
 msgid " Core(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr ""
@@ -174,7 +174,7 @@ msgstr "C0 polling"
 msgid " CPU(OS) %i"
 msgstr ""
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr ""
@@ -189,21 +189,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 active"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/en_US.po b/po/en_US.po
index 3ce213f2af25..8b4ce6427a93 100644
--- a/po/en_US.po
+++ b/po/en_US.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: English (United States) (http://www.transifex.com/projects=
/p/"
@@ -96,7 +96,7 @@ msgstr ""
 msgid " Core(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr ""
@@ -173,7 +173,7 @@ msgstr "C0 polling"
 msgid " CPU(OS) %i"
 msgstr ""
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr ""
@@ -188,21 +188,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 active"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/es_ES.po b/po/es_ES.po
index a862f65fa6ee..0716523a3b53 100644
--- a/po/es_ES.po
+++ b/po/es_ES.po
@@ -9,7 +9,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Spanish (Spain) (http://www.transifex.com/projects/p/Power=
TOP/"
@@ -97,7 +97,7 @@ msgstr ""
 msgid " Core(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr ""
@@ -175,7 +175,7 @@ msgstr "C0 sondeando"
 msgid " CPU(OS) %i"
 msgstr ""
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr ""
@@ -190,21 +190,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 activo"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/hu_HU.po b/po/hu_HU.po
index 12bd29021a5b..dded3143ff5e 100644
--- a/po/hu_HU.po
+++ b/po/hu_HU.po
@@ -11,7 +11,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Hungarian (Hungary) (http://www.transifex.com/projects/p/"
@@ -99,7 +99,7 @@ msgstr ""
 msgid " Core(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr ""
@@ -177,7 +177,7 @@ msgstr "C0 ciklikus lek=C3=A9rdez=C3=A9s"
 msgid " CPU(OS) %i"
 msgstr ""
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr ""
@@ -192,21 +192,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 akt=C3=ADv"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/id_ID.po b/po/id_ID.po
index 994413567cd0..2ccefe790eb3 100644
--- a/po/id_ID.po
+++ b/po/id_ID.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Indonesian (Indonesia) (http://www.transifex.com/projects/=
p/"
@@ -96,7 +96,7 @@ msgstr "  Core"
 msgid " Core(OS)"
 msgstr "  Core"
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr "  Core"
@@ -174,7 +174,7 @@ msgstr "C0 polling"
 msgid " CPU(OS) %i"
 msgstr " CPU %i"
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr " CPU %i"
@@ -189,21 +189,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr "Paket"
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 aktif"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/nl_NL.po b/po/nl_NL.po
index aa5237818c40..7986de5b26fc 100644
--- a/po/nl_NL.po
+++ b/po/nl_NL.po
@@ -9,7 +9,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Dutch (Netherlands) (http://www.transifex.com/projects/p/"
@@ -97,7 +97,7 @@ msgstr ""
 msgid " Core(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr ""
@@ -174,7 +174,7 @@ msgstr "C0 polling"
 msgid " CPU(OS) %i"
 msgstr ""
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr ""
@@ -189,21 +189,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 active"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
diff --git a/po/powertop.pot b/po/powertop.pot
index 7e19e080fbbf..caad4750d758 100644
--- a/po/powertop.pot
+++ b/po/powertop.pot
@@ -1,17 +1,17 @@
-# PowerTOP
-# Copyright (C) 2020 Intel Corporation
+# SOME DESCRIPTIVE TITLE.
+# Copyright (C) YEAR Intel Corporation
 # This file is distributed under the same license as the powertop package.
-# Arjan van de Ven <arjan(a)linux.intel.com>, 2010.
+# FIRST AUTHOR <EMAIL(a)ADDRESS>, YEAR.
 #
 #, fuzzy
 msgid ""
 msgstr ""
-"Project-Id-Version: PowerTOP 2.12-rc1\n"
+"Project-Id-Version: powertop 2.12-rc1\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2020-04-02 14:20-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
 "Last-Translator: FULL NAME <EMAIL(a)ADDRESS>\n"
-"Language-Team: powertop(a)lists.01.org\n"
+"Language-Team: LANGUAGE <LL(a)li.org>\n"
 "Language: \n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DCHARSET\n"
diff --git a/po/zh_TW.po b/po/zh_TW.po
index 0d248044949e..6f1a5c90fd28 100644
--- a/po/zh_TW.po
+++ b/po/zh_TW.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PowerTOP\n"
 "Report-Msgid-Bugs-To: \"powertop(a)lists.01.org\"\n"
-"POT-Creation-Date: 2019-09-26 15:56-0700\n"
+"POT-Creation-Date: 2020-04-17 09:26-0700\n"
 "PO-Revision-Date: 2013-11-05 08:40+0000\n"
 "Last-Translator: Margie Foster <margie(a)linux.intel.com>\n"
 "Language-Team: Chinese (Taiwan) (http://www.transifex.com/projects/p/"
@@ -96,7 +96,7 @@ msgstr "  =E6=A0=B8=E5=BF=83"
 msgid " Core(OS)"
 msgstr "  =E6=A0=B8=E5=BF=83"
 =

-#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:336
+#: src/cpu/cpu_core.cpp:91 src/cpu/intel_cpus.cpp:344
 #, c-format
 msgid "  Core"
 msgstr "  =E6=A0=B8=E5=BF=83"
@@ -174,7 +174,7 @@ msgstr "C0 =E8=BC=AA=E5=B7=A1"
 msgid " CPU(OS) %i"
 msgstr " CPU %i"
 =

-#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:675
+#: src/cpu/cpu_linux.cpp:341 src/cpu/intel_cpus.cpp:691
 #, c-format
 msgid " CPU %i"
 msgstr " CPU %i"
@@ -189,21 +189,21 @@ msgstr ""
 msgid " Pkg(OS)"
 msgstr ""
 =

-#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:436
+#: src/cpu/cpu_package.cpp:104 src/cpu/intel_cpus.cpp:452
 #, c-format
 msgid "  Package"
 msgstr "=E4=BB=A3=E8=99=9F"
 =

-#: src/cpu/intel_cpus.cpp:135
+#: src/cpu/intel_cpus.cpp:139
 #, c-format
 msgid "read_msr cpu%d 0x%llx : "
 msgstr ""
 =

-#: src/cpu/intel_cpus.cpp:598
+#: src/cpu/intel_cpus.cpp:614
 msgid "C0 active"
 msgstr "C0 =E9=81=8B=E4=BD=9C=E4=B8=AD"
 =

-#: src/cpu/intel_cpus.cpp:656
+#: src/cpu/intel_cpus.cpp:672
 #, c-format
 msgid "Average"
 msgstr ""
-- =

2.26.0

--===============8287523533208508896==--

