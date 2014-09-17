Content-Type: multipart/mixed; boundary="===============2889820601899212669=="
MIME-Version: 1.0
From: Sanjay Singh Rawat <sanjay.rawat at linaro.org>
Subject: Re: [Powertop] [PATCH] devfreq: add devfreq devices stats support
Date: Wed, 17 Sep 2014 09:46:48 +0530
Message-ID: <54190B30.2040300@linaro.org>
In-Reply-To: 1408949916-21962-1-git-send-email-sanjay.rawat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2889820601899212669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hello Alexandra,

Can you please review the patch and share your comments?

thanks,
sanjay

On Monday 25 August 2014 12:28 PM, Sanjay Singh Rawat wrote:
> add window to show frequency stats for devfreq devices
>
> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)gmail.com>
> Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
> ---
>   src/Makefile.am           |   2 +-
>   src/devices/devfreq.cpp   | 351 +++++++++++++++++++++++++++++++++++++++=
+++++++
>   src/devices/devfreq.h     |  75 ++++++++++
>   src/main.cpp              |   9 ++
>   src/report/report-maker.h |   1 +
>   5 files changed, 437 insertions(+), 1 deletion(-)
>   create mode 100644 src/devices/devfreq.cpp
>   create mode 100644 src/devices/devfreq.h
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 6886388..fee1ffa 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -32,7 +32,7 @@ powertop_SOURCES =3D parameters/persistent.cpp paramete=
rs/learn.cpp parameters/par
>   		report/report-formatter-csv.cpp report/report-formatter-csv.h \
>   		report/report-formatter-html.cpp report/report-formatter-html.h \
>   		report/report-data-html.cpp report/report-data-html.h \
> -		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
> +		main.cpp css.h powertop.css cpu/intel_gpu.cpp devices/devfreq.cpp \
>   		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp cpu/rapl/rapl_int=
erface.h\
>   		cpu/dram_rapl_device.cpp devices/gpu_rapl_device.cpp cpu/cpu_rapl_dev=
ice.h \
>   		cpu/dram_rapl_device.h devices/gpu_rapl_device.h
> diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
> new file mode 100644
> index 0000000..29d7790
> --- /dev/null
> +++ b/src/devices/devfreq.cpp
> @@ -0,0 +1,351 @@
> +/*
> + * Copyright 2012, Linaro
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
> + * Authors:
> + *	Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> + */
> +
> +#include <iostream>
> +#include <fstream>
> +
> +#include <dirent.h>
> +#include <stdlib.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "device.h"
> +#include "devfreq.h"
> +#include "../display.h"
> +#include "../cpu/cpu.h"
> +#include "../report/report.h"
> +#include "../report/report-maker.h"
> +
> +static bool is_enabled =3D true;
> +
> +static vector<class devfreq *> all_devfreq;
> +
> +devfreq::devfreq(const char* dpath): device()
> +{
> +	strncpy(dir_name, dpath, sizeof(dir_name));
> +}
> +
> +uint64_t devfreq::parse_freq_time(char* pchr)
> +{
> +	char *cptr, *pptr =3D pchr;
> +	uint64_t ctime;
> +
> +	cptr =3D strtok(pchr, " :");
> +	while (cptr !=3D NULL) {
> +		cptr =3D strtok(NULL, " :");
> +		if (cptr )
> +			pptr =3D cptr;
> +	}
> +
> +	ctime =3D strtoull(pptr, NULL, 10);
> +	return ctime;
> +}
> +
> +void devfreq::process_time_stamps()
> +{
> +	unsigned int i;
> +	uint64_t active_time =3D 0;
> +
> +	sample_time =3D (1000000.0 * (stamp_after.tv_sec - stamp_before.tv_sec))
> +			+ ((stamp_after.tv_usec - stamp_before.tv_usec) );
> +
> +	for (i=3D0; i < dstates.size()-1; i++) {
> +		struct frequency *state =3D dstates[i];
> +		state->time_after =3D 1000 * (state->time_after - state->time_before);
> +		active_time +=3D state->time_after;
> +	}
> +	/* Compute idle time for the device */
> +	dstates[i]->time_after =3D sample_time - active_time;
> +}
> +
> +void devfreq::add_devfreq_freq_state(uint64_t freq, uint64_t time)
> +{
> +	struct frequency *state;
> +
> +	state =3D new(std::nothrow) struct frequency;
> +	if (!state)
> +		return;
> +
> +	memset(state, 0, sizeof(*state));
> +	dstates.push_back(state);
> +
> +	state->freq =3D freq;
> +	if (freq =3D=3D 0)
> +		strcpy(state->human_name, "Idle");
> +	else
> +		hz_to_human(freq, state->human_name);
> +	state->time_before =3D time;
> +}
> +
> +void devfreq::update_devfreq_freq_state(uint64_t freq, uint64_t time)
> +{
> +	unsigned int i;
> +	struct frequency *state =3D NULL;
> +
> +	for(i=3D0; i < dstates.size(); i++) {
> +		if (freq =3D=3D dstates[i]->freq)
> +			state =3D dstates[i];
> +	}
> +
> +	if (state =3D=3D NULL) {
> +		add_devfreq_freq_state(freq, time);
> +		return;
> +	}
> +
> +	state->time_after =3D time;
> +}
> +
> +void devfreq::parse_devfreq_trans_stat(char *dname)
> +{
> +	ifstream file;
> +	char filename[256];
> +
> +	sprintf(filename, "/sys/class/devfreq/%s/trans_stat", dir_name);
> +	file.open(filename);
> +
> +	if (!file)
> +		return;
> +
> +	char line[1024];
> +	char *c;
> +
> +	while (file) {
> +		uint64_t freq;
> +		uint64_t time;
> +		char *pchr;
> +
> +		memset(line, 0, sizeof(line));
> +		file.getline(line, sizeof(line));
> +
> +		pchr =3D strchr(line, '*');
> +		pchr =3D (pchr !=3D NULL) ? pchr+1 : line;
> +
> +		freq =3D strtoull(pchr, &c, 10);
> +		if (!freq)
> +			continue;
> +
> +		time =3D parse_freq_time(pchr);
> +		update_devfreq_freq_state(freq, time);
> +	}
> +	file.close();
> +}
> +
> +void devfreq::start_measurement(void)
> +{
> +	unsigned int i;
> +	ifstream file;
> +
> +	for (i=3D0; i < dstates.size(); i++)
> +		delete dstates[i];
> +	dstates.resize(0);
> +	sample_time =3D 0;
> +
> +	gettimeofday(&stamp_before, NULL);
> +	parse_devfreq_trans_stat(dir_name);
> +	/* add device idle state */
> +	update_devfreq_freq_state(0, 0);
> +}
> +
> +void devfreq::end_measurement(void)
> +{
> +	parse_devfreq_trans_stat(dir_name);
> +	gettimeofday(&stamp_after, NULL);
> +	process_time_stamps();
> +}
> +
> +double devfreq::power_usage(struct result_bundle *result, struct paramet=
er_bundle *bundle)
> +{
> +	return 0;
> +}
> +
> +double devfreq::utilization(void)
> +{
> +	return 0;
> +}
> +
> +void devfreq::fill_freq_utilization(unsigned int idx, char *buf)
> +{
> +	buf[0] =3D 0;
> +
> +	if (idx < dstates.size() && dstates[idx]) {
> +		struct frequency *state =3D dstates[idx];
> +		sprintf(buf, " %5.1f%% ", percentage(1.0 * state->time_after / sample_=
time));
> +	}
> +}
> +
> +void devfreq::fill_freq_name(unsigned int idx, char *buf)
> +{
> +	buf[0] =3D 0;
> +
> +	if (idx < dstates.size() && dstates[idx]) {
> +		sprintf(buf, "%-15s", dstates[idx]->human_name);
> +	}
> +}
> +
> +void start_devfreq_measurement(void)
> +{
> +	unsigned int i;
> +
> +	for (i=3D0; i<all_devfreq.size(); i++)
> +		all_devfreq[i]->start_measurement();
> +}
> +
> +void end_devfreq_measurement(void)
> +{
> +	unsigned int i;
> +
> +	for (i=3D0; i<all_devfreq.size(); i++)
> +		all_devfreq[i]->end_measurement();
> +}
> +
> +static void devfreq_dev_callback(const char *d_name)
> +{
> +	devfreq *df =3D new(std::nothrow) class devfreq(d_name);
> +	if (df)
> +		all_devfreq.push_back(df);
> +}
> +
> +void create_all_devfreq_devices(void)
> +{
> +	DIR *dir;
> +	std::string p =3D "/sys/class/devfreq/";
> +	dir =3D opendir(p.c_str());
> +	if (dir =3D=3D NULL) {
> +		fprintf(stderr, "Devfreq not enabled\n");
> +		is_enabled =3D false;
> +		return;
> +	}
> +
> +	callback fn =3D &devfreq_dev_callback;
> +	process_directory(p.c_str(), fn);
> +}
> +
> +void initialize_devfreq(void)
> +{
> +	if (is_enabled)
> +		create_tab("Device Freq stats", _("Device Freq stats"));
> +}
> +
> +void display_devfreq_devices(void)
> +{
> +	unsigned int i, j;
> +	WINDOW *win;
> +	char fline[1024];
> +	char buf[128];
> +
> +	win =3D get_ncurses_win("Device Freq stats");
> +        if (!win)
> +                return;
> +
> +        wclear(win);
> +        wmove(win, 2,0);
> +
> +	if (!is_enabled) {
> +		wprintw(win, _(" Devfreq is not enabled"));
> +		return;
> +	}
> +
> +	if (!all_devfreq.size()) {
> +		wprintw(win, _(" No devfreq devices available"));
> +		return;
> +	}
> +
> +	for (i=3D0; i<all_devfreq.size(); i++) {
> +
> +		class devfreq *df =3D all_devfreq[i];
> +		wprintw(win, "\n%s\n", df->device_name());
> +
> +		for(j=3D0; j < df->dstates.size(); j++) {
> +			memset(fline, 0, sizeof(fline));
> +			strcpy(fline, "\t");
> +			df->fill_freq_name(j, buf);
> +			strcat(fline, buf);
> +			df->fill_freq_utilization(j, buf);
> +			strcat(fline, buf);
> +			strcat(fline, "\n");
> +			wprintw(win, fline);
> +		}
> +		wprintw(win, "\n");
> +	}
> +}
> +
> +void report_devfreq_devices(void)
> +{
> +	if (!is_enabled) {
> +		return;
> +	}
> +
> +/* todo: adapt to new report format */
> +#if 0
> +	char buffer[512];
> +	unsigned int i, j;
> +
> +	report.begin_section(SECTION_DEVFREQ);
> +	report.add_header("Device Frequency Report");
> +
> +	report.begin_table(TABLE_WIDE);
> +	if (!all_devfreq.size()) {
> +		report.begin_row();
> +		report.add(" No devfreq devices available");
> +		return;
> +	}
> +
> +	for (i =3D 0; i < all_devfreq.size(); i++) {
> +		buffer[0] =3D 0;
> +		class devfreq *df =3D all_devfreq[i];
> +
> +		report.begin_row();
> +		report.begin_cell(CELL_CPU_PSTATE_HEADER);
> +		report.addf("%s", df->device_name());
> +
> +		for (j =3D 0; j < df->dstates.size(); j++) {
> +			report.begin_row();
> +			report.begin_cell(CELL_CPU_STATE_VALUE);
> +			df->fill_freq_name(j, buffer);
> +			report.add(buffer);
> +			report.begin_cell(CELL_CPU_STATE_VALUE);
> +			df->fill_freq_utilization(j, buffer);
> +			report.add(buffer);
> +		}
> +	}
> +#endif
> +
> +}
> +
> +void clear_all_devfreq()
> +{
> +	unsigned int i, j;
> +
> +	for (i=3D0; i < all_devfreq.size(); i++) {
> +		class devfreq *df =3D all_devfreq[i];
> +
> +		for(j=3D0; j < df->dstates.size(); j++)
> +			delete df->dstates[j];
> +
> +		df->dstates.resize(0);
> +		delete df;
> +	}
> +	all_devfreq.clear();
> +}
> diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
> new file mode 100644
> index 0000000..8ab5705
> --- /dev/null
> +++ b/src/devices/devfreq.h
> @@ -0,0 +1,75 @@
> +/*
> + * Copyright 2012, Linaro
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
> + * Authors:
> + *	Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> + */
> +#ifndef _INCLUDE_GUARD_DEVFREQ_H
> +#define _INCLUDE_GUARD_DEVFREQ_H
> +
> +#include "device.h"
> +#include "../parameters/parameters.h"
> +
> +struct frequency;
> +
> +class devfreq: public device {
> +	char dir_name[4096];
> +	struct timeval  stamp_before, stamp_after;
> +	double sample_time;
> +
> +	uint64_t parse_freq_time(char *ptr);
> +	void add_devfreq_freq_state(uint64_t freq, uint64_t time);
> +	void update_devfreq_freq_state(uint64_t freq, uint64_t time);
> +	void parse_devfreq_trans_stat(char *dname);
> +	void process_time_stamps();
> +
> +public:
> +
> +	vector<struct frequency *> dstates;
> +
> +	devfreq(const char *c);
> +	void fill_freq_utilization(unsigned int idx, char *buf);
> +	void fill_freq_name(unsigned int idx, char *buf);
> +
> +	virtual void start_measurement(void);
> +	virtual void end_measurement(void);
> +
> +	virtual double	utilization(void); /* percentage */
> +
> +	virtual const char * class_name(void) { return "devfreq";};
> +
> +	virtual const char * device_name(void) { return dir_name;};
> +	virtual const char * human_name(void) { return "devfreq";};
> +	virtual double power_usage(struct result_bundle *result, struct paramet=
er_bundle *bundle);
> +	virtual const char * util_units(void) { return " rpm"; };
> +	virtual int power_valid(void) { return 0; /*utilization_power_valid(r_i=
ndex);*/};
> +	virtual int grouping_prio(void) { return 1; };
> +};
> +
> +extern void create_all_devfreq_devices(void);
> +extern void clear_all_devfreq(void);
> +extern void display_devfreq_devices(void);
> +extern void report_devfreq_devices(void);
> +extern void initialize_devfreq(void);
> +extern void start_devfreq_measurement(void);
> +extern void end_devfreq_measurement(void);
> +
> +#endif
> diff --git a/src/main.cpp b/src/main.cpp
> index cf4e547..d33eaed 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -48,6 +48,7 @@
>   =

