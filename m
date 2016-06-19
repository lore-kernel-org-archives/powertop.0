Content-Type: multipart/mixed; boundary="===============0223125419793466928=="
MIME-Version: 1.0
From: Oleg Drokin <green at linuxhacker.ru>
Subject: [Powertop] [PATCH 1/2] Add support for usbdevfs
Date: Sat, 18 Jun 2016 20:26:01 -0400
Message-ID: <1466295962-1181132-2-git-send-email-green@linuxhacker.ru>
In-Reply-To: 1466295962-1181132-1-git-send-email-green@linuxhacker.ru
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0223125419793466928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Similar to ALSA, usb devices could be held at full power by
opening them via usbdevfs, so it's good to track such processes
and attribute the power to them.

Signed-off-by: Oleg Drokin <green(a)linuxhacker.ru>
---
 src/devices/usb.cpp | 28 ++++++++++++++++++++++++++++
 src/devices/usb.h   |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/src/devices/usb.cpp b/src/devices/usb.cpp
index aa9c227..5042699 100644
--- a/src/devices/usb.cpp
+++ b/src/devices/usb.cpp
@@ -31,6 +31,7 @@
 #include <limits.h>
 =

 #include "../lib.h"
+#include "../devlist.h"
 #include "../parameters/parameters.h"
 =

 #include <iostream>
@@ -52,6 +53,8 @@ usbdevice::usbdevice(const char *_name, const char *path,=
 const char *devid): de
 	active_after =3D 0;
 	connected_before =3D 0;
 	connected_after =3D 0;
+	busnum =3D 0;
+	devnum =3D 0;
 =

 	index =3D get_param_index(devname);
 	r_index =3D get_result_index(name);
@@ -93,6 +96,22 @@ usbdevice::usbdevice(const char *_name, const char *path=
, const char *devid): de
 		snprintf(humanname, sizeof(humanname), _("USB device: %s"), product);
 	else if (strlen(vendor))
 		snprintf(humanname, sizeof(humanname), _("USB device: %s"), vendor);
+
+	/* For usbdevfs we need bus number and device number */
+	snprintf(filename, sizeof(filename), "%s/busnum", path);
+	file.open(filename, ios::in);
+	if (file) {
+
+		file >> busnum;
+		file.close();
+	};
+	snprintf(filename, sizeof(filename), "%s/devnum", path);
+	file.open(filename, ios::in);
+	if (file) {
+
+		file >> devnum;
+		file.close();
+	};
 }
 =

 =

@@ -165,6 +184,15 @@ const char * usbdevice::human_name(void)
 	return humanname;
 }
 =

+void usbdevice::register_power_with_devlist(struct result_bundle *results,=
 struct parameter_bundle *bundle)
+{
+	char devfs_name[1024];
+
+	snprintf(devfs_name, sizeof(devfs_name), "usb/%03d/%03d", busnum,
+		 devnum);
+
+        register_devpower(devfs_name, power_usage(results, bundle), this);
+}
 =

 double usbdevice::power_usage(struct result_bundle *result, struct paramet=
er_bundle *bundle)
 {
diff --git a/src/devices/usb.h b/src/devices/usb.h
index 097df51..7e76a55 100644
--- a/src/devices/usb.h
+++ b/src/devices/usb.h
@@ -40,6 +40,8 @@ class usbdevice: public device {
 	int index;
 	int r_index;
 	int rootport;
+	int busnum;
+	int devnum;
 public:
 =

 	usbdevice(const char *_name, const char *path, const char *devid);
@@ -53,6 +55,7 @@ public:
 =

 	virtual const char * device_name(void);
 	virtual const char * human_name(void);
+	virtual void register_power_with_devlist(struct result_bundle *results, s=
truct parameter_bundle *bundle);
 	virtual double power_usage(struct result_bundle *result, struct parameter=
_bundle *bundle);
 	virtual int power_valid(void) { return utilization_power_valid(r_index);};
 	virtual int grouping_prio(void) { return 4; };
-- =

2.7.4


--===============0223125419793466928==--

