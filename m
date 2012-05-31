Content-Type: multipart/mixed; boundary="===============0805825442495918112=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] add more strings to transalte
Date: Thu, 31 May 2012 08:50:30 -0700
Message-ID: <4FC79346.4080601@linux.intel.com>
In-Reply-To: 4FC70693.3000205@freemail.hu
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0805825442495918112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I like about half of what you have done. I am facing a couple of issues
     1. I do not want CSV reports translated. This effects parsing, and =

is commonly the reports I like to have sent to me.
     2. I have an idea of making the HTML5 report switchable between =

Source language (english) and the traget language (other). This way you =

can generate html (pretty) reports in a target language, but when others =

get them we can also see the English.
All while making the UI portion as translated as possible.

I am in the process of fixing all the strings I can to be more flexible =

and translatable. In this patch I like the HTML portion as a start, but =

I do not want to take the CSV portion.

My goal is to have all reports and the UI translated and meeting the =

goals before the 2.1 release.
Thanks for the input, its very helpful.
-Chris


On 05/30/2012 10:50 PM, N=C3=A9meth M=C3=A1rton wrote:
> From: M=C3=A1rton N=C3=A9meth<nm127(a)freemail.hu>
>
> Separate the HTML/CSV formatting from the strings to be translated.
> Unify upcase/lowcase in heading strings between HTML/CSV output.
>
> Signed-off-by: M=C3=A1rton N=C3=A9meth<nm127(a)freemail.hu>
> ---
> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index 4096835..341a40d 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -395,10 +395,12 @@ void report_display_cpu_cstates(void)
>
>   	if (reporttype)
>   		fprintf(reportout.http_report,
> -			"<div id=3D\"cpuidle\"><h2>Processor Idle state report</h2>\n");
> +			"<div id=3D\"cpuidle\"><h2>%s</h2>\n",
> +			_("Processor Idle State Report"));
>   	else
>   		fprintf(reportout.csv_report,
> -			"**Processor Idle State Report**, \n");
> +			"**%s**, \n",
> +			_("Processor Idle State Report"));
>
>
>   	for (package =3D 0; package<  system_level.children.size(); package++)=
 {
> @@ -437,7 +439,7 @@ void report_display_cpu_cstates(void)
>   										"<th colspan=3D2 class=3D\"package_header\" width=3D\"25%%\">=
%s</th>"
>   										, _package->fill_cstate_line(line, buffer));
>   						else
> -							fprintf(reportout.csv_report, ",%s,", "Package");
> +							fprintf(reportout.csv_report, ",%s,", _("Package"));
>
>   					} else {
>   						if (reporttype)
> @@ -478,14 +480,19 @@ void report_display_cpu_cstates(void)
>   								_core->fill_cstate_line(line, buffer2));
>   					    } else {
>   							if (!first_pkg=3D=3D0) {
> +								fprintf(reportout.csv_report, ",,,");
>   								fprintf(reportout.csv_report,
> -									",,,Core %s ,,",
> +									_("Core %s"),
>   									_core->fill_cstate_line(line, buffer2));
> +								fprintf(reportout.csv_report, " ,,");
>   							} else {
> -							fprintf(reportout.csv_report,
> -									",Core %s ,,",
> +								fprintf(reportout.csv_report, ",");
> +								fprintf(reportout.csv_report,
> +									_("Core %s"),
>   									_core->fill_cstate_line(line, buffer2));
> -						}
> +								fprintf(reportout.csv_report,
> +									" ,,");
> +							}
>   					    }
>   					} else {
>   						if (reporttype) {
> @@ -593,9 +600,11 @@ void report_display_cpu_pstates(void)
>   		return;
>
>   	if (reporttype)
> -		fprintf(reportout.http_report, "<div id=3D\"cpufreq\"><h2>Processor fr=
equency report</h2>\n");
> +		fprintf(reportout.http_report, "<div id=3D\"cpufreq\"><h2>%s</h2>\n",
> +			_("Processor Frequency Report"));
>   	else
> -		fprintf(reportout.csv_report, "**Processor Frequency Report**, \n");
> +		fprintf(reportout.csv_report, "**%s**, \n",
> +			_("Processor Frequency Report"));
>
>   	for (package =3D 0; package<  system_level.children.size(); package++)=
 {
>   		int first_pkg =3D 0;
> @@ -634,7 +643,7 @@ void report_display_cpu_pstates(void)
>   									_package->fill_pstate_name(line, buffer),
>   									_package->fill_pstate_line(line, buffer2));
>   						else
> -								fprintf(reportout.csv_report,",%s,", "Package");
> +								fprintf(reportout.csv_report,",%s,", _("Package"));
>
>   					} else {
>   						if (reporttype) {
> @@ -903,7 +912,7 @@ void perf_power_bundle::handle_trace_point(void *trac=
e, int cpunr, uint64_t time
>   		return;
>
>   	if (cpunr>=3D (int)all_cpus.size()) {
> -		cout<<  "INVALID cpu nr in handle_trace_point\n";
> +		cout<<  _("INVALID cpu nr in handle_trace_point")<<  "\n";
>   		return;
>   	}
>
> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index 7366454..03e33b0 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -414,7 +414,7 @@ void perf_process_bundle::handle_trace_point(void *tr=
ace, int cpu, uint64_t time
>
>   		ret =3D pevent_get_field_val(NULL, event, "vec",&rec,&val, 0);
>                   if (ret<  0) {
> -                        fprintf(stderr, "softirq_entry event returned no=
 vector number?\n");
> +                        fprintf(stderr, _("softirq_entry event returned =
no vector number?\n"));
>                           return;
>                   }
>   		vec =3D (int)val;
> @@ -451,7 +451,7 @@ void perf_process_bundle::handle_trace_point(void *tr=
ace, int cpu, uint64_t time
>
>   		ret =3D pevent_get_field_val(NULL, event, "function",&rec,&val, 0);
>   		if (ret<  0) {
> -			fprintf(stderr, "timer_expire_entry event returned no fucntion value?=
\n");
> +			fprintf(stderr, _("timer_expire_entry event returned no fucntion valu=
e?\n"));
>   			return;
>   		}
>   		function =3D (uint64_t)val;
> @@ -463,7 +463,7 @@ void perf_process_bundle::handle_trace_point(void *tr=
ace, int cpu, uint64_t time
>
>   		ret =3D pevent_get_field_val(NULL, event, "timer",&rec,&val, 0);
>   		if (ret<  0) {
> -			fprintf(stderr, "softirq_entry event returned no timer ?\n");
> +			fprintf(stderr, _("softirq_entry event returned no timer?\n"));
>   			return;
>   		}
>   		tmr =3D (uint64_t)val;
> @@ -839,7 +839,7 @@ void process_update_display(void)
>   		wprintw(win, "\n");
>
>
> -	wprintw(win, "Summary: %3.1f wakeups/second,  %3.1f GPU ops/second, %3.=
1f VFS ops/sec and %3.1f%% CPU use\n\n",
> +	wprintw(win, _("Summary: %3.1f wakeups/second,  %3.1f GPU ops/second, %=
3.1f VFS ops/sec and %3.1f%% CPU use\n\n"),
>   		total_wakeups(), total_gpu_ops(), total_disk_hits(), total_cpu_time()=
*100);
>
>
> @@ -909,21 +909,58 @@ void report_process_update_display(void)
>
>   	if (reporttype){
>   		fprintf(reportout.http_report,
> -			"<div id=3D\"software\"><h2>Overview of Software Power Consumers</h2>=
\n<table width=3D\"100%%\">\n");
> +			"<div id=3D\"software\"><h2>%s</h2>\n<table width=3D\"100%%\">\n",
> +			_("Overview of Software Power Consumers"));
>   		if (show_power)
>   			fprintf(reportout.http_report,
> -				"<tr><th width=3D\"10%%\">Power est.</th><th width=3D\"10%%\">Usage<=
/th><th width=3D\"10%%\">Wakeups/s</th><th width=3D\"10%%\">GPU ops/s</th><=
th
> width=3D\"10%%\">Disk IO/s</th><th width=3D\"10%%\">GFX Wakeups/s</th><th=
 width=3D\"10%%\" class=3D\"process\">Category</th><th class=3D\"process\">=
Description</th></tr>\n");
> +				"<tr>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\" class=3D\"process\">%s</th>"
> +				"<th class=3D\"process\">%s</th>"
> +				"</tr>\n",
> +				_("Power est."),
> +				_("Usage"),
> +				_("Wakeups/s"),
> +				_("GPU ops/s"),
> +				_("Disk IO/s"),
> +				_("GFX Wakeups/s"),
> +				_("Category"),
> +				_("Description")
> +				);
>   		else
>   			fprintf(reportout.http_report,
>   				"<tr><th width=3D\"10%%\">Usage</th><th width=3D\"10%%\">Wakeups/s<=
/th><th width=3D\"10%%\">GPU ops/s</th><th width=3D\"10%%\">Disk IO/s</th><=
th width=3D\"10%%\">GFX
> Wakeups/s</th><th width=3D\"10%%\" class=3D\"process\">Category</th><th c=
lass=3D\"process\">Description</th></tr>\n");
>   	}else {
> -		fprintf(reportout.csv_report,"**Overview of Software Power Consumers**=
, \n\n");
> +		fprintf(reportout.csv_report,"**%s**, \n\n",
> +				_("Overview of Software Power Consumers"));
>   		if (show_power)
>   			fprintf(reportout.csv_report,
> -				"Power est., Usage, Wakeups, GPU ops, Disk IO, GFX Wakeups, Category=
, Description, \n");
> +				"%s, %s, %s, %s, %s, %s, %s, %s, \n",
> +				_("Power est."),
> +				_("Usage"),
> +				_("Wakeups"),
> +				_("GPU ops"),
> +				_("Disk IO"),
> +				_("GFX Wakeups"),
> +				_("Category"),
> +				_("Description")
> +				);
>   		else
>   			fprintf(reportout.csv_report,
> -				"Usage,  Wakeups, GPU ops, Disk IO, GFX Wakeups, Category, Descripti=
on, \n");
> +				"%s,  %s, %s, %s, %s, %s, %s, \n",
> +				_("Usage"),
> +				_("Wakeups"),
> +				_("GPU ops"),
> +				_("Disk IO"),
> +				_("GFX Wakeups"),
> +				_("Category"),
> +				_("Description")
> +				);
>   	}
>
>   	total =3D all_power.size();
> @@ -1024,29 +1061,68 @@ void report_summary(void)
>
>   	if (reporttype) {
>   		fprintf(reportout.http_report,
> -			"<div id=3D\"summary\"><h2>Power Consumption Summary</h2>\n");
> +			"<div id=3D\"summary\"><h2>%s</h2>\n",
> +			_("Power Consumption Summary"));
> +		fprintf(reportout.http_report, "<p>");
>   		fprintf(reportout.http_report,
> -			"<p>%3.1f wakeups/second,  %3.1f GPU ops/second, %3.1f VFS ops/sec, %=
3.1f GFX wakes/sec and %3.1f%% CPU use</p>\n<table width=3D\"100%%\">\n",
> +			_("%3.1f wakeups/second,  %3.1f GPU ops/second, %3.1f VFS ops/sec, %3=
.1f GFX wakes/sec and %3.1f%% CPU use"),
>   			total_wakeups(), total_gpu_ops(), total_disk_hits(), total_xwakes(),=
 total_cpu_time()*100);
> +		fprintf(reportout.http_report,
> +			"</p>\n<table width=3D\"100%%\">\n");
>
>   		if (show_power)
>   			fprintf(reportout.http_report,
> -		"<tr><th width=3D\"10%%\">Power est.</th><th width=3D\"10%%\">Usage</t=
h><th width=3D\"10%%\">Events/s</th><th width=3D\"10%%\" class=3D\"process\=
">Category</th><th
> class=3D\"process\">Description</th></tr>\n");
> +				"<tr>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\">%s</th>"
> +				"<th width=3D\"10%%\" class=3D\"process\">%s</th>"
> +				"<th class=3D\"process\">%s</th>"
> +				"</tr>\n",
> +				_("Power est."),
> +				_("Usage"),
> +				_("Events/s"),
> +				_("Category"),
> +				_("Description")
> +				);
>   		else
>   		fprintf(reportout.http_report,
> -		"<tr><th width=3D\"10%%\">Usage</th><th width=3D\"10%%\">Events/s</th>=
<th width=3D\"10%%\" class=3D\"process\">Category</th><th
> class=3D\"process\">Description</th></tr>\n");
> +			"<tr>"
> +			"<th width=3D\"10%%\">%s</th>"
> +			"<th width=3D\"10%%\">%s</th>"
> +			"<th width=3D\"10%%\" class=3D\"process\">%s</th>"
> +			"<th class=3D\"process\">%s</th>"
> +			"</tr>\n",
> +			_("Usage"),
> +			_("Events/s"),
> +			_("Category"),
> +			_("Description")
> +			);
>
>   	}else {
>   		fprintf(reportout.csv_report,
> -			"**Power Consumption Summary** \n");
> +			"**%s** \n",
> +			_("Power Consumption Summary"));
>   		fprintf(reportout.csv_report,
> -			"%3.1f wakeups/second,  %3.1f GPU ops/second, %3.1f VFS ops/sec, %3.1=
f GFX wakes/sec and %3.1f%% CPU use \n\n",
> +			_("%3.1f wakeups/second,  %3.1f GPU ops/second, %3.1f VFS ops/sec, %3=
.1f GFX wakes/sec and %3.1f%% CPU use"),
>   			total_wakeups(), total_gpu_ops(), total_disk_hits(), total_xwakes(),=
 total_cpu_time()*100);
> +		fprintf(reportout.csv_report, " \n\n");
>
>   		if (show_power)
> -			fprintf(reportout.csv_report,"Power est., Usage, Events/s, Category, =
 Description, \n");
> +			fprintf(reportout.csv_report, "%s, %s, %s, %s,  %s, \n",
> +				_("Power est."),
> +				_("Usage"),
> +				_("Events/s"),
> +				_("Category"),
> +				_("Description")
> +			);
>           else
> -			fprintf(reportout.csv_report,"Usage, Events/s, Category, Description,=
 \n");
> +			fprintf(reportout.csv_report, "%s, %s, %s, %s, \n",
> +				_("Usage"),
> +				_("Events/s"),
> +				_("Category"),
> +				_("Description")
> +				);
>
>   	}
>   	total =3D all_power.size();
> diff --git a/src/report.cpp b/src/report.cpp
> index 1d97d27..86b0964 100644
> --- a/src/report.cpp
> +++ b/src/report.cpp
> @@ -120,20 +120,24 @@ static void system_info(void)
>
>   	if (reporttype) {
>   		fprintf(reportout.http_report, "<div id=3D\"top\">\n<h1><a href=3D\"#=
top\">&nbsp;</a></h1>\n</div>\n<div id=3D\"system\">\n<table>");
> -		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td width=
=3D\"20%%\">PowerTOP Version</td><td>%s</td></tr>\n", POWERTOP_VERSION);
> +		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td width=
=3D\"20%%\">%s</td><td>%s</td></tr>\n",
> +				_("PowerTOP Version"),
> +				POWERTOP_VERSION);
>   	} else {
> -		fprintf(reportout.csv_report, "***PowerTOP Report***, \n");
> -		fprintf(reportout.csv_report, "**System Information**, \n");
> +		fprintf(reportout.csv_report, "***%s***, \n", _("PowerTOP Report"));
> +		fprintf(reportout.csv_report, "**%s**, \n", _("System Information"));
>   		fprintf(reportout.csv_report, "\n");
> -		fprintf(reportout.csv_report,  "PowerTOP Version:, \"%s\", \n", POWERT=
OP_VERSION);
> +		fprintf(reportout.csv_report,  "%s:, \"%s\", \n", "PowerTOP Version", =
POWERTOP_VERSION);
>   	}
>   	str =3D read_sysfs_string("/proc/version");
>
>   	if (reporttype)
> -		fprintf(reportout.http_report,"<tr class=3D\"system_odd\"><td>Kernel V=
ersion</td><td>%s</td></tr>\n",
> +		fprintf(reportout.http_report,"<tr class=3D\"system_odd\"><td>%s</td><=
td>%s</td></tr>\n",
> +				_("Kernel Version"),
>   				str.c_str());
>   	else
> -		fprintf(reportout.csv_report, "Kernel Version:, \"%s\", \n",
> +		fprintf(reportout.csv_report, "%s:, \"%s\", \n",
> +				_("Kernel Version"),
>   				str.c_str());
>
>   	str =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_vendor");
> @@ -141,19 +145,23 @@ static void system_info(void)
>   	str3 =3D read_sysfs_string("/sys/devices/virtual/dmi/id/product_versio=
n");
>
>   	if (reporttype)
> -		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td>System=
 Name</td><td>%s %s %s</td></tr>\n",
> +		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td>%s</td=
><td>%s %s %s</td></tr>\n",
> +				_("System Name"),
>   				str.c_str(), str2.c_str(), str3.c_str());
>   	else
> -		fprintf(reportout.csv_report,"System Name:,\"%s %s %s,\" \n",
> +		fprintf(reportout.csv_report,"%s:,\"%s %s %s,\" \n",
> +				_("System Name"),
>   				str.c_str(), str2.c_str(), str3.c_str());
>
>   	str =3D cpu_model();
>
>   	if (reporttype)
> -		fprintf(reportout.http_report, "<tr class=3D\"system_odd\"><td>CPU Inf=
ormation</td><td>%lix %s</td></tr>\n",
> +		fprintf(reportout.http_report, "<tr class=3D\"system_odd\"><td>%s</td>=
<td>%lix %s</td></tr>\n",
> +			_("CPU Information"),
>   			 sysconf(_SC_NPROCESSORS_ONLN), str.c_str());
>   	else
> -		fprintf(reportout.csv_report,"CPU Information:, %lix \"%s\", \n",
> +		fprintf(reportout.csv_report,"%s:, %lix \"%s\", \n",
> +			_("CPU Information"),
>   			 sysconf(_SC_NPROCESSORS_ONLN), str.c_str());
>
>   	str =3D read_sysfs_string("/etc/system-release");
> @@ -163,11 +171,13 @@ static void system_info(void)
>   		str =3D read_os_release("/etc/os-release");
>
>   	if (reporttype) {
> -		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td>OS Inf=
ormation</td><td>%s</td></tr>\n",
> +		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td>%s</td=
><td>%s</td></tr>\n",
> +				_("OS Information"),
>   				 str.c_str());
>   		fprintf(reportout.http_report,"</table></div>\n");
>   	} else {
> -		fprintf(reportout.csv_report,"OS Information:,\"%s\", \n",
> +		fprintf(reportout.csv_report,"%s:,\"%s\", \n",
> +				_("OS Information"),
>   				 str.c_str());
>   		fprintf(reportout.csv_report,"\n");
>   	}


--===============0805825442495918112==--

