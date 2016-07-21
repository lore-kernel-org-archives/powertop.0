Content-Type: multipart/mixed; boundary="===============1669204989885088208=="
MIME-Version: 1.0
From: Daniel Black <daniel.black at au1.ibm.com>
Subject: [Powertop] [PATCH] Calculate the number of joules consumed over time
Date: Thu, 21 Jul 2016 14:27:57 +1000
Message-ID: <1469075277-35705-1-git-send-email-daniel.black@au1.ibm.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1669204989885088208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The *joules_consumed functions where returning power so renamed to
reflect this.

Calculate the joules used at intervals by multipling the instantaneous
power by the time interval since the last measurement.

Signed-off-by: Daniel Black <daniel.black(a)au1.ibm.com>
---
 src/calibrate/calibrate.cpp      | 26 +++++++++----------
 src/calibrate/calibrate.h        |  2 +-
 src/devices/device.cpp           | 11 ++++++--
 src/main.cpp                     | 54 ++++++++++++++++++++++++++++++++----=
----
 src/measurement/acpi.cpp         |  2 +-
 src/measurement/acpi.h           |  2 +-
 src/measurement/extech.cpp       |  2 +-
 src/measurement/extech.h         |  2 +-
 src/measurement/measurement.cpp  | 31 ++++++++++++++++++++---
 src/measurement/measurement.h    |  6 +++--
 src/measurement/opal-sensors.cpp |  2 +-
 src/measurement/opal-sensors.h   |  2 +-
 src/measurement/sysfs.h          |  2 +-
 src/parameters/parameters.cpp    |  2 +-
 src/parameters/parameters.h      |  1 +
 src/process/do_process.cpp       |  8 ++++--
 16 files changed, 113 insertions(+), 42 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index 60ab892..745d544 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -261,7 +261,7 @@ static void cpu_calibration(int threads)
 	for (i =3D 0; i < threads; i++)
 		pthread_create(&thr, NULL, burn_cpu, NULL);
 =

-	one_measurement(15, NULL);
+	one_measurement(15, 15, NULL);
 	stop_measurement =3D 1;
 	sleep(1);
 }
@@ -276,7 +276,7 @@ static void wakeup_calibration(unsigned long interval)
 =

 	pthread_create(&thr, NULL, burn_cpu_wakeups, (void *)interval);
 =

-	one_measurement(15, NULL);
+	one_measurement(15, 15, NULL);
 	stop_measurement =3D 1;
 	sleep(1);
 }
@@ -292,7 +292,7 @@ static void usb_calibration(void)
 		printf(_(".... device %s \n"), usb_devices[i].c_str());
 		suspend_all_usb_devices();
 		write_sysfs(usb_devices[i], "on\n");
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 		suspend_all_usb_devices();
 		sleep(3);
 	}
@@ -309,7 +309,7 @@ static void rfkill_calibration(void)
 		printf(_(".... device %s \n"), rfkill_devices[i].c_str());
 		rfkill_all_radios();
 		write_sysfs(rfkill_devices[i], "0\n");
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 		rfkill_all_radios();
 		sleep(3);
 	}
@@ -317,7 +317,7 @@ static void rfkill_calibration(void)
 		printf(_(".... device %s \n"), rfkill_devices[i].c_str());
 		unrfkill_all_radios();
 		write_sysfs(rfkill_devices[i], "1\n");
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 		unrfkill_all_radios();
 		sleep(3);
 	}
@@ -333,29 +333,29 @@ static void backlight_calibration(void)
 		char str[4096];
 		printf(_(".... device %s \n"), backlight_devices[i].c_str());
 		lower_backlight();
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 		sprintf(str, "%i\n", blmax / 4);
 		write_sysfs(backlight_devices[i], str);
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 =

 		sprintf(str, "%i\n", blmax / 2);
 		write_sysfs(backlight_devices[i], str);
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 =

 		sprintf(str, "%i\n", 3 * blmax / 4 );
 		write_sysfs(backlight_devices[i], str);
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 =

 		sprintf(str, "%i\n", blmax);
 		write_sysfs(backlight_devices[i], str);
-		one_measurement(15, NULL);
+		one_measurement(15, 15, NULL);
 		lower_backlight();
 		sleep(1);
 	}
 	printf(_("Calibrating idle\n"));
 	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force off"))
 		printf("System is not available\n");
-	one_measurement(15, NULL);
+	one_measurement(15, 15, NULL);
 	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force on"))
 		printf("System is not available\n");
 }
