Content-Type: multipart/mixed; boundary="===============6093581437283139441=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH v2 1/1] tunables: check usb autosuspend support
 before add
Date: Mon, 25 Aug 2014 15:45:50 -0400
Message-ID: <1408995950-1551-1-git-send-email-nanleychery@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6093581437283139441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some usb devices do not have drivers that support autosuspend.
These drivers should not be added to the list of tunables, because
toggling their good/bad value does nothing.

Signed-off-by: Nanley Chery <nanleychery(a)gmail.com>
---

Fixed the issue in the previous patch that allowed returning between
opendir and closedir (thanks Sergey). Also improve detection of interface =

folders.

 src/tuning/tuningusb.cpp | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
index 27a6dca..d2a0c11 100644
--- a/src/tuning/tuningusb.cpp
+++ b/src/tuning/tuningusb.cpp
@@ -28,6 +28,7 @@
 #include "unistd.h"
 #include "tuningusb.h"
 #include <string.h>
+#include <dirent.h>
 #include <utility>
 #include <iostream>
 #include <fstream>
@@ -117,6 +118,7 @@ static void add_usb_callback(const char *d_name)
 {
 	class usb_tunable *usb;
 	char filename[4096];
+	DIR *dir;
 =

 	sprintf(filename, "/sys/bus/usb/devices/%s/power/control", d_name);
 	if (access(filename, R_OK) !=3D 0)
@@ -126,6 +128,23 @@ static void add_usb_callback(const char *d_name)
 	if (access(filename, R_OK)!=3D0)
 		return;
 =

+	/* every interface of this device should support autosuspend */
+	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
+	if ((dir =3D opendir(filename))) {
+		struct dirent *entry;
+		while ((entry =3D readdir(dir))) {
+			/* dirname: <busnum>-<devnum>...:<config num>-<interface num> */
+			if (!isdigit(entry->d_name[0]))
+				continue;
+			sprintf(filename, "/sys/bus/usb/devices/%s/%s/supports_autosuspend", d_=
name, entry->d_name);
+			if (access(filename, R_OK) =3D=3D 0 && read_sysfs(filename) =3D=3D 0)
+				break;
+		}
+		closedir(dir);
+		if (entry)
+			return;
+	}
+
 	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
 	usb =3D new class usb_tunable(filename, d_name);
 	all_tunables.push_back(usb);
-- =

2.0.4


--===============6093581437283139441==--

