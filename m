Content-Type: multipart/mixed; boundary="===============0111490538495323084=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv2 05/10] Deduplication: remove nhm_{cpu, core,
 package}::change_effective_frequency() identical to cpu_{linux, core,
 package}::change_effective_frequency()
Date: Mon, 24 Dec 2012 03:08:47 +0400
Message-ID: <1356304132-3889-6-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0111490538495323084==
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
index 57cb43b..ae31112 100644
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
@@ -407,28 +384,6 @@ void nhm_package::calculate_freq(uint64_t time)
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
@@ -553,25 +508,6 @@ void nhm_cpu::change_freq(uint64_t time, int frequency)
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

1.8.0.2


--===============0111490538495323084==--

