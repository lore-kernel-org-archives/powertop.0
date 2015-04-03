Content-Type: multipart/mixed; boundary="===============6572336363854135416=="
MIME-Version: 1.0
From: David E. Box <david.e.box at linux.intel.com>
Subject: [Powertop] [PATCH V2] Fix Powertop support for Intel Braswell SOC
Date: Thu, 02 Apr 2015 21:24:29 -0700
Message-ID: <1428035069-310-1-git-send-email-david.e.box@linux.intel.com>
In-Reply-To: 55034617.5040507@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6572336363854135416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Correct Braswell MSR used to determine PC6 residency.

Signed-off-by: David E. Box <david.e.box(a)linux.intel.com>
---

V2: Add missing whitespace between '=3D' in assignment statement

 src/cpu/intel_cpus.cpp | 21 +++++++++++++++++++--
 src/cpu/intel_cpus.h   |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 72ecd50..02b420e 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -289,6 +289,7 @@ nhm_package::nhm_package(int model)
 	has_c8c9c10_res =3D 0;
 	has_c2c6_res =3D 0;
 	has_c7_res =3D 0;
+	has_c6c_res =3D 0;
 =

 	switch(model) {
 		case 0x2A:	/* SNB */
@@ -314,6 +315,9 @@ nhm_package::nhm_package(int model)
 		else
 			has_c7_res =3D 0;
 	}
+	/* BSW only exposes package C6 */
+	else if (model =3D=3D 0x4C)
+		has_c6c_res =3D 1;
 	else
 		has_c3_res =3D 1;
 =

@@ -360,7 +364,15 @@ void nhm_package::measurement_start(void)
 =

 	if (this->has_c3_res)
 		c3_before    =3D get_msr(number, MSR_PKG_C3_RESIDENCY);
-	c6_before    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
+
+	/*
+	 * Hack for Braswell where C7 MSR is actually BSW C6
+	 */
+	if (this->has_c6c_res)
+		c6_before    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
+	else
+		c6_before    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
+
 	if (this->has_c7_res)
 		c7_before    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
 	if (this->has_c8c9c10_res) {
@@ -401,7 +413,12 @@ void nhm_package::measurement_end(void)
 =

 	if (this->has_c3_res)
 		c3_after    =3D get_msr(number, MSR_PKG_C3_RESIDENCY);
-	c6_after    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
+
+	if (this->has_c6c_res)
+		c6_after    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
+	else
+		c6_after    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
+
 	if (this->has_c7_res)
 		c7_after    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
 	if (has_c8c9c10_res) {
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 810a243..0331069 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -77,6 +77,7 @@ public:
 	int		has_c7_res;
 	int		has_c2c6_res;
 	int		has_c3_res;
+	int		has_c6c_res;		/* BSW */
 	int		has_c8c9c10_res;
 	nhm_package(int model);
 	virtual void	measurement_start(void);
-- =

1.9.1


--===============6572336363854135416==--

