Content-Type: multipart/mixed; boundary="===============6834388430957638935=="
MIME-Version: 1.0
From: Cheng, Michael <michael.cheng at intel.com>
Subject: [Powertop] [PATCH] Add more descriptive column headers for Idle Stats
 Tab
Date: Fri, 20 Apr 2018 11:45:08 -0700
Message-ID: <20180420184508.13552-1-michael.cheng@intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6834388430957638935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Michael Cheng <michael.cheng(a)intel.com>

This patch introduces a more descriptive column headers to show where
Powertop gets these values from (OS versus model specific registers).

Signed-off-by: Michael Cheng <michael.cheng(a)intel.com>
---
 src/cpu/cpu.cpp         | 25 +++++++++++++++++++------
 src/cpu/cpu.h           |  3 ++-
 src/cpu/cpu_core.cpp    |  6 ++----
 src/cpu/cpu_linux.cpp   |  2 +-
 src/cpu/cpu_package.cpp |  3 +--
 5 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index f3711f5..f6bae03 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -68,11 +68,15 @@ static class abstract_cpu * new_package(int package, in=
t cpu, char * vendor, int
 	char packagename[128];
 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0)
 		if (family =3D=3D 6)
-			if (is_supported_intel_cpu(model))
+			if (is_supported_intel_cpu(model)) {
 				ret =3D new class nhm_package(model);
+				ret->set_intel_MSR(true);
+			}
 =

-	if (!ret)
+	if (!ret) {
 		ret =3D new class cpu_package;
+		ret->set_intel_MSR(false);
+	}
 =

 	ret->set_number(package, cpu);
 	ret->set_type("Package");
@@ -105,11 +109,16 @@ static class abstract_cpu * new_core(int core, int cp=
u, char * vendor, int famil
 =

 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0)
 		if (family =3D=3D 6)
-			if (is_supported_intel_cpu(model))
+			if (is_supported_intel_cpu(model)) {
 				ret =3D new class nhm_core(model);
+				ret->set_intel_MSR(true);
+			}
 =

-	if (!ret)
+	if (!ret) {
 		ret =3D new class cpu_core;
+		ret->set_intel_MSR(false);
+	}
+
 	ret->set_number(core, cpu);
 	ret->childcount =3D 0;
 	ret->set_type("Core");
@@ -134,11 +143,15 @@ static class abstract_cpu * new_cpu(int number, char =
* vendor, int family, int m
 =

 	if (strcmp(vendor, "GenuineIntel") =3D=3D 0)
 		if (family =3D=3D 6)
-			if (is_supported_intel_cpu(model))
+			if (is_supported_intel_cpu(model)) {
 				ret =3D new class nhm_cpu;
+				ret->set_intel_MSR(true);
+			}
 =

-	if (!ret)
+	if (!ret) {
 		ret =3D new class cpu_linux;
+		ret->set_intel_MSR(false);
+	}
 	ret->set_number(number, number);
 	ret->set_type("CPU");
 	ret->childcount =3D 0;
diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index 6b4aed8..9b04018 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -93,7 +93,7 @@ public:
 	int	number;
 	int	childcount;
 	const char*    name;
-	bool	idle, old_idle;
+	bool	idle, old_idle, has_intel_MSR;
 	uint64_t	current_frequency;
 	uint64_t	effective_frequency;
 =

@@ -108,6 +108,7 @@ public:
 =

 	int	get_first_cpu() { return first_cpu; }
 	void	set_number(int _number, int cpu) {this->number =3D _number; this->fi=
rst_cpu =3D cpu;};
+	void	set_intel_MSR(bool _bool_value) {this->has_intel_MSR =3D  _bool_valu=
e;};
 	void	set_type(const char* _name) {this->name =3D _name;};
 	int	get_number(void) { return number; };
 	const char* get_type(void) { return name; };
diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
index 65c2718..e1372f7 100644
--- a/src/cpu/cpu_core.cpp
+++ b/src/cpu/cpu_core.cpp
@@ -33,10 +33,8 @@ char * cpu_core::fill_cstate_line(int line_nr, char *buf=
fer, const char *separat
 	unsigned int i;
 	buffer[0] =3D 0;
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("  Core"));
-		return buffer;
-	}
+	if (line_nr =3D=3D LEVEL_HEADER)
+		sprintf(buffer, this->has_intel_MSR ? _(" Core(HW)"): _(" Core(OS)"));
 =

 	for (i =3D 0; i < cstates.size(); i++) {
 		if (cstates[i]->line_level !=3D line_nr)
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index 2e8dba3..d7ce93d 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -239,7 +239,7 @@ char * cpu_linux::fill_cstate_line(int line_nr, char *b=
uffer, const char *separa
 	buffer[0] =3D 0;
 =

 	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_(" CPU %i"), number);
+		sprintf(buffer,_(" CPU(OS) %i"), number);
 		return buffer;
 	}
 =

diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
index c264e54..926a484 100644
--- a/src/cpu/cpu_package.cpp
+++ b/src/cpu/cpu_package.cpp
@@ -44,8 +44,7 @@ char * cpu_package::fill_cstate_line(int line_nr, char *b=
uffer, const char *sepa
 	buffer[0] =3D 0;
 =

 	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("Package"));
-		return buffer;
+		sprintf(buffer, this->has_intel_MSR ? _(" Pkg(HW)"): _(" Pkg(OS)"));
 	}
 =

 	for (i =3D 0; i < cstates.size(); i++) {
-- =

2.14.1


--===============6834388430957638935==--

