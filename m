Content-Type: multipart/mixed; boundary="===============3311407804959449037=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH v2 1/2] Updates to support Android platform
Date: Mon, 24 Sep 2012 18:58:03 +0530
Message-ID: <1348493284-9375-1-git-send-email-rajagopal.venkat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3311407804959449037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds following minor changes to prepare powertop
to support Android platform.

- Add missing HAVE_CONFIG_H conditional check.
- remove un-used ethtool_cmd_speed_set and ethtool_cmd_speed
functions.
- Minimize dependency on exception handling in catch blocks.

These changes will not affect powertop functionality.

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 src/devices/ahci.cpp    |  4 ++--
 src/devices/alsa.cpp    |  4 ++--
 src/devices/network.cpp | 16 ----------------
 src/main.cpp            |  2 ++
 4 files changed, 6 insertions(+), 20 deletions(-)

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
-- =

1.7.11.3


--===============3311407804959449037==--

