Content-Type: multipart/mixed; boundary="===============6889761002814463474=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH 2/2] Move some includes to the implementation in
 order to reduce their scope.
Date: Wed, 25 Jul 2012 07:12:25 +0200
Message-ID: <1343209456.2554.1.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6889761002814463474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/perf/perf.cpp     |    5 ++++-
 src/perf/perf_event.h |    4 ----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index 102e224..9a30e9f 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -23,6 +23,8 @@
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
 =

+#include "perf.h"
+
 #include <iostream>
 #include <fstream>
 =

@@ -35,11 +37,12 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
+#include <linux/ioctl.h>
+#include <sys/syscall.h>
 =

 #include <fcntl.h>
 =

 #include "perf_event.h"
-#include "perf.h"
 #include "../lib.h"
 #include "../display.h"
 =

diff --git a/src/perf/perf_event.h b/src/perf/perf_event.h
index 92a38b8..a28a570 100644
--- a/src/perf/perf_event.h
+++ b/src/perf/perf_event.h
@@ -39,10 +39,6 @@
 #define _LINUX_PERF_EVENT_H
 =

 #include <linux/types.h>
-#include <linux/ioctl.h>
-#include <asm/byteorder.h>
-#include <sys/syscall.h>
-
 =

 /*
  * User-space ABI bits:
-- =

1.7.10.4


--===============6889761002814463474==--

