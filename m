Content-Type: multipart/mixed; boundary="===============4539080705227720278=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: [Powertop] [PATCH 2/4] Make the "which C state line" logic better
Date: Sun, 05 Aug 2012 10:13:11 -0700
Message-ID: <501EA9A7.8020900@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4539080705227720278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>From 2e88a61859db0592707d1a0a35e33408a0327951 Mon Sep 17 00:00:00 2001
From: Arjan van de Ven <arjan(a)linux.intel.com>
Date: Sun, 5 Aug 2012 09:57:49 -0700
Subject: [PATCH 2/4] Make the "which C state line" logic better

the ARM guys complained that their human-readable C state names didn't have
numbers in them, and that as a result, the output is all messed up.
Using the "linux_name" instead is only a partial solution; it messes up the=
 x86
side of the logic.

This patch fixes the logic to make the code use the human readable logic fi=
rst,
but if there's no numbers there, fall back to the Linux name.

In addition, the patch allows callers to specify the line directly, overrid=
ing
both sets of logic.
---
 src/cpu/abstract_cpu.cpp |   21 ++++++++++++++++++---
 src/cpu/cpu.h            |    4 ++--
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index cd4eba0..8b4c650 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -130,7 +130,7 @@ void abstract_cpu::measurement_end(void)
 	}
 }

-void abstract_cpu::insert_cstate(const char *linux_name, const char *human=
_name, uint64_t usage, uint64_t duration, int count)
+void abstract_cpu::insert_cstate(const char *linux_name, const char *human=
_name, uint64_t usage, uint64_t duration, int count, int level)
 {
 	struct idle_state *state;
 	const char *c;
@@ -147,6 +147,8 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 	strcpy(state->linux_name, linux_name);
 	strcpy(state->human_name, human_name);

+	state->line_level =3D -1;
+	=

 	c =3D human_name;
 	while (*c) {
 		if (strcmp(linux_name, "active")=3D=3D0) {
@@ -160,6 +162,19 @@ void abstract_cpu::insert_cstate(const char *linux_nam=
e, const char *human_name,
 		c++;
 	}

+	/* some architectures (ARM) don't have good numbers in thier human name..=
 fall back to the linux name for those */
+	c =3D linux_name;
+	while (*c && state->line_level < 0) {
+		if (*c >=3D '0' && *c <=3D'9') {
+			state->line_level =3D strtoull(c, NULL, 10);
+			break;
+		}
+		c++;
+	}
+	=

+	if (level >=3D 0)
+		state->line_level =3D level;
+
 	state->usage_before =3D usage;
 	state->duration_before =3D duration;
 	state->before_count =3D count;
@@ -187,7 +202,7 @@ void abstract_cpu::finalize_cstate(const char *linux_na=
me, uint64_t usage, uint6
 	state->after_count +=3D count;
 }

-void abstract_cpu::update_cstate(const char *linux_name, const char *human=
_name, uint64_t usage, uint64_t duration, int count)
+void abstract_cpu::update_cstate(const char *linux_name, const char *human=
_name, uint64_t usage, uint64_t duration, int count, int level)
 {
 	unsigned int i;
 	struct idle_state *state =3D NULL;
@@ -200,7 +215,7 @@ void abstract_cpu::update_cstate(const char *linux_name=
, const char *human_name,
 	}

 	if (!state) {
-		insert_cstate(linux_name, human_name, usage, duration, count);
+		insert_cstate(linux_name, human_name, usage, duration, count, level);
 		return;
 	}

diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index b48ada9..d51e3b2 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -111,8 +111,8 @@ public:

 	/* C state related methods */

-	void		insert_cstate(const char *linux_name, const char *human_name, uint6=
4_t usage, uint64_t duration, int count);
-	void		update_cstate(const char *linux_name, const char *human_name, uint6=
4_t usage, uint64_t duration, int count);
+	void		insert_cstate(const char *linux_name, const char *human_name, uint6=
4_t usage, uint64_t duration, int count, int level =3D -1);
+	void		update_cstate(const char *linux_name, const char *human_name, uint6=
4_t usage, uint64_t duration, int count, int level =3D -1);
 	void		finalize_cstate(const char *linux_name, uint64_t usage, uint64_t du=
ration, int count);

 	virtual int	has_cstate_level(int level);
-- =

1.7.7.6


--===============4539080705227720278==--

