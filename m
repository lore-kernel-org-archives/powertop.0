Content-Type: multipart/mixed; boundary="===============2647459747311794689=="
MIME-Version: 1.0
From: Daniel Kahn Gillmor <dkg at fifthhorseman.net>
Subject: [Powertop] [PATCH] Correct script for tuning wifi power_save with iw
Date: Thu, 13 Dec 2012 23:52:59 -0500
Message-ID: <1355460779-23060-1-git-send-email-dkg@fifthhorseman.net>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2647459747311794689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The logic for the script to run to fix the power_save state of a
wireless device was inverted.

Signed-off-by: Daniel Kahn Gillmor <dkg(a)fifthhorseman.net>
---
 src/tuning/wifi.cpp |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tuning/wifi.cpp b/src/tuning/wifi.cpp
index 38d9be6..77cdfcc 100644
--- a/src/tuning/wifi.cpp
+++ b/src/tuning/wifi.cpp
@@ -47,8 +47,8 @@ wifi_tunable::wifi_tunable(const char *_iface) : tunable(=
"", 1.5, _("Good"), _("
 	strcpy(iface, _iface);
 	sprintf(desc, _("Wireless Power Saving for interface %s"), iface);
 =

-	sprintf(toggle_good, "iw dev %s set power_save off", iface);
-	sprintf(toggle_bad, "iw dev %s set power_save on", iface);
+	sprintf(toggle_good, "iw dev %s set power_save on", iface);
+	sprintf(toggle_bad, "iw dev %s set power_save off", iface);
 }
 =

 int wifi_tunable::good_bad(void)
-- =

1.7.10.4


--===============2647459747311794689==--

