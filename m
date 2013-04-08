Content-Type: multipart/mixed; boundary="===============7986110875929985733=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: [Powertop] [PATCH] cpu: add support for new package states
Date: Mon, 08 Apr 2013 16:49:44 -0700
Message-ID: <1365464984-30047-1-git-send-email-kristen@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7986110875929985733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The next generation Intel cpu supports package states c8/c9/c10.
Add the code to read the relevant MSR counters.
---
 src/cpu/cpu.cpp        |  4 ++++
 src/cpu/intel_cpus.cpp | 21 +++++++++++++++++++++
 src/cpu/intel_cpus.h   |  7 +++++++
 3 files changed, 32 insertions(+)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 9e075bd..0a6d4dc 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -78,7 +78,11 @@ static class abstract_cpu * new_package(int package, int=
 cpu, char * vendor, int
 			case 0x3A:      /* IVB */
 			case 0x3C:
 			case 0x3D:      /* IVB Xeon */
+				has_c2c7_res =3D 1;
+				ret =3D new class nhm_package;
+				break;
 			case 0x45:	/* Next Gen Intel Core Processor */
+				has_c8c9c10_res =3D 1;
 				has_c2c7_res =3D 1;
 				ret =3D new class nhm_package;
 				break;
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 2b78d31..f50bc0b 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -42,6 +42,7 @@
 =

 =

 int has_c2c7_res;
+int has_c8c9c10_res;
 =

 =

 =

@@ -248,6 +249,11 @@ void nhm_package::measurement_start(void)
 	c6_before    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
 	if (has_c2c7_res)
 		c7_before    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
+	if (has_c8c9c10_res) {
+		c8_before    =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
+		c9_before    =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
+		c10_before    =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
+	}
 	tsc_before   =3D get_msr(first_cpu, MSR_TSC);
 =

 	if (has_c2c7_res)
@@ -257,6 +263,11 @@ void nhm_package::measurement_start(void)
 	insert_cstate("pkg c6", "C6 (pc6)", 0, c6_before, 1);
 	if (has_c2c7_res)
 		insert_cstate("pkg c7", "C7 (pc7)", 0, c7_before, 1);
+	if (has_c8c9c10_res) {
+		insert_cstate("pkg c8", "C8 (pc8)", 0, c8_before, 1);
+		insert_cstate("pkg c9", "C9 (pc9)", 0, c9_before, 1);
+		insert_cstate("pkg c10", "C10 (pc10)", 0, c10_before, 1);
+	}
 }
 =

 void nhm_package::measurement_end(void)
@@ -276,6 +287,11 @@ void nhm_package::measurement_end(void)
 	c6_after    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
 	if (has_c2c7_res)
 		c7_after    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
+	if (has_c8c9c10_res) {
+		c8_after =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
+		c9_after =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
+		c10_after =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
+	}
 	tsc_after   =3D get_msr(first_cpu, MSR_TSC);
 =

 	gettimeofday(&stamp_after, NULL);
@@ -289,6 +305,11 @@ void nhm_package::measurement_end(void)
 	finalize_cstate("pkg c6", 0, c6_after, 1);
 	if (has_c2c7_res)
 		finalize_cstate("pkg c7", 0, c7_after, 1);
+	if (has_c8c9c10_res) {
+		finalize_cstate("pkg c8", 0, c8_after, 1);
+		finalize_cstate("pkg c9", 0, c9_after, 1);
+		finalize_cstate("pkg c10", 0, c10_after, 1);
+	}
 =

 	for (i =3D 0; i < children.size(); i++)
 		if (children[i])
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index a51a6d1..64d74f2 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -37,6 +37,9 @@
 #define MSR_PKG_C3_RESIDENCY		0x3F8
 #define MSR_PKG_C6_RESIDENCY		0x3F9
 #define MSR_PKG_C7_RESIDENCY		0x3FA
+#define MSR_PKG_C8_RESIDENCY		0x630
+#define MSR_PKG_C9_RESIDENCY		0x631
+#define MSR_PKG_C10_RESIDENCY		0x632
 #define MSR_CORE_C3_RESIDENCY		0x3FC
 #define MSR_CORE_C6_RESIDENCY		0x3FD
 #define MSR_CORE_C7_RESIDENCY		0x3FE
@@ -49,6 +52,9 @@ private:
 	uint64_t	c3_before, c3_after;
 	uint64_t	c6_before, c6_after;
 	uint64_t	c7_before, c7_after;
+	uint64_t	c8_before, c8_after;
+	uint64_t	c9_before, c9_after;
+	uint64_t	c10_before, c10_after;
 	uint64_t	tsc_before, tsc_after;
 =

 	uint64_t	last_stamp;
@@ -118,6 +124,7 @@ public:
 =

 =

 extern int has_c2c7_res;
+extern int has_c8c9c10_res;
 =

 class i965_core: public cpu_core
 {
-- =

1.7.11.7


--===============7986110875929985733==--

