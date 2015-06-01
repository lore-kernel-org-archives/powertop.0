Content-Type: multipart/mixed; boundary="===============8380822332573641083=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 4/9] syfs_tunable: use udev
Date: Mon, 01 Jun 2015 09:09:10 -0700
Message-ID: <1433174955-17349-5-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8380822332573641083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
---
 src/tuning/tuningsysfs.cpp | 12 +++++++++---
 src/tuning/tuningsysfs.h   |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
index 0859a0c..fb486bd 100644
--- a/src/tuning/tuningsysfs.cpp
+++ b/src/tuning/tuningsysfs.cpp
@@ -115,15 +115,21 @@ void add_sysfs_tunable(const char *str, const char *_=
sysfs_path, const char *_ta
 =

 static void add_sata_tunables_callback(const char *d_name)
 {
+	struct udev_device *dev =3D udev_device_new_from_syspath(get_udev(), d_na=
me);
+	const char *dev_name =3D udev_device_get_sysname(dev);
 	char filename[4096];
 	char msg[4096];
 =

-	sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_policy",=
 d_name);
-	sprintf(msg, _("Enable SATA link power management for %s"), d_name);
+	sprintf(filename, "%s/link_power_management_policy", d_name);
+	sprintf(msg, _("Enable SATA link power management for %s"), dev_name);
 	add_sysfs_tunable(msg, filename,"min_power");
+
+	/* Cleanup */
+	udev_device_unref(dev);
 }
 =

 void add_sata_tunables(void)
 {
-	process_directory("/sys/class/scsi_host", add_sata_tunables_callback);
+	process_subsystem("scsi_host", add_sata_tunables_callback, 1,
+					  "+link_power_management_policy", NULL);
 }
diff --git a/src/tuning/tuningsysfs.h b/src/tuning/tuningsysfs.h
index ad89717..71586ab 100644
--- a/src/tuning/tuningsysfs.h
+++ b/src/tuning/tuningsysfs.h
@@ -32,6 +32,7 @@
 using namespace std;
 =

 class sysfs_tunable : public tunable {
+	struct udev_device *tun_dev;
 	char sysfs_path[4096];
 	char target_value[4096];
 	char bad_value[4096];
-- =

2.4.1


--===============8380822332573641083==--

