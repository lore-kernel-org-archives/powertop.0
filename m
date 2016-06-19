Content-Type: multipart/mixed; boundary="===============0171273332567432642=="
MIME-Version: 1.0
From: Oleg Drokin <green at linuxhacker.ru>
Subject: [Powertop] [PATCH] Fix misaligned curly brace
Date: Sat, 18 Jun 2016 21:20:21 -0400
Message-ID: <1466299221-1181246-1-git-send-email-green@linuxhacker.ru>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0171273332567432642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This brace makes it look like the wrong block is beign closed
causing some confusion for the reader.

Signed-off-by: Oleg Drokin <green(a)linuxhacker.ru>
---
 src/devlist.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/devlist.cpp b/src/devlist.cpp
index e6a4f4c..70ae70e 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -196,7 +196,7 @@ int charge_device_to_openers(const char *devstring, dou=
ble power, class device *
 	for (i =3D 0; i < one.size(); i++) {
 		if (strstr(one[i]->device, devstring))
 			openers++;
-		}
+	}
 	for (i =3D 0; i < two.size(); i++) {
 		if (strstr(two[i]->device, devstring))
 			openers++;
-- =

2.7.4


--===============0171273332567432642==--

