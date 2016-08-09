Content-Type: multipart/mixed; boundary="===============7390540309290135731=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 3/3] search/replace POWERTOP_VERSION and
 SHORT_VERSION
Date: Tue, 09 Aug 2016 12:59:31 -0700
Message-ID: <1470772771-114174-4-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470772771-114174-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7390540309290135731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Across the codebase, do the following replacements:
  POWERTOP_VERSION becomes PACKAGE_VERSION
  SHORT_VERSION    becomes PACKAGE_SHORT_VERSION

PACKAGE_VERSION now contains a git describe string, and
PACKAGE_SHORT_VERSION will contain an abbreviated describe string for
use in the ncurses UI.

v2: no change from v1

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/display.cpp       | 2 +-
 src/lib.h             | 3 ---
 src/main.cpp          | 4 ++--
 src/perf/perf.cpp     | 2 +-
 src/report/report.cpp | 2 +-
 5 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/src/display.cpp b/src/display.cpp
index 57e3e45a1f75..10ee48a0b99b 100644
--- a/src/display.cpp
+++ b/src/display.cpp
@@ -117,7 +117,7 @@ void show_tab(unsigned int tab)
 =

 	wattrset(tab_bar, A_REVERSE);
 	mvwprintw(tab_bar, 0,0, "%120s", "");
-	mvwprintw(tab_bar, 0,0, "PowerTOP %s", POWERTOP_SHORT_VERSION);
+	mvwprintw(tab_bar, 0,0, "PowerTOP %s", PACKAGE_SHORT_VERSION);
 =

 	bottom_line =3D newwin(1, 0, LINES-1, 0);
 	wattrset(bottom_line, A_REVERSE);
diff --git a/src/lib.h b/src/lib.h
index c3324efdff1b..b64bb0f5433f 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -41,9 +41,6 @@
 #define _(STRING)    (STRING)
 #endif
 =

-#define POWERTOP_VERSION "v" PACKAGE_VERSION
-#define POWERTOP_SHORT_VERSION PACKAGE_VERSION
-
 extern int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo);
 =

 extern int get_max_cpu(void);
diff --git a/src/main.cpp b/src/main.cpp
index e6e41b1ce84d..7467f0fd6acc 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -99,7 +99,7 @@ static const struct option long_options[] =3D
 =

 static void print_version()
 {
-	printf(_("PowerTOP version " POWERTOP_VERSION "\n"));
+	printf(_("PowerTOP version " PACKAGE_VERSION "\n"));
 }
 =

 static bool set_refresh_timeout()
@@ -323,7 +323,7 @@ static void checkroot() {
 	uid =3D getuid();
 =

 	if (uid !=3D 0) {
-		printf(_("PowerTOP " POWERTOP_VERSION " must be run with root privileges=
.\n"));
+		printf(_("PowerTOP " PACKAGE_VERSION " must be run with root privileges.=
\n"));
 		printf(_("exiting...\n"));
 		exit(EXIT_FAILURE);
 	}
diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index b1103a769ce0..9ed0ba8ec3ef 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -114,7 +114,7 @@ void perf_event::create_perf_event(char *eventname, int=
 _cpu)
 		if (err =3D=3D EMFILE)
 			fprintf(stderr, _("Too many open files, please increase the limit of op=
en file descriptors.\n"));
 		else {
-			fprintf(stderr, _("PowerTOP %s needs the kernel to support the 'perf' s=
ubsystem\n"), POWERTOP_VERSION);
+			fprintf(stderr, _("PowerTOP %s needs the kernel to support the 'perf' s=
ubsystem\n"), PACKAGE_VERSION);
 			fprintf(stderr, _("as well as support for trace points in the kernel:\n=
"));
 			fprintf(stderr, "CONFIG_PERF_EVENTS=3Dy\nCONFIG_PERF_COUNTERS=3Dy\nCONF=
IG_TRACEPOINTS=3Dy\nCONFIG_TRACING=3Dy\n");
 		}
diff --git a/src/report/report.cpp b/src/report/report.cpp
index ddb2e3065502..f0f31ee8cea5 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -120,7 +120,7 @@ static void system_info(void)
 	/* Set array of data in row Major order */
 	string *system_data =3D new string[sys_table.rows * sys_table.cols];
 	system_data[0]=3D__("PowerTOP Version");
-	snprintf(version_date, sizeof(version_date), "%s ran at %s", POWERTOP_VER=
SION, ctime(&now));
+	snprintf(version_date, sizeof(version_date), "%s ran at %s", PACKAGE_VERS=
ION, ctime(&now));
 	system_data[1]=3Dversion_date;
 =

 	str =3D read_sysfs_string("/proc/version");
-- =

1.8.3.1


--===============7390540309290135731==--

