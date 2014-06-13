Content-Type: multipart/mixed; boundary="===============9074753213537555578=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 1/3] fix-warnings: Ignoring return value of system()
Date: Fri, 13 Jun 2014 15:18:27 -0700
Message-ID: <1402697910-29154-2-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1402697910-29154-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9074753213537555578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added error handling to system() for  bluetooth.cpp.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/tuning/bluetooth.cpp |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
index 2b34277..92f5835 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -176,10 +176,12 @@ void bt_tunable::toggle(void)
 	good =3D good_bad();
 =

 	if (good =3D=3D TUNE_GOOD) {
-		system("/usr/sbin/hciconfig hci0 up &> /dev/null &");
+		if(!system("/usr/sbin/hciconfig hci0 up &> /dev/null &"))
+			printf("System is not available\n");
 		return;
 	}
-	system("/usr/sbin/hciconfig hci0 down &> /dev/null");
+	if(!system("/usr/sbin/hciconfig hci0 down &> /dev/null"))
+		printf("System is not available\n");
 }
 =

 const char *bt_tunable::toggle_script(void)
-- =

1.7.9.5


--===============9074753213537555578==--

