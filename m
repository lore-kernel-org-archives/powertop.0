Content-Type: multipart/mixed; boundary="===============5583948076167067235=="
MIME-Version: 1.0
From: =?utf-8?q?Jaroslav_=C5=A0karvada_=3Cjskarvad_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] Do not exit on MSR read errors
Date: Mon, 11 May 2015 16:32:14 +0200
Message-ID: <1431354734-5615-1-git-send-email-jskarvad@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5583948076167067235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are virtual environments not correctly implementing the MSR (e.g.
VirtualBox bug: https://www.virtualbox.org/ticket/14099) or not implementing
it at all (e.g. KVM). PowerTOP just exits in such environments and
cannot run.

The proposed patch makes PowerTOP not to exit on MSR read errors, but still
report them.

Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
---
 src/cpu/intel_cpus.cpp | 103 +++++++++++++++++++++++++++++----------------=
----
 src/cpu/intel_cpus.h   |   1 +
 2 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 1f3647a..69fdc84 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -79,20 +79,20 @@ int is_supported_intel_cpu(int model)
 	return 0;
 }
 =

-static uint64_t get_msr(int cpu, uint64_t offset)
+static int get_msr(int cpu, uint64_t offset, uint64_t *msr)
 {
 	ssize_t retval;
-	uint64_t msr;
 =

-	retval =3D read_msr(cpu, offset, &msr);
+	retval =3D read_msr(cpu, offset, msr);
 	if (retval < 0) {
 		reset_display();
 		fprintf(stderr, _("read_msr cpu%d 0x%llx : "), cpu, (unsigned long long)=
offset);
 		fprintf(stderr, "%s\n", strerror(errno));
-		exit(-2);
+		*msr =3D 0;
+		return 0;
 	}
 =

-	return msr;
+	return 1;
 }
 =

 intel_util::intel_util()
@@ -152,13 +152,18 @@ void nhm_core::measurement_start(void)
 	last_stamp =3D 0;
 =

 	if (this->has_c1_res)
-		c1_before =3D get_msr(first_cpu, MSR_CORE_C1_RESIDENCY);
+		if (!get_msr(first_cpu, MSR_CORE_C1_RESIDENCY, &c1_before))
+			this->has_c1_res =3D 0;
 	if (this->has_c3_res)
-		c3_before    =3D get_msr(first_cpu, MSR_CORE_C3_RESIDENCY);
-	c6_before    =3D get_msr(first_cpu, MSR_CORE_C6_RESIDENCY);
+		if (!get_msr(first_cpu, MSR_CORE_C3_RESIDENCY, &c3_before))
+			this->has_c3_res =3D 0;
+	if (this->has_c6_res)
+		if (!get_msr(first_cpu, MSR_CORE_C6_RESIDENCY, &c6_before))
+			this->has_c6_res =3D 0;
 	if (this->has_c7_res)
-		c7_before    =3D get_msr(first_cpu, MSR_CORE_C7_RESIDENCY);
-	tsc_before   =3D get_msr(first_cpu, MSR_TSC);
+		if (!get_msr(first_cpu, MSR_CORE_C7_RESIDENCY, &c7_before))
+			this->has_c7_res =3D 0;
+	get_msr(first_cpu, MSR_TSC, &tsc_before);
 =

 	if (this->has_c1_res)
 		insert_cstate("core c1", "C1 (cc1)", 0, c1_before, 1);
@@ -196,13 +201,18 @@ void nhm_core::measurement_end(void)
 	double ratio;
 =

 	if (this->has_c1_res)
-		c1_after =3D get_msr(first_cpu, MSR_CORE_C1_RESIDENCY);
+		if (!get_msr(first_cpu, MSR_CORE_C1_RESIDENCY, &c1_after))
+			this->has_c1_res =3D 0;
 	if (this->has_c3_res)
