Content-Type: multipart/mixed; boundary="===============5562130694537794364=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv2 10/10] Deduplication: merge
 go_idle()/go_unidle()/change_freq() overrides into abstract_cpu() class
Date: Mon, 24 Dec 2012 03:08:52 +0400
Message-ID: <1356304132-3889-11-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5562130694537794364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When merging, also (while at it) use the new freq_updated() method in
these functions.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/cpu.h          | 11 +++--------
 src/cpu/cpu_linux.cpp  | 31 -------------------------------
 src/cpu/intel_cpus.cpp | 28 ----------------------------
 src/cpu/intel_cpus.h   |  5 -----
 4 files changed, 3 insertions(+), 72 deletions(-)

diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index 498447b..9c61641 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -143,9 +143,9 @@ public:
 =

 	/* Frequency micro accounting methods */
 	virtual void    calculate_freq(uint64_t time);
-	virtual void    go_idle(uint64_t time) { idle =3D true; if (parent) paren=
t->calculate_freq(time);};
-	virtual void    go_unidle(uint64_t time) { idle =3D false; if (parent) pa=
rent->calculate_freq(time);};;
-	virtual void    change_freq(uint64_t time, int freq) { current_frequency =
=3D freq; if (parent) parent->calculate_freq(time);};
+	virtual void    go_idle(uint64_t time) { idle =3D true; freq_updated(time=
); }
+	virtual void    go_unidle(uint64_t time) { idle =3D false; freq_updated(t=
ime); }
+	virtual void    change_freq(uint64_t time, int freq) { current_frequency =
=3D freq; freq_updated(time); }
 =

 	virtual void	change_effective_frequency(uint64_t time, uint64_t freq);
 =

@@ -172,11 +172,6 @@ public:
 =

 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
 	virtual char *  fill_pstate_name(int line_nr, char *buffer);
-
-	virtual void    change_freq(uint64_t time, int freq);
-	virtual void    go_idle(uint64_t time);
-	virtual void    go_unidle(uint64_t time);
-
 };
 =

 class cpu_core: public abstract_cpu
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index a2e6cb9..196bfdb 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -346,34 +346,3 @@ char * cpu_linux::fill_pstate_line(int line_nr, char *=
buffer)
 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
 	return buffer;
 }
-
-
-
-
-void cpu_linux::change_freq(uint64_t time, int frequency)
-{
-	current_frequency =3D frequency;
-
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
-
-void cpu_linux::go_idle(uint64_t time)
-{
-
-	idle =3D true;
-
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
-
-
-void cpu_linux::go_unidle(uint64_t time)
-{
-	idle =3D false;
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index a898c06..2b78d31 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -445,31 +445,3 @@ int nhm_cpu::has_pstate_level(int level)
 		return 1;
 	return cpu_linux::has_pstate_level(level);
 }
-
-void nhm_cpu::change_freq(uint64_t time, int frequency)
-{
-	current_frequency =3D frequency;
-
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
-
-void nhm_cpu::go_idle(uint64_t time)
-{
-
-	idle =3D true;
-
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
-
-
-void nhm_cpu::go_unidle(uint64_t time)
-{
-	idle =3D false;
-	if (parent)
-		parent->calculate_freq(time);
-	old_idle =3D idle;
-}
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index a4c0852..a125540 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -98,11 +98,6 @@ public:
 	virtual char *  fill_pstate_name(int line_nr, char *buffer);
 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
 	virtual int	has_pstate_level(int level);
-
-	virtual void    change_freq(uint64_t time, int freq);
-	virtual void    go_idle(uint64_t time);
-	virtual void    go_unidle(uint64_t time);
-
 };
 =

 class atom_package: public cpu_package
-- =

1.8.0.2


--===============5562130694537794364==--

