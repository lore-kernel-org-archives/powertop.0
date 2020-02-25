Content-Type: multipart/mixed; boundary="===============7236539825137512985=="
MIME-Version: 1.0
From: Ross Burton <ross at burtonini.com>
Subject: [Powertop] [PATCH] tuningsysfs: use med_power_with_dipm for SATA link
 power management
Date: Tue, 25 Feb 2020 17:06:16 +0000
Message-ID: <20200225170616.37648-1-ross@burtonini.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7236539825137512985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton(a)intel.com>

Instead of using min_power, which has reports of data corruption, use
med_power_with_dipm (Device Interface Power Management) available since 4.1=
5.

This has the same behaviour as the Windows IRST driver so both power usage =
and
stability should be improved.

See https://lore.kernel.org/patchwork/patch/830838/ for more context.

Signed-off-by: Ross Burton <ross.burton(a)intel.com>
---
 src/tuning/tuningsysfs.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
index 954f52e..631e9fd 100644
--- a/src/tuning/tuningsysfs.cpp
+++ b/src/tuning/tuningsysfs.cpp
@@ -121,7 +121,7 @@ static void add_sata_tunables_callback(const char *d_na=
me)
 =

 	snprintf(filename, sizeof(filename), "/sys/class/scsi_host/%s/link_power_=
management_policy", d_name);
 	snprintf(msg, sizeof(msg), _("Enable SATA link power management for %s"),=
 d_name);
-	add_sysfs_tunable(msg, filename,"min_power");
+	add_sysfs_tunable(msg, filename, "med_power_with_dipm");
 }
 =

 void add_sata_tunables(void)
-- =

2.25.1

--===============7236539825137512985==--

