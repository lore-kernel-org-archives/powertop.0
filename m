Content-Type: multipart/mixed; boundary="===============7761169554322646836=="
MIME-Version: 1.0
From: =?utf-8?q?Jaroslav_=C5=A0karvada_=3Cjskarvad_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] cpufreq: only try to open files under cpuX
Date: Wed, 12 Dec 2012 17:16:13 +0100
Message-ID: <1355328973-22767-1-git-send-email-jskarvad@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7761169554322646836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are called many useless 'open' syscalls that always fail, like:
  open("/sys/devices/system/cpu/uevent/cpufreq/scaling_governor", O_RDONLY)=
 =3D -1 ENOTDIR (Not a directory)
This patch filters this to /sys/devices/system/cpu/cpuX, where X is string
starting with digit (from kernel sources it seems that X can only be intege=
r).
For match cases it will add only small overhead.

Originally reported as:
https://bugzilla.redhat.com/show_bug.cgi?id=3D886185

Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
---
 src/tuning/cpufreq.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/tuning/cpufreq.cpp b/src/tuning/cpufreq.cpp
index df245ad..c448f4c 100644
--- a/src/tuning/cpufreq.cpp
+++ b/src/tuning/cpufreq.cpp
@@ -36,6 +36,7 @@
 #include <dirent.h>
 #include <errno.h>
 #include <sys/stat.h>
+#include <ctype.h>
 =

 #include "../lib.h"
 #include "cpufreq.h"
@@ -72,7 +73,7 @@ int cpufreq_tunable::good_bad(void)
 		return ret;
 =

 	while ((dirent =3D readdir(dir))) {
-		if (dirent->d_name[0]=3D=3D'.')
+		if (strlen(dirent->d_name) < 4 || strncmp(dirent->d_name, "cpu", 3) !=3D=
 0 || !isdigit(dirent->d_name[3]))
 			continue;
 		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor",=
 dirent->d_name);
 		file =3D fopen(filename, "r");
-- =

1.7.11.7


--===============7761169554322646836==--

