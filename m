Content-Type: multipart/mixed; boundary="===============1706985596407286964=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH] tunables: remove Power Aware CPU scheduler support
Date: Tue, 30 Sep 2014 22:46:50 -0400
Message-ID: <1412131610-3846-1-git-send-email-nanleychery@gmail.com>
In-Reply-To: 54150.10.24.2.106.1412117195.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1706985596407286964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Due to seemingly poor code maintenance, the power aware scheduler feature w=
as
removed in the 3.5 linux kernel (see linux kernel commit:
8e7fbcbc22c12414bcc9dfdd683637f58fb32759).

Signed-off-by: Nanley Chery <nanleychery(a)gmail.com>
---
 src/tuning/tuning.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 7d64cad..78be52f 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -58,7 +58,6 @@ static void init_tuning(void)
 {
 	add_sysfs_tunable(_("Enable Audio codec power management"), "/sys/module/=
snd_hda_intel/parameters/power_save", "1");
 	add_sysfs_tunable(_("NMI watchdog should be turned off"), "/proc/sys/kern=
el/nmi_watchdog", "0");
-	add_sysfs_tunable(_("Power Aware CPU scheduler"), "/sys/devices/system/cp=
u/sched_mc_power_savings", "1");
 	add_sysfs_tunable(_("VM writeback timeout"), "/proc/sys/vm/dirty_writebac=
k_centisecs", "1500");
 	add_sata_tunables();
 	add_usb_tunables();
-- =

2.1.0


--===============1706985596407286964==--

