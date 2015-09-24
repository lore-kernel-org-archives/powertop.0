Content-Type: multipart/mixed; boundary="===============2710055013110119489=="
MIME-Version: 1.0
From: Radhakrishna Sripada <radhakrishna.sripada at intel.com>
Subject: [Powertop] [PATCH] Assign line level based on linux name
Date: Wed, 23 Sep 2015 17:13:09 -0700
Message-ID: <1443053589-1036-1-git-send-email-radhakrishna.sripada@intel.com>
In-Reply-To: 56031610.8080304@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2710055013110119489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Powertop Idle Stats only show the statistics of C1E-SKL and not C1-SKL while
intel_idle driver exposes both the states. Parsing the human names of the
states, the same line level '1' gets assigned to both C1-SKL and C1E-SKL. T=
he
statistics of C1-SKL are always overwritten by the statistics of C1E-SKL. To
eliminate this parsing linux name would assign different line levels to
different cstates irrespective of their human names.

Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada(a)intel.com>
---
 src/cpu/abstract_cpu.cpp | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index 17acb71..12dcb7d 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -210,7 +210,7 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 =

 	state->line_level =3D -1;
 =

-	c =3D human_name;
+	c =3D linux_name;
 	while (*c) {
 		if (strcmp(linux_name, "active")=3D=3D0) {
 			state->line_level =3D LEVEL_C0;
@@ -223,15 +223,6 @@ void abstract_cpu::insert_cstate(const char *linux_nam=
e, const char *human_name,
 		c++;
 	}
 =

-	/* some architectures (ARM) don't have good numbers in their human name..=
 fall back to the linux name for those */
-	c =3D linux_name;
-	while (*c && state->line_level < 0) {
-		if (*c >=3D '0' && *c <=3D'9') {
-			state->line_level =3D strtoull(c, NULL, 10);
-			break;
-		}
-		c++;
-	}
 =

 	if (level >=3D 0)
 		state->line_level =3D level;
-- =

1.9.1


--===============2710055013110119489==--

