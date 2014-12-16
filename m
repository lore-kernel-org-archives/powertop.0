Content-Type: multipart/mixed; boundary="===============4463207641206347409=="
MIME-Version: 1.0
From: Lorenzo Pieralisi <lorenzo.pieralisi at arm.com>
Subject: [Powertop] [PATCH] powertop: fix erroneous C state detection on ARM
Date: Tue, 16 Dec 2014 16:09:06 +0000
Message-ID: <1418746146-25522-1-git-send-email-lorenzo.pieralisi@arm.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4463207641206347409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When the kernel is configured with CONFIG_CPU_IDLE_MULTIPLE_DRIVERS,
the cpuidle directory contains a "driver" subdirectory that confuses
the current code parsing the C states on ARM platforms, ending up
with a C state entry corresponding to the actual driver name instead
of a proper C state entry.

This patch fixes the code by stopping the parsing if the files that
characterise the C states (ie usage) are not found in the respective:

/sys/devices/system/cpu/cpuX/cpuidle

subdirectory containing C states information.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi(a)arm.com>
Tested-by: Kevin Hilman <khilman(a)linaro.org>
---
 src/cpu/cpu_linux.cpp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index e1ff165..78fd2d3 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -83,7 +83,8 @@ void cpu_linux::parse_cstates_start(void)
 		if (file) {
 			file >> usage;
 			file.close();
-		}
+		} else
+			continue;
 =

 		sprintf(filename + len, "/%s/time", entry->d_name);
 =

@@ -172,7 +173,8 @@ void cpu_linux::parse_cstates_end(void)
 		if (file) {
 			file >> usage;
 			file.close();
-		}
+		} else
+			continue;
 =

 		sprintf(filename + len, "/%s/time", entry->d_name);
 =

-- =

2.1.2


--===============4463207641206347409==--

