Content-Type: multipart/mixed; boundary="===============4255752409607046931=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCH 05/11] Deduplication: remove nhm_{cpu, core,
 package}::change_effective_frequency() identical to cpu_{linux, core,
 package}::change_effective_frequency()
Date: Mon, 05 Nov 2012 15:12:27 +0400
Message-ID: <1352113953-24687-6-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1352113953-24687-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4255752409607046931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Trivial: remove identical overrides wrt. direct base classes.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/intel_cpus.cpp | 64 ----------------------------------------------=
----
 src/cpu/intel_cpus.h   |  4 ----
 2 files changed, 68 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index eeeb8c9..30f2d38 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -211,29 +211,6 @@ void nhm_core::calculate_freq(uint64_t time)
 	old_idle =3D idle;
 }
 =

-void nhm_core::change_effective_frequency(uint64_t time, uint64_t frequenc=
y)
-{
-	uint64_t freq =3D 0;
-	uint64_t time_delta, fr;
-
-
-	if (last_stamp)
-		time_delta =3D time - last_stamp;
-	else
-		time_delta =3D 1;
-
-	fr =3D effective_frequency;
-
-	if (old_idle)
-		fr =3D 0;
-
-	account_freq(fr, time_delta);
-
-	effective_frequency =3D freq;
-	last_stamp =3D time;
-	abstract_cpu::change_effective_frequency(time, frequency);
-}
-
 char * nhm_core::fill_pstate_line(int line_nr, char *buffer)
 {
 	buffer[0] =3D 0;
@@ -396,28 +373,6 @@ void nhm_package::calculate_freq(uint64_t time)
 	old_idle =3D idle;
 }
 =

-void nhm_package::change_effective_frequency(uint64_t time, uint64_t frequ=
ency)
-{
-	uint64_t time_delta, fr;
-
-	if (last_stamp)
-		time_delta =3D time - last_stamp;
-	else
-		time_delta =3D 1;
-
-	fr =3D effective_frequency;
-	if (old_idle)
-		fr =3D 0;
-
-	account_freq(fr, time_delta);
-
-	effective_frequency =3D frequency;
-	last_stamp =3D time;
-
-	abstract_cpu::change_effective_frequency(time, frequency);
-}
-
-
 void nhm_cpu::measurement_start(void)
 {
 	ifstream file;
@@ -537,25 +492,6 @@ void nhm_cpu::change_freq(uint64_t time, int frequency)
 	old_idle =3D idle;
 }
 =

-void nhm_cpu::change_effective_frequency(uint64_t time, uint64_t frequency)
-{
-	uint64_t time_delta, fr;
-
-	if (last_stamp)
-		time_delta =3D time - last_stamp;
-	else
-		time_delta =3D 1;
-
-	fr =3D effective_frequency;
-	if (old_idle)
-		fr =3D 0;
-
-	account_freq(fr, time_delta);
-
-	effective_frequency =3D frequency;
-	last_stamp =3D time;
-}
-
 void nhm_cpu::go_idle(uint64_t time)
 {
 =

diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index cfa46ec..53cadab 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -61,7 +61,6 @@ public:
 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
 =

 	virtual void    calculate_freq(uint64_t time);
-	virtual void	change_effective_frequency(uint64_t time, uint64_t freq);
 =

 };
 =

@@ -83,8 +82,6 @@ public:
 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
 =

 	virtual void    calculate_freq(uint64_t time);
-	virtual void	change_effective_frequency(uint64_t time, uint64_t freq);
-
 };
 =

 class nhm_cpu: public cpu_linux
@@ -108,7 +105,6 @@ public:
 	virtual int	has_pstate_level(int level);
 =

 	virtual void    change_freq(uint64_t time, int freq);
-	virtual void	change_effective_frequency(uint64_t time, uint64_t freq);
 	virtual void    go_idle(uint64_t time);
 	virtual void    go_unidle(uint64_t time);
 =

-- =

1.8.0


--===============4255752409607046931==--

