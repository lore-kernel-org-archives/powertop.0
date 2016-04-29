Content-Type: multipart/mixed; boundary="===============3849589757507089057=="
MIME-Version: 1.0
From: xiechj at mail2.sysu.edu.cn
Subject: [Powertop] [PATCH] Throw error message when system cmd returns
 Non-zero value.
Date: Fri, 29 Apr 2016 22:05:12 +0800
Message-ID: <1461938712-1162-1-git-send-email-xiechj@mail2.sysu.edu.cn>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3849589757507089057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Madper Xie <madper.xie(a)canonical.com>

hciconfig returns 0 when succeed.
Signed-off-by: Madper Xie <madper.xie(a)canonical.com>
---
 src/tuning/bluetooth.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
index dab46d7..2958849 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -176,11 +176,11 @@ void bt_tunable::toggle(void)
 	good =3D good_bad();
 =

 	if (good =3D=3D TUNE_GOOD) {
-		if(!system("/usr/sbin/hciconfig hci0 up &> /dev/null &"))
+		if(system("/usr/sbin/hciconfig hci0 up &> /dev/null &"))
 			printf("System is not available\n");
 		return;
 	}
-	if(!system("/usr/sbin/hciconfig hci0 down &> /dev/null"))
+	if(system("/usr/sbin/hciconfig hci0 down &> /dev/null"))
 		printf("System is not available\n");
 }
 =

-- =

2.7.4




--===============3849589757507089057==--

