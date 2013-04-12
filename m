Content-Type: multipart/mixed; boundary="===============3920954597521242447=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 2/8] Use MSR Lib MSR functions
Date: Fri, 12 Apr 2013 08:47:02 -0700
Message-ID: <1365781628-11053-3-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1365781628-11053-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3920954597521242447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

MSR read is implemented in lib.c. Use this API instead.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
---
 src/cpu/intel_cpus.cpp | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 2b78d31..8d5f51a 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -49,30 +49,15 @@ static uint64_t get_msr(int cpu, uint64_t offset)
 {
 	ssize_t retval;
 	uint64_t msr;
-	int fd;
-	char msr_path[256];
 =

-	fd =3D sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
-
-	if (access(msr_path, R_OK) !=3D 0){
-		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
-
-		if (access(msr_path, R_OK) !=3D 0){
-			fprintf(stderr, _("msr reg not found"));
-			exit(-2);
-		}
-	}
-
-	fd =3D open(msr_path, O_RDONLY);
-
-	retval =3D pread(fd, &msr, sizeof msr, offset);
-	if (retval !=3D sizeof msr) {
+	retval =3D read_msr(cpu, offset, &msr);
+	if (retval < 0) {
 		reset_display();
-		fprintf(stderr, _("pread cpu%d 0x%llx : "), cpu, (unsigned long long)off=
set);
+		fprintf(stderr, _("read_msr cpu%d 0x%llx : "), cpu, (unsigned long long)=
offset);
 		fprintf(stderr, "%s\n", strerror(errno));
 		exit(-2);
 	}
-	close(fd);
+
 	return msr;
 }
 =

-- =

1.7.11.7


--===============3920954597521242447==--

