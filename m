Content-Type: multipart/mixed; boundary="===============7992034276093604765=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: [Powertop] [PATCH] Fix C states and P states presentation issue.
Date: Tue, 15 Jan 2013 19:05:18 +0800
Message-ID: <1358247918-31031-1-git-send-email-zhang.austin@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7992034276093604765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If using '10' in this 'for' loop, for P states, once the processor
provides more than 10 P states, those additional ones cannot been
presented; and for C states, once the processor provides maximize
C states level more than 9, for example, it only has POLL, C1, C3,
C6, C10, the additional one like C10 also cannot be presented.

Now we get the loop numbers from the system information we had got
before.

Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
---
 src/cpu/cpu.cpp |   35 +++++++++++++++++++++++++++++------
 1 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 7f3af69..28f77b7 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -404,6 +404,15 @@ void report_display_cpu_cstates(void)
 	unsigned int package, core, cpu;
 	int line;
 	class abstract_cpu *_package, * _core, * _cpu;
+	unsigned int i, j, cstates_num;
+
+	for (i =3D 0, cstates_num =3D 0; i < all_cpus.size(); i++) {
+		if (all_cpus[i])
+			for (j =3D 0; j < all_cpus[i]->cstates.size(); j++)
+				if ((all_cpus[i]->cstates[j])->line_level >=3D 0 &&
+				    (all_cpus[i]->cstates[j])->line_level > cstates_num)
+					cstates_num =3D (all_cpus[i]->cstates[j])->line_level;
+	}
 =

 	report.begin_section(SECTION_CPUIDLE);
 	report.add_header("Processor Idle state report");
@@ -421,7 +430,7 @@ void report_display_cpu_cstates(void)
 			if (!_core)
 				continue;
 =

-			for (line =3D LEVEL_HEADER; line < 10; line++) {
+			for (line =3D LEVEL_HEADER; line <=3D (int)cstates_num; line++) {
 				bool first_cpu =3D true;
 =

 				if (!_package->has_cstate_level(line))
@@ -628,14 +637,29 @@ void impl_w_display_cpu_states(int state)
 	char buffer[128];
 	char linebuf[1024];
 	unsigned int package, core, cpu;
-	int line;
+	int line, loop;
 	class abstract_cpu *_package, * _core, * _cpu;
 	int ctr =3D 0;
+	unsigned int i, j, cstates_num, pstates_num;
+
+	for (i =3D 0, cstates_num =3D 0, pstates_num =3D 0; i < all_cpus.size(); =
i++) {
+		if (all_cpus[i] && all_cpus[i]->pstates.size() > pstates_num)
+			pstates_num =3D all_cpus[i]->pstates.size();
 =

-	if (state =3D=3D PSTATE)
+		if (all_cpus[i])
+			for (j =3D 0; j < all_cpus[i]->cstates.size(); j++)
+				if ((all_cpus[i]->cstates[j])->line_level >=3D 0 &&
+				    (all_cpus[i]->cstates[j])->line_level > cstates_num)
+					cstates_num =3D (all_cpus[i]->cstates[j])->line_level;
+	}
+
+	if (state =3D=3D PSTATE) {
 		win =3D get_ncurses_win("Frequency stats");
-	else
+		loop =3D (int)pstates_num;
+	} else {
 		win =3D get_ncurses_win("Idle stats");
+		loop =3D (int)cstates_num;
+	}
 =

 	if (!win)
 		return;
@@ -656,8 +680,7 @@ void impl_w_display_cpu_states(int state)
 			if (!_core->has_pstates() && state =3D=3D PSTATE)
 				continue;
 =

-
-			for (line =3D LEVEL_HEADER; line < 10; line++) {
+			for (line =3D LEVEL_HEADER; line <=3D loop; line++) {
 				int first =3D 1;
 				ctr =3D 0;
 				linebuf[0] =3D 0;
-- =

1.7.5.4


--===============7992034276093604765==--

