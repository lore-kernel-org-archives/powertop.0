Content-Type: multipart/mixed; boundary="===============6102087864681650741=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 8/8] tuningusb: use process_directory()
Date: Thu, 19 Sep 2013 15:47:31 +0300
Message-ID: <20130919124731.GH2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6102087864681650741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

use process_directory() helper

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/tuning/tuningusb.cpp | 46 ++++++++++++++------------------------------=
--
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
index 74bbacf..27a6dca 100644
--- a/src/tuning/tuningusb.cpp
+++ b/src/tuning/tuningusb.cpp
@@ -31,9 +31,6 @@
 #include <utility>
 #include <iostream>
 #include <fstream>
-#include <unistd.h>
-#include <sys/types.h>
-#include <dirent.h>
 =

 #include "../lib.h"
 =

@@ -116,40 +113,25 @@ const char *usb_tunable::toggle_script(void)
 	return toggle_good;
 }
 =

-void add_usb_tunables(void)
+static void add_usb_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
+	class usb_tunable *usb;
 	char filename[4096];
 =

-	dir =3D opendir("/sys/bus/usb/devices/");
-	if (!dir)
+	sprintf(filename, "/sys/bus/usb/devices/%s/power/control", d_name);
+	if (access(filename, R_OK) !=3D 0)
 		return;
-	while (1) {
-		class usb_tunable *usb;
-
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		sprintf(filename, "/sys/bus/usb/devices/%s/power/control", entry->d_name=
);
-
-		if (access(filename, R_OK) !=3D 0)
-			continue;
-
-		sprintf(filename, "/sys/bus/usb/devices/%s/power/active_duration", entry=
->d_name);
-		if (access(filename, R_OK)!=3D0)
-			continue;
 =

-		sprintf(filename, "/sys/bus/usb/devices/%s", entry->d_name);
-
-		usb =3D new class usb_tunable(filename, entry->d_name);
+	sprintf(filename, "/sys/bus/usb/devices/%s/power/active_duration", d_name=
);
+	if (access(filename, R_OK)!=3D0)
+		return;
 =

-		all_tunables.push_back(usb);
+	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
+	usb =3D new class usb_tunable(filename, d_name);
+	all_tunables.push_back(usb);
+}
 =

-	}
-	closedir(dir);
+void add_usb_tunables(void)
+{
+	process_directory("/sys/bus/usb/devices/", add_usb_callback);
 }

--===============6102087864681650741==--

