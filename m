Content-Type: multipart/mixed; boundary="===============3472026089732987469=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv3 03/10] Deduplication: move all instances of
 account_freq() to abstract_cpu::account_freq()
Date: Mon, 24 Dec 2012 17:58:03 +0400
Message-ID: <15782216.4XQ9195BJj@intelfx-laptop>
In-Reply-To: 1356304132-3889-4-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3472026089732987469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Trivial: unify identical in-class private definitions in the common base cl=
ass.

The only override left is nhm_cpu::account_freq() which is almost identical=
 but
ignores the "Turbo Mode" state.
Seems like a hidden bug to me, but will remove it in a separate commit so o=
ne can revert
it easily in case something goes wrong.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/abstract_cpu.cpp | 39 +++++++++++++++++++++++++
 src/cpu/cpu.h            |  6 ++--
 src/cpu/cpu_core.cpp     | 39 -------------------------
 src/cpu/cpu_linux.cpp    | 39 -------------------------
 src/cpu/cpu_package.cpp  | 40 --------------------------
 src/cpu/intel_cpus.cpp   | 74 --------------------------------------------=
----
 src/cpu/intel_cpus.h     |  5 ----
 7 files changed, 41 insertions(+), 201 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index 537f3cb..5618761 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -28,7 +28,46 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include "cpu.h"
+#include "../lib.h"
 =

