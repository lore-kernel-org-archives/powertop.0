Content-Type: multipart/mixed; boundary="===============2852904960088083381=="
MIME-Version: 1.0
From: Rosen Penev <rosenp at gmail.com>
Subject: [Powertop] [PATCH] intel_cpus.cpp: Change open parameter to const
 char *
Date: Sat, 30 Mar 2019 20:21:32 -0700
Message-ID: <20190331032132.17697-1-rosenp@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2852904960088083381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ifstream::open takes std::string starting with C++11, not before.

This fixes compilation with uClibc++ and potentially other older libraries

Signed-off-by: Rosen Penev <rosenp(a)gmail.com>
---
 src/cpu/intel_cpus.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 0030dba..4dffadc 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -92,7 +92,7 @@ int is_supported_intel_cpu(int model, int cpu)
 =

 int is_intel_pstate_driver_loaded()
 {
-	const string filename("/sys/devices/system/cpu/cpu0/cpufreq/scaling_drive=
r");
+	const char *filename =3D "/sys/devices/system/cpu/cpu0/cpufreq/scaling_dr=
iver";
 	const string intel_pstate("intel_pstate");
 	char line[32] =3D { '\0' };
 	ifstream file;
-- =

2.17.1


--===============2852904960088083381==--

