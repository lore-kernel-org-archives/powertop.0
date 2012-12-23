Content-Type: multipart/mixed; boundary="===============4370791509774653417=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv2 07/10] Deduplication: remove {cpu,
 nhm}_core::calculate_freq() identical to
 abstract_cpu::calculate_freq()
Date: Mon, 24 Dec 2012 03:08:49 +0400
Message-ID: <1356304132-3889-8-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4370791509774653417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Trivial: remove identical overrides wrt. direct base class.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/cpu.h          |  1 -
 src/cpu/cpu_core.cpp   | 25 -------------------------
 src/cpu/intel_cpus.cpp | 26 --------------------------
 src/cpu/intel_cpus.h   |  2 --
 4 files changed, 54 deletions(-)

diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index c99d4ea..1e9d771 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -188,7 +188,6 @@ public:
 	virtual char *  fill_pstate_name(int line_nr, char *buffer);
 =

 	virtual int     can_collapse(void) { return childcount =3D=3D 1;};
-	virtual void    calculate_freq(uint64_t time);
 };
 =

 class cpu_package: public abstract_cpu
diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
index 7ec498d..65c2718 100644
--- a/src/cpu/cpu_core.cpp
+++ b/src/cpu/cpu_core.cpp
@@ -77,31 +77,6 @@ char * cpu_core::fill_pstate_name(int line_nr, char *buf=
fer)
 	return buffer;
 }
 =

-void cpu_core::calculate_freq(uint64_t time)
-{
-	uint64_t freq =3D 0;
-	bool is_idle =3D true;
-	unsigned int i;
-
-	/* calculate the maximum frequency of all children */
-	for (i =3D 0; i < children.size(); i++)
-		if (children[i] && children[i]->has_pstates()) {
-			uint64_t f =3D 0;
-			if (!children[i]->idle) {
-				f =3D children[i]->current_frequency;
-				is_idle =3D false;
-			}
-			if (f > freq)
-				freq =3D f;
-		}
-
-	current_frequency =3D freq;
-	idle =3D is_idle;
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
-
 char * cpu_core::fill_pstate_line(int line_nr, char *buffer)
 {
 	buffer[0] =3D 0;
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index ae31112..031c7ac 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -185,32 +185,6 @@ void nhm_core::measurement_end(void)
 	total_stamp =3D 0;
 }
 =

-void nhm_core::calculate_freq(uint64_t time)
-{
-	uint64_t freq =3D 0;
-	bool is_idle =3D true;
-	unsigned int i;
-
-
-	/* calculate the maximum frequency of all children */
-	for (i =3D 0; i < children.size(); i++)
-		if (children[i] && children[i]->has_pstates()) {
-			uint64_t f =3D 0;
-			if (!children[i]->idle) {
-				f =3D children[i]->current_frequency;
-				is_idle =3D false;
-			}
-			if (f > freq)
-				freq =3D f;
-		}
-
-	current_frequency =3D freq;
-	idle =3D is_idle;
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
-
 char * nhm_core::fill_pstate_line(int line_nr, char *buffer)
 {
 	buffer[0] =3D 0;
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 53cadab..f41d589 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -80,8 +80,6 @@ public:
 	virtual int     can_collapse(void) { return 0;};
 =

 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
-
-	virtual void    calculate_freq(uint64_t time);
 };
 =

 class nhm_cpu: public cpu_linux
-- =

1.8.0.2


--===============4370791509774653417==--