+void abstract_cpu::account_freq(uint64_t freq, uint64_t duration)
+{
+	struct frequency *state =3D NULL;
+	unsigned int i;
+
+	for (i =3D 0; i < pstates.size(); i++) {
+		if (freq =3D=3D pstates[i]->freq) {
+			state =3D pstates[i];
+			break;
+		}
+	}
+
+
+	if (!state) {
+		state =3D new(std::nothrow) struct frequency;
+
+		if (!state)
+			return;
+
+		memset(state, 0, sizeof(*state));
+
+		pstates.push_back(state);
+
+		state->freq =3D freq;
+		hz_to_human(freq, state->human_name);
+		if (freq =3D=3D 0)
+			strcpy(state->human_name, _("Idle"));
+		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
+			sprintf(state->human_name, _("Turbo Mode"));
+
+		state->after_count =3D 1;
+	}
+
+
+	state->time_after +=3D duration;
+
+
+}
 =

 void abstract_cpu::measurement_start(void)
 {
diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index 2304cd5..6f0203f 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -83,6 +83,8 @@ protected:
 	double  time_factor;
 	uint64_t max_frequency;
 	uint64_t max_minus_one_frequency;
+
+	virtual void	account_freq(uint64_t frequency, uint64_t duration);
 public:
 	uint64_t	last_stamp;
 	uint64_t	total_stamp;
@@ -158,8 +160,6 @@ extern vector<class abstract_cpu *> all_cpus;
 =

 class cpu_linux: public abstract_cpu
 {
-
-	void	account_freq(uint64_t frequency, uint64_t duration);
 	void 	parse_pstates_start(void);
 	void 	parse_cstates_start(void);
 	void 	parse_pstates_end(void);
@@ -186,7 +186,6 @@ public:
 =

 class cpu_core: public abstract_cpu
 {
-	void		account_freq(uint64_t frequency, uint64_t duration);
 public:
 	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char *s=
eparator=3D"");
 	virtual char *  fill_cstate_name(int line_nr, char *buffer);
@@ -201,7 +200,6 @@ public:
 =

 class cpu_package: public abstract_cpu
 {
-	void		account_freq(uint64_t frequency, uint64_t duration);
 public:
 	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char *s=
eparator=3D"");
 	virtual char *  fill_cstate_name(int line_nr, char *buffer);
diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
index 8aba60b..8249d83 100644
--- a/src/cpu/cpu_core.cpp
+++ b/src/cpu/cpu_core.cpp
@@ -77,45 +77,6 @@ char * cpu_core::fill_pstate_name(int line_nr, char *buf=
fer)
 	return buffer;
 }
 =

-
-void cpu_core::account_freq(uint64_t freq, uint64_t duration)
-{
-	struct frequency *state =3D NULL;
-	unsigned int i;
-
-	for (i =3D 0; i < pstates.size(); i++) {
-		if (freq =3D=3D pstates[i]->freq) {
-			state =3D pstates[i];
-			break;
-		}
-	}
-
-
-	if (!state) {
-		state =3D new(std::nothrow) struct frequency;
-
-		if (!state)
-			return;
-
-		memset(state, 0, sizeof(*state));
-
-		pstates.push_back(state);
-
-		state->freq =3D freq;
-		hz_to_human(freq, state->human_name);
-		if (freq =3D=3D 0)
-			strcpy(state->human_name, _("Idle"));
-		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
-			sprintf(state->human_name, _("Turbo Mode"));
-
-		state->after_count =3D 1;
-	}
-
-
-	state->time_after +=3D duration;
-}
-
-
 void cpu_core::calculate_freq(uint64_t time)
 {
 	uint64_t freq =3D 0;
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index 2837cd0..1a0eb4d 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -350,45 +350,6 @@ char * cpu_linux::fill_pstate_line(int line_nr, char *=
buffer)
 =

 =

 =

-void cpu_linux::account_freq(uint64_t freq, uint64_t duration)
-{
-	struct frequency *state =3D NULL;
-	unsigned int i;
-
-
-	for (i =3D 0; i < pstates.size(); i++) {
-		if (freq =3D=3D pstates[i]->freq) {
-			state =3D pstates[i];
-			break;
-		}
-	}
-
-	if (!state) {
-		state =3D new(std::nothrow) struct frequency;
-
-		if (!state)
-			return;
-
-		memset(state, 0, sizeof(*state));
-
-		pstates.push_back(state);
-
-		state->freq =3D freq;
-		hz_to_human(freq, state->human_name);
-		if (freq =3D=3D 0)
-			strcpy(state->human_name, _("Idle"));
-		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
-			sprintf(state->human_name, _("Turbo Mode"));
-
-		state->after_count =3D 1;
-	}
-
-
-	state->time_after +=3D duration;
-
-
-}
-
 void cpu_linux::change_freq(uint64_t time, int frequency)
 {
 	current_frequency =3D frequency;
diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
index 61ce050..6794a38 100644
--- a/src/cpu/cpu_package.cpp
+++ b/src/cpu/cpu_package.cpp
@@ -102,46 +102,6 @@ char * cpu_package::fill_pstate_line(int line_nr, char=
 *buffer)
 	return buffer;
 }
 =

-
-
-
-void cpu_package::account_freq(uint64_t freq, uint64_t duration)
-{
-	struct frequency *state =3D NULL;
-	unsigned int i;
-
-	for (i =3D 0; i < pstates.size(); i++) {
-		if (freq =3D=3D pstates[i]->freq) {
-			state =3D pstates[i];
-			break;
-		}
-	}
-
-
-	if (!state) {
-		state =3D new(std::nothrow) struct frequency;
-
-		if (!state)
-			return;
-
-		memset(state, 0, sizeof(*state));
-
-		pstates.push_back(state);
-
-		state->freq =3D freq;
-		hz_to_human(freq, state->human_name);
-		if (freq =3D=3D 0)
-			strcpy(state->human_name, _("Idle"));
-		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
-			sprintf(state->human_name, _("Turbo Mode"));
-		state->after_count =3D 1;
-	}
-
-	state->time_after +=3D duration;
-
-}
-
-
 void cpu_package::calculate_freq(uint64_t time)
 {
 	uint64_t freq =3D 0;
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 640a0d5..4d52206 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -185,44 +185,6 @@ void nhm_core::measurement_end(void)
 	total_stamp =3D 0;
 }
 =

-void nhm_core::account_freq(uint64_t freq, uint64_t duration)
-{
-	struct frequency *state =3D NULL;
-	unsigned int i;
-
-	for (i =3D 0; i < pstates.size(); i++) {
-		if (freq =3D=3D pstates[i]->freq) {
-			state =3D pstates[i];
-			break;
-		}
-	}
-
-
-	if (!state) {
-		state =3D new(std::nothrow) struct frequency;
-
-		if (!state)
-			return;
-
-		memset(state, 0, sizeof(*state));
-
-		pstates.push_back(state);
-
-		state->freq =3D freq;
-		hz_to_human(freq, state->human_name);
-		if (freq =3D=3D 0)
-			strcpy(state->human_name, _("Idle"));
-		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
-			sprintf(state->human_name, _("Turbo Mode"));
-
-		state->after_count =3D 1;
-	}
-
-
-	state->time_after +=3D duration;
-}
-
-
 void nhm_core::calculate_freq(uint64_t time)
 {
 	uint64_t freq =3D 0;
@@ -418,42 +380,6 @@ void nhm_package::measurement_end(void)
 =

 }
 =

-void nhm_package::account_freq(uint64_t freq, uint64_t duration)
-{
-	struct frequency *state =3D NULL;
-	unsigned int i;
-
-	for (i =3D 0; i < pstates.size(); i++) {
-		if (freq =3D=3D pstates[i]->freq) {
-			state =3D pstates[i];
-			break;
-		}
-	}
-
-
-	if (!state) {
-		state =3D new(std::nothrow) struct frequency;
-
-		if (!state)
-			return;
-
-		memset(state, 0, sizeof(*state));
-
-		pstates.push_back(state);
-
-		state->freq =3D freq;
-		hz_to_human(freq, state->human_name);
-		if (freq =3D=3D 0)
-			strcpy(state->human_name, _("Idle"));
-		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
-			sprintf(state->human_name, _("Turbo Mode"));
-		state->after_count =3D 1;
-	}
-
-	state->time_after +=3D duration;
-
-}
-
 =

 void nhm_package::calculate_freq(uint64_t time)
 {
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index a8bb892..181ffc4 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -53,9 +53,6 @@ private:
 =

 	uint64_t	last_stamp;
 	uint64_t	total_stamp;
-
-	void		account_freq(uint64_t frequency, uint64_t duration);
-
 public:
 	virtual void	measurement_start(void);
 	virtual void	measurement_end(void);
@@ -78,8 +75,6 @@ private:
 =

 	uint64_t	last_stamp;
 	uint64_t	total_stamp;
-
-	void		account_freq(uint64_t frequency, uint64_t duration);
 public:
 	virtual void	measurement_start(void);
 	virtual void	measurement_end(void);
-- =

1.8.0.2



--===============3472026089732987469==--

