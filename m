Content-Type: multipart/mixed; boundary="===============2765076723855527915=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv2 09/10] Deduplication: properly merge
 cpu_package::calculate_freq() into abstract_cpu::calculate_freq()
Date: Mon, 24 Dec 2012 03:08:51 +0400
Message-ID: <1356304132-3889-10-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2765076723855527915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The overridden method "cpu_package::calculate_freq()" differs from a generi=
c implementation in
that it propagates the package's frequency to all in-package cores by
calling change_effective_frequency().

Instead of duplicating the code, introduce a small virtual function
freq_updated() which normally propagates frequency changes upwards and
override it for cpu_package, retaining the correct behavior. Then remove th=
e override of
calculate_freq().

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/abstract_cpu.cpp | 11 ++++++++---
 src/cpu/cpu.h            |  5 +++--
 src/cpu/cpu_package.cpp  | 38 +++++++++++---------------------------
 3 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index ec52f55..fea377b 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -69,6 +69,13 @@ void abstract_cpu::account_freq(uint64_t freq, uint64_t =
duration)
 =

 }
 =

+void abstract_cpu::freq_updated(uint64_t time)
+{
+	if(parent)
+		parent->calculate_freq(time);
+	old_idle =3D idle;
+}
+
 void abstract_cpu::measurement_start(void)
 {
 	unsigned int i;
@@ -385,9 +392,7 @@ void abstract_cpu::calculate_freq(uint64_t time)
 =

 	current_frequency =3D freq;
 	idle =3D is_idle;
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
+	freq_updated(time);
 }
 =

 void abstract_cpu::change_effective_frequency(uint64_t time, uint64_t freq=
uency)
diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index 1e9d771..498447b 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -85,6 +85,7 @@ protected:
 	uint64_t max_minus_one_frequency;
 =

 	virtual void	account_freq(uint64_t frequency, uint64_t duration);
+	virtual void	freq_updated(uint64_t time);
 public:
 	uint64_t	last_stamp;
 	uint64_t	total_stamp;
@@ -192,6 +193,8 @@ public:
 =

 class cpu_package: public abstract_cpu
 {
+protected:
+	virtual void	freq_updated(uint64_t time);
 public:
 	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char *s=
eparator=3D"");
 	virtual char *  fill_cstate_name(int line_nr, char *buffer);
@@ -199,8 +202,6 @@ public:
 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
 	virtual char *  fill_pstate_name(int line_nr, char *buffer);
 	virtual int     can_collapse(void) { return childcount =3D=3D 1;};
-
-	virtual void    calculate_freq(uint64_t time);
 };
 =

 extern void enumerate_cpus(void);
diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
index ef54524..c264e54 100644
--- a/src/cpu/cpu_package.cpp
+++ b/src/cpu/cpu_package.cpp
@@ -27,6 +27,17 @@
 #include "../lib.h"
 #include "../parameters/parameters.h"
 =

+void cpu_package::freq_updated(uint64_t time)
+{
+	if (parent)
+		parent->calculate_freq(time);
+	/*
+	 * Make the frequency changes to propagate to all cores in a package.
+	 */
+	change_effective_frequency(time, current_frequency);
+	old_idle =3D idle;
+}
+
 char * cpu_package::fill_cstate_line(int line_nr, char *buffer, const char=
 *separator)
 {
 	unsigned int i;
@@ -101,30 +112,3 @@ char * cpu_package::fill_pstate_line(int line_nr, char=
 *buffer)
 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
 	return buffer;
 }
-
-void cpu_package::calculate_freq(uint64_t time)
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
-	change_effective_frequency(time, current_frequency);
-	old_idle =3D idle;
-}
-
-- =

1.8.0.2


--===============2765076723855527915==--