-		c3_after    =3D get_msr(first_cpu, MSR_CORE_C3_RESIDENCY);
-	c6_after    =3D get_msr(first_cpu, MSR_CORE_C6_RESIDENCY);
+		if (!get_msr(first_cpu, MSR_CORE_C3_RESIDENCY, &c3_after))
+			this->has_c3_res =3D 0;
+	if (this->has_c6_res)
+		if (!get_msr(first_cpu, MSR_CORE_C6_RESIDENCY, &c6_after))
+			this->has_c6_res =3D 0;
 	if (this->has_c7_res)
-		c7_after    =3D get_msr(first_cpu, MSR_CORE_C7_RESIDENCY);
-	tsc_after   =3D get_msr(first_cpu, MSR_TSC);
+		if (!get_msr(first_cpu, MSR_CORE_C7_RESIDENCY, &c7_after))
+			this->has_c7_res =3D 0;
+	get_msr(first_cpu, MSR_TSC, &tsc_after);
 =

 	if (this->has_c1_res)
 		finalize_cstate("core c1", 0, c1_after, 1);
@@ -360,27 +370,31 @@ void nhm_package::measurement_start(void)
 	last_stamp =3D 0;
 =

 	if (this->has_c2c6_res)
-		c2_before    =3D get_msr(number, MSR_PKG_C2_RESIDENCY);
+		if (!get_msr(number, MSR_PKG_C2_RESIDENCY, &c2_before))
+			this->has_c2c6_res =3D 0;
 =

 	if (this->has_c3_res)
-		c3_before    =3D get_msr(number, MSR_PKG_C3_RESIDENCY);
+		if (!get_msr(number, MSR_PKG_C3_RESIDENCY, &c3_before))
+			this->has_c3_res =3D 0;
 =

 	/*
 	 * Hack for Braswell where C7 MSR is actually BSW C6
 	 */
 	if (this->has_c6c_res)
-		c6_before    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
+		get_msr(number, MSR_PKG_C7_RESIDENCY, &c6_before);
 	else
-		c6_before    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
+		get_msr(number, MSR_PKG_C6_RESIDENCY, &c6_before);
 =

 	if (this->has_c7_res)
-		c7_before    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
+		if (!get_msr(number, MSR_PKG_C7_RESIDENCY, &c7_before))
+			this->has_c7_res =3D 0;
 	if (this->has_c8c9c10_res) {
-		c8_before    =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
-		c9_before    =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
-		c10_before    =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
+		if (!get_msr(number, MSR_PKG_C8_RESIDENCY, &c8_before) ||
+		    !get_msr(number, MSR_PKG_C9_RESIDENCY, &c9_before) ||
+		    !get_msr(number, MSR_PKG_C10_RESIDENCY, &c10_before))
+			this->has_c8c9c10_res =3D 0;
 	}
-	tsc_before   =3D get_msr(first_cpu, MSR_TSC);
+	get_msr(first_cpu, MSR_TSC, &tsc_before);
 =

 	if (this->has_c2c6_res)
 		insert_cstate("pkg c2", "C2 (pc2)", 0, c2_before, 1);
@@ -409,24 +423,28 @@ void nhm_package::measurement_end(void)
 =

 =

 	if (this->has_c2c6_res)
-		c2_after    =3D get_msr(number, MSR_PKG_C2_RESIDENCY);
+		if (!get_msr(number, MSR_PKG_C2_RESIDENCY, &c2_after))
+			this->has_c2c6_res =3D 0;
 =

 	if (this->has_c3_res)
-		c3_after    =3D get_msr(number, MSR_PKG_C3_RESIDENCY);
+		if (!get_msr(number, MSR_PKG_C3_RESIDENCY, &c3_after))
+			this->has_c3_res =3D 0;
 =

 	if (this->has_c6c_res)
-		c6_after    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
+		get_msr(number, MSR_PKG_C7_RESIDENCY, &c6_after);
 	else
