Content-Type: multipart/mixed; boundary="===============4615990827359051558=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 05/12] remove unnecessary assignments
Date: Sat, 02 Aug 2014 12:54:10 +0100
Message-ID: <1406980457-19077-6-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4615990827359051558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Found using scan-build, Clang static analyzer.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/lib.cpp                | 8 ++++----
 src/main.cpp               | 6 ++++--
 src/process/do_process.cpp | 2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index a8f3746..b482296 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -472,10 +472,10 @@ int read_msr(int cpu, uint64_t offset, uint64_t *valu=
e)
 	int fd;
 	char msr_path[256];
 =

-	fd =3D sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
+	sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
 =

 	if (access(msr_path, R_OK) !=3D 0){
-		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
+		sprintf(msr_path, "/dev/msr%d", cpu);
 =

 		if (access(msr_path, R_OK) !=3D 0){
 			fprintf(stderr,
@@ -504,10 +504,10 @@ int write_msr(int cpu, uint64_t offset, uint64_t valu=
e)
 	int fd;
 	char msr_path[256];
 =

-	fd =3D sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
+	sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
 =

 	if (access(msr_path, R_OK) !=3D 0){
-		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
+		sprintf(msr_path, "/dev/msr%d", cpu);
 =

 		if (access(msr_path, R_OK) !=3D 0){
 			fprintf(stderr,
diff --git a/src/main.cpp b/src/main.cpp
index cf4e547..99a985f 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -315,8 +315,10 @@ static void powertop_init(void)
 	rlmt.rlim_cur =3D rlmt.rlim_max =3D get_nr_open();
 	setrlimit (RLIMIT_NOFILE, &rlmt);
 =

-	ret =3D system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1");
-	ret =3D system("/sbin/modprobe msr > /dev/null 2>&1");
+	if (system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1"))
+		fprintf(stderr, _("modprobe cpufreq_stats failed"));
+	if (system("/sbin/modprobe msr > /dev/null 2>&1"))
+		fprintf(stderr, _("modprobe msr failed"));
 	statfs("/sys/kernel/debug", &st_fs);
 =

 	if (st_fs.f_type !=3D (long) DEBUGFS_MAGIC) {
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 15115c3..6f9b80a 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -579,7 +579,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 		consumer_child_time(cpu, t);
 	}
 	else if (strcmp(event->name, "cpu_idle") =3D=3D 0) {
-		ret =3D pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
+		pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
 		if (val =3D=3D (unsigned int)-1)
 			consume_blame(cpu);
 		else
-- =

2.0.3


--===============4615990827359051558==--

