Content-Type: multipart/mixed; boundary="===============3643456878476853366=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [Warning fixes 6/6] Remove trailing whitespace in the cpu/
 and process/ subdirs.
Date: Fri, 24 Aug 2012 19:27:08 +0200
Message-ID: <20120824173217.E5621E00D4@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3643456878476853366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index 8b4c650..e3f9f9a 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -148,7 +148,7 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 	strcpy(state->human_name, human_name);
 =

 	state->line_level =3D -1;
-	=

+
 	c =3D human_name;
 	while (*c) {
 		if (strcmp(linux_name, "active")=3D=3D0) {
@@ -171,7 +171,7 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 		}
 		c++;
 	}
-	=

+
 	if (level >=3D 0)
 		state->line_level =3D level;
 =

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index c3f0c79..d31f0f9 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -235,7 +235,7 @@ static void handle_i965_gpu(void)
 =

 =

 	package =3D system_level.children[0];
-	=

+
 	core_number =3D package->children.size();
 =

 	if (package->children.size() <=3D core_number)
@@ -310,7 +310,7 @@ void enumerate_cpus(void)
 			if (number >=3D 0) {
 				handle_one_cpu(number, vendor, family, model);
 				set_max_cpu(number);
-				number =3D -2; =

+				number =3D -2;
 			}
 		}
 	}
@@ -631,10 +631,10 @@ void report_display_cpu_pstates(void)
 	int line;
 	class abstract_cpu *_package, * _core, * _cpu;
 	unsigned int i, pstates_num;
-	=

+
 	for (i =3D 0, pstates_num =3D 0; i<  all_cpus.size(); i++)
 		if (all_cpus[i]&&  all_cpus[i]->pstates.size()>  pstates_num)
-			pstates_num =3D all_cpus[i]->pstates.size(); =

+			pstates_num =3D all_cpus[i]->pstates.size();
 	if ((!reportout.csv_report)&&(!reportout.http_report))
 		return;
 =

@@ -981,7 +981,7 @@ void perf_power_bundle::handle_trace_point(void *trace,=
 int cpunr, uint64_t time
 			cpu->go_idle(time);
 	}
 =

-	if (strcmp(event->name, "power_frequency") =3D=3D 0 =

+	if (strcmp(event->name, "power_frequency") =3D=3D 0
 	|| strcmp(event->name, "cpu_frequency") =3D=3D 0){
 =

 		ret =3D pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 1949af1..0762492 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -144,7 +144,7 @@ private:
 	uint64_t	rc6_before, rc6_after;
 	uint64_t	rc6p_before, rc6p_after;
 	uint64_t	rc6pp_before, rc6pp_after;
-	=

+
 	struct timeval	before;
 	struct timeval	after;
 =

diff --git a/src/cpu/intel_gpu.cpp b/src/cpu/intel_gpu.cpp
index 6b6df6c..18c998b 100644
--- a/src/cpu/intel_gpu.cpp
+++ b/src/cpu/intel_gpu.cpp
@@ -66,11 +66,11 @@ char * i965_core::fill_cstate_line(int line_nr, char *b=
uffer, const char *separa
 	}
 =

 	buffer[0] =3D 0;
-	=

+
 	time_delta  =3D 1000000 * (after.tv_sec - before.tv_sec) + after.tv_usec =
- before.tv_usec;
 	ratio =3D 100000.0/time_delta;
 =

-	switch (line_nr) {	=

+	switch (line_nr) {
 	case 0:
 		d =3D 100.0 - ratio * (rc6_after + rc6p_after + rc6pp_after - rc6_before=
 - rc6p_before - rc6pp_before);
 		break;
@@ -86,13 +86,13 @@ char * i965_core::fill_cstate_line(int line_nr, char *b=
uffer, const char *separa
 	default:
 		return buffer;
 	}
-		=

+
 	/* cope with rounding errors due to the measurement interval */
 	if (d < 0.0)
 		d =3D 0.0;
 	if (d > 100.0)
 		d =3D 100.0;
-	=

+
 	sprintf(buffer,"%5.1f%%", d);
 =

 	return buffer;
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index e127572..0b574b2 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -249,7 +249,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 		field =3D pevent_find_any_field(event, "next_comm");
 		if (!field || !(field->flags & FIELD_IS_STRING))
 			return; /* ?? */
-	=

+
 		next_comm =3D get_pevent_field_str(trace, event, field);
 =

 		ret =3D pevent_get_field_val(NULL, event, "next_pid", &rec, &val, 0);
@@ -308,8 +308,8 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 	}
 	else if (strcmp(event->name, "sched_wakeup") =3D=3D 0) {
 		class power_consumer *from =3D NULL;
-		class process *dest_proc =3D NULL;  =

-		class process *from_proc =3D NULL; =

+		class process *dest_proc =3D NULL;
+		class process *from_proc =3D NULL;
 		const char *comm;
 		int flags;
 		int pid;
@@ -338,7 +338,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 		field =3D pevent_find_any_field(event, "comm");
 =

 		if (!field || !(field->flags & FIELD_IS_STRING))
- 			return; =

+ 			return;
 =

 		comm =3D get_pevent_field_str(trace, event, field);
 =

@@ -635,7 +635,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 =

 		ret =3D pevent_get_field_val(NULL, event, "dev", &rec, &val, 0);
 		if (ret < 0)
-			=

+
 			return;
 		dev =3D (int)val;
 =

@@ -789,7 +789,7 @@ void process_update_display(void)
 	WINDOW *win;
 	double pw;
 	int tl;
-	int tlt; =

+	int tlt;
 	int tlr;
 =

 	int show_power;
diff --git a/src/process/timer.cpp b/src/process/timer.cpp
index 8917490..641328a 100644
--- a/src/process/timer.cpp
+++ b/src/process/timer.cpp
@@ -41,7 +41,7 @@ static bool timer_is_deferred(const char *handler)
 	bool    ret =3D false;
 	char    line[4096];
 =

-	file =3D fopen("/proc/timer_stats", "r");	=

+	file =3D fopen("/proc/timer_stats", "r");
 	if (!file) {
 		return ret;
 	}
-- =

1.7.7


--===============3643456878476853366==--

