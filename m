Content-Type: multipart/mixed; boundary="===============1455187769673351821=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Fix screen DPMS support detection
Date: Mon, 13 Aug 2012 20:41:32 +0400
Message-ID: <1344876092-13807-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1455187769673351821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Consider DPMS disabled when we can't open /sys/class/drm/card0 directory.
---
 src/devices/backlight.cpp |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
index b8c9147..c0219f3 100644
--- a/src/devices/backlight.cpp
+++ b/src/devices/backlight.cpp
@@ -84,7 +84,7 @@ static int dpms_screen_on(void)
 =

 	dir =3D opendir("/sys/class/drm/card0");
 	if (!dir)
-		return 1;
+		return 0;
 	while (1) {
 		entry =3D readdir(dir);
 		if (!entry)
-- =

1.7.5.4


--===============1455187769673351821==--

