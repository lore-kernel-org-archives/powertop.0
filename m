Content-Type: multipart/mixed; boundary="===============2532603613640015217=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [FYI][RFC][PATCH 2/2] MALI GPU profiling support
Date: Tue, 25 Dec 2012 23:58:25 +0300
Message-ID: <20121225205825.GG3307@swordfish>
In-Reply-To: 1351771239-18925-3-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2532603613640015217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hello Igor,

On (11/01/12 16:00), Igor Zhbanov wrote:
> This patch adds MALI GPU profiling support.
> The information is collected from internal tracing mechanism
> (/sys/kernel/debug/mali/profiling/).
> =

> Currently the collected data is written in reports only and not
> on screen in interactive mode.
> =

> Reviewed-by: Kyungmin Park <kyungmin.park(a)samsung.com>
> ---
>  src/Makefile.am                                   |    1 +
>  src/main.cpp                                      |    8 +
>  src/mali-internal-events/mali-events.h            |  143 +++
>  src/mali-internal-events/mali-internal-events.cpp | 1279 +++++++++++++++=
++++++
>  4 files changed, 1431 insertions(+), 0 deletions(-)
>  create mode 100644 src/mali-internal-events/mali-events.h
>  create mode 100644 src/mali-internal-events/mali-internal-events.cpp
> =

> diff --git a/src/Makefile.am b/src/Makefile.am
> index e3eb6c2..af98867 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -28,6 +28,7 @@ powertop_SOURCES =3D parameters/persistent.cpp paramete=
rs/learn.cpp parameters/par
>  		tuning/tuningsysfs.cpp tuning/wifi.h tuning/runtime.cpp tuning/tunable=
.h \
>  		tuning/runtime.h tuning/tuningusb.h tuning/iw.h calibrate/calibrate.cp=
p \
>  		calibrate/calibrate.h measurement/measurement.cpp measurement/power_su=
pply.cpp \
> +		mali-internal-events/mali-events.h mali-internal-events/mali-internal-=
events.cpp  \
>  		mali-internal-events/proc-scan.cpp mali-internal-events/proc-scan.h \
>  		measurement/measurement.h measurement/acpi.cpp measurement/sysfs.h mea=
surement/sysfs.cpp \
>  		measurement/acpi.h measurement/extech.cpp measurement/power_supply.h m=
easurement/extech.h \
> diff --git a/src/main.cpp b/src/main.cpp
> index 83adfad..c901ce7 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -61,6 +61,7 @@
>  #define DEBUGFS_MAGIC          0x64626720
>  =

>  #include "mali-internal-events/proc-scan.h"
> +#include "mali-internal-events/mali-events.h"
>  =

>  int debug_learning =3D 0;
>  unsigned time_out =3D 20;
> @@ -183,6 +184,7 @@ static void do_sleep(int seconds)
>  	} while (1);
>  }
>  =

> +mali_ctx *ctx =3D NULL;
>  =


do we really need mali_ctx in main all the time (even for !mali builds)?
can we hide mali context as a static within mali internals?

side note: '#define __arm__' implies '#define mali'.



