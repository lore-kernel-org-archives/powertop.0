Content-Type: multipart/mixed; boundary="===============8785234355098921409=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 6/9] replace pciutils usage with udevhwdb
Date: Mon, 01 Jun 2015 09:09:12 -0700
Message-ID: <1433174955-17349-7-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8785234355098921409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 src/lib.cpp            | 27 +++++++++++++++++++++++++++
 src/lib.h              |  1 +
 src/tuning/runtime.cpp | 11 +++--------
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 5a9c6be..399d2bc 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -314,6 +314,33 @@ void cleanup_udev()
 	}
 }
 =

+const char *upci_id_to_name(struct udev_device* dev, char* buffer)
+{
+	const char *uvendor =3D udev_device_get_sysattr_value(dev, "vendor");
+	const char *udevice =3D udev_device_get_sysattr_value(dev, "device");
+	uint16_t vendor =3D stoul(string(uvendor), NULL, 16);
+	uint16_t device =3D stoul(string(udevice), NULL, 16);
+	char modalias[64];
+	sprintf(modalias, "pci:v%08Xd%08X*", vendor, device);
+	const char *key1 =3D "ID_VENDOR_FROM_DATABASE";
+	const char *key2 =3D "ID_MODEL_FROM_DATABASE";
+
+	struct udev_hwdb *hwdb =3D udev_hwdb_new(udev_device_get_udev(dev));
+	struct udev_list_entry *entry;
+	udev_list_entry_foreach(entry, udev_hwdb_get_properties_list_entry(hwdb, =
modalias, 0))
+		if (strcmp(udev_list_entry_get_name(entry), key1) =3D=3D 0)
+			uvendor =3D  udev_list_entry_get_value(entry);
+		else if (strcmp(udev_list_entry_get_name(entry), key2) =3D=3D 0)
+			udevice =3D  udev_list_entry_get_value(entry);
+
+	if (uvendor && udevice) {
+		sprintf(buffer, "%s %s", uvendor, udevice);
+		return buffer;
+	}
+
+	return NULL;
+}
+
 #ifndef HAVE_NO_PCI
 static struct pci_access *pci_access;
 =

diff --git a/src/lib.h b/src/lib.h
index ae0421f..464ce71 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -68,6 +68,7 @@ extern string read_sysfs_string(const char *format, const=
 char *param);
 =

 extern void format_watts(double W, char *buffer, unsigned int len);
 =

+extern const char *upci_id_to_name(struct udev_device* dev, char* buffer);
 extern char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer=
, int len);
 extern void end_pci_access(void);
 =

diff --git a/src/tuning/runtime.cpp b/src/tuning/runtime.cpp
index 463372d..ac65522 100644
--- a/src/tuning/runtime.cpp
+++ b/src/tuning/runtime.cpp
@@ -42,16 +42,11 @@ runtime_tunable::runtime_tunable(struct udev_device* ud=
ev_device) :
 	const char *dev =3D udev_device_get_sysname(udev_device);
 =

 	/* Give more accurate descriptions for PCI devices */
+	char devname[4096];
 	if (strcmp(bus, "pci") =3D=3D 0) {
-		const char *uvendor =3D udev_device_get_sysattr_value(udev_device, "vend=
or");
-		const char *udevice =3D udev_device_get_sysattr_value(udev_device, "devi=
ce");
-		uint16_t vendor =3D stoul(string(uvendor), NULL, 16);
-		uint16_t device =3D stoul(string(udevice), NULL, 16);
+		if (upci_id_to_name(udev_device, devname))
+			dev =3D devname;
 		bus =3D "PCI";
-		if (vendor && device) {
-			char filename[4096];
-			dev =3D pci_id_to_name(vendor, device, filename, 4095);
-		}
 	}
 =

 	if (!udevice_has_runtime_pm(udev_device))
-- =

2.4.1


--===============8785234355098921409==--

