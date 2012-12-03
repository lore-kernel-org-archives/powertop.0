Content-Type: multipart/mixed; boundary="===============2778512398725706117=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH 2/3] Suppress compiler warnings on system()
Date: Tue, 04 Dec 2012 00:13:19 +0900
Message-ID: <1354547600-1743-2-git-send-email-namhyung@gmail.com>
In-Reply-To: 1354547600-1743-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2778512398725706117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As system(3) requires to check its return value, make a wrapper
do_system() to suppress following warnings:

  CXX    tuning/powertop-bluetooth.o
tuning/bluetooth.cpp: In member function =E2=80=98virtual void bt_tunable::=
toggle()=E2=80=99:
tuning/bluetooth.cpp:179: warning: ignoring return value of =E2=80=98int sy=
stem(const char*)=E2=80=99, declared with attribute warn_unused_result
tuning/bluetooth.cpp:182: warning: ignoring return value of =E2=80=98int sy=
stem(const char*)=E2=80=99, declared with attribute warn_unused_result
  CXX    tuning/powertop-cpufreq.o
tuning/cpufreq.cpp: In member function =E2=80=98virtual void cpufreq_tunabl=
e::toggle()=E2=80=99:
tuning/cpufreq.cpp:118: warning: ignoring return value of =E2=80=98int syst=
em(const char*)=E2=80=99, declared with attribute warn_unused_result
...
  CXX    calibrate/powertop-calibrate.o
calibrate/calibrate.cpp: In function =E2=80=98void backlight_calibration()=
=E2=80=99:
calibrate/calibrate.cpp:408: warning: ignoring return value of =E2=80=98int=
 system(const char*)=E2=80=99, declared with attribute warn_unused_result
calibrate/calibrate.cpp:410: warning: ignoring return value of =E2=80=98int=
 system(const char*)=E2=80=99, declared with attribute warn_unused_result
calibrate/calibrate.cpp: In function =E2=80=98void idle_calibration()=E2=80=
=99:
calibrate/calibrate.cpp:416: warning: ignoring return value of =E2=80=98int=
 system(const char*)=E2=80=99, declared with attribute warn_unused_result
calibrate/calibrate.cpp:418: warning: ignoring return value of =E2=80=98int=
 system(const char*)=E2=80=99, declared with attribute warn_unused_result

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/calibrate/calibrate.cpp |    8 ++++----
 src/lib.cpp                 |    5 +++++
 src/lib.h                   |    1 +
 src/tuning/bluetooth.cpp    |    4 ++--
 src/tuning/cpufreq.cpp      |    2 +-
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index 2d4c1af..c886b73 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -406,17 +406,17 @@ static void backlight_calibration(void)
 		sleep(1);
 	}
 	printf(_("Calibrating idle\n"));
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
+	do_system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
 	one_measurement(15, NULL);
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
+	do_system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
 }
 =

 static void idle_calibration(void)
 {
 	printf(_("Calibrating idle\n"));
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
+	do_system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
 	one_measurement(15, NULL);
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
+	do_system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
 }
 =

 =

diff --git a/src/lib.cpp b/src/lib.cpp
index 9838c0b..ccba414 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -441,3 +441,8 @@ int get_user_input(char *buf, unsigned sz)
 	/* to distinguish between getnstr error and empty line */
 	return ret || strlen(buf);
 }
+
+int do_system(const char *command)
+{
+	return system(command); /* make gcc slient */
+}
diff --git a/src/lib.h b/src/lib.h
index 209421a..7002f14 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -73,5 +73,6 @@ typedef void (*callback)(const char*);
 extern void process_directory(const char *d_name, callback fn);
 extern int utf_ok;
 extern int get_user_input(char *buf, unsigned sz);
+extern int do_system(const char *cmd);
 =

 #endif
diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
index e0bdf12..b717610 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -176,10 +176,10 @@ void bt_tunable::toggle(void)
 	good =3D good_bad();
 =

 	if (good =3D=3D TUNE_GOOD) {
-		system("/usr/sbin/hciconfig hci0 up &> /dev/null &");
+		do_system("/usr/sbin/hciconfig hci0 up &> /dev/null &");
 		return;
 	}
-	system("/usr/sbin/hciconfig hci0 down &> /dev/null");
+	do_system("/usr/sbin/hciconfig hci0 down &> /dev/null");
 }
 =

 const char *bt_tunable::toggle_script(void)
diff --git a/src/tuning/cpufreq.cpp b/src/tuning/cpufreq.cpp
index df245ad..8a8d1c5 100644
--- a/src/tuning/cpufreq.cpp
+++ b/src/tuning/cpufreq.cpp
@@ -115,7 +115,7 @@ void cpufreq_tunable::toggle(void)
 	int good;
 	good =3D good_bad();
 =

-	system("/sbin/modprobe cpufreq_ondemand > /dev/null 2>&1");
+	do_system("/sbin/modprobe cpufreq_ondemand > /dev/null 2>&1");
 =

 	if (good =3D=3D TUNE_GOOD) {
 		dir =3D opendir("/sys/devices/system/cpu");
-- =

1.7.9.2


--===============2778512398725706117==--

