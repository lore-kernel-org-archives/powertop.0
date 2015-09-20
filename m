Content-Type: multipart/mixed; boundary="===============1162324414912439692=="
MIME-Version: 1.0
From: Romain Naour <romain.naour at openwide.fr>
Subject: [Powertop] [PATCH 1/2] add missing sys/time.h header
Date: Sun, 20 Sep 2015 12:31:58 +0200
Message-ID: <1442745119-680-1-git-send-email-romain.naour@openwide.fr>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1162324414912439692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

struct timeval is defined in sys/time.h with a musl toolchain.

Fixes:
In file included from devices/devfreq.cpp:35:0:
devices/devfreq.h:35:18: error: field =E2=80=98stamp_before=E2=80=99 has in=
complete type =E2=80=98timeval=E2=80=99
  struct timeval  stamp_before, stamp_after;

Signed-off-by: Romain Naour <romain.naour(a)openwide.fr>
---
 src/devices/devfreq.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
index 16a60fb..4a8983b 100644
--- a/src/devices/devfreq.h
+++ b/src/devices/devfreq.h
@@ -27,6 +27,7 @@
 =

 #include "device.h"
 #include "../parameters/parameters.h"
+#include <sys/time.h>
 =

 struct frequency;
 =

-- =

2.4.3


--===============1162324414912439692==--

