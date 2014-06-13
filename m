Content-Type: multipart/mixed; boundary="===============2033701008300933049=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 2/3] fix-warnings: Ignoring return value
Date: Fri, 13 Jun 2014 15:18:28 -0700
Message-ID: <1402697910-29154-3-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1402697910-29154-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2033701008300933049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added error handling to system() and write() calls.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/calibrate/calibrate.cpp |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index db368e0..a9a0a7c 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -33,6 +33,7 @@
 #include <pthread.h>
 #include <math.h>
 #include <sys/types.h>
+#include <errno.h>
 =

 #include "../parameters/parameters.h"
 extern "C" {
@@ -239,7 +240,8 @@ static void *burn_disk(void *dummy)
 =

 	while (!stop_measurement) {
 		lseek(fd, 0, SEEK_SET);
-		write(fd, buffer, 64*1024);
+		if(write(fd, buffer, 64*1024) =3D=3D -1)
+			printf("Error: %s\n", strerror(errno));
 		fdatasync(fd);
 	}
 	close(fd);
@@ -350,17 +352,21 @@ static void backlight_calibration(void)
 		sleep(1);
 	}
 	printf(_("Calibrating idle\n"));
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
+	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force off"))
+		printf("System is not available\n");
 	one_measurement(15, NULL);
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
+	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force on"))
+		printf("System is not available\n");
 }
 =

 static void idle_calibration(void)
 {
 	printf(_("Calibrating idle\n"));
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
+	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force off"))
+		printf("System is not available\n");
 	one_measurement(15, NULL);
-	system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
+	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force on"))
+		printf("System is not available\n");
 }
 =

 =

-- =

1.7.9.5


--===============2033701008300933049==--

