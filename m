Content-Type: multipart/mixed; boundary="===============1926319236561696642=="
MIME-Version: 1.0
From: Stewart Smith <stewart at linux.vnet.ibm.com>
Subject: [Powertop] [PATCH 1/2] cpu: support powerpc /proc/cpuinfo
Date: Fri, 27 Nov 2015 11:07:28 +1100
Message-ID: <1448582849-1707-2-git-send-email-stewart@linux.vnet.ibm.com>
In-Reply-To: 1448582849-1707-1-git-send-email-stewart@linux.vnet.ibm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1926319236561696642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Clean up duplicate code added for ARM and add support for what
seems to be a good deliminator on ppc64.

This patch makes powertop pick up CPUs on powernv platform.

Signed-off-by: Stewart Smith <stewart(a)linux.vnet.ibm.com>
---
 src/cpu/cpu.cpp | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 9ca320f50449..64e1d3d9feab 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -285,19 +285,13 @@ void enumerate_cpus(void)
 				model =3D strtoull(c, NULL, 10);
 			}
 		}
-		if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0) {
-			if (number =3D=3D -1) {
-				/* Not all /proc/cpuinfo include "processor\t". */
-				number =3D 0;
-			}
-			if (number >=3D 0) {
-				handle_one_cpu(number, vendor, family, model);
-				set_max_cpu(number);
-				number =3D -2;
-			}
-		}
-		/* bogomips is removed in ARM, using CPU revision to enumerate */
-		if (strncasecmp(line, "CPU revision\t", 13) =3D=3D 0) {
+		/* on x86 and others 'bogomips' is last
+		 * on ARM it *can* be bogomips, or 'CPU revision'
+		 * on POWER, it's revision
+		 */
+		if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0
+		    || strncasecmp(line, "CPU revision\t", 13) =3D=3D 0
+		    || strncmp(line, "revision", 7) =3D=3D 0) {
 			if (number =3D=3D -1) {
 				/* Not all /proc/cpuinfo include "processor\t". */
 				number =3D 0;
-- =

2.1.4


--===============1926319236561696642==--

