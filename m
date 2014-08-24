Content-Type: multipart/mixed; boundary="===============0907218311231443749=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH 1/1] tunables: check usb autosuspend support before
 add
Date: Sat, 23 Aug 2014 23:22:13 -0400
Message-ID: <1408850533-5008-2-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1408850533-5008-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0907218311231443749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some usb devices do not have drivers that support autosuspend.
These drivers should not be added to the list of tunables, because
toggling their good/bad value does nothing.

Signed-off-by: Nanley Chery <nanleychery(a)gmail.com>
---
 src/tuning/tuningusb.cpp | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
index 27a6dca..ee86335 100644
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
@@ -126,6 +127,25 @@ static void add_usb_callback(const char *d_name)
 	if (access(filename, R_OK)!=3D0)
 		return;
 =

+	/* every interface of this device should support autosuspend */
+	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
+	DIR *dir =3D opendir(filename);
+	if (!dir)
+		return;
+	while (1) {
+		struct dirent *entry =3D readdir(dir);
+		if (!entry)
+			break;
+		if (entry->d_name[0] =3D=3D '.')
+			continue;
+		sprintf(filename, "/sys/bus/usb/devices/%s/%s/supports_autosuspend", d_n=
ame, entry->d_name);
+		bool intf_path_found;
+		bool intf_supports_auto =3D read_sysfs(filename, &intf_path_found);
+		if (intf_path_found && !intf_supports_auto)
+			return;
+	}
+	closedir(dir);
+
 	sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
 	usb =3D new class usb_tunable(filename, d_name);
 	all_tunables.push_back(usb);
-- =

2.0.4


--===============0907218311231443749==--

