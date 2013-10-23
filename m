Content-Type: multipart/mixed; boundary="===============0033415913352426450=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 1/2] [PATCH] resolve android build errors
Date: Wed, 23 Oct 2013 22:27:02 +0300
Message-ID: <2df9d4c2355dda36565e5e5c64b90ff144be36c6.1382555988.git.sergey.senozhatsky@gmail.com>
In-Reply-To: cover.1382555988.git.sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0033415913352426450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>

- for android receiving compilation error
rapl_interface.cpp:195:40: error: call of overloaded 'pow(int, uint64_t)' i=
s ambiguous

include/math.h:222:8: note: double pow(double, double).
stlport/stlport/stl/_cmath.h:453:24: note: float pow(float, float)

- these files are missing in the android makefile

Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
---
 Android.mk                      | 4 ++++
 src/cpu/rapl/rapl_interface.cpp | 6 +++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Android.mk b/Android.mk
index ec47c4b..cf13fe8 100644
--- a/Android.mk
+++ b/Android.mk
@@ -31,6 +31,9 @@ LOCAL_SRC_FILES +=3D \
 	src/cpu/cpu_core.cpp \
 	src/cpu/cpu_package.cpp \
 	src/cpu/abstract_cpu.cpp \
+	src/cpu/cpu_rapl_device.cpp \
+	src/cpu/dram_rapl_device.cpp \
+	src/cpu/rapl/rapl_interface.cpp \
 	src/measurement/measurement.cpp \
 	src/measurement/acpi.cpp \
 	src/measurement/extech.cpp \
@@ -62,6 +65,7 @@ LOCAL_SRC_FILES +=3D \
 	src/devices/backlight.cpp \
 	src/devices/network.cpp \
 	src/devices/device.cpp \
+	src/devices/gpu_rapl_device.cpp \
 	src/devlist.cpp \
 	src/calibrate/calibrate.cpp \
 	src/lib.cpp \
diff --git a/src/cpu/rapl/rapl_interface.cpp b/src/cpu/rapl/rapl_interface.=
cpp
index 8f236eb..6dd7b26 100644
--- a/src/cpu/rapl/rapl_interface.cpp
+++ b/src/cpu/rapl/rapl_interface.cpp
@@ -192,7 +192,7 @@ double c_rapl_interface::get_power_unit()
 		return ret;
 	}
 =

-	return (double) 1/pow(2, value & 0xf);
+	return (double) 1/pow((double)2, (double)(value & 0xf));
 }
 =

 double c_rapl_interface::get_energy_status_unit()
@@ -206,7 +206,7 @@ double c_rapl_interface::get_energy_status_unit()
 		return ret;
 	}
 =

-	return (double)1/ pow(2, (value & 0x1f00) >> 8);
+	return (double)1/ pow((double)2, (double)((value & 0x1f00) >> 8));
 }
 =

 double c_rapl_interface::get_time_unit()
@@ -220,7 +220,7 @@ double c_rapl_interface::get_time_unit()
 		return ret;
 	}
 =

-	return (double)1 / pow(2, (value & 0xf0000) >> 16);
+	return (double)1 / pow((double)2, (double)((value & 0xf0000) >> 16));
 }
 =

 int c_rapl_interface::get_pkg_energy_status(double *status)
-- =

1.8.4.1.780.ga09e2a8


--===============0033415913352426450==--

