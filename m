Content-Type: multipart/mixed; boundary="===============5255192539982484784=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH v2 1/1] tunable: update sched_mc_power_savings
 target val
Date: Thu, 14 Aug 2014 14:04:38 -0400
Message-ID: <1408039478-23276-2-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1408039478-23276-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5255192539982484784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Starting in kernel 2.6.29, the highest power savings level increased
to "2". It should be noted that the sched power savings feature was
removed altogether in kernel 3.5.

Signed-off-by: Nanley Chery <nanleychery(a)gmail.com>
---
 src/tuning/tuning.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 6367a20..90e74d0 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -58,7 +58,7 @@ static void init_tuning(void)
 {
 	add_sysfs_tunable(_("Enable Audio codec power management"), "/sys/module/=
snd_hda_intel/parameters/power_save", "1");
 	add_sysfs_tunable(_("NMI watchdog should be turned off"), "/proc/sys/kern=
el/nmi_watchdog", "0");
-	add_sysfs_tunable(_("Power Aware CPU scheduler"), "/sys/devices/system/cp=
u/sched_mc_power_savings", "1");
+	add_sysfs_tunable(_("Power Aware CPU scheduler"), "/sys/devices/system/cp=
u/sched_mc_power_savings", "2");
 	add_sysfs_tunable(_("VM writeback timeout"), "/proc/sys/vm/dirty_writebac=
k_centisecs", "1500");
 	add_sata_tunables();
 	add_usb_tunables();
-- =

2.0.4


--===============5255192539982484784==--

