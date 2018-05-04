Content-Type: multipart/mixed; boundary="===============5845006612822959839=="
MIME-Version: 1.0
From: =?utf-8?q?Jaroslav_=C5=A0karvada_=3Cjskarvad_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] Don't use intel_cpus if APERF MSR isn't supported
Date: Fri, 04 May 2018 23:55:55 +0200
Message-ID: <20180504215555.8489-1-jskarvad@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5845006612822959839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The intel_cpus (class nhm_package) needs APERF MSR. This maybe problem on
some virtual machines (e.g. KVM) where the APERF MSR is not implemented.
On such VMs powertop exits with MSR read error and doesn't work. Previously,
powertop worked in such cases (e.g. powertop-2.3). This patch adds check
whether APERF MSR is supported, if not, intel_cpus is not used.

Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
---
 src/cpu/cpu.cpp        | 6 +++---
 src/cpu/intel_cpus.cpp | 6 ++++--
 src/cpu/intel_cpus.h   | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index f3711f5..019d922 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -68,7 +68,7 @@ static class abstract_cpu * new_package(int package, int =
cpu, char * vendor, int
 	char packagename[128];
 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0)
 		if (family =3D=3D 6)
-			if (is_supported_intel_cpu(model))
+			if (is_supported_intel_cpu(model, cpu))
 				ret =3D new class nhm_package(model);
 =

 	if (!ret)
@@ -105,7 +105,7 @@ static class abstract_cpu * new_core(int core, int cpu,=
 char * vendor, int famil
 =

 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0)
 		if (family =3D=3D 6)
-			if (is_supported_intel_cpu(model))
+			if (is_supported_intel_cpu(model, cpu))
 				ret =3D new class nhm_core(model);
 =

 	if (!ret)
@@ -134,7 +134,7 @@ static class abstract_cpu * new_cpu(int number, char * =
vendor, int family, int m
 =

 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0)
 		if (family =3D=3D 6)
-			if (is_supported_intel_cpu(model))
+			if (is_supported_intel_cpu(model, number))
 				ret =3D new class nhm_cpu;
 =

 	if (!ret)
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 4c7b315..0030dba 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -77,13 +77,15 @@ static int intel_cpu_models[] =3D {
 =

 static int intel_pstate_driver_loaded =3D -1;
 =

-int is_supported_intel_cpu(int model)
+int is_supported_intel_cpu(int model, int cpu)
 {
 	int i;
+	uint64_t msr;
 =

 	for (i =3D 0; intel_cpu_models[i] !=3D 0; i++)
 		if (model =3D=3D intel_cpu_models[i])
-			return 1;
+			if (cpu < 0 || read_msr(cpu, MSR_APERF, &msr) >=3D 0)
+				return 1;
 =

 	return 0;
 }
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index d20db9a..79afb98 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -172,7 +172,7 @@ public:
 =

 };
 =

-int is_supported_intel_cpu(int model);
+int is_supported_intel_cpu(int model, int cpu);
 int byt_has_ahci();
 =

 int is_intel_pstate_driver_loaded();
-- =

2.14.3


--===============5845006612822959839==--

