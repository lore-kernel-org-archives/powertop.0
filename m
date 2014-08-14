Content-Type: multipart/mixed; boundary="===============7635865674581513986=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH 1/1] tunable: update sched_mc_power_savings target
 value
Date: Wed, 13 Aug 2014 21:28:05 -0400
Message-ID: <1407979685-1745-2-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1407979685-1745-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7635865674581513986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Starting in kernel 2.6.29, the highest power savings level increased to "2".
However, in kernel 3.5, the sched power savings feature was removed altoget=
her.

Signed-off-by: Nanley Chery <nanleychery(a)gmail.com>
---
 src/tuning/tuning.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 6367a20..ea1905b 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -28,6 +28,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <ncurses.h>
+#include <linux/version.h>
 =

 =

 #include "tuning.h"
@@ -58,7 +59,9 @@ static void init_tuning(void)
 {
 	add_sysfs_tunable(_("Enable Audio codec power management"), "/sys/module/=
snd_hda_intel/parameters/power_save", "1");
 	add_sysfs_tunable(_("NMI watchdog should be turned off"), "/proc/sys/kern=
el/nmi_watchdog", "0");
-	add_sysfs_tunable(_("Power Aware CPU scheduler"), "/sys/devices/system/cp=
u/sched_mc_power_savings", "1");
+#if LINUX_VERSION_CODE <=3D KERNEL_VERSION(3,4,0)
+	add_sysfs_tunable(_("Power Aware CPU scheduler"), "/sys/devices/system/cp=
u/sched_mc_power_savings", "2");
+#endif
 	add_sysfs_tunable(_("VM writeback timeout"), "/proc/sys/vm/dirty_writebac=
k_centisecs", "1500");
 	add_sata_tunables();
 	add_usb_tunables();
-- =

2.0.4


--===============7635865674581513986==--

