Content-Type: multipart/mixed; boundary="===============6735131138273768085=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] devfreq: add devfreq devices stats support
Date: Mon, 29 Sep 2014 16:04:47 -0700
Message-ID: <54124.10.24.5.188.1412031887.squirrel@linux.intel.com>
In-Reply-To: 54007.10.24.5.188.1412030798.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6735131138273768085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>
>> add window to show frequency stats for devfreq devices
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)gmail.com>
>> Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
>> ---
>>  src/Makefile.am           |   2 +-
>>  src/devices/devfreq.cpp   | 351
>> ++++++++++++++++++++++++++++++++++++++++++++++
>>  src/devices/devfreq.h     |  75 ++++++++++
>>  src/main.cpp              |   9 ++
>>  src/report/report-maker.h |   1 +
>>  5 files changed, 437 insertions(+), 1 deletion(-)
>>  create mode 100644 src/devices/devfreq.cpp
>>  create mode 100644 src/devices/devfreq.h
>>
>> diff --git a/src/Makefile.am b/src/Makefile.am
>> index 6886388..fee1ffa 100644
>> --- a/src/Makefile.am
>> +++ b/src/Makefile.am
>> @@ -32,7 +32,7 @@ powertop_SOURCES =3D parameters/persistent.cpp
>> parameters/learn.cpp parameters/par
>>  		report/report-formatter-csv.cpp report/report-formatter-csv.h \
>>  		report/report-formatter-html.cpp report/report-formatter-html.h \
>>  		report/report-data-html.cpp report/report-data-html.h \
>> -		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
>> +		main.cpp css.h powertop.css cpu/intel_gpu.cpp devices/devfreq.cpp \
>>  		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp
>> cpu/rapl/rapl_interface.h\
>>  		cpu/dram_rapl_device.cpp devices/gpu_rapl_device.cpp
>> cpu/cpu_rapl_device.h \
>>  		cpu/dram_rapl_device.h devices/gpu_rapl_device.h
>> diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
>> new file mode 100644
>> index 0000000..29d7790
>> --- /dev/null
>> +++ b/src/devices/devfreq.cpp
>> @@ -0,0 +1,351 @@
>> +/*
>> + * Copyright 2012, Linaro
>> + *
>> + * This file is part of PowerTOP
>> + *
>> + * This program file is free software; you can redistribute it and/or
>> modify it
>> + * under the terms of the GNU General Public License as published by
>> the
>> + * Free Software Foundation; version 2 of the License.
>> + *
>> + * This program is distributed in the hope that it will be useful, but
>> WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
>> or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
>> License
>> + * for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program in a file named COPYING; if not, write to
>> the
>> + * Free Software Foundation, Inc,
>> + * 51 Franklin Street, Fifth Floor,
>> + * Boston, MA 02110-1301 USA
>> + * or just google for it.
>> + *
>> + * Authors:
>> + *	Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
>> + */
>> +
>> +#include <iostream>
>> +#include <fstream>
>> +
>> +#include <dirent.h>
>> +#include <stdlib.h>
>> +#include <time.h>
>> +#include <unistd.h>
>> +
>> +#include "device.h"
>> +#include "devfreq.h"
>> +#include "../display.h"
>> +#include "../cpu/cpu.h"
>> +#include "../report/report.h"
>> +#include "../report/report-maker.h"
>> +
>> +static bool is_enabled =3D true;
>> +
>> +static vector<class devfreq *> all_devfreq;
>> +
>> +devfreq::devfreq(const char* dpath): device()
>> +{
>> +	strncpy(dir_name, dpath, sizeof(dir_name));
>> +}
>> +
>> +uint64_t devfreq::parse_freq_time(char* pchr)
>> +{
>> +	char *cptr, *pptr =3D pchr;
>> +	uint64_t ctime;
>> +
>> +	cptr =3D strtok(pchr, " :");
>> +	while (cptr !=3D NULL) {
>> +		cptr =3D strtok(NULL, " :");
>> +		if (cptr )
>> +			pptr =3D cptr;
>> +	}
>> +
>> +	ctime =3D strtoull(pptr, NULL, 10);
>> +	return ctime;
>> +}
>> +
>> +void devfreq::process_time_stamps()
>> +{
>> +	unsigned int i;
>> +	uint64_t active_time =3D 0;
>> +
>> +	sample_time =3D (1000000.0 * (stamp_after.tv_sec - stamp_before.tv_sec=
))
>> +			+ ((stamp_after.tv_usec - stamp_before.tv_usec) );
>> +
>> +	for (i=3D0; i < dstates.size()-1; i++) {
>> +		struct frequency *state =3D dstates[i];
>> +		state->time_after =3D 1000 * (state->time_after - state->time_before);
>> +		active_time +=3D state->time_after;
>> +	}
>> +	/* Compute idle time for the device */
>> +	dstates[i]->time_after =3D sample_time - active_time;
>> +}
>> +
>> +void devfreq::add_devfreq_freq_state(uint64_t freq, uint64_t time)
>> +{
>> +	struct frequency *state;
>> +
>> +	state =3D new(std::nothrow) struct frequency;
>> +	if (!state)
>> +		return;
>> +
>> +	memset(state, 0, sizeof(*state));
>> +	dstates.push_back(state);
>> +
>> +	state->freq =3D freq;
>> +	if (freq =3D=3D 0)
>> +		strcpy(state->human_name, "Idle");
>> +	else
>> +		hz_to_human(freq, state->human_name);
>> +	state->time_before =3D time;
>> +}
>> +
>> +void devfreq::update_devfreq_freq_state(uint64_t freq, uint64_t time)
>> +{
>> +	unsigned int i;
>> +	struct frequency *state =3D NULL;
>> +
>> +	for(i=3D0; i < dstates.size(); i++) {
>> +		if (freq =3D=3D dstates[i]->freq)
>> +			state =3D dstates[i];
>> +	}
>> +
>> +	if (state =3D=3D NULL) {
>> +		add_devfreq_freq_state(freq, time);
>> +		return;
>> +	}
>> +
>> +	state->time_after =3D time;
>> +}
>> +
>> +void devfreq::parse_devfreq_trans_stat(char *dname)
>> +{
>> +	ifstream file;
>> +	char filename[256];
>> +
>> +	sprintf(filename, "/sys/class/devfreq/%s/trans_stat", dir_name);
>> +	file.open(filename);
>> +
>> +	if (!file)
>> +		return;
>> +
>> +	char line[1024];
>> +	char *c;
>> +
>> +	while (file) {
>> +		uint64_t freq;
>> +		uint64_t time;
>> +		char *pchr;
>> +
>> +		memset(line, 0, sizeof(line));
>> +		file.getline(line, sizeof(line));
>> +
>> +		pchr =3D strchr(line, '*');
>> +		pchr =3D (pchr !=3D NULL) ? pchr+1 : line;
>> +
>> +		freq =3D strtoull(pchr, &c, 10);
>> +		if (!freq)
>> +			continue;
>> +
>> +		time =3D parse_freq_time(pchr);
>> +		update_devfreq_freq_state(freq, time);
>> +	}
>> +	file.close();
>> +}
>> +
>> +void devfreq::start_measurement(void)
>> +{
>> +	unsigned int i;
>> +	ifstream file;
>> +
>> +	for (i=3D0; i < dstates.size(); i++)
>> +		delete dstates[i];
>> +	dstates.resize(0);
>> +	sample_time =3D 0;
>> +
>> +	gettimeofday(&stamp_before, NULL);
>> +	parse_devfreq_trans_stat(dir_name);
>> +	/* add device idle state */
>> +	update_devfreq_freq_state(0, 0);
>> +}
>> +
>> +void devfreq::end_measurement(void)
>> +{
>> +	parse_devfreq_trans_stat(dir_name);
>> +	gettimeofday(&stamp_after, NULL);
>> +	process_time_stamps();
>> +}
>> +
>> +double devfreq::power_usage(struct result_bundle *result, struct
>> parameter_bundle *bundle)
>> +{
>> +	return 0;
>> +}
>> +
>> +double devfreq::utilization(void)
>> +{
>> +	return 0;
>> +}
>> +
>> +void devfreq::fill_freq_utilization(unsigned int idx, char *buf)
>> +{
>> +	buf[0] =3D 0;
>> +
>> +	if (idx < dstates.size() && dstates[idx]) {
>> +		struct frequency *state =3D dstates[idx];
>> +		sprintf(buf, " %5.1f%% ", percentage(1.0 * state->time_after /
>> sample_time));
>> +	}
>> +}
>> +
>> +void devfreq::fill_freq_name(unsigned int idx, char *buf)
>> +{
>> +	buf[0] =3D 0;
>> +
>> +	if (idx < dstates.size() && dstates[idx]) {
>> +		sprintf(buf, "%-15s", dstates[idx]->human_name);
>> +	}
>> +}
>> +
>> +void start_devfreq_measurement(void)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i=3D0; i<all_devfreq.size(); i++)
>> +		all_devfreq[i]->start_measurement();
>> +}
>> +
>> +void end_devfreq_measurement(void)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i=3D0; i<all_devfreq.size(); i++)
>> +		all_devfreq[i]->end_measurement();
>> +}
>> +
>> +static void devfreq_dev_callback(const char *d_name)
>> +{
>> +	devfreq *df =3D new(std::nothrow) class devfreq(d_name);
>> +	if (df)
>> +		all_devfreq.push_back(df);
>> +}
>> +
>> +void create_all_devfreq_devices(void)
>> +{
>> +	DIR *dir;
>> +	std::string p =3D "/sys/class/devfreq/";
>> +	dir =3D opendir(p.c_str());
>> +	if (dir =3D=3D NULL) {
>> +		fprintf(stderr, "Devfreq not enabled\n");
>> +		is_enabled =3D false;
>> +		return;
>> +	}
>> +
>> +	callback fn =3D &devfreq_dev_callback;
>> +	process_directory(p.c_str(), fn);
>> +}
>> +
>> +void initialize_devfreq(void)
>> +{
>> +	if (is_enabled)
>> +		create_tab("Device Freq stats", _("Device Freq stats"));
>> +}
>> +
>> +void display_devfreq_devices(void)
>> +{
>> +	unsigned int i, j;
>> +	WINDOW *win;
>> +	char fline[1024];
>> +	char buf[128];
>> +
>> +	win =3D get_ncurses_win("Device Freq stats");
>> +        if (!win)
>> +                return;
>> +
>> +        wclear(win);
>> +        wmove(win, 2,0);
>> +
>> +	if (!is_enabled) {
>> +		wprintw(win, _(" Devfreq is not enabled"));
>> +		return;
>> +	}
>> +
>> +	if (!all_devfreq.size()) {
>> +		wprintw(win, _(" No devfreq devices available"));
>> +		return;
>> +	}
>> +
>> +	for (i=3D0; i<all_devfreq.size(); i++) {
>> +
>> +		class devfreq *df =3D all_devfreq[i];
>> +		wprintw(win, "\n%s\n", df->device_name());
>> +
>> +		for(j=3D0; j < df->dstates.size(); j++) {
>> +			memset(fline, 0, sizeof(fline));
>> +			strcpy(fline, "\t");
>> +			df->fill_freq_name(j, buf);
>> +			strcat(fline, buf);
>> +			df->fill_freq_utilization(j, buf);
>> +			strcat(fline, buf);
>> +			strcat(fline, "\n");
>> +			wprintw(win, fline);
>> +		}
>> +		wprintw(win, "\n");
>> +	}
>> +}
>> +
>> +void report_devfreq_devices(void)
>> +{
>> +	if (!is_enabled) {
>> +		return;
>> +	}
>> +
>> +/* todo: adapt to new report format */
>> +#if 0
>> +	char buffer[512];
>> +	unsigned int i, j;
>> +
>> +	report.begin_section(SECTION_DEVFREQ);
>> +	report.add_header("Device Frequency Report");
>> +
>> +	report.begin_table(TABLE_WIDE);
>> +	if (!all_devfreq.size()) {
>> +		report.begin_row();
>> +		report.add(" No devfreq devices available");
>> +		return;
>> +	}
>> +
>> +	for (i =3D 0; i < all_devfreq.size(); i++) {
>> +		buffer[0] =3D 0;
>> +		class devfreq *df =3D all_devfreq[i];
>> +
>> +		report.begin_row();
>> +		report.begin_cell(CELL_CPU_PSTATE_HEADER);
>> +		report.addf("%s", df->device_name());
>> +
>> +		for (j =3D 0; j < df->dstates.size(); j++) {
>> +			report.begin_row();
>> +			report.begin_cell(CELL_CPU_STATE_VALUE);
>> +			df->fill_freq_name(j, buffer);
>> +			report.add(buffer);
>> +			report.begin_cell(CELL_CPU_STATE_VALUE);
>> +			df->fill_freq_utilization(j, buffer);
>> +			report.add(buffer);
>> +		}
>> +	}
>> +#endif
>> +
>> +}
>> +
>> +void clear_all_devfreq()
>> +{
>> +	unsigned int i, j;
>> +
>> +	for (i=3D0; i < all_devfreq.size(); i++) {
>> +		class devfreq *df =3D all_devfreq[i];
>> +
>> +		for(j=3D0; j < df->dstates.size(); j++)
>> +			delete df->dstates[j];
>> +
>> +		df->dstates.resize(0);
>> +		delete df;
>> +	}
>> +	all_devfreq.clear();
>> +}
>> diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
>> new file mode 100644
>> index 0000000..8ab5705
>> --- /dev/null
>> +++ b/src/devices/devfreq.h
>> @@ -0,0 +1,75 @@
>> +/*
>> + * Copyright 2012, Linaro
>> + *
>> + * This file is part of PowerTOP
>> + *
>> + * This program file is free software; you can redistribute it and/or
>> modify it
>> + * under the terms of the GNU General Public License as published by
>> the
>> + * Free Software Foundation; version 2 of the License.
>> + *
>> + * This program is distributed in the hope that it will be useful, but
>> WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
>> or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
>> License
>> + * for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program in a file named COPYING; if not, write to
>> the
>> + * Free Software Foundation, Inc,
>> + * 51 Franklin Street, Fifth Floor,
>> + * Boston, MA 02110-1301 USA
>> + * or just google for it.
>> + *
>> + * Authors:
>> + *	Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
>> + */
>> +#ifndef _INCLUDE_GUARD_DEVFREQ_H
>> +#define _INCLUDE_GUARD_DEVFREQ_H
>> +
>> +#include "device.h"
>> +#include "../parameters/parameters.h"
>> +
>> +struct frequency;
>> +
>> +class devfreq: public device {
>> +	char dir_name[4096];
>> +	struct timeval  stamp_before, stamp_after;
>> +	double sample_time;
>> +
>> +	uint64_t parse_freq_time(char *ptr);
>> +	void add_devfreq_freq_state(uint64_t freq, uint64_t time);
>> +	void update_devfreq_freq_state(uint64_t freq, uint64_t time);
>> +	void parse_devfreq_trans_stat(char *dname);
>> +	void process_time_stamps();
>> +
>> +public:
>> +
>> +	vector<struct frequency *> dstates;
>> +
>> +	devfreq(const char *c);
>> +	void fill_freq_utilization(unsigned int idx, char *buf);
>> +	void fill_freq_name(unsigned int idx, char *buf);
>> +
>> +	virtual void start_measurement(void);
>> +	virtual void end_measurement(void);
>> +
>> +	virtual double	utilization(void); /* percentage */
>> +
>> +	virtual const char * class_name(void) { return "devfreq";};
>> +
>> +	virtual const char * device_name(void) { return dir_name;};
>> +	virtual const char * human_name(void) { return "devfreq";};
>> +	virtual double power_usage(struct result_bundle *result, struct
>> parameter_bundle *bundle);
>> +	virtual const char * util_units(void) { return " rpm"; };
>> +	virtual int power_valid(void) { return 0;
>> /*utilization_power_valid(r_index);*/};
>> +	virtual int grouping_prio(void) { return 1; };
>> +};
>> +
>> +extern void create_all_devfreq_devices(void);
>> +extern void clear_all_devfreq(void);
>> +extern void display_devfreq_devices(void);
>> +extern void report_devfreq_devices(void);
>> +extern void initialize_devfreq(void);
>> +extern void start_devfreq_measurement(void);
>> +extern void end_devfreq_measurement(void);
>> +
>> +#endif
>> diff --git a/src/main.cpp b/src/main.cpp
>> index cf4e547..d33eaed 100644
>> --- a/src/main.cpp
>> +++ b/src/main.cpp
>> @@ -48,6 +48,7 @@
>>
>>
>>  #include "devices/device.h"
>> +#include "devices/devfreq.h"
>>  #include "devices/usb.h"
>>  #include "devices/ahci.h"
>>  #include "measurement/measurement.h"
>> @@ -194,6 +195,7 @@ void one_measurement(int seconds, char *workload)
>>  	create_all_usb_devices();
>>  	start_power_measurement();
>>  	devices_start_measurement();
>> +	start_devfreq_measurement();
>>  	start_process_measurement();
>>  	start_cpu_measurement();
>>
>> @@ -206,6 +208,7 @@ void one_measurement(int seconds, char *workload)
>>  	end_cpu_measurement();
>>  	end_process_measurement();
>>  	collect_open_devices();
>> +	end_devfreq_measurement();
>>  	devices_end_measurement();
>>  	end_power_measurement();
>>
>> @@ -233,6 +236,9 @@ void one_measurement(int seconds, char *workload)
>>  	report_show_open_devices();
>>
>>  	report_devices();
>> +	display_devfreq_devices();
>> +	report_devfreq_devices();
>> +
>>  	ahci_create_device_stats_table();
>>  	store_results(measurement_time);
>>  	end_cpu_data();
>> @@ -344,6 +350,7 @@ static void powertop_init(void)
>>
>>  	enumerate_cpus();
>>  	create_all_devices();
>> +	create_all_devfreq_devices();
>>  	detect_power_meters();
>>
>>  	register_parameter("base power", 100, 0.5);
>> @@ -457,6 +464,7 @@ int main(int argc, char **argv)
>>  		exit(0);
>>  	}
>>  	init_display();
>> +	initialize_devfreq();
>>  	initialize_tuning();
>>  	/* first one is short to not let the user wait too long */
>>  	one_measurement(1, NULL);
>> @@ -491,6 +499,7 @@ int main(int argc, char **argv)
>>
>>  	clean_open_devices();
>>  	clear_all_devices();
>> +	clear_all_devfreq();
>>  	clear_all_cpus();
>>
>>  	return 0;
>> diff --git a/src/report/report-maker.h b/src/report/report-maker.h
>> index 423568a..bda4cef 100644
>> --- a/src/report/report-maker.h
>> +++ b/src/report/report-maker.h
>> @@ -89,6 +89,7 @@ enum section_type {
>>  	SECTION_SYSINFO,
>>  	SECTION_CPUIDLE,
>>  	SECTION_CPUFREQ,
>> +	SECTION_DEVFREQ,
>>  	SECTION_DEVPOWER,
>>  	SECTION_SOFTWARE,
>>  	SECTION_SUMMARY,
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>
>
> Hi Sanjay,
>
> It would be better that Device Frequency Stats appears only when
> /sys/class/devfewq is present on the system.  That will simplify code
> execution at runtime and remove the blank window with "No devfreq devices
> available".
>
> Thank you,
> Alexandra.
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

I'm testing the code doesn't break Intel support.  Please Sergey
Senozhatsky and any one else in the community can you help me test this
patch on ARM platforms.

Thank you,
Alexandra.

--===============6735131138273768085==--