-		c6_after    =3D get_msr(number, MSR_PKG_C6_RESIDENCY);
+		get_msr(number, MSR_PKG_C6_RESIDENCY, &c6_after);
 =

 	if (this->has_c7_res)
-		c7_after    =3D get_msr(number, MSR_PKG_C7_RESIDENCY);
-	if (has_c8c9c10_res) {
-		c8_after =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
-		c9_after =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
-		c10_after =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
+		if (!get_msr(number, MSR_PKG_C7_RESIDENCY, &c7_after))
+			this->has_c7_res =3D 0;
+	if (this->has_c8c9c10_res) {
+		if (!get_msr(number, MSR_PKG_C8_RESIDENCY, &c8_after) ||
+		    !get_msr(number, MSR_PKG_C9_RESIDENCY, &c9_after) ||
+		    !get_msr(number, MSR_PKG_C10_RESIDENCY, &c10_after))
+			this->has_c8c9c10_res =3D 0;
 	}
-	tsc_after   =3D get_msr(first_cpu, MSR_TSC);
+	get_msr(first_cpu, MSR_TSC, &tsc_after);
 =

 	gettimeofday(&stamp_after, NULL);
 =

@@ -441,7 +459,7 @@ void nhm_package::measurement_end(void)
 	finalize_cstate("pkg c6", 0, c6_after, 1);
 	if (this->has_c7_res)
 		finalize_cstate("pkg c7", 0, c7_after, 1);
-	if (has_c8c9c10_res) {
+	if (this->has_c8c9c10_res) {
 		finalize_cstate("pkg c8", 0, c8_after, 1);
 		finalize_cstate("pkg c9", 0, c9_after, 1);
 		finalize_cstate("pkg c10", 0, c10_after, 1);
@@ -497,9 +515,9 @@ void nhm_cpu::measurement_start(void)
 =

 	last_stamp =3D 0;
 =

-	aperf_before =3D get_msr(number, MSR_APERF);
-	mperf_before =3D get_msr(number, MSR_MPERF);
-	tsc_before   =3D get_msr(number, MSR_TSC);
+	get_msr(number, MSR_APERF, &aperf_before);
+	get_msr(number, MSR_MPERF, &mperf_before);
+	get_msr(number, MSR_TSC, &tsc_before);
 =

 	insert_cstate("active", _("C0 active"), 0, aperf_before, 1);
 =

@@ -527,9 +545,9 @@ void nhm_cpu::measurement_end(void)
 	double ratio;
 	unsigned int i;
 =

-	aperf_after =3D get_msr(number, MSR_APERF);
-	mperf_after =3D get_msr(number, MSR_MPERF);
-	tsc_after   =3D get_msr(number, MSR_TSC);
+	get_msr(number, MSR_APERF, &aperf_after);
+	get_msr(number, MSR_MPERF, &mperf_after);
+	get_msr(number, MSR_TSC, &tsc_after);
 =

 =

 =

@@ -582,7 +600,8 @@ char * nhm_cpu::fill_pstate_line(int line_nr, char *buf=
fer)
 =

 	if (line_nr =3D=3D LEVEL_C0) {
 		double F;
-		F =3D 1.0 * (tsc_after - tsc_before) * (aperf_after - aperf_before) / (m=
perf_after - mperf_before) / time_factor * 1000;
+		F =3D mperf_after - mperf_before;
+		F =3D 1.0 * (tsc_after - tsc_before) * (aperf_after - aperf_before) / (F=
 ? F : 1) / time_factor * 1000;
 		hz_to_human(F, buffer, 1);
 		return buffer;
 	}
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 0331069..e909018 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -100,6 +100,7 @@ private:
 	uint64_t	total_stamp;
 public:
 	int		has_c1_res;
+	int		has_c6_res =3D 1;
 	int		has_c7_res;
 	int		has_c3_res;
 	nhm_core(int model);
-- =

2.1.0


--===============5583948076167067235==--

