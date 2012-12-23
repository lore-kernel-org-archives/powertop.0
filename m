Content-Type: multipart/mixed; boundary="===============0057162322806011079=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv2 08/10] Deduplication: remove
 nhm_package::calculate_freq() identical to cpu_package::calculate_freq()
Date: Mon, 24 Dec 2012 03:08:50 +0400
Message-ID: <1356304132-3889-9-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0057162322806011079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Trivial - remove an identical override wrt. direct base class.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/intel_cpus.cpp | 27 ---------------------------
 src/cpu/intel_cpus.h   |  3 ---
 2 files changed, 30 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 031c7ac..a898c06 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -331,33 +331,6 @@ void nhm_package::measurement_end(void)
 =

 }
 =

-
-void nhm_package::calculate_freq(uint64_t time)
-{
-	uint64_t freq =3D 0;
-	bool is_idle =3D true;
-	unsigned int i;
-
-	/* calculate the maximum frequency of all children */
-	for (i =3D 0; i < children.size(); i++)
-		if (children[i] && children[i]->has_pstates()) {
-			uint64_t f =3D 0;
-			if (!children[i]->idle) {
-				f =3D children[i]->current_frequency;
-				is_idle =3D false;
-			}
-			if (f > freq)
-				freq =3D f;
-		}
-
-	current_frequency =3D freq;
-	idle =3D is_idle;
-	if (parent)
-		parent->calculate_freq(time);
-	change_effective_frequency(time, current_frequency);
-	old_idle =3D idle;
-}
-
 void nhm_cpu::measurement_start(void)
 {
 	ifstream file;
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index f41d589..a4c0852 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -59,9 +59,6 @@ public:
 	virtual int     can_collapse(void) { return 0;};
 =

 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
-
-	virtual void    calculate_freq(uint64_t time);
-
 };
 =

 class nhm_core: public cpu_core
-- =

1.8.0.2


--===============0057162322806011079==--

