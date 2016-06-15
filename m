Content-Type: multipart/mixed; boundary="===============8237824054876038297=="
MIME-Version: 1.0
From: Wang, Xiaolong <xiaolong.wang at intel.com>
Subject: Re: [Powertop] [PATCH 2/2] intel_cpus: no pstate Idle pct with
 intel_pstate
Date: Wed, 15 Jun 2016 01:51:22 +0000
Message-ID: <3D803AC0BEBB604B9799C45D4E4A14B7113C646C@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: 20160613160034.29283-3-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8237824054876038297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Joe,
I just realized a further scenario that would be problematic with your curr=
ent patch:
once I'd read from Len Brown's post to Red Hat, that enabling HWP in intel_=
pstate driver is considered a mistake,
because enabling HWP only need to write a few msr bits, based on a few simp=
le policies,
there's no need to load a whole intel_pstate driver to do that.
so future upstream kernel would remove that part, and HWP enabling will be =
put to some CPPC driver,
and on HWP reinforced platform, intel_pstate driver will not be loaded at a=
ll.

So, if that happen, the is_intel_pstate_driver_loaded() will return false, =
and code will go to the old path,
but the frequency statistics still not exist, then we got nothing.

mmm... maybe you could use 'cpufreq statistics exists or not' to branch you=
r code,
  if exist, use it; if not, calculate average freq from msrs.
there should have been such a function to check that condition.

-Wang, Xiaolong =


-----Original Message-----
From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Joe Ko=
nno
Sent: Tuesday, June 14, 2016 12:01 AM
To: powertop(a)lists.01.org
Subject: [Powertop] [PATCH 2/2] intel_cpus: no pstate Idle pct with intel_p=
state

From: Joe Konno <joe.konno(a)intel.com>

Do not display "percent Idle" in the Frequency Stats tab when the intel_pst=
ate kernel driver is loaded. This is because Idle time is inferred through =
kernel PM trace events, which may be insufficient for proper computation in=
 certain scenarios. Therefore, best to display no data than potentially ina=
ccurate data.

End-users are encouraged to use the Idle Stats tab in the UI or report to a=
nalyze their system's idle time. When the intel_pstate kernel driver is loa=
ded, the Frequency Stats tab will only present the end-user with the averag=
e frequency of each logical core.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/cpu/intel_cpus.cpp | 50 +++++++++++++++++++++++++++++++++++++++++++---=
----
 src/cpu/intel_cpus.h   |  2 ++
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp index 81512922=
38ec..330050e37473 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -70,6 +70,8 @@ static int intel_cpu_models[] =3D {
 	0	/* last entry must be zero */
 };
 =

+static int intel_pstate_driver_loaded =3D -1;
+
 int is_supported_intel_cpu(int model)
 {
 	int i;
@@ -81,6 +83,34 @@ int is_supported_intel_cpu(int model)
 	return 0;
 }
 =

+int is_intel_pstate_driver_loaded()
+{
+	const string filename("/sys/devices/system/cpu/cpu0/cpufreq/scaling_drive=
r");
+	const string intel_pstate("intel_pstate");
+	char line[32] =3D { '\0' };
+	ifstream file;
+
+	if (intel_pstate_driver_loaded > -1)
+		return intel_pstate_driver_loaded;
+
+	file.open(filename, ios::in);
+
+	if (!file)
+		return -1;
+
+	file.getline(line, sizeof(line)-1);
+	file.close();
+
+	const string scaling_driver(line);
+	if (scaling_driver =3D=3D intel_pstate) {
+		intel_pstate_driver_loaded =3D 1;
+	} else {
+		intel_pstate_driver_loaded =3D 0;
+	}
+
+	return intel_pstate_driver_loaded;
+}
+
 static uint64_t get_msr(int cpu, uint64_t offset)  {
 	ssize_t retval;
@@ -267,10 +297,11 @@ void nhm_core::measurement_end(void)
 =

 char * nhm_core::fill_pstate_line(int line_nr, char *buffer)  {
+	const int intel_pstate =3D is_intel_pstate_driver_loaded();
 	buffer[0] =3D 0;
 	unsigned int i;
 =

-	if (total_stamp =3D=3D0) {
+	if (!intel_pstate && total_stamp =3D=3D0) {
 		for (i =3D 0; i < pstates.size(); i++)
 			total_stamp +=3D pstates[i]->time_after;
 		if (total_stamp =3D=3D 0)
@@ -282,10 +313,11 @@ char * nhm_core::fill_pstate_line(int line_nr, char *=
buffer)
 		return buffer;
 	}
 =

-	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
+	if (intel_pstate > 0 || line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
+
 	return buffer;
 }
 =

@@ -342,10 +374,11 @@ nhm_package::nhm_package(int model)
 =

 char * nhm_package::fill_pstate_line(int line_nr, char *buffer)  {
+	const int intel_pstate =3D is_intel_pstate_driver_loaded();
 	buffer[0] =3D 0;
 	unsigned int i;
 =

-	if (total_stamp =3D=3D0) {
+	if (!intel_pstate && total_stamp =3D=3D0) {
 		for (i =3D 0; i < pstates.size(); i++)
 			total_stamp +=3D pstates[i]->time_after;
 		if (total_stamp =3D=3D 0)
@@ -358,10 +391,11 @@ char * nhm_package::fill_pstate_line(int line_nr, cha=
r *buffer)
 		return buffer;
 	}
 =

-	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
+	if (intel_pstate > 0 || line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
+
 	return buffer;
 }
 =

@@ -581,7 +615,9 @@ char * nhm_cpu::fill_pstate_name(int line_nr, char *buf=
fer)
 =

 char * nhm_cpu::fill_pstate_line(int line_nr, char *buffer)  {
-	if (total_stamp =3D=3D0) {
+	const int intel_pstate =3D is_intel_pstate_driver_loaded();
+
+	if (!intel_pstate && total_stamp =3D=3D0) {
 		unsigned int i;
 		for (i =3D 0; i < pstates.size(); i++)
 			total_stamp +=3D pstates[i]->time_after; @@ -600,12 +636,12 @@ char * n=
hm_cpu::fill_pstate_line(int line_nr, char *buffer)
 		hz_to_human(F, buffer, 1);
 		return buffer;
 	}
-	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
+	if (intel_pstate > 0 || line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
-	return buffer;
 =

+	return buffer;
 }
 =

 =

diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h index 03310692a83b=
..d20db9ae3986 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -175,4 +175,6 @@ public:
 int is_supported_intel_cpu(int model);
 int byt_has_ahci();
 =

+int is_intel_pstate_driver_loaded();
+
 #endif
--
2.8.3

_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============8237824054876038297==--

