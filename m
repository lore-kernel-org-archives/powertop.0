Content-Type: multipart/mixed; boundary="===============3078108426155094980=="
MIME-Version: 1.0
From: Sergey Alirzaev <zl29ah at gmail.com>
Subject: [Powertop] [PATCH] calibrate: do not override DISPLAY env var on xset
Date: Thu, 16 Aug 2018 19:55:55 +0300
Message-ID: <20180816165555.13751-1-zl29ah@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3078108426155094980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

since X may live on another display, and the variable exists for this
very case
---
 src/calibrate/calibrate.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index 745d544..4efb5a6 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -353,20 +353,20 @@ static void backlight_calibration(void)
 		sleep(1);
 	}
 	printf(_("Calibrating idle\n"));
-	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force off"))
+	if(!system("/usr/bin/xset dpms force off"))
 		printf("System is not available\n");
 	one_measurement(15, 15, NULL);
-	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force on"))
+	if(!system("/usr/bin/xset dpms force on"))
 		printf("System is not available\n");
 }
 =

 static void idle_calibration(void)
 {
 	printf(_("Calibrating idle\n"));
-	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force off"))
+	if(!system("/usr/bin/xset dpms force off"))
 		printf("System is not available\n");
 	one_measurement(15, 15, NULL);
-	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force on"))
+	if(!system("/usr/bin/xset dpms force on"))
 		printf("System is not available\n");
 }
 =

-- =

2.18.0


--===============3078108426155094980==--

