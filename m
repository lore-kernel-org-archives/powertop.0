Content-Type: multipart/mixed; boundary="===============1482107194208525812=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 2/2] tuningsysfs: use lib process_directory() helper
Date: Tue, 26 Nov 2013 22:27:10 +0300
Message-ID: <1385494030-22556-3-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1385494030-22556-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1482107194208525812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

use process_directory() helper while processing sata tunables.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/tuning/tuningsysfs.cpp | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
index f70dc23..0859a0c 100644
--- a/src/tuning/tuningsysfs.cpp
+++ b/src/tuning/tuningsysfs.cpp
@@ -113,34 +113,17 @@ void add_sysfs_tunable(const char *str, const char *_=
sysfs_path, const char *_ta
 	all_tunables.push_back(tunable);
 }
 =

-void add_sata_tunables(void)
+static void add_sata_tunables_callback(const char *d_name)
 {
-	struct dirent *entry;
-	DIR *dir;
 	char filename[4096];
 	char msg[4096];
 =

-	dir =3D opendir("/sys/class/scsi_host");
-
-	if (!dir)
-		return;
-
-        while (1) {
-		entry =3D readdir(dir);
-
-		if (!entry)
-			break;
-
-		if (entry->d_name[0] =3D=3D '.')
-			continue;
-
-		sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_policy"=
, entry->d_name);
-
-	        sprintf(msg, _("Enable SATA link power management for %s"),entry-=
>d_name);
-
-		add_sysfs_tunable(msg, filename,"min_power");
-
-        }
+	sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_policy",=
 d_name);
+	sprintf(msg, _("Enable SATA link power management for %s"), d_name);
+	add_sysfs_tunable(msg, filename,"min_power");
+}
 =

-        closedir(dir);
+void add_sata_tunables(void)
+{
+	process_directory("/sys/class/scsi_host", add_sata_tunables_callback);
 }
-- =

1.8.5.rc3.362.gdf10213.dirty


--===============1482107194208525812==--