>  void one_measurement(int seconds, char *workload)
>  {
> @@ -191,6 +193,7 @@ void one_measurement(int seconds, char *workload)
>  	devices_start_measurement();
>  	start_process_measurement();
>  	start_cpu_measurement();
> +	start_mali_capture(ctx);
>  =

>  	if (workload && workload[0]) {
>  		scanproc(0, 0);
> @@ -206,9 +209,11 @@ void one_measurement(int seconds, char *workload)
>  	collect_open_devices();
>  	devices_end_measurement();
>  	end_power_measurement();
> +	stop_mali_capture(ctx);
>  =

>  	process_cpu_data();
>  	process_process_data();
> +	process_mali_events(ctx);
>  =

>  	/* output stats */
>  	process_update_display();
> @@ -257,11 +262,14 @@ void make_report(int time, char *workload, int iter=
ations, char *file)
>  	for (int i=3D0; i !=3D iterations; i++){
>  		init_report_output(file, iterations);
>  		initialize_tuning();
> +		ctx =3D init_mali_capture();
>  		/* and then the real measurement */
>  		one_measurement(time, workload);
>  		report_show_tunables();
> +		print_mali_stat(ctx);
>  		finish_report_output();
>  		clear_tuning();
> +		cleanup_mali_capture(&ctx);
>  	}
>  	/* and wrap up */
>  	learn_parameters(50, 0);
> diff --git a/src/mali-internal-events/mali-events.h b/src/mali-internal-e=
vents/mali-events.h
> new file mode 100644
> index 0000000..825f926
> --- /dev/null
> +++ b/src/mali-internal-events/mali-events.h
> @@ -0,0 +1,143 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *	http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * MALI GPU internal events tracer for r3p0 driver version.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>,
> + * Alina Litvinova <alina.litvinova(a)gmail.com>
> + * 2012.06 */
> +
> +#ifndef _MALI_EVENTS_H_
> +#define _MALI_EVENTS_H_
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +
> +struct mali_event {
> +	unsigned long long timestamp;
> +	unsigned int type, channel, data, d0, d1, d2, d3, d4;
> +};
> +
> +/*
> +Event ID bit format:
> + 3         2         1
> +10987654321098765432109876543210
> +RRRRTTTTCCCCCCCCDDDDDDDDDDDDDDDD
> +
> +RRRR -- reserved for future use.
> +
> +TTTT -- type of the event: */
> +#define MALI_PROFILING_EVENT_TYPE_SINGLE	0
> +#define MALI_PROFILING_EVENT_TYPE_START		1
> +#define MALI_PROFILING_EVENT_TYPE_STOP		2
> +#define MALI_PROFILING_EVENT_TYPE_SUSPEND	3
> +#define MALI_PROFILING_EVENT_TYPE_RESUME	4
> +
> +/*
> +CCCCCCCC -- channel/source of the event: */
> +#define MALI_PROFILING_EVENT_CHANNEL_SOFTWARE	0
> +#define MALI_PROFILING_EVENT_CHANNEL_GP0	1
> +#define MALI_PROFILING_EVENT_CHANNEL_PP0	5
> +#define MALI_PROFILING_EVENT_CHANNEL_PP1	6
> +#define MALI_PROFILING_EVENT_CHANNEL_PP2	7
> +#define MALI_PROFILING_EVENT_CHANNEL_PP3	8
> +#define MALI_PROFILING_EVENT_CHANNEL_PP4	9
> +#define MALI_PROFILING_EVENT_CHANNEL_PP5	10
> +#define MALI_PROFILING_EVENT_CHANNEL_PP6	11
> +#define MALI_PROFILING_EVENT_CHANNEL_PP7	12
> +#define MALI_PROFILING_EVENT_CHANNEL_GPU	21
> +
> +#define GP_NUM 1 /* Maximal number of GP units */
> +#define PP_NUM 8 /* Maximal number of PP units */
> +
> +/*
> +DDDDDDDDDDDDDDDD -- event data.
> +
> +Events data for MALI_PROFILING_EVENT_TYPE_SINGLE event type
> +from software channel: */
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_NONE		0 /* Not used */,
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_EGL_NEW_FRAME	1 /* Not use=
d */,
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_FLUSH		2 /* Not used */,
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_EGL_SWAP_BUFFERS	3 /* Not =
used */,
> +/*#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_FB_EVENT	4 // NOT USED */
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_GPU_FREQ		4
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_GPU_VOLTS		5
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_GLOBAL_TRY_LOCK	6
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_GLOBAL_LOCK	7
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_GLOBAL_UNLOCK	8
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_SW_VBLANK_VSYNC	9
> +
> +/*
> +Events data for MALI_PROFILING_EVENT_TYPE_SINGLE event type
> +from a HW channel (GPx + PPx + GPU): */
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_HW_NONE		0 /* Not used */
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_HW_INTERRUPT		1
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_HW_FLUSH		2
> +#define MALI_PROFILING_EVENT_REASON_SINGLE_GPU_FREQ_VOLT_CHANGE	10
> +
> +#define TIMESTAMP_FACTOR 1000000000ll
> +
> +#define MALI_PROFILING_PATH "/sys/kernel/debug/mali/profiling/"
> +#define MALI_PROFILING_EVENTS MALI_PROFILING_PATH "events"
> +#define MALI_PROFILING_RECORD MALI_PROFILING_PATH "record"
> +#define MALI_PROFILING_ENABLE MALI_PROFILING_PATH "proc/default/enable"
> +
> +enum unit_status {
> +	UNIT_FREE =3D 0,
> +	UNIT_BUSY
> +};
> +
> +struct unit_state {
> +	long long job_start;
> +	pid_t pid, tid;
> +	unit_status status;
> +};
> +
> +struct mali_state {
> +	unit_state gp[GP_NUM];
> +	unit_state pp[PP_NUM];
> +	int freq, volt; /* I hope GPU frequency will not be above 2 GHz ;-) */
> +	int split_count;
> +};
> +
> +struct mali_ctx {
> +	int old_enable, old_record;
> +	/* For filtering events timestamp */
> +	long long start_time, finish_time;
> +	const char *fname;
> +	mali_state gpu_state;
> +	bool live, error_flag, started, processed;
> +};
> +
> +mali_ctx *init_mali_capture();
> +bool start_mali_capture(mali_ctx *ctx);
> +bool stop_mali_capture(mali_ctx *ctx);
> +bool process_mali_events(mali_ctx *ctx);
> +bool print_mali_stat(mali_ctx *ctx);
> +bool cleanup_mali_capture(mali_ctx **ctx);
> +
> +bool get_pt_proc_info(pid_t pid, const char **name, const char **cmdline=
);
> +
> +#ifndef UNUSED
> +#define UNUSED __attribute__((unused))
> +#endif /* UNUSED */
> +


so we know everything about mali even in !mali (!arm) builds?



> +#endif /* _MALI_EVENTS_H_ */
> diff --git a/src/mali-internal-events/mali-internal-events.cpp b/src/mali=
-internal-events/mali-internal-events.cpp
> new file mode 100644
> index 0000000..686d1c3
> --- /dev/null
> +++ b/src/mali-internal-events/mali-internal-events.cpp
> @@ -0,0 +1,1279 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *	http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * MALI GPU internal events tracer for r3p0 driver version.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>,
> + * Alina Litvinova <alina.litvinova(a)gmail.com>
> + * 2012.06 */
> +
> +#define _POSIX_SOURCE
> +
> +#include <time.h>
> +#include <stdio.h>
> +#include <locale.h>
> +#include <stdarg.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <sys/time.h>
> +#include <sys/types.h>
> +
> +#include "proc-scan.h"
> +#include "mali-events.h"
> +
> +#include "../report/report.h"
> +#include "../report/report-maker.h"
> +
> +#ifdef __arm__
> +
> +enum debug_level_t {
> +	NO_DEBUG =3D 0,
> +	CRIT,
> +	TOTAL_REPORT,
> +	WARN,
> +	PER_UNIT_REPORT,
> +	TASK_EVENTS,
> +	MISC_EVENTS
> +};
> +
> +static debug_level_t debug_level =3D CRIT;
> +
> +/* *********************************************************************=
*** */
> +
> +static int dprintf(debug_level_t level, const char *fmt, ...)
> +				__attribute__ ((format (printf, 2, 3)));
> +
> +static int
> +dprintf(debug_level_t level, const char *fmt, ...) {
> +	int ret;
> +
> +	if (level > debug_level)
> +		return 0;
> +
> +	va_list ap;
> +	va_start(ap, fmt);
> +	ret =3D vprintf(fmt, ap);
> +	va_end(ap);
> +	return ret;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static int edprintf(debug_level_t level, const char *fmt, ...)
> +				__attribute__ ((format (printf, 2, 3)));
> +
> +static int
> +edprintf(debug_level_t level, const char *fmt, ...) {
> +	int ret;
> +
> +	if (level > debug_level)
> +		return 0;
> +
> +	va_list ap;
> +	va_start(ap, fmt);
> +	ret =3D vfprintf(stderr, fmt, ap);
> +	va_end(ap);
> +	return ret;
> +}
> +


side note: to my mind, it's better to have some debugging support in lib, r=
ather than
inside some subsystem.



 =

 off topic: I think it'll be nice to have some UI level user reporting, let=
's say,
 first UI line (white text on red bg).

 e.g. =

 if (toggle() !=3D SUCCESS)
	notify_user("Unable to toggle powersave on %s", _(dev_name));


 for example, something like this (let's return to this later):

	void notify_user(const char *frmt, ...)
	{
	        va_list list;
	=

	        start_color();
	        init_pair(1, COLOR_WHITE, COLOR_RED);
	=

	        va_start(list, frmt);
	        attron(COLOR_PAIR(1));
	        mvprintw(1, 0, frmt, list);
	        attroff(COLOR_PAIR(1));
	        va_end(list);
	}
	=



> +/* *********************************************************************=
*** */
> +
> +static int
> +get_int_value(const char *fname)
> +{
> +	FILE *f;
> +	int value;
> +
> +	f =3D fopen(fname, "r");
> +	if (!f) {
> +		edprintf(CRIT, "Can't open \"%s\".\n", fname);
> +		return -1;
> +	}
> +
> +	if (fscanf(f, "%d", &value) !=3D 1) {
> +		edprintf(CRIT, "Can't read \"%s\" or its value is in wrong "
> +			       "format.\n", fname);
> +		fclose(f);
> +		return -1;
> +	}
> +
> +	fclose(f);
> +	return value;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +set_int_value(const char *fname, int value)
> +{
> +	FILE *f;
> +
> +	f =3D fopen(fname, "w");
> +	if (!f) {
> +		edprintf(CRIT, "Can't open \"%s\".\n", fname);
> +		return false;
> +	}
> +
> +	fprintf(f, "%d\n", value);
> +	fclose(f);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static int
> +get_enable()
> +{
> +	return get_int_value(MALI_PROFILING_ENABLE);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +set_enable(int value)
> +{
> +	return set_int_value(MALI_PROFILING_ENABLE, value);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static int
> +get_record()
> +{
> +	return get_int_value(MALI_PROFILING_RECORD);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +set_record(int value)
> +{
> +	return set_int_value(MALI_PROFILING_RECORD, value);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +save_mode(int *old_enable, int *old_record)
> +{
> +	*old_enable =3D get_enable();
> +	if (*old_enable =3D=3D -1) {
> +		edprintf(CRIT, "Can't get value of \"" MALI_PROFILING_ENABLE
> +			       "\".\n");
> +		return false;
> +	}
> +
> +	*old_record =3D get_record();
> +	if (*old_record =3D=3D -1) {
> +		edprintf(CRIT, "Can't get value of \"" MALI_PROFILING_RECORD
> +			       "\".\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +set_mode()
> +{
> +	if (!set_enable(1))
> +		return false;
> +
> +	/* Enable recording. Don't clean previous records to collect
> +	 * voltage and frequency information */
> +	if (!set_record(1))
> +		return false;
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +restore_mode(int old_enable, int old_record)
> +{
> +	/* Clear previous events and disable recording */
> +	if (!set_record(old_record))
> +		return false;
> +
> +	if (!set_enable(old_enable))
> +		return false;
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static int
> +gp_number(int channel)
> +{
> +	return channel - MALI_PROFILING_EVENT_CHANNEL_GP0;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static int
> +pp_number(int channel)
> +{
> +	return channel - MALI_PROFILING_EVENT_CHANNEL_PP0;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +is_gp_channel(int channel)
> +{
> +	return (channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_GP0);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +is_pp_channel(int channel)
> +{
> +	return (channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_PP0 ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_PP1 ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_PP2 ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_PP3 ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_PP4 ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_PP5 ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_PP6);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +is_gp_or_pp_channel(int channel)
> +{
> +	return (is_gp_channel(channel) || is_pp_channel(channel));
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +is_known_channel(int channel)
> +{
> +	return (is_gp_or_pp_channel(channel) ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_SOFTWARE ||
> +		channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_GPU);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static const char *
> +get_gp_name(int channel)
> +{
> +	switch (channel) {
> +		case MALI_PROFILING_EVENT_CHANNEL_GP0:
> +			return "GP0";
> +		default:
> +			return "NOT A GP UNIT";
> +	}
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static const char *
> +get_pp_name(int channel)
> +{
> +	switch (channel) {
> +		case MALI_PROFILING_EVENT_CHANNEL_PP0:
> +			return "PP0";
> +		case MALI_PROFILING_EVENT_CHANNEL_PP1:
> +			return "PP1";
> +		case MALI_PROFILING_EVENT_CHANNEL_PP2:
> +			return "PP2";
> +		case MALI_PROFILING_EVENT_CHANNEL_PP3:
> +			return "PP3";
> +		case MALI_PROFILING_EVENT_CHANNEL_PP4:
> +			return "PP4";
> +		case MALI_PROFILING_EVENT_CHANNEL_PP5:
> +			return "PP5";
> +		case MALI_PROFILING_EVENT_CHANNEL_PP6:
> +			return "PP6";
> +		case MALI_PROFILING_EVENT_CHANNEL_PP7:
> +			return "PP7";
> +		default:
> +			return "NOT A PP UNIT";
> +	}
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static const char *
> +get_channel_name(int channel)
> +{
> +	if (is_pp_channel(channel))
> +		return get_pp_name(channel);
> +	else if (is_gp_channel(channel))
> +		return get_gp_name(channel);
> +	else if (channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_SOFTWARE)
> +		return "Software";
> +	else if (channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_GPU)
> +		return "GPU";
> +	else {
> +		static char buf[64];
> +
> +		snprintf(buf, sizeof(buf), "UNKNOWN(%u)", channel);
> +		return buf;
> +	}
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static int
> +print_date(debug_level_t level, const mali_event *ev)
> +{
> +	time_t t;
> +	char str[256], stz[32];
> +	struct tm *ltm;
> +
> +	if (level > debug_level)
> +		return 0;
> +
> +	t =3D ev->timestamp / TIMESTAMP_FACTOR;
> +	ltm =3D localtime(&t);
> +
> +	strftime(str, sizeof(str), "%F %T", ltm);
> +	strftime(stz, sizeof(stz), "%z", ltm);
> +
> +	/* No newline at end */
> +	return dprintf(level, "%s.%010u %s: ", str,
> +		       (unsigned int)(ev->timestamp % TIMESTAMP_FACTOR), stz);
> +}
*> +
> +/* *********************************************************************=
*** */
> +
> +/* Channel is a GP channel here */
> +static bool
> +process_gp_job(mali_ctx *ctx, const mali_event *ev, int un)
> +{
> +	double freq, volt, duration, power;
> +	process_info *proc;
> +	pid_t pid;
> +
> +	if (ctx->gpu_state.freq =3D=3D -1) {
> +		dprintf(WARN, "GPU Frequency is unknown for finished job. "
> +			"Set it to 440 MHz.\n");
> +		ctx->gpu_state.freq =3D 440000000;
> +	}
> +
> +	if (ctx->gpu_state.volt =3D=3D -1) {
> +		dprintf(WARN, "GPU Voltage is unknown for finished job. "
> +			"Set it to 1.075 V.\n");
> +		ctx->gpu_state.volt =3D 1075000;
> +	}
> +
> +	freq =3D ctx->gpu_state.freq / 1000000.;
> +	volt =3D ctx->gpu_state.volt / 1000000.;
> +	pid =3D ctx->gpu_state.gp[un].pid;
> +	ctx->gpu_state.gp[un].status =3D UNIT_FREE;
> +	duration =3D (double)(ev->timestamp - ctx->gpu_state.gp[un].job_start) /
> +		   (double)TIMESTAMP_FACTOR;
> +	/* Consumed power approximately can be computed as this:
> +	 * P =3D C * V^2 * f, where C is capacitance, V is voltage
> +	 * and f is frequency. We don't need exact Watts so we consider
> +	 * that 1 PW (PseudoWatt) is consumed running one GPU unit
> +	 * (GPx or PPx) on 266 MHz and 1 Volt. */
> +	power =3D freq * volt * volt * duration / 266.;
> +	dprintf(TASK_EVENTS, "Job was ran on GP%d by pid %d, tid %d "
> +			     "for %lg seconds with GPU frequency =3D %lg MHz, "
> +			     "voltage =3D %.03f, "
> +			     "consumed power =3D %lg PseudoWatts\n",
> +		un, pid, ctx->gpu_state.gp[un].tid, duration, freq, volt,
> +		power);
> +
> +	proc =3D get_proc_info(pid);
> +	if (!proc)
> +		add_unknown_proc(pid, power);
> +	else
> +		proc->power +=3D power;
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +/* Channel is a PP channel here */
> +static bool
> +process_pp_job(mali_ctx *ctx, const mali_event *ev, int un)
> +{
> +	double freq, volt, duration, power;
> +	process_info *proc;
> +	pid_t pid;
> +
> +	if (ctx->gpu_state.freq =3D=3D -1) {
> +		dprintf(WARN, "GPU Frequency is unknown for finished job. "
> +			"Set it to 440 MHz.\n");
> +		ctx->gpu_state.freq =3D 440000000;
> +	}
> +
> +	if (ctx->gpu_state.volt =3D=3D -1) {
> +		dprintf(WARN, "GPU Voltage is unknown for finished job. "
> +			"Set it to 1.075 V.\n");
> +		ctx->gpu_state.volt =3D 1075000;
> +	}
> +
> +	freq =3D ctx->gpu_state.freq / 1000000.;
> +	volt =3D ctx->gpu_state.volt / 1000000.;
> +	pid =3D ctx->gpu_state.pp[un].pid;
> +	ctx->gpu_state.pp[un].status =3D UNIT_FREE;
> +	duration =3D (double)(ev->timestamp - ctx->gpu_state.pp[un].job_start) /
> +		   (double)TIMESTAMP_FACTOR;
> +	/* See comment in process_gp_job() above. */
> +	power =3D freq * volt * volt * duration / 266.;
> +	dprintf(TASK_EVENTS, "Job was ran on PP%d by pid %d, tid %d "
> +			     "for %lg seconds with GPU frequency =3D %g MHz, "
> +			     "voltage =3D %.03f, "
> +			     "consumed power =3D %lg PseudoWatts\n",
> +		un, pid, ctx->gpu_state.pp[un].tid, duration, freq, volt,
> +		power);
> +
> +	proc =3D get_proc_info(pid);
> +	if (!proc)
> +		add_unknown_proc(pid, power);
> +	else
> +		proc->power +=3D power;
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +/* Channel is a GP channel here */
> +static bool
> +process_gp_job_start(mali_ctx *ctx, const mali_event *ev)
> +{
> +	int un;
> +
> +	print_date(TASK_EVENTS, ev);
> +	dprintf(TASK_EVENTS, "GP job started at %s by pid =3D %u, tid =3D %u\n",
> +		get_gp_name(ev->channel), ev->d0, ev->d1);
> +	un =3D gp_number(ev->channel);
> +	if (ctx->gpu_state.gp[un].status !=3D UNIT_FREE) {
> +		edprintf(WARN, "We have missed GP Job Stop event. "
> +			       "Considering running task finished.\n");
> +		if (!process_gp_job(ctx, ev, un))
> +			return false;
> +	}
> +
> +	ctx->gpu_state.gp[un].status =3D UNIT_BUSY;
> +	ctx->gpu_state.gp[un].job_start =3D ev->timestamp;
> +	ctx->gpu_state.gp[un].pid =3D ev->d0;
> +	ctx->gpu_state.gp[un].tid =3D ev->d1;
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +/* Channel is a PP channel here */
> +static bool
> +process_pp_job_start(mali_ctx *ctx, const mali_event *ev)
> +{
> +	int un;
> +
> +	print_date(TASK_EVENTS, ev);
> +	dprintf(TASK_EVENTS, "PP job started at %s by pid =3D %u, tid =3D %u\n",
> +		get_pp_name(ev->channel), ev->d0, ev->d1);
> +	un =3D pp_number(ev->channel);
> +	if (ctx->gpu_state.pp[un].status !=3D UNIT_FREE) {
> +		edprintf(WARN, "We have missed PP Job Stop event. "
> +			       "Considering running task finished.\n");
> +		if (!process_pp_job(ctx, ev, un))
> +			return false;
> +	}
> +
> +	ctx->gpu_state.pp[un].status =3D UNIT_BUSY;
> +	ctx->gpu_state.pp[un].job_start =3D ev->timestamp;
> +	ctx->gpu_state.pp[un].pid =3D ev->d0;
> +	ctx->gpu_state.pp[un].tid =3D ev->d1;
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_start_event(mali_ctx *ctx, const mali_event *ev)
> +{
> +	/* Skip events that was before program start
> +	 * or after program finish */
> +	if ((signed long long)ev->timestamp < ctx->start_time ||
> +	    (signed long long)ev->timestamp > ctx->finish_time) {
> +		dprintf(MISC_EVENTS,
> +			"Skipping Start event out of time interval (ts=3D%lld, "
> +			"st=3D%lld, fn=3D%lld).\n",
> +			ev->timestamp, ctx->start_time, ctx->finish_time);
> +		return true;
> +	}
> +
> +	if (!is_gp_or_pp_channel(ev->channel)) {
> +		print_date(MISC_EVENTS, ev);
> +		dprintf(MISC_EVENTS, "Skipping Start event from uninterested "
> +			"channel %s.\n", get_channel_name(ev->channel));
> +		return true;
> +	}
> +
> +	if (is_gp_channel(ev->channel))
> +		return process_gp_job_start(ctx, ev);
> +	else
> +		return process_pp_job_start(ctx, ev);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +/* Channel is a GP channel here */
> +static bool
> +process_gp_job_stop(mali_ctx *ctx, const mali_event *ev)
> +{
> +	int un;
> +	int src0, src1;
> +
> +	src0 =3D ev->d2 & 0xff;
> +	src1 =3D ev->d2 >> 8;
> +	print_date(TASK_EVENTS, ev);
> +	dprintf(TASK_EVENTS,
> +		"GP job stopped at %s with val0 =3D %u, val1 =3D %u, "
> +		"src0 =3D %u, src1 =3D %u\n",
> +		get_gp_name(ev->channel), ev->d0, ev->d1, src0, src1);
> +	un =3D gp_number(ev->channel);
> +	if (ctx->gpu_state.gp[un].status !=3D UNIT_BUSY) {
> +		edprintf(WARN, "Skipping GP Job Stop event because unit "
> +			       "is already free.\n");
> +		return true;
> +	}
> +
> +	return process_gp_job(ctx, ev, un);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +/* Channel is a PP channel here */
> +static bool
> +process_pp_job_stop(mali_ctx *ctx, const mali_event *ev)
> +{
> +	int un;
> +	int src0, src1;
> +
> +	src0 =3D ev->d2 & 0xff;
> +	src1 =3D ev->d2 >> 8;
> +	print_date(TASK_EVENTS, ev);
> +	dprintf(TASK_EVENTS,
> +		"PP job stopped at %s with val0 =3D %u, val1 =3D %u, "
> +		"src0 =3D %u, src1 =3D %u\n",
> +		get_pp_name(ev->channel), ev->d0, ev->d1, src0, src1);
> +	un =3D pp_number(ev->channel);
> +	if (ctx->gpu_state.pp[un].status !=3D UNIT_BUSY) {
> +		edprintf(WARN, "Skipping PP Job Stop event because unit "
> +			       "is already free.\n");
> +		return true;
> +	}
> +
> +	return process_pp_job(ctx, ev, un);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_stop_event(mali_ctx *ctx, const mali_event *ev)
> +{
> +	/* Skip events that was before program start
> +	 * or after program finish */
> +	if ((signed long long)ev->timestamp < ctx->start_time ||
> +	    (signed long long)ev->timestamp > ctx->finish_time) {
> +		dprintf(MISC_EVENTS,
> +			"Skipping Stop event out of time interval.\n");
> +		return true;
> +	}
> +
> +	if (!is_gp_or_pp_channel(ev->channel)) {
> +		print_date(MISC_EVENTS, ev);
> +		dprintf(MISC_EVENTS,
> +			"Skipping Stop event from uninterested channel %s.\n",
> +			get_channel_name(ev->channel));
> +		return true;
> +	}
> +
> +	if (is_gp_channel(ev->channel))
> +		return process_gp_job_stop(ctx, ev);
> +	else
> +		return process_pp_job_stop(ctx, ev);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_sw_global_try_lock(const mali_event *ev)
> +{
> +	print_date(MISC_EVENTS, ev);
> +	dprintf(MISC_EVENTS,
> +		"SW Global Try Lock by pid =3D %u, tid =3D %u, key =3D %u\n",
> +		ev->d0, ev->d1, ev->d2);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_sw_global_lock(const mali_event *ev)
> +{
> +	print_date(MISC_EVENTS, ev);
> +	dprintf(MISC_EVENTS,
> +		"SW Global Lock     by pid =3D %u, tid =3D %u, key =3D %u\n",
> +		ev->d0, ev->d1, ev->d2);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_sw_global_unlock(const mali_event *ev)
> +{
> +	print_date(MISC_EVENTS, ev);
> +	dprintf(MISC_EVENTS,
> +		"SW Global Unlock   by pid =3D %u, tid =3D %u, key =3D %u\n",
> +		ev->d0, ev->d1, ev->d2);
> +	return true;
> +}
> +

can we factor out generic =


	process_sw_global_lock_op(const mali_event *ev, const char *op)
	{
		print_date(MISC_EVENTS, ev);
		dprintf(MISC_EVENTS,
			"%s   by pid =3D %u, tid =3D %u, key =3D %u\n", op,
			ev->d0, ev->d1, ev->d2);
		return true;
	}

and use

	process_sw_global_lock_op(ev, SW_GLOBAL_TRY_LOCK);
	process_sw_global_lock_op(ev, SW_GLOBAL_LOCK);
	process_sw_global_lock_op(ev, SW_GLOBAL_UNLOCK);

where #define SW_GLOBAL_TRY_LOCK "SW Global Try Lock", etc.


for example, =

process_pp_job() and process_pp_job() are identical, with the only differen=
ce in
unit_state being addressed: pp or gp.

in other words, if there is no difference from techical point of view (well=
, almost)
what job we start/stop/process, then *PROBABLY* we can have generic job sta=
rt/stop/process
function taking UNIT_STATE_TYPE (e.g.) as additional parameter.
what do you think?


	-ss

> +/* *********************************************************************=
*** */
> +
> +/* on:
> + *  0 -- Device is powering up,
> + *  1 -- Device is powering down,
> + * -1 -- Don't care about device state and don't issue warnings. */
> +static void
> +split_gp_jobs(mali_ctx *ctx, const mali_event *ev, int on)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < GP_NUM; i++) {
> +		if (ctx->gpu_state.gp[i].status =3D=3D UNIT_FREE)
> +			continue;
> +
> +		if (on =3D=3D 1)
> +			dprintf(WARN,
> +				"Strange thing. GP%d is turned on while "
> +				"task is already running.\n", i);
> +		else if (on =3D=3D 0)
> +			dprintf(WARN,
> +				"Strange thing. GP%d is turned off while "
> +				"task is still running.\n", i);
> +
> +		dprintf(MISC_EVENTS, "Next GP job is splitted.\n");
> +		/* Split task and "restart" job with the same pid */
> +		process_gp_job(ctx, ev, i);
> +		ctx->gpu_state.gp[i].status =3D UNIT_BUSY;
> +		ctx->gpu_state.gp[i].job_start =3D ev->timestamp;
> +	}
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static void
> +split_pp_jobs(mali_ctx *ctx, const mali_event *ev, int on)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < PP_NUM; i++) {
> +		if (ctx->gpu_state.pp[i].status =3D=3D UNIT_FREE)
> +			continue;
> +
> +		if (on =3D=3D 1)
> +			dprintf(WARN,
> +				"Strange thing. PP%d is turned on while "
> +				"task is already running.\n", i);
> +		else if (on =3D=3D 0)
> +			dprintf(WARN,
> +				"Strange thing. PP%d is turned off while "
> +				"task is still running.\n", i);
> +
> +		dprintf(MISC_EVENTS, "Next PP job is splitted.\n");
> +		/* Split task and "restart" job with the same pid */
> +		process_pp_job(ctx, ev, i);
> +		ctx->gpu_state.pp[i].status =3D UNIT_BUSY;
> +		ctx->gpu_state.pp[i].job_start =3D ev->timestamp;
> +	}
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static void
> +split_jobs(mali_ctx *ctx, const mali_event *ev, int on)
> +{
> +	/* It seems that it is impossible to change Only voltage without
> +	 * changing frequency. And it seems that these events are always
> +	 * come in pairs. So we split our jobs at first event and skip
> +	 * second to avoid reports with strange frequency / voltage
> +	 * combination. It would be better to know dependancy between
> +	 * frequency and voltage so we can adjust another when one changes.*/
> +	if (ctx->gpu_state.split_count & 1)
> +		return;
> +
> +	split_gp_jobs(ctx, ev, on);
> +	split_pp_jobs(ctx, ev, on);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_sw_gpu_freq(mali_ctx *ctx, const mali_event *ev)
> +{
> +	if (!ev->d1) {
> +		print_date(MISC_EVENTS, ev);
> +		dprintf(MISC_EVENTS, "SW GPU Freq rate (previous) =3D %u\n",
> +			ev->d0);
> +		return true;
> +	}
> +
> +	if (ctx->gpu_state.freq =3D=3D (signed int)ev->d0)
> +		return true;
> +
> +	split_jobs(ctx, ev, -1);
> +	ctx->gpu_state.freq =3D ev->d0;
> +	ctx->gpu_state.split_count++;
> +	print_date(TASK_EVENTS, ev);
> +	dprintf(TASK_EVENTS, "GPU frequency changed to %d\n",
> +		ctx->gpu_state.freq);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_sw_gpu_volts(mali_ctx *ctx, const mali_event *ev)
> +{
> +	if (ev->d2 !=3D 2) {
> +		print_date(MISC_EVENTS, ev);
> +		dprintf(MISC_EVENTS,
> +			"SW GPU Volts min_uV =3D %u, max_uV =3D %u (Desired)\n",
> +			ev->d0, ev->d1);
> +		return true;
> +	}
> +
> +	if (ctx->gpu_state.volt =3D=3D (signed int)ev->d0)
> +		return true;
> +
> +	split_jobs(ctx, ev, -1);
> +	ctx->gpu_state.volt =3D ev->d0;
> +	ctx->gpu_state.split_count++;
> +	print_date(TASK_EVENTS, ev);
> +	dprintf(TASK_EVENTS, "GPU voltage changed to %d\n",
> +		ctx->gpu_state.volt);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_single_software_event(mali_ctx *ctx, const mali_event *ev)
> +{
> +	switch (ev->data) {
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_SW_GPU_FREQ:
> +			return process_sw_gpu_freq(ctx, ev);
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_SW_GPU_VOLTS:
> +			return process_sw_gpu_volts(ctx, ev);
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_SW_GLOBAL_TRY_LOCK:
> +			return process_sw_global_try_lock(ev);
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_SW_GLOBAL_LOCK:
> +			return process_sw_global_lock(ev);
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_SW_GLOBAL_UNLOCK:
> +			return process_sw_global_unlock(ev);
> +			break;
> +/*		case MALI_PROFILING_EVENT_REASON_SINGLE_SW_VBLANK_VSYNC:*/
> +/*		case MALI_PROFILING_EVENT_REASON_SINGLE_GPU_FREQ_VOLT_CHANGE:*/
> +		default:
> +			print_date(WARN, ev);
> +			dprintf(WARN, "Skipping Single software event "
> +				"with unknown data %d.\n", ev->data);
> +			break;
> +	}
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_hw_interrupt(const mali_event *ev)
> +{
> +	if (!is_gp_or_pp_channel(ev->channel)) {
> +		print_date(WARN, ev);
> +		dprintf(WARN, "Skipping HW Interrupt event from wrong "
> +			"channel %s.\n", get_channel_name(ev->channel));
> +		return true;
> +	}
> +
> +	print_date(MISC_EVENTS, ev);
> +	dprintf(MISC_EVENTS, "HW Interrupt at %s with irq_readout =3D %u\n",
> +		get_channel_name(ev->channel), ev->d0);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_hw_flush(const mali_event *ev)
> +{
> +	if (!is_gp_or_pp_channel(ev->channel)) {
> +		print_date(WARN, ev);
> +		dprintf(WARN, "Skipping HW Flush event from wrong "
> +			"channel %s.\n", get_channel_name(ev->channel));
> +		return true;
> +	}
> +
> +	print_date(MISC_EVENTS, ev);
> +	dprintf(MISC_EVENTS,
> +		"HW Flush at %s with frame_builder_id =3D %u, flush_id, =3D %u\n",
> +		get_channel_name(ev->channel), ev->d0, ev->d1);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +update_jobs(mali_ctx *ctx, const mali_event *ev, int new_freq, int new_v=
olt)
> +{
> +	/* Nothing to change */
> +	if (ctx->gpu_state.freq =3D=3D new_freq &&
> +	    ctx->gpu_state.volt =3D=3D new_volt)
> +		return true;
> +
> +	if (new_freq) {
> +		dprintf(TASK_EVENTS, "GPU is ON now\n");
> +		/* Shouldn't have any jobs running but recheck it for sure */
> +		split_jobs(ctx, ev, 1);
> +	} else {
> +		dprintf(TASK_EVENTS, "GPU is OFF now\n");
> +		/* Shouldn't have any jobs running but recheck it for sure */
> +		split_jobs(ctx, ev, 0);
> +	}
> +
> +	ctx->gpu_state.freq =3D new_freq;
> +	ctx->gpu_state.volt =3D new_volt;
> +	ctx->gpu_state.split_count =3D 0;
> +	dprintf(TASK_EVENTS, "GPU frequency changed to %d, voltage to %d\n",
> +		ctx->gpu_state.freq, ctx->gpu_state.volt);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_gpu_freq_volt_change(mali_ctx *ctx, const mali_event *ev)
> +{
> +	if (ev->channel !=3D MALI_PROFILING_EVENT_CHANNEL_GPU) {
> +		print_date(WARN, ev);
> +		dprintf(WARN,
> +			"Skipping GPU Freq Volt event from wrong channel "
> +			"%s.\n", get_channel_name(ev->channel));
> +		return true;
> +	}
> +
> +	dprintf(MISC_EVENTS, "GPU Volt Change with mali_gpu_clk =3D %u, "
> +			     "mali_gpu_vol / 1000 =3D %u\n",
> +		ev->d0, ev->d1);
> +	return update_jobs(ctx, ev, ev->d0 * 1000000, ev->d1 * 1000);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_single_hardware_event(mali_ctx *ctx, const mali_event *ev)
> +{
> +	switch (ev->data) {
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_HW_INTERRUPT:
> +			return process_hw_interrupt(ev);
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_HW_FLUSH:
> +			return process_hw_flush(ev);
> +		case MALI_PROFILING_EVENT_REASON_SINGLE_GPU_FREQ_VOLT_CHANGE:
> +			return process_gpu_freq_volt_change(ctx, ev);
> +		default:
> +			print_date(WARN, ev);
> +			dprintf(WARN, "Skipping Single hardware event "
> +				      "with unknown data %d.\n", ev->data);
> +			break;
> +	}
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_single_event(mali_ctx *ctx, const mali_event *ev)
> +{
> +	if (!is_known_channel(ev->channel)) {
> +		print_date(WARN, ev);
> +		dprintf(WARN,
> +			"Skipping Single event with unknown channel %d.\n",
> +			ev->channel);
> +		return true;
> +	}
> +
> +	if (ev->channel =3D=3D MALI_PROFILING_EVENT_CHANNEL_SOFTWARE)
> +		return process_single_software_event(ctx, ev);
> +	else
> +		return process_single_hardware_event(ctx, ev);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_unknown_event(const mali_event *ev)
> +{
> +	print_date(WARN, ev);
> +	dprintf(WARN,
> +		"Skipping unknown event: type =3D %u, channel =3D %u, data =3D %u, "
> +		"d0 =3D %u, d1 =3D %u, d2 =3D %u, d3 =3D %u, d4 =3D %u.\n",
> +		ev->type, ev->channel, ev->data, ev->d0, ev->d1, ev->d2,
> +		ev->d3, ev->d4);
> +	return true;
> +}
> +
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +process_mali_event(mali_ctx *ctx, const mali_event *ev)
> +{
> +	switch (ev->type) {
> +		case MALI_PROFILING_EVENT_TYPE_SINGLE:
> +			return process_single_event(ctx, ev);
> +		case MALI_PROFILING_EVENT_TYPE_START:
> +			return process_start_event(ctx, ev);
> +		case MALI_PROFILING_EVENT_TYPE_STOP:
> +			return process_stop_event(ctx, ev);
> +		case MALI_PROFILING_EVENT_TYPE_SUSPEND:
> +			print_date(MISC_EVENTS, ev);
> +			dprintf(MISC_EVENTS, "Skipping Suspend event.\n");
> +			break;
> +		case MALI_PROFILING_EVENT_TYPE_RESUME:
> +			print_date(MISC_EVENTS, ev);
> +			dprintf(MISC_EVENTS, "Skipping Resume event.\n");
> +			break;
> +		default:
> +			return process_unknown_event(ev);
> +	}
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +parse_mali_event(mali_ctx *ctx, const char *line)
> +{
> +	mali_event ev;
> +	unsigned int event_id;
> +
> +	if (sscanf(line, "%llu %u %u %u %u %u %u", &ev.timestamp, &event_id,
> +		   &ev.d0, &ev.d1, &ev.d2, &ev.d3, &ev.d4) !=3D 7) {
> +		edprintf(CRIT, "Wrong event line: %s", line);
> +		return false;
> +	}
> +
> +	/* Doesn't skip events here because we need information about current
> +	 * voltage and frequency. Will skip only job-related events later. */
> +
> +	ev.type    =3D (event_id >> 24) & 0xf;
> +	ev.channel =3D (event_id >> 16) & 0xff;
> +	ev.data    =3D event_id & 0xffff;
> +	return process_mali_event(ctx, &ev);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +process_mali_events(mali_ctx *ctx)
> +{
> +	FILE *f;
> +	char line[4096];
> +
> +	if (!ctx || ctx->processed)
> +		return false;
> +
> +	f =3D fopen(ctx->fname, "r");
> +	if (!f) {
> +		edprintf(CRIT, "Can't open \"%s\".\n", ctx->fname);
> +		ctx->error_flag =3D 1;
> +		return false;
> +	}
> +
> +	while (fgets(line, sizeof(line), f))
> +		if (parse_mali_event(ctx, line) =3D=3D -1) {
> +			ctx->error_flag =3D 1;
> +			return false;
> +		}
> +
> +	fclose(f);
> +	ctx->processed =3D true;
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static void
> +init_gpu_state(mali_ctx *ctx)
> +{
> +	memset(&ctx->gpu_state, '\0', sizeof(mali_state));
> +	ctx->gpu_state.freq =3D -1; /* Unknown */
> +	ctx->gpu_state.volt =3D -1; /* Unknown */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +cleanup_mali_capture(mali_ctx **ctx)
> +{
> +	if (!ctx || !*ctx)
> +		return true;
> +
> +	clear_procs_info();
> +
> +	if ((*ctx)->live &&
> +			!restore_mode((*ctx)->old_enable, (*ctx)->old_record))
> +		return false;
> +
> +	free(*ctx);
> +	*ctx =3D NULL;
> +
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +static bool
> +stat_callback(const process_info *pinfo, void *data UNUSED)
> +{
> +	const char *comm, *cmdline;
> +
> +	if (pinfo->power =3D=3D 0) /* Skip empty */
> +		return true;
> +
> +	dprintf(TOTAL_REPORT,
> +		"Total consumed power by pid %d is %lg PseudoWatts*s\n",
> +		pinfo->pid, pinfo->power);
> +
> +	if (!pinfo->unknown_name) {
> +		comm    =3D pinfo->comm;
> +		cmdline =3D pinfo->cmdline;
> +	} else if (!get_pt_proc_info(pinfo->pid, &comm, &cmdline)) {
> +		comm    =3D "(Unknown)";
> +		cmdline =3D "(Unknown)";
> +	}
> +
> +	report.begin_row(ROW_SOFTWARE);
> +	report.begin_cell();
> +	report.addf("%.4f PWs", pinfo->power);
> +	report.begin_cell();
> +	report.addf("%d", pinfo->pid);
> +	report.begin_cell();
> +	report.add(comm);
> +	report.begin_cell();
> +	report.add(cmdline);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +print_mali_stat(mali_ctx *ctx)
> +{
> +	char *oldlocale;
> +
> +	if (!ctx)
> +		return false;
> +
> +	if (ctx->error_flag || ctx->started || !ctx->processed) {
> +		edprintf(CRIT,
> +			 "Errors was encountered during processing '%s'\n",
> +			 ctx->fname);
> +		return false;
> +	}
> +
> +	oldlocale =3D setlocale(LC_NUMERIC, NULL);
> +	oldlocale =3D strdup(oldlocale);
> +	setlocale(LC_NUMERIC, "C"); /* For dots in %f in printf() */
> +
> +	report.add_header("Overview of MALI GPU power consumers");
> +	report.begin_table(TABLE_WIDE);
> +	report.begin_row();
> +	report.begin_cell(CELL_SOFTWARE_PROCESS);
> +	report.add("Power est. (PseudoWatts*s)");
> +	report.begin_cell(CELL_SOFTWARE_DESCRIPTION);
> +	report.add("PID");
> +	report.begin_cell(CELL_SOFTWARE_DESCRIPTION);
> +	report.add("Name");
> +	report.begin_cell(CELL_SOFTWARE_DESCRIPTION);
> +	report.add("Description");
> +	print_sorted_procs(stat_callback, NULL);
> +
> +	setlocale(LC_NUMERIC, oldlocale);
> +	free(oldlocale);
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +stop_mali_capture(mali_ctx *ctx)
> +{
> +	if (!ctx || !ctx->started)
> +		return false;
> +
> +	if (ctx->live) {
> +		struct timeval tv;
> +
> +		if (!set_record(0)) /* Stop events recording */
> +			return false;
> +
> +		gettimeofday(&tv, NULL);
> +		ctx->finish_time =3D (tv.tv_sec * 1000000ll + tv.tv_usec) *
> +				   (TIMESTAMP_FACTOR / 1000000ll);
> +	}
> +
> +	ctx->started =3D false;
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +start_mali_capture(mali_ctx *ctx)
> +{
> +	if (!ctx || ctx->started)
> +		return false;
> +
> +	clear_procs_info();
> +	ctx->processed =3D false;
> +	ctx->error_flag =3D false;
> +	init_gpu_state(ctx);
> +
> +	if (ctx->live) {
> +		struct timeval tv;
> +
> +		gettimeofday(&tv, NULL);
> +		/* Could be wrong if TIMESTAMP_FACTOR is not divisible
> +		 * by 1000000 or if TIMESTAMP_FACTOR is less than 1000000. */
> +		ctx->start_time =3D (tv.tv_sec * 1000000ll + tv.tv_usec) *
> +				  (TIMESTAMP_FACTOR / 1000000ll);
> +
> +		if (!set_mode()) /* Start events recording */
> +			return false;
> +	} else {
> +		ctx->start_time =3D -1;
> +		ctx->finish_time =3D 0x7fffffffffffffffll;
> +	}
> +
> +	ctx->started =3D true;
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +mali_ctx *
> +init_mali_capture_ex(bool live, const char *fname)
> +{
> +	mali_ctx *ctx;
> +
> +	ctx =3D (mali_ctx *)malloc(sizeof(mali_ctx));
> +	if (!ctx) {
> +		edprintf(CRIT, "No free memory.\n");
> +		return NULL;
> +	}
> +
> +	memset(ctx, '\0', sizeof(mali_ctx));
> +	ctx->live =3D live;
> +	ctx->fname =3D fname;
> +	ctx->started =3D false;
> +	ctx->processed =3D false;
> +
> +	if (live && !save_mode(&ctx->old_enable, &ctx->old_record)) {
> +		free(ctx);
> +		return NULL;
> +	}
> +
> +	return ctx;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +mali_ctx *
> +init_mali_capture()
> +{
> +	return init_mali_capture_ex(true, MALI_PROFILING_EVENTS);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +#else /* !ARM */
> +
> +/* *********************************************************************=
*** */
> +
> +mali_ctx *
> +init_mali_capture()
> +{
> +	return NULL;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +start_mali_capture(mali_ctx *ctx UNUSED)
> +{
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +stop_mali_capture(mali_ctx *ctx UNUSED)
> +{
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +process_mali_events(mali_ctx *ctx UNUSED)
> +{
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +print_mali_stat(mali_ctx *ctx UNUSED)
> +{
> +	return true;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +bool
> +cleanup_mali_capture(mali_ctx **ctx UNUSED)
> +{
> +	return true;
> +}
> +
> +#endif /* !ARM */
> -- =

> 1.7.5.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============2532603613640015217==--

