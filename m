Content-Type: multipart/mixed; boundary="===============2337993190784442155=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 02/10] set open files rlimit to /proc/sys/fs/nr_open
Date: Mon, 14 Oct 2013 11:40:49 +0300
Message-ID: <1381740057-12499-3-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2337993190784442155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jaroslav Skarvada <jskarvad(a)redhat.com>

From: Jaroslav Skarvada <jskarvad(a)redhat.com>

we have noticed that it can only overcome soft limits, but not hard limits.=
 E.g.
on Fedora (and probably others) there is a soft limit of 1024 and a hard li=
mit
of 4096, so if powertop opens at least 15 file descriptors per CPU, then th=
is
will fail on a system with >273 CPUs.

On my system NR_OPEN is 1024, but /proc/sys/fs/nr_open gives me 1048576.
It seems the linux kernel hardcodes 1024 * 1024 as the default kernel limit.
This default limit can be raised to:

sysctl_nr_open_max =3D min((size_t)INT_MAX, ~(size_t)0/sizeof(void *)) &
  -BITS_PER_LONG;

which is 2 Gi - 63 on my 64 bit system. I think we shouldn't
touch/increase this. It seems there is no header definition for these
limits.

I am proposing new patch, which reads the current kernel limit from the
/proc. I am not sure about the portability, but at least it shouldn't
break anything.

Finally I think, the first patch could be applied together with this patch
(probably with the changed message) to notify user that he/she reached
the FDs limit, because there is still some limit. This could also
occur if some process would decrease the /proc/sys/fs/nr_open after
it is read by powertop and before the ulimit is set

patch merge modifications by: Sergey Senozhatsky <sergey.senozhatsky(a)gmai=
l.com>
---
 src/main.cpp | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 501a364..4e34ee6 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -28,6 +28,7 @@
  *	Arjan van de Ven <arjan(a)linux.intel.com>
  */
 #include <iostream>
+#include <fstream>
 #include <stdlib.h>
 #include <stdio.h>
 #include <time.h>
@@ -61,6 +62,8 @@
 =

 #define DEBUGFS_MAGIC          0x64626720
 =

+#define NR_OPEN_DEF 1024 * 1024
+
 int debug_learning =3D 0;
 unsigned time_out =3D 20;
 int leave_powertop =3D 0;
@@ -281,6 +284,20 @@ static void checkroot() {
 =

 }
 =

+static int get_nr_open(void) {
+	int nr_open =3D NR_OPEN_DEF;
+	ifstream file;
+
+	file.open("/proc/sys/fs/nr_open", ios::in);
+	if (file) {
+		file >> nr_open;
+		if (!file)
+			nr_open =3D NR_OPEN_DEF;
+		file.close();
+	}
+	return nr_open;
+}
+
 static void powertop_init(void)
 {
 	static char initialized =3D 0;
@@ -293,8 +310,7 @@ static void powertop_init(void)
 =

 	checkroot();
 =

-	getrlimit (RLIMIT_NOFILE, &rlmt);
-	rlmt.rlim_cur =3D rlmt.rlim_max;
+	rlmt.rlim_cur =3D rlmt.rlim_max =3D get_nr_open();
 	setrlimit (RLIMIT_NOFILE, &rlmt);
 =

 	ret =3D system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1");
-- =

1.8.4.679.g0a1a803


--===============2337993190784442155==--

