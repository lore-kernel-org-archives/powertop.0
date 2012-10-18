Content-Type: multipart/mixed; boundary="===============7535241547115115998=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH] devices: Trivial coding style fix
Date: Thu, 18 Oct 2012 23:20:16 +0900
Message-ID: <1350570016-3759-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7535241547115115998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* block statement doesn't need a semicolon.
* put closing curly bracket of function on a new line.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/devices/rfkill.cpp |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/devices/rfkill.cpp b/src/devices/rfkill.cpp
index 750175c..2404432 100644
--- a/src/devices/rfkill.cpp
+++ b/src/devices/rfkill.cpp
@@ -63,11 +63,12 @@ rfkill::rfkill(char *_name, char *path): device()
 	sprintf(filename, "%s/device/driver", path);
 	if (readlink(filename, line, 4096) > 0) {
 		sprintf(humanname, _("Radio device: %s"), basename(line));
-	};
+	}
 	sprintf(filename, "%s/device/device/driver", path);
 	if (readlink(filename, line, 4096) > 0) {
 		sprintf(humanname, _("Radio device: %s"), basename(line));
-	}}
+	}
+}
 =

 void rfkill::start_measurement(void)
 {
-- =

1.7.9.2


--===============7535241547115115998==--