@@ -365,7 +365,7 @@ static void idle_calibration(void)
 	printf(_("Calibrating idle\n"));
 	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force off"))
 		printf("System is not available\n");
-	one_measurement(15, NULL);
+	one_measurement(15, 15, NULL);
 	if(!system("DISPLAY=3D:0 /usr/bin/xset dpms force on"))
 		printf("System is not available\n");
 }
@@ -382,7 +382,7 @@ static void disk_calibration(void)
 	stop_measurement =3D 0;
 	pthread_create(&thr, NULL, burn_disk, NULL);
 =

-	one_measurement(15, NULL);
+	one_measurement(15, 15, NULL);
 	stop_measurement =3D 1;
 	sleep(1);
 =

diff --git a/src/calibrate/calibrate.h b/src/calibrate/calibrate.h
index c279ae2..de71938 100644
--- a/src/calibrate/calibrate.h
+++ b/src/calibrate/calibrate.h
@@ -25,7 +25,7 @@
 #ifndef __INCLUDE_GUARD_CALIBRATE_H
 #define __INCLUDE_GUARD_CALIBRATE_H
 =

-extern void one_measurement(int seconds, char *workload);
+extern void one_measurement(int seconds, int sample_interval, char *worklo=
ad);
 extern void calibrate(void);
 =

 =

diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index 1757a55..2245b65 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -166,11 +166,13 @@ void report_devices(void)
 =

 =

 =

