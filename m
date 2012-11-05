Content-Type: multipart/mixed; boundary="===============2965971098742432457=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCH 04/11] Deduplication: remove
 nhm_cpu::account_freq() almost identical to abstract_cpu::account_freq()
Date: Mon, 05 Nov 2012 15:12:26 +0400
Message-ID: <1352113953-24687-5-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1352113953-24687-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2965971098742432457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

See previous commit for explanation.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/intel_cpus.cpp | 36 ------------------------------------
 src/cpu/intel_cpus.h   |  2 --
 2 files changed, 38 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 2a0a874..eeeb8c9 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -528,42 +528,6 @@ int nhm_cpu::has_pstate_level(int level)
 	return cpu_linux::has_pstate_level(level);
 }
 =

-void nhm_cpu::account_freq(uint64_t freq, uint64_t duration)
-{
-	struct frequency *state =3D NULL;
-	unsigned int i;
-
-
-	for (i =3D 0; i < pstates.size(); i++) {
-		if (freq =3D=3D pstates[i]->freq) {
-			state =3D pstates[i];
-			break;
-		}
-	}
-
-	if (!state) {
-		state =3D new(std::nothrow) struct frequency;
-
-		if (!state)
-			return;
-
-		memset(state, 0, sizeof(*state));
-
-		pstates.push_back(state);
-
-		state->freq =3D freq;
-		hz_to_human(freq, state->human_name);
-		if (freq =3D=3D 0)
-			strcpy(state->human_name, _("Idle"));
-		state->after_count =3D 1;
-	}
-
-
-	state->time_after +=3D duration;
-
-
-}
-
 void nhm_cpu::change_freq(uint64_t time, int frequency)
 {
 	current_frequency =3D frequency;
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 181ffc4..cfa46ec 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -98,8 +98,6 @@ private:
 =

 	uint64_t	last_stamp;
 	uint64_t	total_stamp;
-
-	void		account_freq(uint64_t frequency, uint64_t duration);
 public:
 	virtual void	measurement_start(void);
 	virtual void	measurement_end(void);
-- =

1.8.0


--===============2965971098742432457==--

