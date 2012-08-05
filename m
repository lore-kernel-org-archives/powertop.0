Content-Type: multipart/mixed; boundary="===============1055240136279724676=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: [Powertop] [PATCH 3/4] Allow for cores without P-states
Date: Sun, 05 Aug 2012 10:13:44 -0700
Message-ID: <501EA9C8.7060208@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1055240136279724676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>From e034a0fd2f623197e85b1b5bb286c05514732b1d Mon Sep 17 00:00:00 2001
From: Arjan van de Ven <arjan(a)linux.intel.com>
Date: Sun, 5 Aug 2012 10:01:08 -0700
Subject: [PATCH 3/4] Allow for cores without P-states

In a hybrid system (CPU and GPU), it's common (well, for Intel graphics)
to not have statistics for the GPU P states, while we do have statistics
for the GPU C states.

This patch puts all the plumbing in place to allow for cores that
don't have P states, to not show up in the P state displays
---
 src/cpu/cpu.cpp |    5 +++++
 src/cpu/cpu.h   |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index eb0a46c..63e48ee 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -626,6 +626,8 @@ void report_display_cpu_pstates(void)
 			_core =3D _package->children[core];
 			if (!_core)
 				continue;
+			if (!_core->has_pstates())
+				continue;

 			for (line =3D LEVEL_HEADER; line < (int)pstates_num; line++) {
 				int first =3D 1;
@@ -821,6 +823,9 @@ void impl_w_display_cpu_states(int state)
 			_core =3D _package->children[core];
 			if (!_core)
 				continue;
+			if (!_core->has_pstates() && state =3D=3D PSTATE)
+				continue;
+

 			for (line =3D LEVEL_HEADER; line < 10; line++) {
 				int first =3D 1;
diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index d51e3b2..ec9dbfc 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -130,6 +130,7 @@ public:
 	virtual char *  fill_pstate_line(int line_nr, char *buffer) { return buff=
er;};
 	virtual char *  fill_pstate_name(int line_nr, char *buffer) { return buff=
er;};
 	virtual int	has_pstate_level(int level);
+	virtual int	has_pstates(void) { return 1; };

 	/* Frequency micro accounting methods */
 	virtual void    calculate_freq(uint64_t time);
-- =

1.7.7.6


--===============1055240136279724676==--

