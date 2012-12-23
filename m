Content-Type: multipart/mixed; boundary="===============3443783532813971025=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv2 06/10] Deduplication: merge cpu_{core, linux,
 package}::change_effective_frequency() into
 abstract_cpu::change_effective_frequency()
Date: Mon, 24 Dec 2012 03:08:48 +0400
Message-ID: <1356304132-3889-7-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3443783532813971025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The mentioned overrides differ only in assigning 0 to effective_frequency
prior to calling abstract_cpu::change_effective_frequency(), which reassign=
s real frequency
to the same field.
Moreover, the field value is never used between assignments.

So it shall be safe to merge these overrides into the base definition as sh=
own:
* immediately assign real frequency to field effective_frequency;
* remove post-assignment to the same field.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/abstract_cpu.cpp | 17 +++++++++++++++--
 src/cpu/cpu.h            |  4 ----
 src/cpu/cpu_core.cpp     | 23 -----------------------
 src/cpu/cpu_linux.cpp    | 19 -------------------
 src/cpu/cpu_package.cpp  | 20 --------------------
 5 files changed, 15 insertions(+), 68 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index 5618761..ec52f55 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -393,14 +393,27 @@ void abstract_cpu::calculate_freq(uint64_t time)
 void abstract_cpu::change_effective_frequency(uint64_t time, uint64_t freq=
uency)
 {
 	unsigned int i;
+	uint64_t time_delta, fr;
+
+	if (last_stamp)
+		time_delta =3D time - last_stamp;
+	else
+		time_delta =3D 1;
+
+	fr =3D effective_frequency;
+	if (old_idle)
+		fr =3D 0;
+
+	account_freq(fr, time_delta);
+
+	effective_frequency =3D frequency;
+	last_stamp =3D time;
 =

 	/* propagate to all children */
 	for (i =3D 0; i < children.size(); i++)
 		if (children[i]) {
 			children[i]->change_effective_frequency(time, frequency);
 		}
-
-	effective_frequency =3D frequency;
 }
 =

 =

diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index 8b9c9f9..c99d4ea 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -173,7 +173,6 @@ public:
 	virtual char *  fill_pstate_name(int line_nr, char *buffer);
 =

 	virtual void    change_freq(uint64_t time, int freq);
-	virtual void	change_effective_frequency(uint64_t time, uint64_t freq);
 	virtual void    go_idle(uint64_t time);
 	virtual void    go_unidle(uint64_t time);
 =

@@ -190,7 +189,6 @@ public:
 =

 	virtual int     can_collapse(void) { return childcount =3D=3D 1;};
 	virtual void    calculate_freq(uint64_t time);
-	virtual void	change_effective_frequency(uint64_t time, uint64_t freq);
 };
 =

 class cpu_package: public abstract_cpu
@@ -204,8 +202,6 @@ public:
 	virtual int     can_collapse(void) { return childcount =3D=3D 1;};
 =

 	virtual void    calculate_freq(uint64_t time);
-	virtual void	change_effective_frequency(uint64_t time, uint64_t freq);
-
 };
 =

 extern void enumerate_cpus(void);
diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
index 8249d83..7ec498d 100644
--- a/src/cpu/cpu_core.cpp
+++ b/src/cpu/cpu_core.cpp
@@ -102,29 +102,6 @@ void cpu_core::calculate_freq(uint64_t time)
 	old_idle =3D idle;
 }
 =

-void cpu_core::change_effective_frequency(uint64_t time, uint64_t frequenc=
y)
-{
-	uint64_t freq =3D 0;
-	uint64_t time_delta, fr;
-
-
-	if (last_stamp)
-		time_delta =3D time - last_stamp;
-	else
-		time_delta =3D 1;
-
-	fr =3D effective_frequency;
-
-	if (old_idle)
-		fr =3D 0;
-
-	account_freq(fr, time_delta);
-
-	effective_frequency =3D freq;
-	last_stamp =3D time;
-	abstract_cpu::change_effective_frequency(time, frequency);
-}
-
 char * cpu_core::fill_pstate_line(int line_nr, char *buffer)
 {
 	buffer[0] =3D 0;
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index 41a2238..a2e6cb9 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -359,25 +359,6 @@ void cpu_linux::change_freq(uint64_t time, int frequen=
cy)
 	old_idle =3D idle;
 }
 =

-void cpu_linux::change_effective_frequency(uint64_t time, uint64_t frequen=
cy)
-{
-	uint64_t time_delta, fr;
-
-	if (last_stamp)
-		time_delta =3D time - last_stamp;
-	else
-		time_delta =3D 1;
-
-	fr =3D effective_frequency;
-	if (old_idle)
-		fr =3D 0;
-
-	account_freq(fr, time_delta);
-
-	effective_frequency =3D frequency;
-	last_stamp =3D time;
-}
-
 void cpu_linux::go_idle(uint64_t time)
 {
 =

diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
index 6794a38..ef54524 100644
--- a/src/cpu/cpu_package.cpp
+++ b/src/cpu/cpu_package.cpp
@@ -128,23 +128,3 @@ void cpu_package::calculate_freq(uint64_t time)
 	old_idle =3D idle;
 }
 =

-void cpu_package::change_effective_frequency(uint64_t time, uint64_t frequ=
ency)
-{
-	uint64_t time_delta, fr;
-
-	if (last_stamp)
-		time_delta =3D time - last_stamp;
-	else
-		time_delta =3D 1;
-
-	fr =3D effective_frequency;
-	if (old_idle)
-		fr =3D 0;
-
-	account_freq(fr, time_delta);
-
-	effective_frequency =3D frequency;
-	last_stamp =3D time;
-
-	abstract_cpu::change_effective_frequency(time, frequency);
-}
-- =

1.8.0.2


--===============3443783532813971025==--

