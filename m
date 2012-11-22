Content-Type: multipart/mixed; boundary="===============3889433949644879697=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH] Allow frequency stats when cpuidle is not enabled
Date: Thu, 22 Nov 2012 13:05:48 +0530
Message-ID: <1353569748-24846-1-git-send-email-rajagopal.venkat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3889433949644879697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Powertop fails to display frequency stats when cpuidle subsystem
is not enabled. Fix it.

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 src/cpu/cpu_linux.cpp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index d6caf45..b8dbbc5 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -63,7 +63,7 @@ void cpu_linux::measurement_start(void)
 =

 	dir =3D opendir(filename);
 	if (!dir)
-		return;
+		goto cpufreq;
 =

 	/* For each C-state, there is a stateX directory which
 	 * contains a 'usage' and a 'time' (duration) file */
@@ -112,6 +112,7 @@ void cpu_linux::measurement_start(void)
 	}
 	closedir(dir);
 =

+cpufreq:
 	last_stamp =3D 0;
 =

 	for (i =3D 0; i < children.size(); i++)
@@ -149,7 +150,7 @@ void cpu_linux::measurement_end(void)
 =

 	dir =3D opendir(filename);
 	if (!dir)
-		return;
+		goto cpufreq;
 =

 	/* For each C-state, there is a stateX directory which
 	 * contains a 'usage' and a 'time' (duration) file */
@@ -188,6 +189,7 @@ void cpu_linux::measurement_end(void)
 	}
 	closedir(dir);
 =

+cpufreq:
 	sprintf(filename, "/sys/devices/system/cpu/cpu%i/cpufreq/stats/time_in_st=
ate", number);
 =

 	file.open(filename, ios::in);
-- =

1.7.11.3


--===============3889433949644879697==--

