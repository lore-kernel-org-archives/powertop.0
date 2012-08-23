Content-Type: multipart/mixed; boundary="===============7665540004435928377=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [PATCH 1/4] Remove trailing whitespace
Date: Thu, 23 Aug 2012 23:20:13 +0200
Message-ID: <20120823215259.098D2DFFDC@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7665540004435928377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>
---
 src/display.cpp |    2 +-
 src/display.h   |    2 +-
 src/lib.cpp     |    2 +-
 src/main.cpp    |   12 ++++++------
 src/report.cpp  |    6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/src/display.cpp b/src/display.cpp
index e17745d..f48b53f 100644
--- a/src/display.cpp
+++ b/src/display.cpp
@@ -275,7 +275,7 @@ void cursor_enter(void)
 void window_refresh()
 {
 	class tab_window *w;
-	=

+
 	w =3D tab_windows[tab_names[current_tab]];
 =

 	if (w) {
diff --git a/src/display.h b/src/display.h
index 72f771a..33aaae1 100644
--- a/src/display.h
+++ b/src/display.h
@@ -60,7 +60,7 @@ public:
 	virtual void expose(void) { cursor_pos =3D 0; repaint();};
 	virtual void hide(void) { };
 =

-	virtual ~tab_window() =

+	virtual ~tab_window()
 	{
 		delwin(win);
 		win =3D NULL;
diff --git a/src/lib.cpp b/src/lib.cpp
index 8753421..9838c0b 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -164,7 +164,7 @@ void write_sysfs(const string &filename, const string &=
value)
 	file.open(filename.c_str(), ios::out);
 	if (!file)
 		return;
-	try =

+	try
 	{
 		file << value;
 		file.close();
diff --git a/src/main.cpp b/src/main.cpp
index 139b514..8714daf 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -237,7 +237,7 @@ void report(int time, char *workload, int iterations, c=
har *file)
 	fprintf(stderr, _("Preparing to take measurements\n"));
 	utf_ok =3D 0;
 	one_measurement(1, NULL);
-	=

+
 	if (!workload[0])
 	  fprintf(stderr, _("Taking %d measurement(s) for a duration of %d second=
(s) each.\n"),iterations,time);
 	else
@@ -260,7 +260,7 @@ void report(int time, char *workload, int iterations, c=
har *file)
 }
 =

 static void checkroot() {
-	int uid; =

+	int uid;
 	uid =3D getuid();
 =

 	if (uid !=3D 0) {
@@ -268,7 +268,7 @@ static void checkroot() {
 		printf(_("exiting...\n"));
 		exit(EXIT_FAILURE);
 	}
-	=

+
 }
 =

 static void powertop_init(void)
@@ -280,7 +280,7 @@ static void powertop_init(void)
 	if (initialized)
 		return;
 =

-	checkroot(); =

+	checkroot();
 	ret =3D system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1");
 	ret =3D system("/sbin/modprobe msr > /dev/null 2>&1");
 	statfs("/sys/kernel/debug", &st_fs);
@@ -355,7 +355,7 @@ int main(int argc, char **argv)
 				break;
 =

 			case 'e': /* Extech power analyzer support */
-				checkroot(); =

+				checkroot();
 				extech_power_meter(optarg ? optarg : "/dev/ttyUSB0");
 				break;
 			case 'u':
@@ -388,7 +388,7 @@ int main(int argc, char **argv)
 			case 'q':
 				freopen("/dev/null", "a", stderr);
 				break;
-				=

+
 			case 'C': /* csv report*/
 				wantreport =3D true;
 				reporttype =3D 0;
diff --git a/src/report.cpp b/src/report.cpp
index af4b89b..fcb2e22 100644
--- a/src/report.cpp
+++ b/src/report.cpp
@@ -190,12 +190,12 @@ void init_report_output(char *filename_str, int itera=
tions)
 	memset(&stamp, 0, sizeof(time_t));
 	stamp=3Dtime(NULL);
 	strftime(datestr, sizeof(datestr), "%Y%m%d-%H%M%S", localtime(&stamp));
-	=

+
 	if (iterations !=3D 1)
-		sprintf(reportout.filename, "%s-%s.%s", =

+		sprintf(reportout.filename, "%s-%s.%s",
 			file_prefix, datestr,file_postfix);
 	else
-		sprintf(reportout.filename, "%s.%s", =

+		sprintf(reportout.filename, "%s.%s",
 			file_prefix, file_postfix);
 =

 	if (reporttype) {
-- =

1.7.7


--===============7665540004435928377==--