>   =

>   #include "devices/device.h"
> +#include "devices/devfreq.h"
>   #include "devices/usb.h"
>   #include "devices/ahci.h"
>   #include "measurement/measurement.h"
> @@ -194,6 +195,7 @@ void one_measurement(int seconds, char *workload)
>   	create_all_usb_devices();
>   	start_power_measurement();
>   	devices_start_measurement();
> +	start_devfreq_measurement();
>   	start_process_measurement();
>   	start_cpu_measurement();
>   =

> @@ -206,6 +208,7 @@ void one_measurement(int seconds, char *workload)
>   	end_cpu_measurement();
>   	end_process_measurement();
>   	collect_open_devices();
> +	end_devfreq_measurement();
>   	devices_end_measurement();
>   	end_power_measurement();
>   =

> @@ -233,6 +236,9 @@ void one_measurement(int seconds, char *workload)
>   	report_show_open_devices();
>   =

>   	report_devices();
> +	display_devfreq_devices();
> +	report_devfreq_devices();
> +
>   	ahci_create_device_stats_table();
>   	store_results(measurement_time);
>   	end_cpu_data();
> @@ -344,6 +350,7 @@ static void powertop_init(void)
>   =

>   	enumerate_cpus();
>   	create_all_devices();
> +	create_all_devfreq_devices();
>   	detect_power_meters();
>   =

