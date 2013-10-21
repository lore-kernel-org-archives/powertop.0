Content-Type: multipart/mixed; boundary="===============1182322964003670563=="
MIME-Version: 1.0
From: Sanjay Singh Rawat <sanjay.rawat at linaro.org>
Subject: [Powertop] [PATCH] resolve error for overloaded function call
Date: Mon, 21 Oct 2013 17:19:01 +0530
Message-ID: <1382356141-21415-1-git-send-email-sanjay.rawat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1182322964003670563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

- for android receiving compilation error
rapl_interface.cpp:195:40: error: call of overloaded 'pow(int, uint64_t)' i=
s ambiguous

include/math.h:222:8: note: double pow(double, double).
stlport/stlport/stl/_cmath.h:453:24: note: float pow(float, float)

Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
---
 src/cpu/rapl/rapl_interface.cpp |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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

1.7.9.5


--===============1182322964003670563==--

