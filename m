Content-Type: multipart/mixed; boundary="===============7882545119713183576=="
MIME-Version: 1.0
From: Youquan Song <youquan.song at intel.com>
Subject: [Powertop] [PATCH] Fix running failure when > 69 CPUs for open file
 limitation
Date: Wed, 29 May 2013 11:44:07 -0400
Message-ID: <1369842247-11442-1-git-send-email-youquan.song@intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7882545119713183576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Powertop 2.3 fails to run on machine with > 69 CPUs because system open fil=
es
limitation of one process is 1024 default,  While powertop will open one fi=
le
for every monitored perf_event (at least 15) each CPU.

Like on 80 CPUs Westmere-EX machine, powertop will fail to run with below:

PowerTOP v2.3 needs the kernel to support the 'perf' subsystem
as well as support for trace points in the kernel:
CONFIG_PERF_EVENTS=3Dy
CONFIG_PERF_COUNTERS=3Dy
CONFIG_TRACEPOINTS=3Dy
CONFIG_TRACING=3Dy

This patch is to change RLIMIT_NOFILE from default (1024) to max limition.


Signed-off-by: Youquan Song <youquan.song(a)intel.com>
---
 src/main.cpp |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 0883424..8cd97a2 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -36,6 +36,7 @@
 #include <getopt.h>
 #include <unistd.h>
 #include <locale.h>
+#include <sys/resource.h>
 =

 #include "cpu/cpu.h"
 #include "process/process.h"
@@ -283,9 +284,14 @@ static void powertop_init(void)
 	static char initialized =3D 0;
 	int ret;
 	struct statfs st_fs;
+	struct rlimit rlmt;
 =

 	if (initialized)
 		return;
+
+	getrlimit (RLIMIT_NOFILE, &rlmt);
+	rlmt.rlim_cur =3D rlmt.rlim_max;
+	setrlimit (RLIMIT_NOFILE, &rlmt);
 =

 	checkroot();
 	ret =3D system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1");
-- =

1.7.7.4


--===============7882545119713183576==--