>   	register_parameter("base power", 100, 0.5);
> @@ -457,6 +464,7 @@ int main(int argc, char **argv)
>   		exit(0);
>   	}
>   	init_display();
> +	initialize_devfreq();
>   	initialize_tuning();
>   	/* first one is short to not let the user wait too long */
>   	one_measurement(1, NULL);
> @@ -491,6 +499,7 @@ int main(int argc, char **argv)
>   =

>   	clean_open_devices();
>   	clear_all_devices();
> +	clear_all_devfreq();
>   	clear_all_cpus();
>   =

>   	return 0;
> diff --git a/src/report/report-maker.h b/src/report/report-maker.h
> index 423568a..bda4cef 100644
> --- a/src/report/report-maker.h
> +++ b/src/report/report-maker.h
> @@ -89,6 +89,7 @@ enum section_type {
>   	SECTION_SYSINFO,
>   	SECTION_CPUIDLE,
>   	SECTION_CPUFREQ,
> +	SECTION_DEVFREQ,
>   	SECTION_DEVPOWER,
>   	SECTION_SOFTWARE,
>   	SECTION_SUMMARY,

-- =

sanjay


--===============2889820601899212669==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9SVNP
LTg4NTktMSIKICAgICAgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIj4KICA8L2hlYWQ+CiAgPGJv
ZHkgYmdjb2xvcj0iI0ZGRkZGRiIgdGV4dD0iIzAwMDAwMCI+CiAgICA8Zm9udCBzaXplPSItMSI+
aGVsbG8gPC9mb250PkFsZXhhbmRyYSw8YnI+CiAgICA8YnI+CiAgICBDYW4geW91IHBsZWFzZSBy
ZXZpZXcgdGhlIHBhdGNoIGFuZCBzaGFyZSB5b3VyIGNvbW1lbnRzPzxicj4KICAgIDxicj4KICAg
IHRoYW5rcyw8YnI+CiAgICBzYW5qYXk8YnI+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3ot
Y2l0ZS1wcmVmaXgiPk9uIE1vbmRheSAyNSBBdWd1c3QgMjAxNCAxMjoyOCBQTSwKICAgICAgU2Fu
amF5IFNpbmdoIFJhd2F0IHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUKICAg
ICAgY2l0ZT0ibWlkOjE0MDg5NDk5MTYtMjE5NjItMS1naXQtc2VuZC1lbWFpbC1zYW5qYXkucmF3
YXRAbGluYXJvLm9yZyIKICAgICAgdHlwZT0iY2l0ZSI+CiAgICAgIDxwcmUgd3JhcD0iIj5hZGQg
d2luZG93IHRvIHNob3cgZnJlcXVlbmN5IHN0YXRzIGZvciBkZXZmcmVxIGRldmljZXMKClNpZ25l
ZC1vZmYtYnk6IFJhamFnb3BhbCBWZW5rYXQgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnJhamFnb3BhbC52ZW5rYXRAZ21haWwuY29tIj4mbHQ7cmFqYWdvcGFs
LnZlbmthdEBnbWFpbC5jb20mZ3Q7PC9hPgpTaWduZWQtb2ZmLWJ5OiBTYW5qYXkgU2luZ2ggUmF3
YXQgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnNhbmpheS5y
YXdhdEBsaW5hcm8ub3JnIj4mbHQ7c2FuamF5LnJhd2F0QGxpbmFyby5vcmcmZ3Q7PC9hPgotLS0K
IHNyYy9NYWtlZmlsZS5hbSAgICAgICAgICAgfCAgIDIgKy0KIHNyYy9kZXZpY2VzL2RldmZyZXEu
Y3BwICAgfCAzNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwogc3JjL2RldmljZXMvZGV2ZnJlcS5oICAgICB8ICA3NSArKysrKysrKysrCiBzcmMvbWFpbi5j
cHAgICAgICAgICAgICAgIHwgICA5ICsrCiBzcmMvcmVwb3J0L3JlcG9ydC1tYWtlci5oIHwgICAx
ICsKIDUgZmlsZXMgY2hhbmdlZCwgNDM3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzcmMvZGV2aWNlcy9kZXZmcmVxLmNwcAogY3JlYXRlIG1vZGUgMTAw
NjQ0IHNyYy9kZXZpY2VzL2RldmZyZXEuaAoKZGlmZiAtLWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBi
L3NyYy9NYWtlZmlsZS5hbQppbmRleCA2ODg2Mzg4Li5mZWUxZmZhIDEwMDY0NAotLS0gYS9zcmMv
TWFrZWZpbGUuYW0KKysrIGIvc3JjL01ha2VmaWxlLmFtCkBAIC0zMiw3ICszMiw3IEBAIHBvd2Vy
dG9wX1NPVVJDRVMgPSBwYXJhbWV0ZXJzL3BlcnNpc3RlbnQuY3BwIHBhcmFtZXRlcnMvbGVhcm4u
Y3BwIHBhcmFtZXRlcnMvcGFyCiAJCXJlcG9ydC9yZXBvcnQtZm9ybWF0dGVyLWNzdi5jcHAgcmVw
b3J0L3JlcG9ydC1mb3JtYXR0ZXItY3N2LmggXAogCQlyZXBvcnQvcmVwb3J0LWZvcm1hdHRlci1o
dG1sLmNwcCByZXBvcnQvcmVwb3J0LWZvcm1hdHRlci1odG1sLmggXAogCQlyZXBvcnQvcmVwb3J0
LWRhdGEtaHRtbC5jcHAgcmVwb3J0L3JlcG9ydC1kYXRhLWh0bWwuaCBcCi0JCW1haW4uY3BwIGNz
cy5oIHBvd2VydG9wLmNzcyBjcHUvaW50ZWxfZ3B1LmNwcCBcCisJCW1haW4uY3BwIGNzcy5oIHBv
d2VydG9wLmNzcyBjcHUvaW50ZWxfZ3B1LmNwcCBkZXZpY2VzL2RldmZyZXEuY3BwIFwKIAkJY3B1
L3JhcGwvcmFwbF9pbnRlcmZhY2UuY3BwIGNwdS9jcHVfcmFwbF9kZXZpY2UuY3BwIGNwdS9yYXBs
L3JhcGxfaW50ZXJmYWNlLmhcCiAJCWNwdS9kcmFtX3JhcGxfZGV2aWNlLmNwcCBkZXZpY2VzL2dw
dV9yYXBsX2RldmljZS5jcHAgY3B1L2NwdV9yYXBsX2RldmljZS5oIFwKIAkJY3B1L2RyYW1fcmFw
bF9kZXZpY2UuaCBkZXZpY2VzL2dwdV9yYXBsX2RldmljZS5oCmRpZmYgLS1naXQgYS9zcmMvZGV2
aWNlcy9kZXZmcmVxLmNwcCBiL3NyYy9kZXZpY2VzL2RldmZyZXEuY3BwCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAuLjI5ZDc3OTAKLS0tIC9kZXYvbnVsbAorKysgYi9zcmMvZGV2
aWNlcy9kZXZmcmVxLmNwcApAQCAtMCwwICsxLDM1MSBAQAorLyoKKyAqIENvcHlyaWdodCAyMDEy
LCBMaW5hcm8KKyAqCisgKiBUaGlzIGZpbGUgaXMgcGFydCBvZiBQb3dlclRPUAorICoKKyAqIFRo
aXMgcHJvZ3JhbSBmaWxlIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnkgaXQKKyAqIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZQorICogRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UuCisgKgorICogVGhpcyBwcm9ncmFtIGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dCBXSVRI
T1VUCisgKiBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
ZiBNRVJDSEFOVEFCSUxJVFkgb3IKKyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogZm9yIG1vcmUgZGV0YWls
cy4KKyAqCisgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZQorICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0gaW4gYSBmaWxl
IG5hbWVkIENPUFlJTkc7IGlmIG5vdCwgd3JpdGUgdG8gdGhlCisgKiBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24sIEluYywKKyAqIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsCisgKiBC
b3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBCisgKiBvciBqdXN0IGdvb2dsZSBmb3IgaXQuCisgKgor
ICogQXV0aG9yczoKKyAqCVJhamFnb3BhbCBWZW5rYXQgPGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhamFnb3BhbC52ZW5rYXRAbGluYXJvLm9yZyI+Jmx0O3Jh
amFnb3BhbC52ZW5rYXRAbGluYXJvLm9yZyZndDs8L2E+CisgKi8KKworI2luY2x1ZGUgJmx0O2lv
c3RyZWFtJmd0OworI2luY2x1ZGUgJmx0O2ZzdHJlYW0mZ3Q7CisKKyNpbmNsdWRlICZsdDtkaXJl
bnQuaCZndDsKKyNpbmNsdWRlICZsdDtzdGRsaWIuaCZndDsKKyNpbmNsdWRlICZsdDt0aW1lLmgm
Z3Q7CisjaW5jbHVkZSAmbHQ7dW5pc3RkLmgmZ3Q7CisKKyNpbmNsdWRlICJkZXZpY2UuaCIKKyNp
bmNsdWRlICJkZXZmcmVxLmgiCisjaW5jbHVkZSAiLi4vZGlzcGxheS5oIgorI2luY2x1ZGUgIi4u
L2NwdS9jcHUuaCIKKyNpbmNsdWRlICIuLi9yZXBvcnQvcmVwb3J0LmgiCisjaW5jbHVkZSAiLi4v
cmVwb3J0L3JlcG9ydC1tYWtlci5oIgorCitzdGF0aWMgYm9vbCBpc19lbmFibGVkID0gdHJ1ZTsK
Kworc3RhdGljIHZlY3RvciZsdDtjbGFzcyBkZXZmcmVxIComZ3Q7IGFsbF9kZXZmcmVxOworCitk
ZXZmcmVxOjpkZXZmcmVxKGNvbnN0IGNoYXIqIGRwYXRoKTogZGV2aWNlKCkKK3sKKwlzdHJuY3B5
KGRpcl9uYW1lLCBkcGF0aCwgc2l6ZW9mKGRpcl9uYW1lKSk7Cit9CisKK3VpbnQ2NF90IGRldmZy
ZXE6OnBhcnNlX2ZyZXFfdGltZShjaGFyKiBwY2hyKQoreworCWNoYXIgKmNwdHIsICpwcHRyID0g
cGNocjsKKwl1aW50NjRfdCBjdGltZTsKKworCWNwdHIgPSBzdHJ0b2socGNociwgIiA6Iik7CisJ
d2hpbGUgKGNwdHIgIT0gTlVMTCkgeworCQljcHRyID0gc3RydG9rKE5VTEwsICIgOiIpOworCQlp
ZiAoY3B0ciApCisJCQlwcHRyID0gY3B0cjsKKwl9CisKKwljdGltZSA9IHN0cnRvdWxsKHBwdHIs
IE5VTEwsIDEwKTsKKwlyZXR1cm4gY3RpbWU7Cit9CisKK3ZvaWQgZGV2ZnJlcTo6cHJvY2Vzc190
aW1lX3N0YW1wcygpCit7CisJdW5zaWduZWQgaW50IGk7CisJdWludDY0X3QgYWN0aXZlX3RpbWUg
PSAwOworCisJc2FtcGxlX3RpbWUgPSAoMTAwMDAwMC4wICogKHN0YW1wX2FmdGVyLnR2X3NlYyAt
IHN0YW1wX2JlZm9yZS50dl9zZWMpKQorCQkJKyAoKHN0YW1wX2FmdGVyLnR2X3VzZWMgLSBzdGFt
cF9iZWZvcmUudHZfdXNlYykgKTsKKworCWZvciAoaT0wOyBpICZsdDsgZHN0YXRlcy5zaXplKCkt
MTsgaSsrKSB7CisJCXN0cnVjdCBmcmVxdWVuY3kgKnN0YXRlID0gZHN0YXRlc1tpXTsKKwkJc3Rh
dGUtJmd0O3RpbWVfYWZ0ZXIgPSAxMDAwICogKHN0YXRlLSZndDt0aW1lX2FmdGVyIC0gc3RhdGUt
Jmd0O3RpbWVfYmVmb3JlKTsKKwkJYWN0aXZlX3RpbWUgKz0gc3RhdGUtJmd0O3RpbWVfYWZ0ZXI7
CisJfQorCS8qIENvbXB1dGUgaWRsZSB0aW1lIGZvciB0aGUgZGV2aWNlICovCisJZHN0YXRlc1tp
XS0mZ3Q7dGltZV9hZnRlciA9IHNhbXBsZV90aW1lIC0gYWN0aXZlX3RpbWU7Cit9CisKK3ZvaWQg
ZGV2ZnJlcTo6YWRkX2RldmZyZXFfZnJlcV9zdGF0ZSh1aW50NjRfdCBmcmVxLCB1aW50NjRfdCB0
aW1lKQoreworCXN0cnVjdCBmcmVxdWVuY3kgKnN0YXRlOworCisJc3RhdGUgPSBuZXcoc3RkOjpu
b3Rocm93KSBzdHJ1Y3QgZnJlcXVlbmN5OworCWlmICghc3RhdGUpCisJCXJldHVybjsKKworCW1l
bXNldChzdGF0ZSwgMCwgc2l6ZW9mKCpzdGF0ZSkpOworCWRzdGF0ZXMucHVzaF9iYWNrKHN0YXRl
KTsKKworCXN0YXRlLSZndDtmcmVxID0gZnJlcTsKKwlpZiAoZnJlcSA9PSAwKQorCQlzdHJjcHko
c3RhdGUtJmd0O2h1bWFuX25hbWUsICJJZGxlIik7CisJZWxzZQorCQloel90b19odW1hbihmcmVx
LCBzdGF0ZS0mZ3Q7aHVtYW5fbmFtZSk7CisJc3RhdGUtJmd0O3RpbWVfYmVmb3JlID0gdGltZTsK
K30KKwordm9pZCBkZXZmcmVxOjp1cGRhdGVfZGV2ZnJlcV9mcmVxX3N0YXRlKHVpbnQ2NF90IGZy
ZXEsIHVpbnQ2NF90IHRpbWUpCit7CisJdW5zaWduZWQgaW50IGk7CisJc3RydWN0IGZyZXF1ZW5j
eSAqc3RhdGUgPSBOVUxMOworCisJZm9yKGk9MDsgaSAmbHQ7IGRzdGF0ZXMuc2l6ZSgpOyBpKysp
IHsKKwkJaWYgKGZyZXEgPT0gZHN0YXRlc1tpXS0mZ3Q7ZnJlcSkKKwkJCXN0YXRlID0gZHN0YXRl
c1tpXTsKKwl9CisKKwlpZiAoc3RhdGUgPT0gTlVMTCkgeworCQlhZGRfZGV2ZnJlcV9mcmVxX3N0
YXRlKGZyZXEsIHRpbWUpOworCQlyZXR1cm47CisJfQorCisJc3RhdGUtJmd0O3RpbWVfYWZ0ZXIg
PSB0aW1lOworfQorCit2b2lkIGRldmZyZXE6OnBhcnNlX2RldmZyZXFfdHJhbnNfc3RhdChjaGFy
ICpkbmFtZSkKK3sKKwlpZnN0cmVhbSBmaWxlOworCWNoYXIgZmlsZW5hbWVbMjU2XTsKKworCXNw
cmludGYoZmlsZW5hbWUsICIvc3lzL2NsYXNzL2RldmZyZXEvJXMvdHJhbnNfc3RhdCIsIGRpcl9u
YW1lKTsKKwlmaWxlLm9wZW4oZmlsZW5hbWUpOworCisJaWYgKCFmaWxlKQorCQlyZXR1cm47CisK
KwljaGFyIGxpbmVbMTAyNF07CisJY2hhciAqYzsKKworCXdoaWxlIChmaWxlKSB7CisJCXVpbnQ2
NF90IGZyZXE7CisJCXVpbnQ2NF90IHRpbWU7CisJCWNoYXIgKnBjaHI7CisKKwkJbWVtc2V0KGxp
bmUsIDAsIHNpemVvZihsaW5lKSk7CisJCWZpbGUuZ2V0bGluZShsaW5lLCBzaXplb2YobGluZSkp
OworCisJCXBjaHIgPSBzdHJjaHIobGluZSwgJyonKTsKKwkJcGNociA9IChwY2hyICE9IE5VTEwp
ID8gcGNocisxIDogbGluZTsKKworCQlmcmVxID0gc3RydG91bGwocGNociwgJmFtcDtjLCAxMCk7
CisJCWlmICghZnJlcSkKKwkJCWNvbnRpbnVlOworCisJCXRpbWUgPSBwYXJzZV9mcmVxX3RpbWUo
cGNocik7CisJCXVwZGF0ZV9kZXZmcmVxX2ZyZXFfc3RhdGUoZnJlcSwgdGltZSk7CisJfQorCWZp
bGUuY2xvc2UoKTsKK30KKwordm9pZCBkZXZmcmVxOjpzdGFydF9tZWFzdXJlbWVudCh2b2lkKQor
eworCXVuc2lnbmVkIGludCBpOworCWlmc3RyZWFtIGZpbGU7CisKKwlmb3IgKGk9MDsgaSAmbHQ7
IGRzdGF0ZXMuc2l6ZSgpOyBpKyspCisJCWRlbGV0ZSBkc3RhdGVzW2ldOworCWRzdGF0ZXMucmVz
aXplKDApOworCXNhbXBsZV90aW1lID0gMDsKKworCWdldHRpbWVvZmRheSgmYW1wO3N0YW1wX2Jl
Zm9yZSwgTlVMTCk7CisJcGFyc2VfZGV2ZnJlcV90cmFuc19zdGF0KGRpcl9uYW1lKTsKKwkvKiBh
ZGQgZGV2aWNlIGlkbGUgc3RhdGUgKi8KKwl1cGRhdGVfZGV2ZnJlcV9mcmVxX3N0YXRlKDAsIDAp
OworfQorCit2b2lkIGRldmZyZXE6OmVuZF9tZWFzdXJlbWVudCh2b2lkKQoreworCXBhcnNlX2Rl
dmZyZXFfdHJhbnNfc3RhdChkaXJfbmFtZSk7CisJZ2V0dGltZW9mZGF5KCZhbXA7c3RhbXBfYWZ0
ZXIsIE5VTEwpOworCXByb2Nlc3NfdGltZV9zdGFtcHMoKTsKK30KKworZG91YmxlIGRldmZyZXE6
OnBvd2VyX3VzYWdlKHN0cnVjdCByZXN1bHRfYnVuZGxlICpyZXN1bHQsIHN0cnVjdCBwYXJhbWV0
ZXJfYnVuZGxlICpidW5kbGUpCit7CisJcmV0dXJuIDA7Cit9CisKK2RvdWJsZSBkZXZmcmVxOjp1
dGlsaXphdGlvbih2b2lkKQoreworCXJldHVybiAwOworfQorCit2b2lkIGRldmZyZXE6OmZpbGxf
ZnJlcV91dGlsaXphdGlvbih1bnNpZ25lZCBpbnQgaWR4LCBjaGFyICpidWYpCit7CisJYnVmWzBd
ID0gMDsKKworCWlmIChpZHggJmx0OyBkc3RhdGVzLnNpemUoKSAmYW1wOyZhbXA7IGRzdGF0ZXNb
aWR4XSkgeworCQlzdHJ1Y3QgZnJlcXVlbmN5ICpzdGF0ZSA9IGRzdGF0ZXNbaWR4XTsKKwkJc3By
aW50ZihidWYsICIgJTUuMWYlJSAiLCBwZXJjZW50YWdlKDEuMCAqIHN0YXRlLSZndDt0aW1lX2Fm
dGVyIC8gc2FtcGxlX3RpbWUpKTsKKwl9Cit9CisKK3ZvaWQgZGV2ZnJlcTo6ZmlsbF9mcmVxX25h
bWUodW5zaWduZWQgaW50IGlkeCwgY2hhciAqYnVmKQoreworCWJ1ZlswXSA9IDA7CisKKwlpZiAo
aWR4ICZsdDsgZHN0YXRlcy5zaXplKCkgJmFtcDsmYW1wOyBkc3RhdGVzW2lkeF0pIHsKKwkJc3By
aW50ZihidWYsICIlLTE1cyIsIGRzdGF0ZXNbaWR4XS0mZ3Q7aHVtYW5fbmFtZSk7CisJfQorfQor
Cit2b2lkIHN0YXJ0X2RldmZyZXFfbWVhc3VyZW1lbnQodm9pZCkKK3sKKwl1bnNpZ25lZCBpbnQg
aTsKKworCWZvciAoaT0wOyBpJmx0O2FsbF9kZXZmcmVxLnNpemUoKTsgaSsrKQorCQlhbGxfZGV2
ZnJlcVtpXS0mZ3Q7c3RhcnRfbWVhc3VyZW1lbnQoKTsKK30KKwordm9pZCBlbmRfZGV2ZnJlcV9t
ZWFzdXJlbWVudCh2b2lkKQoreworCXVuc2lnbmVkIGludCBpOworCisJZm9yIChpPTA7IGkmbHQ7
YWxsX2RldmZyZXEuc2l6ZSgpOyBpKyspCisJCWFsbF9kZXZmcmVxW2ldLSZndDtlbmRfbWVhc3Vy
ZW1lbnQoKTsKK30KKworc3RhdGljIHZvaWQgZGV2ZnJlcV9kZXZfY2FsbGJhY2soY29uc3QgY2hh
ciAqZF9uYW1lKQoreworCWRldmZyZXEgKmRmID0gbmV3KHN0ZDo6bm90aHJvdykgY2xhc3MgZGV2
ZnJlcShkX25hbWUpOworCWlmIChkZikKKwkJYWxsX2RldmZyZXEucHVzaF9iYWNrKGRmKTsKK30K
Kwordm9pZCBjcmVhdGVfYWxsX2RldmZyZXFfZGV2aWNlcyh2b2lkKQoreworCURJUiAqZGlyOwor
CXN0ZDo6c3RyaW5nIHAgPSAiL3N5cy9jbGFzcy9kZXZmcmVxLyI7CisJZGlyID0gb3BlbmRpcihw
LmNfc3RyKCkpOworCWlmIChkaXIgPT0gTlVMTCkgeworCQlmcHJpbnRmKHN0ZGVyciwgIkRldmZy
ZXEgbm90IGVuYWJsZWRcbiIpOworCQlpc19lbmFibGVkID0gZmFsc2U7CisJCXJldHVybjsKKwl9
CisKKwljYWxsYmFjayBmbiA9ICZhbXA7ZGV2ZnJlcV9kZXZfY2FsbGJhY2s7CisJcHJvY2Vzc19k
aXJlY3RvcnkocC5jX3N0cigpLCBmbik7Cit9CisKK3ZvaWQgaW5pdGlhbGl6ZV9kZXZmcmVxKHZv
aWQpCit7CisJaWYgKGlzX2VuYWJsZWQpCisJCWNyZWF0ZV90YWIoIkRldmljZSBGcmVxIHN0YXRz
IiwgXygiRGV2aWNlIEZyZXEgc3RhdHMiKSk7Cit9CisKK3ZvaWQgZGlzcGxheV9kZXZmcmVxX2Rl
dmljZXModm9pZCkKK3sKKwl1bnNpZ25lZCBpbnQgaSwgajsKKwlXSU5ET1cgKndpbjsKKwljaGFy
IGZsaW5lWzEwMjRdOworCWNoYXIgYnVmWzEyOF07CisKKwl3aW4gPSBnZXRfbmN1cnNlc193aW4o
IkRldmljZSBGcmVxIHN0YXRzIik7CisgICAgICAgIGlmICghd2luKQorICAgICAgICAgICAgICAg
IHJldHVybjsKKworICAgICAgICB3Y2xlYXIod2luKTsKKyAgICAgICAgd21vdmUod2luLCAyLDAp
OworCisJaWYgKCFpc19lbmFibGVkKSB7CisJCXdwcmludHcod2luLCBfKCIgRGV2ZnJlcSBpcyBu
b3QgZW5hYmxlZCIpKTsKKwkJcmV0dXJuOworCX0KKworCWlmICghYWxsX2RldmZyZXEuc2l6ZSgp
KSB7CisJCXdwcmludHcod2luLCBfKCIgTm8gZGV2ZnJlcSBkZXZpY2VzIGF2YWlsYWJsZSIpKTsK
KwkJcmV0dXJuOworCX0KKworCWZvciAoaT0wOyBpJmx0O2FsbF9kZXZmcmVxLnNpemUoKTsgaSsr
KSB7CisKKwkJY2xhc3MgZGV2ZnJlcSAqZGYgPSBhbGxfZGV2ZnJlcVtpXTsKKwkJd3ByaW50dyh3
aW4sICJcbiVzXG4iLCBkZi0mZ3Q7ZGV2aWNlX25hbWUoKSk7CisKKwkJZm9yKGo9MDsgaiAmbHQ7
IGRmLSZndDtkc3RhdGVzLnNpemUoKTsgaisrKSB7CisJCQltZW1zZXQoZmxpbmUsIDAsIHNpemVv
ZihmbGluZSkpOworCQkJc3RyY3B5KGZsaW5lLCAiXHQiKTsKKwkJCWRmLSZndDtmaWxsX2ZyZXFf
bmFtZShqLCBidWYpOworCQkJc3RyY2F0KGZsaW5lLCBidWYpOworCQkJZGYtJmd0O2ZpbGxfZnJl
cV91dGlsaXphdGlvbihqLCBidWYpOworCQkJc3RyY2F0KGZsaW5lLCBidWYpOworCQkJc3RyY2F0
KGZsaW5lLCAiXG4iKTsKKwkJCXdwcmludHcod2luLCBmbGluZSk7CisJCX0KKwkJd3ByaW50dyh3
aW4sICJcbiIpOworCX0KK30KKwordm9pZCByZXBvcnRfZGV2ZnJlcV9kZXZpY2VzKHZvaWQpCit7
CisJaWYgKCFpc19lbmFibGVkKSB7CisJCXJldHVybjsKKwl9CisKKy8qIHRvZG86IGFkYXB0IHRv
IG5ldyByZXBvcnQgZm9ybWF0ICovCisjaWYgMAorCWNoYXIgYnVmZmVyWzUxMl07CisJdW5zaWdu
ZWQgaW50IGksIGo7CisKKwlyZXBvcnQuYmVnaW5fc2VjdGlvbihTRUNUSU9OX0RFVkZSRVEpOwor
CXJlcG9ydC5hZGRfaGVhZGVyKCJEZXZpY2UgRnJlcXVlbmN5IFJlcG9ydCIpOworCisJcmVwb3J0
LmJlZ2luX3RhYmxlKFRBQkxFX1dJREUpOworCWlmICghYWxsX2RldmZyZXEuc2l6ZSgpKSB7CisJ
CXJlcG9ydC5iZWdpbl9yb3coKTsKKwkJcmVwb3J0LmFkZCgiIE5vIGRldmZyZXEgZGV2aWNlcyBh
dmFpbGFibGUiKTsKKwkJcmV0dXJuOworCX0KKworCWZvciAoaSA9IDA7IGkgJmx0OyBhbGxfZGV2
ZnJlcS5zaXplKCk7IGkrKykgeworCQlidWZmZXJbMF0gPSAwOworCQljbGFzcyBkZXZmcmVxICpk
ZiA9IGFsbF9kZXZmcmVxW2ldOworCisJCXJlcG9ydC5iZWdpbl9yb3coKTsKKwkJcmVwb3J0LmJl
Z2luX2NlbGwoQ0VMTF9DUFVfUFNUQVRFX0hFQURFUik7CisJCXJlcG9ydC5hZGRmKCIlcyIsIGRm
LSZndDtkZXZpY2VfbmFtZSgpKTsKKworCQlmb3IgKGogPSAwOyBqICZsdDsgZGYtJmd0O2RzdGF0
ZXMuc2l6ZSgpOyBqKyspIHsKKwkJCXJlcG9ydC5iZWdpbl9yb3coKTsKKwkJCXJlcG9ydC5iZWdp
bl9jZWxsKENFTExfQ1BVX1NUQVRFX1ZBTFVFKTsKKwkJCWRmLSZndDtmaWxsX2ZyZXFfbmFtZShq
LCBidWZmZXIpOworCQkJcmVwb3J0LmFkZChidWZmZXIpOworCQkJcmVwb3J0LmJlZ2luX2NlbGwo
Q0VMTF9DUFVfU1RBVEVfVkFMVUUpOworCQkJZGYtJmd0O2ZpbGxfZnJlcV91dGlsaXphdGlvbihq
LCBidWZmZXIpOworCQkJcmVwb3J0LmFkZChidWZmZXIpOworCQl9CisJfQorI2VuZGlmCisKK30K
Kwordm9pZCBjbGVhcl9hbGxfZGV2ZnJlcSgpCit7CisJdW5zaWduZWQgaW50IGksIGo7CisKKwlm
b3IgKGk9MDsgaSAmbHQ7IGFsbF9kZXZmcmVxLnNpemUoKTsgaSsrKSB7CisJCWNsYXNzIGRldmZy
ZXEgKmRmID0gYWxsX2RldmZyZXFbaV07CisKKwkJZm9yKGo9MDsgaiAmbHQ7IGRmLSZndDtkc3Rh
dGVzLnNpemUoKTsgaisrKQorCQkJZGVsZXRlIGRmLSZndDtkc3RhdGVzW2pdOworCisJCWRmLSZn
dDtkc3RhdGVzLnJlc2l6ZSgwKTsKKwkJZGVsZXRlIGRmOworCX0KKwlhbGxfZGV2ZnJlcS5jbGVh
cigpOworfQpkaWZmIC0tZ2l0IGEvc3JjL2RldmljZXMvZGV2ZnJlcS5oIGIvc3JjL2RldmljZXMv
ZGV2ZnJlcS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjhhYjU3MDUKLS0t
IC9kZXYvbnVsbAorKysgYi9zcmMvZGV2aWNlcy9kZXZmcmVxLmgKQEAgLTAsMCArMSw3NSBAQAor
LyoKKyAqIENvcHlyaWdodCAyMDEyLCBMaW5hcm8KKyAqCisgKiBUaGlzIGZpbGUgaXMgcGFydCBv
ZiBQb3dlclRPUAorICoKKyAqIFRoaXMgcHJvZ3JhbSBmaWxlIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQKKyAqIHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZQor
ICogRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UuCisg
KgorICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2ls
bCBiZSB1c2VmdWwsIGJ1dCBXSVRIT1VUCisgKiBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0
aGUgaW1wbGllZCB3YXJyYW50eSBvZiBNRVJDSEFOVEFCSUxJVFkgb3IKKyAqIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZQorICogZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQg
YSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogYWxvbmcgd2l0aCB0
aGlzIHByb2dyYW0gaW4gYSBmaWxlIG5hbWVkIENPUFlJTkc7IGlmIG5vdCwgd3JpdGUgdG8gdGhl
CisgKiBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYywKKyAqIDUxIEZyYW5rbGluIFN0cmVl
dCwgRmlmdGggRmxvb3IsCisgKiBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBCisgKiBvciBqdXN0
IGdvb2dsZSBmb3IgaXQuCisgKgorICogQXV0aG9yczoKKyAqCVJhamFnb3BhbCBWZW5rYXQgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhamFnb3BhbC52ZW5r
YXRAbGluYXJvLm9yZyI+Jmx0O3JhamFnb3BhbC52ZW5rYXRAbGluYXJvLm9yZyZndDs8L2E+Cisg
Ki8KKyNpZm5kZWYgX0lOQ0xVREVfR1VBUkRfREVWRlJFUV9ICisjZGVmaW5lIF9JTkNMVURFX0dV
QVJEX0RFVkZSRVFfSAorCisjaW5jbHVkZSAiZGV2aWNlLmgiCisjaW5jbHVkZSAiLi4vcGFyYW1l
dGVycy9wYXJhbWV0ZXJzLmgiCisKK3N0cnVjdCBmcmVxdWVuY3k7CisKK2NsYXNzIGRldmZyZXE6
IHB1YmxpYyBkZXZpY2UgeworCWNoYXIgZGlyX25hbWVbNDA5Nl07CisJc3RydWN0IHRpbWV2YWwg
IHN0YW1wX2JlZm9yZSwgc3RhbXBfYWZ0ZXI7CisJZG91YmxlIHNhbXBsZV90aW1lOworCisJdWlu
dDY0X3QgcGFyc2VfZnJlcV90aW1lKGNoYXIgKnB0cik7CisJdm9pZCBhZGRfZGV2ZnJlcV9mcmVx
X3N0YXRlKHVpbnQ2NF90IGZyZXEsIHVpbnQ2NF90IHRpbWUpOworCXZvaWQgdXBkYXRlX2RldmZy
ZXFfZnJlcV9zdGF0ZSh1aW50NjRfdCBmcmVxLCB1aW50NjRfdCB0aW1lKTsKKwl2b2lkIHBhcnNl
X2RldmZyZXFfdHJhbnNfc3RhdChjaGFyICpkbmFtZSk7CisJdm9pZCBwcm9jZXNzX3RpbWVfc3Rh
bXBzKCk7CisKK3B1YmxpYzoKKworCXZlY3RvciZsdDtzdHJ1Y3QgZnJlcXVlbmN5IComZ3Q7IGRz
dGF0ZXM7CisKKwlkZXZmcmVxKGNvbnN0IGNoYXIgKmMpOworCXZvaWQgZmlsbF9mcmVxX3V0aWxp
emF0aW9uKHVuc2lnbmVkIGludCBpZHgsIGNoYXIgKmJ1Zik7CisJdm9pZCBmaWxsX2ZyZXFfbmFt
ZSh1bnNpZ25lZCBpbnQgaWR4LCBjaGFyICpidWYpOworCisJdmlydHVhbCB2b2lkIHN0YXJ0X21l
YXN1cmVtZW50KHZvaWQpOworCXZpcnR1YWwgdm9pZCBlbmRfbWVhc3VyZW1lbnQodm9pZCk7CisK
Kwl2aXJ0dWFsIGRvdWJsZQl1dGlsaXphdGlvbih2b2lkKTsgLyogcGVyY2VudGFnZSAqLworCisJ
dmlydHVhbCBjb25zdCBjaGFyICogY2xhc3NfbmFtZSh2b2lkKSB7IHJldHVybiAiZGV2ZnJlcSI7
fTsKKworCXZpcnR1YWwgY29uc3QgY2hhciAqIGRldmljZV9uYW1lKHZvaWQpIHsgcmV0dXJuIGRp
cl9uYW1lO307CisJdmlydHVhbCBjb25zdCBjaGFyICogaHVtYW5fbmFtZSh2b2lkKSB7IHJldHVy
biAiZGV2ZnJlcSI7fTsKKwl2aXJ0dWFsIGRvdWJsZSBwb3dlcl91c2FnZShzdHJ1Y3QgcmVzdWx0
X2J1bmRsZSAqcmVzdWx0LCBzdHJ1Y3QgcGFyYW1ldGVyX2J1bmRsZSAqYnVuZGxlKTsKKwl2aXJ0
dWFsIGNvbnN0IGNoYXIgKiB1dGlsX3VuaXRzKHZvaWQpIHsgcmV0dXJuICIgcnBtIjsgfTsKKwl2
aXJ0dWFsIGludCBwb3dlcl92YWxpZCh2b2lkKSB7IHJldHVybiAwOyAvKnV0aWxpemF0aW9uX3Bv
d2VyX3ZhbGlkKHJfaW5kZXgpOyovfTsKKwl2aXJ0dWFsIGludCBncm91cGluZ19wcmlvKHZvaWQp
IHsgcmV0dXJuIDE7IH07Cit9OworCitleHRlcm4gdm9pZCBjcmVhdGVfYWxsX2RldmZyZXFfZGV2
aWNlcyh2b2lkKTsKK2V4dGVybiB2b2lkIGNsZWFyX2FsbF9kZXZmcmVxKHZvaWQpOworZXh0ZXJu
IHZvaWQgZGlzcGxheV9kZXZmcmVxX2RldmljZXModm9pZCk7CitleHRlcm4gdm9pZCByZXBvcnRf
ZGV2ZnJlcV9kZXZpY2VzKHZvaWQpOworZXh0ZXJuIHZvaWQgaW5pdGlhbGl6ZV9kZXZmcmVxKHZv
aWQpOworZXh0ZXJuIHZvaWQgc3RhcnRfZGV2ZnJlcV9tZWFzdXJlbWVudCh2b2lkKTsKK2V4dGVy
biB2b2lkIGVuZF9kZXZmcmVxX21lYXN1cmVtZW50KHZvaWQpOworCisjZW5kaWYKZGlmZiAtLWdp
dCBhL3NyYy9tYWluLmNwcCBiL3NyYy9tYWluLmNwcAppbmRleCBjZjRlNTQ3Li5kMzNlYWVkIDEw
MDY0NAotLS0gYS9zcmMvbWFpbi5jcHAKKysrIGIvc3JjL21haW4uY3BwCkBAIC00OCw2ICs0OCw3
IEBACiAKIAogI2luY2x1ZGUgImRldmljZXMvZGV2aWNlLmgiCisjaW5jbHVkZSAiZGV2aWNlcy9k
ZXZmcmVxLmgiCiAjaW5jbHVkZSAiZGV2aWNlcy91c2IuaCIKICNpbmNsdWRlICJkZXZpY2VzL2Fo
Y2kuaCIKICNpbmNsdWRlICJtZWFzdXJlbWVudC9tZWFzdXJlbWVudC5oIgpAQCAtMTk0LDYgKzE5
NSw3IEBAIHZvaWQgb25lX21lYXN1cmVtZW50KGludCBzZWNvbmRzLCBjaGFyICp3b3JrbG9hZCkK
IAljcmVhdGVfYWxsX3VzYl9kZXZpY2VzKCk7CiAJc3RhcnRfcG93ZXJfbWVhc3VyZW1lbnQoKTsK
IAlkZXZpY2VzX3N0YXJ0X21lYXN1cmVtZW50KCk7CisJc3RhcnRfZGV2ZnJlcV9tZWFzdXJlbWVu
dCgpOwogCXN0YXJ0X3Byb2Nlc3NfbWVhc3VyZW1lbnQoKTsKIAlzdGFydF9jcHVfbWVhc3VyZW1l
bnQoKTsKIApAQCAtMjA2LDYgKzIwOCw3IEBAIHZvaWQgb25lX21lYXN1cmVtZW50KGludCBzZWNv
bmRzLCBjaGFyICp3b3JrbG9hZCkKIAllbmRfY3B1X21lYXN1cmVtZW50KCk7CiAJZW5kX3Byb2Nl
c3NfbWVhc3VyZW1lbnQoKTsKIAljb2xsZWN0X29wZW5fZGV2aWNlcygpOworCWVuZF9kZXZmcmVx
X21lYXN1cmVtZW50KCk7CiAJZGV2aWNlc19lbmRfbWVhc3VyZW1lbnQoKTsKIAllbmRfcG93ZXJf
bWVhc3VyZW1lbnQoKTsKIApAQCAtMjMzLDYgKzIzNiw5IEBAIHZvaWQgb25lX21lYXN1cmVtZW50
KGludCBzZWNvbmRzLCBjaGFyICp3b3JrbG9hZCkKIAlyZXBvcnRfc2hvd19vcGVuX2RldmljZXMo
KTsKIAogCXJlcG9ydF9kZXZpY2VzKCk7CisJZGlzcGxheV9kZXZmcmVxX2RldmljZXMoKTsKKwly
ZXBvcnRfZGV2ZnJlcV9kZXZpY2VzKCk7CisKIAlhaGNpX2NyZWF0ZV9kZXZpY2Vfc3RhdHNfdGFi
bGUoKTsKIAlzdG9yZV9yZXN1bHRzKG1lYXN1cmVtZW50X3RpbWUpOwogCWVuZF9jcHVfZGF0YSgp
OwpAQCAtMzQ0LDYgKzM1MCw3IEBAIHN0YXRpYyB2b2lkIHBvd2VydG9wX2luaXQodm9pZCkKIAog
CWVudW1lcmF0ZV9jcHVzKCk7CiAJY3JlYXRlX2FsbF9kZXZpY2VzKCk7CisJY3JlYXRlX2FsbF9k
ZXZmcmVxX2RldmljZXMoKTsKIAlkZXRlY3RfcG93ZXJfbWV0ZXJzKCk7CiAKIAlyZWdpc3Rlcl9w
YXJhbWV0ZXIoImJhc2UgcG93ZXIiLCAxMDAsIDAuNSk7CkBAIC00NTcsNiArNDY0LDcgQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQlleGl0KDApOwogCX0KIAlpbml0X2Rpc3Bs
YXkoKTsKKwlpbml0aWFsaXplX2RldmZyZXEoKTsKIAlpbml0aWFsaXplX3R1bmluZygpOwogCS8q
IGZpcnN0IG9uZSBpcyBzaG9ydCB0byBub3QgbGV0IHRoZSB1c2VyIHdhaXQgdG9vIGxvbmcgKi8K
IAlvbmVfbWVhc3VyZW1lbnQoMSwgTlVMTCk7CkBAIC00OTEsNiArNDk5LDcgQEAgaW50IG1haW4o
aW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCiAJY2xlYW5fb3Blbl9kZXZpY2VzKCk7CiAJY2xlYXJf
YWxsX2RldmljZXMoKTsKKwljbGVhcl9hbGxfZGV2ZnJlcSgpOwogCWNsZWFyX2FsbF9jcHVzKCk7
CiAKIAlyZXR1cm4gMDsKZGlmZiAtLWdpdCBhL3NyYy9yZXBvcnQvcmVwb3J0LW1ha2VyLmggYi9z
cmMvcmVwb3J0L3JlcG9ydC1tYWtlci5oCmluZGV4IDQyMzU2OGEuLmJkYTRjZWYgMTAwNjQ0Ci0t
LSBhL3NyYy9yZXBvcnQvcmVwb3J0LW1ha2VyLmgKKysrIGIvc3JjL3JlcG9ydC9yZXBvcnQtbWFr
ZXIuaApAQCAtODksNiArODksNyBAQCBlbnVtIHNlY3Rpb25fdHlwZSB7CiAJU0VDVElPTl9TWVNJ
TkZPLAogCVNFQ1RJT05fQ1BVSURMRSwKIAlTRUNUSU9OX0NQVUZSRVEsCisJU0VDVElPTl9ERVZG
UkVRLAogCVNFQ1RJT05fREVWUE9XRVIsCiAJU0VDVElPTl9TT0ZUV0FSRSwKIAlTRUNUSU9OX1NV
TU1BUlksCjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgPHByZSBjbGFzcz0i
bW96LXNpZ25hdHVyZSIgY29scz0iNzIiPi0tIApzYW5qYXk8L3ByZT4KICA8L2JvZHk+CjwvaHRt
bD4K

--===============2889820601899212669==--

