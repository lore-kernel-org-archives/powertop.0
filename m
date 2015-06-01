Content-Type: multipart/mixed; boundary="===============2451606040350349565=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 2/9] add udev helper functions
Date: Mon, 01 Jun 2015 09:09:08 -0700
Message-ID: <1433174955-17349-3-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2451606040350349565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 src/lib.cpp  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/lib.h    |  4 ++++
 src/main.cpp |  1 +
 3 files changed, 59 insertions(+)

diff --git a/src/lib.cpp b/src/lib.cpp
index 437803b..5a9c6be 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -291,6 +291,29 @@ void format_watts(double W, char *buffer, unsigned int=
 len)
 	align_string(buffer, len, len);
 }
 =

+static struct udev *udev_cxt =3D NULL;
+
+struct udev * get_udev()
+{
+	if (udev_cxt =3D=3D NULL) {
+		udev_cxt =3D udev_new();
+		if (udev_cxt =3D=3D NULL) {
+			printf("Couldn't create udev\n");
+			exit(EXIT_FAILURE);
+		}
+	}
+
+	return udev_cxt;
+}
+
+void cleanup_udev()
+{
+	if (udev_cxt !=3D NULL) {
+		udev_unref(udev_cxt);
+		udev_cxt =3D NULL;
+	}
+}
+
 #ifndef HAVE_NO_PCI
 static struct pci_access *pci_access;
 =

@@ -437,6 +460,37 @@ int equals(double a, double b)
 	return fabs(a - b) <=3D std::numeric_limits<double>::epsilon();
 }
 =

+void process_subsystem(const char *subsystem, callback fn, int num_attr, .=
..)
+{
+	/* Find devices in subsystem with given attributes */
+	struct udev_enumerate *enumerate =3D udev_enumerate_new(get_udev());
+	udev_enumerate_add_match_subsystem(enumerate, subsystem);
+	va_list args;
+	va_start (args, num_attr);
+	while (num_attr--) {
+		const char *attr =3D va_arg(args, const char*);
+		const char *attr_val =3D va_arg(args, const char*);
+		if (*attr =3D=3D '+')
+			udev_enumerate_add_match_sysattr(enumerate, &attr[1], attr_val);
+		else if (*attr =3D=3D '-')
+			udev_enumerate_add_nomatch_sysattr(enumerate, &attr[1], attr_val);
+		else {
+			fprintf (stderr, "Bad format of attribute\n");
+			exit(1);
+		}
+	}
+	va_end (args);
+	udev_enumerate_scan_devices(enumerate);
+
+	/* Run callback on each device */
+	struct udev_list_entry *dev_entry;
+	udev_list_entry_foreach(dev_entry, udev_enumerate_get_list_entry(enumerat=
e))
+		fn(udev_list_entry_get_name(dev_entry));
+
+	/* Cleanup */
+	udev_enumerate_unref(enumerate);
+}
+
 void process_directory(const char *d_name, callback fn)
 {
 	struct dirent *entry;
diff --git a/src/lib.h b/src/lib.h
index 5c94271..ae0421f 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -28,6 +28,7 @@
 #include <libintl.h>
 #include <stdint.h>
 #include <stdlib.h>
+#include <libudev.h>
 =

 /* Include only for Automake builds */
 #ifdef HAVE_CONFIG_H
@@ -70,6 +71,8 @@ extern void format_watts(double W, char *buffer, unsigned=
 int len);
 extern char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer=
, int len);
 extern void end_pci_access(void);
 =

+extern struct udev * get_udev();
+extern void cleanup_udev();
 =

 extern char *fmt_prefix(double n, char *buf);
 extern char *pretty_print(const char *str, char *buf, int len);
@@ -77,6 +80,7 @@ extern int equals(double a, double b);
 =

 typedef void (*callback)(const char*);
 extern void process_directory(const char *d_name, callback fn);
+extern void process_subsystem(const char *subsystem, callback fn, int num_=
attr, ...);
 extern int utf_ok;
 extern int get_user_input(char *buf, unsigned sz);
 extern int read_msr(int cpu, uint64_t offset, uint64_t *value);
diff --git a/src/main.cpp b/src/main.cpp
index dc69fca..65e54ac 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -379,6 +379,7 @@ void clean_shutdown()
 	clear_all_devices();
 	clear_all_devfreq();
 	clear_all_cpus();
+	cleanup_udev();
 =

 	return;
 }
-- =

2.4.1


--===============2451606040350349565==--