-	pw =3D global_joules_consumed();
+	pw =3D global_power();
 	if (pw > 0.0001) {
 		char buf[32];
 		wprintw(win, _("The battery reports a discharge rate of %sW\n"),
 				fmt_prefix(pw, buf));
+		wprintw(win, _("The power consumed was %sJ\n"),
+				fmt_prefix(global_joules(), buf));
 	}
 =

 	if (show_power) {
@@ -248,13 +250,18 @@ void show_report_devices(void)
 	/* Device Summary */
 	int summary_size=3D2;
 	string *summary =3D new string[summary_size];
-	pw =3D global_joules_consumed();
+	pw =3D global_power();
 	char buf[32];
 	if (pw > 0.0001) {
 		summary[0]=3D __("The battery reports a discharge rate of: ");
 		summary[1]=3Dstring(fmt_prefix(pw, buf));
 		summary[1].append(" W");
 		report.add_summary_list(summary, summary_size);
+
+		summary[0]=3D __("The power consumed was : ");
+		summary[1]=3Dstring(fmt_prefix(global_joules(), buf));
+		summary[1].append(" J");
+		report.add_summary_list(summary, summary_size);
 	}
 =

 	if (show_power) {
diff --git a/src/main.cpp b/src/main.cpp
index 01afbaa..3d912bb 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -89,6 +89,7 @@ static const struct option long_options[] =3D
 	{"html",	optional_argument,	NULL,		 'r'},
 	{"iteration",	optional_argument,	NULL,		 'i'},
 	{"quiet",	no_argument,		NULL,		 'q'},
+	{"sample",	optional_argument,	NULL,		 's'},
 	{"time",	optional_argument,	NULL,		 't'},
 	{"workload",	optional_argument,	NULL,		 'w'},
 	{"version",	no_argument,		NULL,		 'V'},
@@ -126,6 +127,7 @@ static void print_usage()
 	printf(" -r, --html%s\t %s\n", _("[=3Dfilename]"), _("generate a html rep=
ort"));
 	printf(" -i, --iteration%s\n", _("[=3Diterations] number of times to run =
each test"));
 	printf(" -q, --quiet\t\t %s\n", _("suppress stderr output"));
+	printf(" -s, --sample%s\t %s\n", _("[=3Dseconds]"), _("interval for power=
 consumption measurement"));
 	printf(" -t, --time%s\t %s\n", _("[=3Dseconds]"), _("generate a report fo=
r 'x' seconds"));
 	printf(" -w, --workload%s %s\n", _("[=3Dworkload]"), _("file to execute f=
or workload"));
 	printf(" -V, --version\t\t %s\n", _("print version information"));
@@ -197,8 +199,20 @@ static void do_sleep(int seconds)
 	} while (1);
 }
 =

+extern "C" {
+	static volatile bool end_thread;
+	void* measure_background_thread(void *arg)
+	{
+		int sleep_time =3D *((int *) arg);
+		while (!end_thread) {
+			do_sleep(sleep_time);
+			global_sample_power();
+		}
+		return 0;
+	}
+}
 =

-void one_measurement(int seconds, char *workload)
+void one_measurement(int seconds, int sample_interval, char *workload)
 {
 	create_all_usb_devices();
 	start_power_measurement();
@@ -208,10 +222,27 @@ void one_measurement(int seconds, char *workload)
 	start_cpu_measurement();
 =

 	if (workload && workload[0]) {
+		pthread_t thread =3D 0UL;
+		end_thread =3D false;
+		if (pthread_create(&thread, NULL, measure_background_thread, &sample_int=
erval))
+			fprintf(stderr, "ERROR: workload measurement thread creation failed\n");
+
 		if (system(workload))
 			fprintf(stderr, _("Unknown issue running workload!\n"));
+
+		if (thread)
+		{
+			end_thread =3D true;
+			pthread_join( thread, NULL);
+		}
+		global_sample_power();
 	} else {
-		do_sleep(seconds);
+		while (seconds > 0)
+		{
+			do_sleep(sample_interval > seconds ? seconds : sample_interval);
+			seconds -=3D sample_interval;
+			global_sample_power();
+		}
 	}
 	end_cpu_measurement();
 	end_process_measurement();
@@ -237,7 +268,7 @@ void one_measurement(int seconds, char *workload)
 =

 	end_process_data();
 =

-	global_joules_consumed();
+	global_power();
 	compute_bundle();
 =

 	show_report_devices();
@@ -258,13 +289,13 @@ void out_of_memory()
 	abort();
 }
 =

-void make_report(int time, char *workload, int iterations, char *file)
+void make_report(int time, char *workload, int iterations, int sample_inte=
rval, char *file)
 {
 =

 	/* one to warm up everything */
 	fprintf(stderr, _("Preparing to take measurements\n"));
 	utf_ok =3D 0;
-	one_measurement(1, NULL);
+	one_measurement(1, sample_interval, NULL);
 =

 	if (!workload[0])
 	  fprintf(stderr, _("Taking %d measurement(s) for a duration of %d second=
(s) each.\n"),iterations,time);
@@ -274,7 +305,7 @@ void make_report(int time, char *workload, int iteratio=
ns, char *file)
 		init_report_output(file, iterations);
 		initialize_tuning();
 		/* and then the real measurement */
-		one_measurement(time, workload);
+		one_measurement(time, sample_interval, workload);
 		report_show_tunables();
 		finish_report_output();
 		clear_tuning();
@@ -393,7 +424,7 @@ int main(int argc, char **argv)
 	int c;
 	char filename[PATH_MAX];
 	char workload[PATH_MAX] =3D {0};
-	int  iterations =3D 1, auto_tune =3D 0;
+	int  iterations =3D 1, auto_tune =3D 0, sample_interval =3D 5;
 =

 	set_new_handler(out_of_memory);
 =

@@ -451,6 +482,9 @@ int main(int argc, char **argv)
 			if (freopen("/dev/null", "a", stderr))
 				fprintf(stderr, _("Quiet mode failed!\n"));
 			break;
+		case 's':
+			sample_interval =3D (optarg ? atoi(optarg) : 5);
+			break;
 		case 't':
 			time_out =3D (optarg ? atoi(optarg) : 20);
 			break;
@@ -475,7 +509,7 @@ int main(int argc, char **argv)
 	powertop_init();
 =

 	if (reporttype !=3D REPORT_OFF)
-		make_report(time_out, workload, iterations, filename);
+		make_report(time_out, workload, iterations, sample_interval, filename);
 =

 	if (debug_learning)
 		printf("Learning debugging enabled\n");
@@ -496,7 +530,7 @@ int main(int argc, char **argv)
 	initialize_devfreq();
 	initialize_tuning();
 	/* first one is short to not let the user wait too long */
-	one_measurement(1, NULL);
+	one_measurement(1, sample_interval, NULL);
 =

 	if (!auto_tune) {
 		tuning_update_display();
@@ -508,7 +542,7 @@ int main(int argc, char **argv)
 	while (!leave_powertop) {
 		if (!auto_tune)
 			show_cur_tab();
-		one_measurement(time_out, NULL);
+		one_measurement(time_out, sample_interval, NULL);
 		learn_parameters(15, 0);
 	}
 	if (!auto_tune)
diff --git a/src/measurement/acpi.cpp b/src/measurement/acpi.cpp
index 2c9815d..ede2782 100644
--- a/src/measurement/acpi.cpp
+++ b/src/measurement/acpi.cpp
@@ -207,7 +207,7 @@ void acpi_power_meter::start_measurement(void)
 }
 =

 =

-double acpi_power_meter::joules_consumed(void)
+double acpi_power_meter::power(void)
 {
 	return rate;
 }
diff --git a/src/measurement/acpi.h b/src/measurement/acpi.h
index 315fddf..25bbe04 100644
--- a/src/measurement/acpi.h
+++ b/src/measurement/acpi.h
@@ -39,7 +39,7 @@ public:
 	virtual void start_measurement(void);
 	virtual void end_measurement(void);
 =

-	virtual double joules_consumed(void);
+	virtual double power(void);
 	virtual double dev_capacity(void) { return capacity; };
 };
 =

diff --git a/src/measurement/extech.cpp b/src/measurement/extech.cpp
index e014a5d..0849907 100644
--- a/src/measurement/extech.cpp
+++ b/src/measurement/extech.cpp
@@ -347,7 +347,7 @@ void extech_power_meter::start_measurement(void)
 }
 =

 =

-double extech_power_meter::joules_consumed(void)
+double extech_power_meter::power(void)
 {
 	return rate;
 }
diff --git a/src/measurement/extech.h b/src/measurement/extech.h
index 5f4c338..b7b330a 100644
--- a/src/measurement/extech.h
+++ b/src/measurement/extech.h
@@ -44,7 +44,7 @@ public:
 	virtual void end_measurement(void);
 	virtual void sample(void);
 	=

-	virtual double joules_consumed(void);
+	virtual double power(void);
 	virtual double dev_capacity(void) { return 0.0; };
 };
 =

diff --git a/src/measurement/measurement.cpp b/src/measurement/measurement.=
cpp
index 1c8e4da..caee24e 100644
--- a/src/measurement/measurement.cpp
+++ b/src/measurement/measurement.cpp
@@ -36,6 +36,7 @@
 #include <stdio.h>
 #include <fstream>
 #include <unistd.h>
+#include <time.h>
 =

 double min_power =3D 50000.0;
 =

@@ -49,18 +50,22 @@ void power_meter::end_measurement(void)
 }
 =

 =

-double power_meter::joules_consumed(void)
+double power_meter::power(void)
 {
 	return 0.0;
 }
 =

 vector<class power_meter *> power_meters;
 =

+static struct timespec tlast;
+
 void start_power_measurement(void)
 {
 	unsigned int i;
+	clock_gettime(CLOCK_REALTIME, &tlast);
 	for (i =3D 0; i < power_meters.size(); i++)
 		power_meters[i]->start_measurement();
+	all_results.joules =3D 0.0;
 }
 void end_power_measurement(void)
 {
@@ -69,7 +74,7 @@ void end_power_measurement(void)
 		power_meters[i]->end_measurement();
 }
 =

-double global_joules_consumed(void)
+double global_power(void)
 {
 	bool global_discharging =3D false;
 	double total =3D 0.0;
@@ -77,8 +82,9 @@ double global_joules_consumed(void)
 =

 	for (i =3D 0; i < power_meters.size(); i++) {
 		global_discharging |=3D power_meters[i]->is_discharging();
-		total +=3D power_meters[i]->joules_consumed();
+		total +=3D power_meters[i]->power();
 	}
+
 	/* report global time left if at least one battery is discharging */
 	if (!global_discharging)
 		return 0.0;
@@ -89,6 +95,23 @@ double global_joules_consumed(void)
 	return total;
 }
 =

+void global_sample_power(void)
+{
+	struct timespec tnow;
+
+	clock_gettime(CLOCK_REALTIME, &tnow);
+	/* power * time =3D joules */
+	all_results.joules +=3D global_power() * \
+			 ( ((double)tnow.tv_sec + 1.0e-9*tnow.tv_nsec) - \
+			   ((double)tlast.tv_sec + 1.0e-9*tlast.tv_nsec));
+	tlast =3D tnow;
+}
+
+double global_joules(void)
+{
+	return all_results.joules;
+}
+
 double global_time_left(void)
 {
 	bool global_discharging =3D false;
@@ -98,7 +121,7 @@ double global_time_left(void)
 	for (i =3D 0; i < power_meters.size(); i++) {
 		global_discharging |=3D power_meters[i]->is_discharging();
 		total_capacity +=3D power_meters[i]->dev_capacity();
-		total_rate +=3D power_meters[i]->joules_consumed();
+		total_rate +=3D power_meters[i]->power();
 	}
 	/* report global time left if at least one battery is discharging */
 	if (!global_discharging)
diff --git a/src/measurement/measurement.h b/src/measurement/measurement.h
index 83ffc34..df0ceca 100644
--- a/src/measurement/measurement.h
+++ b/src/measurement/measurement.h
@@ -36,7 +36,7 @@ public:
 =

 	virtual void start_measurement(void);
 	virtual void end_measurement(void);
-	virtual double joules_consumed(void);
+	virtual double power(void);
 =

 	virtual double dev_capacity(void)
 	{
@@ -58,7 +58,9 @@ extern vector<class power_meter *> power_meters;
 =

 extern void start_power_measurement(void);
 extern void end_power_measurement(void);
-extern double global_joules_consumed(void);
+extern double global_power(void);
+extern void global_sample_power(void);
+extern double global_joules(void);
 extern double global_time_left(void);
 =

 extern void detect_power_meters(void);
diff --git a/src/measurement/opal-sensors.cpp b/src/measurement/opal-sensor=
s.cpp
index 7316d1f..a70ec56 100644
--- a/src/measurement/opal-sensors.cpp
+++ b/src/measurement/opal-sensors.cpp
@@ -34,7 +34,7 @@ opal_sensors_power_meter::opal_sensors_power_meter(const =
char *power_supply_name
 	strncpy(name, power_supply_name, sizeof(name));
 }
 =

-double opal_sensors_power_meter::joules_consumed(void)
+double opal_sensors_power_meter::power(void)
 {
 	bool ok;
 	int value;
diff --git a/src/measurement/opal-sensors.h b/src/measurement/opal-sensors.h
index 8347733..7962091 100644
--- a/src/measurement/opal-sensors.h
+++ b/src/measurement/opal-sensors.h
@@ -35,7 +35,7 @@ public:
 	virtual void start_measurement(void) {};
 	virtual void end_measurement(void) {};
 =

-	virtual double joules_consumed(void);
+	virtual double power(void);
 	virtual double dev_capacity(void) { return 0.0; }
 };
 =

diff --git a/src/measurement/sysfs.h b/src/measurement/sysfs.h
index b7efa3d..5b440f5 100644
--- a/src/measurement/sysfs.h
+++ b/src/measurement/sysfs.h
@@ -48,7 +48,7 @@ public:
 	virtual void start_measurement(void);
 	virtual void end_measurement(void);
 =

-	virtual double joules_consumed(void) { return rate; }
+	virtual double power(void) { return rate; }
 	virtual double dev_capacity(void) { return capacity; }
 };
 =

diff --git a/src/parameters/parameters.cpp b/src/parameters/parameters.cpp
index 3bd5c05..38e1752 100644
--- a/src/parameters/parameters.cpp
+++ b/src/parameters/parameters.cpp
@@ -327,7 +327,7 @@ void store_results(double duration)
 {
 	if (duration < 5)
 		return;
-	global_joules_consumed();
+	global_power();
 	if (all_results.power > 0.01) {
 		unsigned int overflow_index;
 		overflow_index =3D 50 + (rand() % MAX_KEEP);
diff --git a/src/parameters/parameters.h b/src/parameters/parameters.h
index 72f8d32..1781a0e 100644
--- a/src/parameters/parameters.h
+++ b/src/parameters/parameters.h
@@ -66,6 +66,7 @@ extern void set_parameter_value(const char *name, double =
value, struct parameter
 =

 struct result_bundle
 {
+	double joules;
 	double power;
 	vector <double> utilization; /* device name, device utilization %age */
 };
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 391cb7f..812572c 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -787,6 +787,7 @@ void process_update_display(void)
 	unsigned int i;
 	WINDOW *win;
 	double pw;
+	double joules;
 	int tl;
 	int tlt;
 	int tlr;
@@ -816,10 +817,11 @@ void process_update_display(void)
 	}
 =

 	wprintw(win, _("Estimated power: %5.1f    Measured power: %5.1f    Sum: %=
5.1f\n\n"),
-				all_parameters.guessed_power, global_joules_consumed(), sum);
+				all_parameters.guessed_power, global_power(), sum);
 #endif
 =

-	pw =3D global_joules_consumed();
+	pw =3D global_power();
+	joules =3D global_joules();
 	tl =3D global_time_left() / 60;
 	tlt =3D (tl /60);
 	tlr =3D tl % 60;
@@ -828,6 +830,8 @@ void process_update_display(void)
 		char buf[32];
 		wprintw(win, _("The battery reports a discharge rate of %sW\n"),
 				fmt_prefix(pw, buf));
+		wprintw(win, _("The power consumed was %sJ\n"),
+				fmt_prefix(joules, buf));
 		need_linebreak =3D 1;
 	}
 	if (tl > 0 && pw > 0.0001) {
-- =

2.7.4


--===============1669204989885088208==--

