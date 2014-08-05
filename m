Content-Type: multipart/mixed; boundary="===============1471820698838551997=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 07/14] remove unnecessary code reported by cppcheck
Date: Tue, 05 Aug 2014 22:31:31 +0100
Message-ID: <1407274298-16404-7-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1407274298-16404-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1471820698838551997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/cpu/rapl/rapl_interface.cpp | 4 ++--
 src/devices/alsa.cpp            | 1 -
 src/display.cpp                 | 9 ++-------
 src/tuning/runtime.cpp          | 4 ----
 src/tuning/tuning.cpp           | 1 -
 5 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/src/cpu/rapl/rapl_interface.cpp b/src/cpu/rapl/rapl_interface.=
cpp
index a19e0a9..ab8e8ce 100644
--- a/src/cpu/rapl/rapl_interface.cpp
+++ b/src/cpu/rapl/rapl_interface.cpp
@@ -647,9 +647,9 @@ void c_rapl_interface::rapl_measure_energy()
 	double pp0_joules =3D 0;
 	double pp1_joules =3D 0;
 =

-	ret =3D get_pkg_power_info(&thermal_spec_power, &max_power, &min_power, &=
max_time_window);
+	get_pkg_power_info(&thermal_spec_power, &max_power, &min_power, &max_time=
_window);
 	RAPL_DBG_PRINT("Pkg Power Info: Thermal spec %f watts, max %f watts, min =
%f watts, max time window %f seconds\n", thermal_spec_power, max_power, min=
_power, max_time_window);
-	ret =3D get_dram_power_info(&thermal_spec_power, &max_power, &min_power, =
&max_time_window);
+	get_dram_power_info(&thermal_spec_power, &max_power, &min_power, &max_tim=
e_window);
 	RAPL_DBG_PRINT("DRAM Power Info: Thermal spec %f watts, max %f watts, min=
 %f watts, max time window %f seconds\n", thermal_spec_power, max_power, mi=
n_power, max_time_window);
 =

 	for (;;) {
diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index 5dee334..a1fca71 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -154,7 +154,6 @@ static void create_all_alsa_callback(const char *d_name)
 {
 	char filename[4096];
 	class alsa *bl;
-	ofstream file;
 =

 	if (strncmp(d_name, "hwC", 3) !=3D 0)
 		return;
diff --git a/src/display.cpp b/src/display.cpp
index c76ba27..123620a 100644
--- a/src/display.cpp
+++ b/src/display.cpp
@@ -267,13 +267,8 @@ void cursor_up(void)
 	if (w) {
 		w->cursor_up(); =

 		if(w->ypad_pos > 0) {
-			if (tab_names[current_tab] =3D=3D "Tunables") {
-				prefresh(w->win, --w->ypad_pos, w->xpad_pos, =

-					1, 0, LINES - 3, COLS - 1);
-	                } else {
-				prefresh(w->win, --w->ypad_pos, w->xpad_pos, =

-					1, 0, LINES - 3, COLS - 1);
-			}
+			prefresh(w->win, --w->ypad_pos, w->xpad_pos,
+				 1, 0, LINES - 3, COLS - 1);
 		}
 	}
 	=

diff --git a/src/tuning/runtime.cpp b/src/tuning/runtime.cpp
index b57d53e..3201fdd 100644
--- a/src/tuning/runtime.cpp
+++ b/src/tuning/runtime.cpp
@@ -139,10 +139,6 @@ void add_runtime_tunables(const char *bus)
 		if (entry->d_name[0] =3D=3D '.')
 			continue;
 =

-		sprintf(filename, "/sys/bus/%s/devices/%s", bus, entry->d_name);
-
-
-
 		sprintf(filename, "/sys/bus/%s/devices/%s/power/control", bus, entry->d_=
name);
 =

 		if (access(filename, R_OK) !=3D 0)
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 85b80ac..7d64cad 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -198,7 +198,6 @@ void report_show_tunables(void)
 	unsigned int i;
 	/* three tables; bad, unfixable, good */
 	sort_tunables();
-	string srt_tmp;
 	int idx, rows =3D 0, cols;
 =

 	/* First Table */
-- =

2.0.4


--===============1471820698838551997==--

