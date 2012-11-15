Content-Type: multipart/mixed; boundary="===============7833521572188797366=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH] cpu: Fix leftovers from the P state cpu frequency
 calculation
Date: Fri, 16 Nov 2012 00:17:56 +0900
Message-ID: <1352992676-14940-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7833521572188797366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The commit 15b8bfb ("Ignore non-P-state-enabled CPUs when calculating
frequency") and 29f42b5 ("fixed issues with p-state reported CPU
frequencies") fixed frequency calculation for cpu packages but missed
it for cpu cores.  Add it.

This fixes wrong frequency report on my quad-core box: 2072.5% -> 100.0%

Cc: Ivan Shapovalov <intelfx100(a)gmail.com>
Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/cpu/cpu_core.cpp   |    3 +--
 src/cpu/intel_cpus.cpp |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
index b0dd4da..2caa58d 100644
--- a/src/cpu/cpu_core.cpp
+++ b/src/cpu/cpu_core.cpp
@@ -131,10 +131,9 @@ void cpu_core::calculate_freq(uint64_t time)
 	bool is_idle =3D true;
 	unsigned int i;
 =

-
 	/* calculate the maximum frequency of all children */
 	for (i =3D 0; i < children.size(); i++)
-		if (children[i]) {
+		if (children[i] && children[i]->has_pstates()) {
 			uint64_t f =3D 0;
 			if (!children[i]->idle) {
 				f =3D children[i]->current_frequency;
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index f7b86bc..19ad85c 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -240,7 +240,7 @@ void nhm_core::calculate_freq(uint64_t time)
 =

 	/* calculate the maximum frequency of all children */
 	for (i =3D 0; i < children.size(); i++)
-		if (children[i]) {
+		if (children[i] && children[i]->has_pstates()) {
 			uint64_t f =3D 0;
 			if (!children[i]->idle) {
 				f =3D children[i]->current_frequency;
-- =

1.7.9.2


--===============7833521572188797366==--

