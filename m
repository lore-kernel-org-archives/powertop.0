Content-Type: multipart/mixed; boundary="===============3204472771424332970=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 01/10] tell user if the system is running out of FDs
Date: Mon, 14 Oct 2013 11:40:48 +0300
Message-ID: <1381740057-12499-2-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3204472771424332970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jaroslav Skarvada <jskarvad(a)redhat.com>

From: Jaroslav Skarvada <jskarvad(a)redhat.com>

complex servers can run out of FDs easily (due to perf).
In such case tell user that more FDs are needed instead
of the generic message (that kernel doesn't support
the perf).
---
 src/perf/perf.cpp | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index e919741..b176256 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -26,6 +26,7 @@
 #include <iostream>
 #include <fstream>
 =

+#include <errno.h>
 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -72,6 +73,7 @@ void perf_event::create_perf_event(char *eventname, int _=
cpu)
 {
 	struct perf_event_attr attr;
 	int ret;
+	int err;
 =

 	struct {
 		__u64 count;
@@ -107,10 +109,15 @@ void perf_event::create_perf_event(char *eventname, i=
nt _cpu)
 	perf_fd =3D sys_perf_event_open(&attr, -1, _cpu, -1, 0);
 =

 	if (perf_fd < 0) {
+		err =3D errno;
 		reset_display();
-		fprintf(stderr, _("PowerTOP %s needs the kernel to support the 'perf' su=
bsystem\n"), POWERTOP_VERSION);
-		fprintf(stderr, _("as well as support for trace points in the kernel:\n"=
));
-		fprintf(stderr, "CONFIG_PERF_EVENTS=3Dy\nCONFIG_PERF_COUNTERS=3Dy\nCONFI=
G_TRACEPOINTS=3Dy\nCONFIG_TRACING=3Dy\n");
+		if (err =3D=3D EMFILE)
+			fprintf(stderr, _("Too many open files, please increase the limit of op=
en file descriptors.\n"));
+		else {
+			fprintf(stderr, _("PowerTOP %s needs the kernel to support the 'perf' s=
ubsystem\n"), POWERTOP_VERSION);
+			fprintf(stderr, _("as well as support for trace points in the kernel:\n=
"));
+			fprintf(stderr, "CONFIG_PERF_EVENTS=3Dy\nCONFIG_PERF_COUNTERS=3Dy\nCONF=
IG_TRACEPOINTS=3Dy\nCONFIG_TRACING=3Dy\n");
+		}
 		exit(EXIT_FAILURE);
 	}
 	if (read(perf_fd, &read_data, sizeof(read_data)) =3D=3D -1) {
-- =

1.8.4.679.g0a1a803


--===============3204472771424332970==--

