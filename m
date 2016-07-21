Content-Type: multipart/mixed; boundary="===============1239458325700496302=="
MIME-Version: 1.0
From: Daniel Black <daniel.black at au1.ibm.com>
Subject: [Powertop] [PATCH] MSR is valid for x86_32/x86_64 only
Date: Thu, 21 Jul 2016 10:55:48 +1000
Message-ID: <1469062548-6768-1-git-send-email-daniel.black@au1.ibm.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1239458325700496302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As such we compile guard the portions of code related to msr
modprobing, reads and writes.

Signed-off-by: Daniel Black <daniel.black(a)au1.ibm.com>
---
 src/lib.cpp  | 8 ++++++++
 src/main.cpp | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/src/lib.cpp b/src/lib.cpp
index cdbd0cd..5e48f37 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -497,6 +497,7 @@ int get_user_input(char *buf, unsigned sz)
 =

 int read_msr(int cpu, uint64_t offset, uint64_t *value)
 {
+#if defined(__i386__) || defined(__x86_64__)
 	ssize_t retval;
 	uint64_t msr;
 	int fd;
@@ -526,10 +527,14 @@ int read_msr(int cpu, uint64_t offset, uint64_t *valu=
e)
 	*value =3D msr;
 =

 	return retval;
+#else
+	return -1;
+#endif
 }
 =

 int write_msr(int cpu, uint64_t offset, uint64_t value)
 {
+#if defined(__i386__) || defined(__x86_64__)
 	ssize_t retval;
 	int fd;
 	char msr_path[256];
@@ -557,6 +562,9 @@ int write_msr(int cpu, uint64_t offset, uint64_t value)
 	}
 =

 	return retval;
+#else
+	return -1;
+#endif
 }
 =

 #define UI_NOTIFY_BUFF_SZ 2048
diff --git a/src/main.cpp b/src/main.cpp
index f2569c1..31e3e71 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -328,8 +328,10 @@ static void powertop_init(void)
 =

 	if (system("/sbin/modprobe cpufreq_stats > /dev/null 2>&1"))
 		fprintf(stderr, _("modprobe cpufreq_stats failed"));
+#if defined(__i386__) || defined(__x86_64__)
 	if (system("/sbin/modprobe msr > /dev/null 2>&1"))
 		fprintf(stderr, _("modprobe msr failed"));
+#endif
 	statfs("/sys/kernel/debug", &st_fs);
 =

 	if (st_fs.f_type !=3D (long) DEBUGFS_MAGIC) {
-- =

2.7.4


--===============1239458325700496302==--

