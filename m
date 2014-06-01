Content-Type: multipart/mixed; boundary="===============5516637158114157202=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] Fix packaging extra files in src/tuning/ [Was: PowerTOP
 v2.6.1 released]
Date: Sun, 01 Jun 2014 10:09:29 +0200
Message-ID: <20140601080929.GN615@rhrk.uni-kl.de>
In-Reply-To: 20140601075106.GL615@rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5516637158114157202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> find a regenerated version below. Btw, to find out about problems with
> the source: Please run "make distcheck" before doing a release - which
> will currently fail due to the included object files.

OK, while I'm at it: Fix the extra files in src/tuning/ as well. With this
an the previous patch applied "make distcheck" succeeds on my system.

Ciao
    J=C3=B6rg


>From 86f48b0eaf6b7128b70f96b47c1e176142eb7402 Mon Sep 17 00:00:00 2001
From: Joerg Mayer <jmpt(a)loplof.de>
Date: Sun, 1 Jun 2014 10:06:35 +0200
Subject: [PATCH] Don't add the complete content of src/tuning/ when packagi=
ng
 the source.

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>
---
 src/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index 0fe3c04..62e1fd2 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -18,7 +18,7 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		devices/thinkpad-light.cpp devices/ahci.h devices/i915-gpu.h devices/net=
work.h \
 		devices/rfkill.cpp devices/alsa.h devices/thinkpad-fan.h devices/device.=
h \
 		devices/usb.h devices/backlight.h devices/backlight.cpp devices/runtime_=
pm.h \
-		devices/thinkpad-light.h devices/network.cpp lib.h tuning \
+		devices/thinkpad-light.h devices/network.cpp lib.h \
 		tuning/bluetooth.cpp tuning/tuning.cpp tuning/tuningusb.cpp \
 		tuning/ethernet.cpp tuning/bluetooth.h tuning/tuning.h tuning/ethernet.h=
 \
 		tuning/tunable.cpp tuning/nl80211.h tuning/iw.c tuning/wifi.cpp tuning/t=
uningsysfs.h \
-- =

1.8.4.5

-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.

--===============5516637158114157202==--

