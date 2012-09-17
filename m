Content-Type: multipart/mixed; boundary="===============3677105975407706649=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Mon, 17 Sep 2012 20:04:08 +0530
Message-ID: <1347892449-10484-1-git-send-email-rajagopal.venkat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3677105975407706649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds following minor changes to prepare powertop
to support Android platform.

- add missing HAVE_CONFIG_H conditional check.
- remove un-used ethtool_cmd_speed_set and ethtool_cmd_speed
functions.
- minimize dependency on exception handling in catch blocks.

These changes will not affect powertop functionality.

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 src/devices/ahci.cpp       |    4 ++--
 src/devices/alsa.cpp       |    4 ++--
 src/devices/network.cpp    |   16 ----------------
 src/lib.cpp                |    2 +-
 src/main.cpp               |    2 ++
 src/process/do_process.cpp |    4 ++--
 6 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index 1fe39c7..67ce06e 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -170,7 +170,7 @@ void ahci::start_measurement(void)
 		file.close();
 	}
 	catch (std::ios_base::failure &c) {
-		fprintf(stderr, "%s\n", c.what());
+		fprintf(stderr, "Failed to start measurement for ahci device\n");
 	}
 =

 }
@@ -203,7 +203,7 @@ void ahci::end_measurement(void)
 		file.close();
 	}
 	catch (std::ios_base::failure &c) {
-		fprintf(stderr, "%s\n", c.what());
+		fprintf(stderr, "Failed to end measurement for ahci device\n");
 	}
 	if (end_active < start_active)
 		end_active =3D start_active;
diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index 4f5d3f9..a67780c 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -104,7 +104,7 @@ void alsa::start_measurement(void)
 		file.close();
 	}
 	catch (std::ios_base::failure &c) {
-		fprintf(stderr, "%s\n", c.what());
+		fprintf(stderr, "Failed to start measurement for alsa device\n");
 	}
 }
 =

@@ -130,7 +130,7 @@ void alsa::end_measurement(void)
 		file.close();
 	}
 	catch (std::ios_base::failure &c) {
-		fprintf(stderr, "%s\n", c.what());
+		fprintf(stderr, "Failed to end measurement for alsa device\n");
 	}
 =

 	p =3D (end_active - start_active) / (0.001 + end_active + end_inactive - =
start_active - start_inactive) * 100.0;
diff --git a/src/devices/network.cpp b/src/devices/network.cpp
index b8a5c9c..ed9d7aa 100644
--- a/src/devices/network.cpp
+++ b/src/devices/network.cpp
@@ -55,22 +55,6 @@ extern "C" {
 =

 static map<string, class network *> nics;
 =

-#ifdef DISABLE_TRYCATCH
-
-static inline void ethtool_cmd_speed_set(struct ethtool_cmd *ep,
-						__u32 speed)
-{
-
-	ep->speed =3D (__u16)speed;
-	ep->speed_hi =3D (__u16)(speed >> 16);
-}
-
-static inline __u32 ethtool_cmd_speed(struct ethtool_cmd *ep)
-{
-	return (ep->speed_hi << 16) | ep->speed;
-}
-
-#endif
 =

 static void do_proc_net_dev(void)
 {
diff --git a/src/lib.cpp b/src/lib.cpp
index 9838c0b..776a67b 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -259,7 +259,7 @@ void format_watts(double W, char *buffer, unsigned int =
len)
 	if (W < 0.0001)
 		sprintf(buffer, _("    0 mW"));
 =

-	while (mbstowcs(NULL,buffer,0) < len)
+	while (mbstowcs(NULL,buffer,len) < len)
 		strcat(buffer, " ");
 }
 =

diff --git a/src/main.cpp b/src/main.cpp
index 1815075..dc49dba 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -42,7 +42,9 @@
 #include "perf/perf.h"
 #include "perf/perf_bundle.h"
 #include "lib.h"
+#ifdef HAVE_CONFIG_H
 #include "../config.h"
+#endif
 =

 =

 #include "devices/device.h"
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index eaef7f1..c9d6b0b 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -869,7 +869,7 @@ void process_update_display(void)
 		if (!show_power)
 			strcpy(power, "          ");
 		sprintf(name, "%s", all_power[i]->type());
-		while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
+		while (mbstowcs(NULL,name,20) < 14) strcat(name, " ");
 =

 =

 		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&=
 all_power[i]->Witts() =3D=3D 0)
@@ -882,7 +882,7 @@ void process_update_display(void)
 			else
 				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->usag=
e_units());
 		}
-		while (mbstowcs(NULL,usage,0) < 14) strcat(usage, " ");
+		while (mbstowcs(NULL,usage,20) < 14) strcat(usage, " ");
 		sprintf(events, "%5.1f", all_power[i]->events());
 		if (!all_power[i]->show_events())
 			events[0] =3D 0;
-- =

1.7.9.5


--===============3677105975407706649==--

