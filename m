Content-Type: multipart/mixed; boundary="===============6735939800888595564=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCH 02/11] Deduplication: move is_turbo()
 function to lib
Date: Mon, 05 Nov 2012 15:12:24 +0400
Message-ID: <1352113953-24687-3-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1352113953-24687-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6735939800888595564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Trivial: remove 4 identical static definitions of is_turbo().

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/cpu_core.cpp    |  9 ---------
 src/cpu/cpu_linux.cpp   |  9 ---------
 src/cpu/cpu_package.cpp | 10 ----------
 src/cpu/intel_cpus.cpp  |  8 --------
 src/lib.cpp             |  9 +++++++++
 src/lib.h               |  1 +
 6 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
index 593d5f6..f56394f 100644
--- a/src/cpu/cpu_core.cpp
+++ b/src/cpu/cpu_core.cpp
@@ -28,15 +28,6 @@
 =

 #include "../parameters/parameters.h"
 =

-static int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo)
-{
-	if (freq !=3D max)
-		return 0;
-	if (maxmo + 1000 !=3D max)
-		return 0;
-	return 1;
-}
-
 char * cpu_core::fill_cstate_line(int line_nr, char *buffer, const char *s=
eparator)
 {
 	unsigned int i;
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index f5e269e..56b895c 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -38,15 +38,6 @@
 #include <sys/stat.h>
 #include <dirent.h>
 =

-static int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo)
-{
-	if (freq !=3D max)
-		return 0;
-	if (maxmo + 1000 !=3D max)
-		return 0;
-	return 1;
-}
-
 void cpu_linux::measurement_start(void)
 {
 	ifstream file;
diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
index 2e2e8a3..7cdbf5d 100644
--- a/src/cpu/cpu_package.cpp
+++ b/src/cpu/cpu_package.cpp
@@ -27,16 +27,6 @@
 #include "../lib.h"
 #include "../parameters/parameters.h"
 =

-static int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo)
-{
-	if (freq !=3D max)
-		return 0;
-	if (maxmo + 1000 !=3D max)
-		return 0;
-	return 1;
-}
-
-
 char * cpu_package::fill_cstate_line(int line_nr, char *buffer, const char=
 *separator)
 {
 	unsigned int i;
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index a5684aa..24d0398 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -40,14 +40,6 @@
 #include "../parameters/parameters.h"
 #include "../display.h"
 =

-static int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo)
-{
-	if (freq !=3D max)
-		return 0;
-	if (maxmo + 1000 !=3D max)
-		return 0;
-	return 1;
-}
 =

 int has_c2c7_res;
 =

diff --git a/src/lib.cpp b/src/lib.cpp
index 9838c0b..723517a 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -59,6 +59,15 @@ extern "C" {
 =

 static int kallsyms_read =3D 0;
 =

+int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo)
+{
+	if (freq !=3D max)
+		return 0;
+	if (maxmo + 1000 !=3D max)
+		return 0;
+	return 1;
+}
+
 double percentage(double F)
 {
 	F =3D F * 100.0;
diff --git a/src/lib.h b/src/lib.h
index 8cf4632..9b44450 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -38,6 +38,7 @@
 #define POWERTOP_VERSION "v2.1"
 #define POWERTOP_SHORT_VERSION "2.1"
 =

+extern int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo);
 =

 extern int get_max_cpu(void);
 extern void set_max_cpu(int cpu);
-- =

1.8.0


--===============6735939800888595564==--

