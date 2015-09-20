Content-Type: multipart/mixed; boundary="===============7385996249351752624=="
MIME-Version: 1.0
From: Romain Naour <romain.naour at openwide.fr>
Subject: [Powertop] [PATCH 2/2] add missing stdio.h header
Date: Sun, 20 Sep 2015 12:31:59 +0200
Message-ID: <1442745119-680-2-git-send-email-romain.naour@openwide.fr>
In-Reply-To: 1442745119-680-1-git-send-email-romain.naour@openwide.fr
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7385996249351752624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

snprinf is defined in stdio.h.

Fixes:
perf/perf_bundle.cpp: In function =E2=80=98void parse_event_format(const ch=
ar*)=E2=80=99:
perf/perf_bundle.cpp:141:75: error: =E2=80=98sprintf=E2=80=99 was not decla=
red in this scope
  sprintf(file, "/sys/kernel/debug/tracing/events/%s/%s/format", sys, event=
);

Signed-off-by: Romain Naour <romain.naour(a)openwide.fr>
---
 src/perf/perf_bundle.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
index cf1ae11..3d216ff 100644
--- a/src/perf/perf_bundle.cpp
+++ b/src/perf/perf_bundle.cpp
@@ -31,6 +31,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <unistd.h>
+#include <stdio.h>
 =

 #include "perf_bundle.h"
 #include "perf_event.h"
-- =

2.4.3


--===============7385996249351752624==--

