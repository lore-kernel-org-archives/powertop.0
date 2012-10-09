Content-Type: multipart/mixed; boundary="===============3405960601613543620=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [RFC][PATCH 2/2] Convert powertop to use new report
 generator facility (v2)
Date: Tue, 09 Oct 2012 20:44:16 +0400
Message-ID: <1349801056-29990-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3405960601613543620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Convert report system to use new report generator facility
for producing parsable CSV- and HTML-reports, enhancing code readability
and maintainability, merging CSV and HTML codepaths, separating document
structure from text formatting.
---
 src/cpu/cpu.cpp            |  411 ++++++++++------------------------------=
----
 src/cpu/cpu.h              |    5 +
 src/cpu/cpu_core.cpp       |   11 --
 src/cpu/cpu_linux.cpp      |   55 +++++--
 src/cpu/cpu_package.cpp    |   12 --
 src/cpu/intel_cpus.cpp     |   19 --
 src/devices/device.cpp     |  112 ++++--------
 src/devlist.cpp            |   44 ++----
 src/main.cpp               |   13 +-
 src/powertop.css           |   10 +
 src/process/do_process.cpp |  199 ++++++++++------------
 src/report.cpp             |  145 +++++-----------
 src/report.h               |   12 +-
 src/tuning/tuning.cpp      |  145 +++++-----------
 14 files changed, 394 insertions(+), 799 deletions(-)

Changes:
 Fixed "Processor Idle state report" table headers alignment.
 Fixed Scripts column in "Software Settings in need of Tuning" table.

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 96e3888..3d260d9 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -37,6 +37,7 @@
 #include "../lib.h"
 #include "../display.h"
 #include "../report.h"
+#include "../report/report-maker.h"
 =

 static class abstract_cpu system_level;
 =

@@ -353,41 +354,6 @@ static void expand_string(char *string, unsigned int n=
ewlen)
 		strcat(string, " ");
 }
 =

-
-static const char *core_class(int line)
-{
-	if (line & 1)
-		return "core_odd";
-	return "core_even";
-}
-
-static const char *package_class(int line)
-{
-	if (line & 1)
-		return "package_odd";
-	return "package_even";
-}
-
-static const char *cpu_class(int line, int cpu)
-{
-	if (line & 1) {
-		if (cpu & 1)
-			return "cpu_odd_odd";
-		return "cpu_odd_even";
-	}
-	if (cpu & 1)
-		return "cpu_even_odd";
-	return "cpu_even_even";
-}
-
-static const char *freq_class(int line)
-{
-	if (line & 1) {
-		return "cpu_odd_freq";
-	}
-	return "cpu_even_freq";
-}
-
 static int has_state_level(class abstract_cpu *acpu, int state, int line)
 {
 	switch (state) {
@@ -435,195 +401,102 @@ void report_display_cpu_cstates(void)
 	int line;
 	class abstract_cpu *_package, * _core, * _cpu;
 =

-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
-
-	if (reporttype)
-		fprintf(reportout.http_report,
-			"<div id=3D\"cpuidle\"><h2>Processor Idle state report</h2>\n");
-	else
-		fprintf(reportout.csv_report,
-			"**Processor Idle State Report**, \n");
-
+	report.begin_section(SECTION_CPUIDLE);
+	report.add_header("Processor Idle state report");
 =

 	for (package =3D 0; package < system_level.children.size(); package++) {
-		int first_pkg =3D 0;
+		bool first_core =3D true;
+
 		_package =3D system_level.children[package];
 		if (!_package)
 			continue;
 =

-		if (reporttype)
-			fprintf(reportout.http_report,"<table width=3D\"100%%\">\n");
-		else
-			fprintf(reportout.csv_report,"\n");
-
+		report.begin_table(TABLE_WIDE);
 		for (core =3D 0; core < _package->children.size(); core++) {
-			int actual_line =3D 0;
 			_core =3D _package->children[core];
 			if (!_core)
 				continue;
 =

 			for (line =3D LEVEL_HEADER; line < 10; line++) {
-				int first =3D 1;
+				bool first_cpu =3D true;
+
 				if (!_package->has_cstate_level(line))
 					continue;
 =

-				actual_line++;
-				if (reporttype)
-					fprintf(reportout.http_report, "<tr>");
-
+				report.begin_row();
 				buffer[0] =3D 0;
 				buffer2[0] =3D 0;
 =

 				if (line =3D=3D LEVEL_HEADER) {
-					if (first_pkg =3D=3D 0) {
-						if (reporttype)
-							fprintf(reportout.http_report,
-										"<th colspan=3D2 class=3D\"package_header\" width=3D\"25%%\">%s<=
/th>"
-										, _package->fill_cstate_line(line, buffer));
-						else
-							fprintf(reportout.csv_report, ",%s,", "Package");
-
+					if (first_core) {
+						report.begin_cell(CELL_FIRST_PACKAGE_HEADER);
+						report.addf(__("Package %i"), _package->get_number());
 					} else {
-						if (reporttype)
-							fprintf(reportout.http_report, "<th colspan=3D2 class=3D\"package_h=
eader\">&nbsp;</th>");
+						report.begin_cell(CELL_EMPTY_PACKAGE_HEADER);
+						report.add_empty_cell();
 					}
-
-				} else if (first_pkg =3D=3D 0) {
-
-					if (reporttype)
-						fprintf(reportout.http_report, "<td class=3D\"%s\" width=3D\"10%%\">=
%s</td><td class=3D\"%s\">%s</td>",
-							freq_class(actual_line),
-							_package->fill_cstate_name(line, buffer),
-							package_class(actual_line),
-							_package->fill_cstate_line(line, buffer2));
-					else
-						fprintf(reportout.csv_report, "%s, %s,",
-							_package->fill_cstate_name(line, buffer),
-							_package->fill_cstate_line(line, buffer2));
-
-
+				} else if (first_core) {
+					report.begin_cell(CELL_STATE_NAME);
+					report.add(_package->fill_cstate_name(line, buffer));
+					report.begin_cell(CELL_PACKAGE_STATE_VALUE);
+					report.add(_package->fill_cstate_line(line, buffer2));
 				} else {
-					if (reporttype)
-						fprintf(reportout.http_report,"<td colspan=3D2>&nbsp;</td>");
+					report.begin_cell(CELL_EMPTY_PACKAGE_STATE);
+					report.add_empty_cell();
 				}
 =

-
-				if (reporttype)
-						fprintf(reportout.http_report,"<td width=3D\"2%%\">&nbsp;</td>");
+				report.begin_cell(CELL_SEPARATOR);
+				report.add_empty_cell();
 =

 				if (!_core->can_collapse()) {
 					buffer[0] =3D 0;
 					buffer2[0] =3D 0;
 =

 					if (line =3D=3D LEVEL_HEADER) {
-						if (reporttype) {
-							fprintf(reportout.http_report,
-								"<th colspan=3D2 class=3D\"core_header\" width=3D\"25%%\">%s</th>",
-								_core->fill_cstate_line(line, buffer2));
-					    } else {
-							if (!first_pkg=3D=3D0) {
-								fprintf(reportout.csv_report,
-									",,,Core %s ,,",
-									_core->fill_cstate_line(line, buffer2));
-							} else {
-							fprintf(reportout.csv_report,
-									",Core %s ,,",
-									_core->fill_cstate_line(line, buffer2));
-						}
-					    }
+						report.begin_cell(CELL_CORE_HEADER);
+						report.addf(__("Core %i"), _core->get_number());
 					} else {
-						if (reporttype) {
-							fprintf(reportout.http_report,
-								"<td class=3D\"%s\" width=3D\"10%%\">%s</td><td class=3D\"%s\">%s<=
/td>",
-								freq_class(actual_line),
-								_core->fill_cstate_name(line, buffer),
-								core_class(actual_line),
-								_core->fill_cstate_line(line, buffer2));
-						} else {
-							if (first_pkg=3D=3D0) {
-								fprintf(reportout.csv_report,
-									"%s, %s,",
-									_core->fill_cstate_name(line, buffer),
-									_core->fill_cstate_line(line, buffer2));
-							} else {
-								fprintf(reportout.csv_report,
-									",,%s, %s,",
-									_core->fill_cstate_name(line, buffer),
-									_core->fill_cstate_line(line, buffer2));
-							}
-						}
+						report.begin_cell(CELL_STATE_NAME);
+						report.add(_core->fill_cstate_name(line, buffer));
+						report.begin_cell(CELL_CORE_STATE_VALUE);
+						report.add(_core->fill_cstate_line(line, buffer2));
 					}
 				}
 =

-				if (reporttype)
-					fprintf(reportout.http_report,"<td width=3D\"2%%\">&nbsp;</td>");
+				report.begin_cell(CELL_SEPARATOR);
+				report.add_empty_cell();
 =

 				for (cpu =3D 0; cpu < _core->children.size(); cpu++) {
 					_cpu =3D _core->children[cpu];
 					if (!_cpu)
 						continue;
 =

+					report.set_cpu_number(cpu);
 					if (line =3D=3D LEVEL_HEADER) {
-						if (reporttype)
-							fprintf(reportout.http_report,"<th colspan=3D3 class=3D\"cpu_header=
\">%s</th>",
-								_cpu->fill_cstate_line(line, buffer));
-						else
-							fprintf(reportout.csv_report, ",%s,",
-									_cpu->fill_cstate_line(line, buffer));
-					} else {
-						if (first =3D=3D 1) {
-							if (reporttype )
-								fprintf(reportout.http_report,"<td class=3D\"%s\" width=3D\"10%%\"=
>%s</td>",
-									freq_class(actual_line),
-									_cpu->fill_cstate_name(line, buffer));
-							else
-								fprintf(reportout.csv_report, "%s,",
-									_cpu->fill_cstate_name(line, buffer));
-
-							first =3D 0;
-							buffer[0] =3D 0;
-
-							if (reporttype) {
-								sprintf(buffer2, "</td><td class=3D\"%s\">",
-									cpu_class(actual_line, cpu));
-
-								fprintf(reportout.http_report,"<td class=3D\"%s\">%s</td>",
-									cpu_class(actual_line, cpu),
-									_cpu->fill_cstate_line(line, buffer, buffer2));
-							}else {
-								fprintf(reportout.csv_report,"%s,",
-									_cpu->fill_cstate_line(line, buffer, ","));
-							}
-						} else {
-							buffer[0] =3D 0;
-
-							if (reporttype) {
-								sprintf(buffer2, "</td><td class=3D\"%s\">",
-									cpu_class(actual_line, cpu));
-
-								fprintf(reportout.http_report,"<td colspan=3D2 class=3D\"s\">%s</t=
d>",
-									_cpu->fill_cstate_line(line, buffer, buffer2));
-							} else {
-								fprintf(reportout.csv_report, "%s,",
-									_cpu->fill_cstate_line(line, buffer, ","));
-							}
-						}
+						report.begin_cell(CELL_CPU_CSTATE_HEADER);
+						report.addf(__("CPU %i"), _cpu->get_number());
+						continue;
+					}
+
+					if (first_cpu) {
+						report.begin_cell(CELL_STATE_NAME);
+						report.add(_cpu->fill_cstate_name(line, buffer));
+						first_cpu =3D false;
 					}
 =

+					buffer[0] =3D 0;
+					report.begin_cell(CELL_CPU_STATE_VALUE);
+					report.add(_cpu->fill_cstate_percentage(line, buffer));
+					report.begin_cell(CELL_CPU_STATE_VALUE);
+					if (line !=3D LEVEL_C0)
+						report.add(_cpu->fill_cstate_time(line, buffer));
+					else
+						report.add_empty_cell();
 				}
-				if (reporttype)
-					fprintf(reportout.http_report, "</tr>\n");
-				else
-					fprintf(reportout.csv_report, "\n");
 			}
 =

-			first_pkg++;
+			first_core =3D false;
 		}
-		if (reporttype)
-			fprintf(reportout.http_report,"</table></div>\n");
-		else
-			fprintf(reportout.csv_report, "\n");
 	}
 }
 =

@@ -635,126 +508,73 @@ void report_display_cpu_pstates(void)
 	class abstract_cpu *_package, * _core, * _cpu;
 	unsigned int i, pstates_num;
 	=

-	for (i =3D 0, pstates_num =3D 0; i<  all_cpus.size(); i++)
-		if (all_cpus[i]&&  all_cpus[i]->pstates.size()>  pstates_num)
+	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++)
+		if (all_cpus[i] && all_cpus[i]->pstates.size() > pstates_num)
 			pstates_num =3D all_cpus[i]->pstates.size(); =

-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
 =

-	if (reporttype)
-		fprintf(reportout.http_report, "<div id=3D\"cpufreq\"><h2>Processor freq=
uency report</h2>\n");
-	else
-		fprintf(reportout.csv_report, "**Processor Frequency Report**, \n");
+	report.begin_section(SECTION_CPUFREQ);
+	report.add_header("Processor Frequency Report");
 =

 	for (package =3D 0; package < system_level.children.size(); package++) {
-		int first_pkg =3D 0;
+		bool first_core =3D true;
+
 		_package =3D system_level.children[package];
 		if (!_package)
 			continue;
 =

-		if (reporttype)
-			fprintf(reportout.http_report,"<table width=3D\"100%%\">\n");
-		else
-			fprintf(reportout.csv_report,"\n");
-
-
+		report.begin_table(TABLE_WIDE);
 		for (core =3D 0; core < _package->children.size(); core++) {
 			_core =3D _package->children[core];
 			if (!_core)
 				continue;
+
 			if (!_core->has_pstates())
 				continue;
 =

 			for (line =3D LEVEL_HEADER; line < (int)pstates_num; line++) {
-				int first =3D 1;
+				bool first_cpu =3D true;
 =

 				if (!_package->has_pstate_level(line))
 					continue;
 =

-
-				if (reporttype)
-					fprintf(reportout.http_report,"<tr>");
+				report.begin_row();
 =

 				buffer[0] =3D 0;
 				buffer2[0] =3D 0;
-				if (first_pkg =3D=3D 0) {
+				if (first_core) {
 					if (line =3D=3D LEVEL_HEADER) {
-						 if (reporttype)
-								fprintf(reportout.http_report,
-									"<th colspan=3D2 class=3D\"package_header\" width=3D\"25%%\">%s%s=
</th>",
-									_package->fill_pstate_name(line, buffer),
-									_package->fill_pstate_line(line, buffer2));
-						else
-								fprintf(reportout.csv_report,",%s,", "Package");
-
+						report.begin_cell(CELL_FIRST_PACKAGE_HEADER);
+						report.addf(__("Package %i"), _package->get_number());
 					} else {
-						if (reporttype) {
-							fprintf(reportout.http_report,
-								"<td class=3D\"%s\" width=3D\"10%%\">%s</td><td class=3D\"%s\">%s<=
/td>",
-								freq_class(line),
-								_package->fill_pstate_name(line, buffer),
-								package_class(line),
-								_package->fill_pstate_line(line, buffer2));
-						} else {
-							fprintf(reportout.csv_report,"%s, %s,",
-								_package->fill_pstate_name(line, buffer),
-								_package->fill_pstate_line(line, buffer2));
-						}
+						report.begin_cell(CELL_STATE_NAME);
+						report.add(_package->fill_pstate_name(line, buffer));
+						report.begin_cell(CELL_PACKAGE_STATE_VALUE);
+						report.add(_package->fill_pstate_line(line, buffer2));
 					}
 				} else {
-					if (reporttype)
-						fprintf(reportout.http_report,"<td colspan=3D2>&nbsp;</td>");
+					report.begin_cell(CELL_EMPTY_PACKAGE_STATE);
+					report.add_empty_cell();
 				}
 =

-
-				if (reporttype)
-					fprintf(reportout.http_report,"<td width=3D\"2%%\">&nbsp;</td>");
+				report.begin_cell(CELL_SEPARATOR);
+				report.add_empty_cell();
 =

 				if (!_core->can_collapse()) {
 					buffer[0] =3D 0;
 					buffer2[0] =3D 0;
 					if (line =3D=3D LEVEL_HEADER) {
-						if (reporttype) {
-						fprintf(reportout.http_report,
-							"<th colspan=3D2 class=3D\"core_header\" width=3D\"25%%\">%s%s</th>=
",
-							_core->fill_pstate_name(line, buffer),
-							_core->fill_pstate_line(line, buffer2));
-						} else {
-							if (first_pkg =3D=3D 0) {
-								fprintf(reportout.csv_report, "%s,%s,,",
-									_core->fill_pstate_name(line, buffer),
-									_core->fill_pstate_line(line, buffer2));
-							} else {
-								fprintf(reportout.csv_report, ",,%s,%s,,",
-									_core->fill_pstate_name(line, buffer),
-									_core->fill_pstate_line(line, buffer2));
-
-							}
-						}
-					}else {
-						if (reporttype)	{
-							fprintf(reportout.http_report,
-								"<td class=3D\"%s\" width=3D\"10%%\">%s</td><td class=3D\"%s\">%s<=
/td>",
-								freq_class(line),
-								_core->fill_pstate_name(line, buffer),
-								core_class(line),
-								_core->fill_pstate_line(line, buffer2));
-						} else {
-							if (first_pkg =3D=3D 0) {
-								fprintf(reportout.csv_report, "%s,%s,",
-									_core->fill_pstate_name(line, buffer),
-									_core->fill_pstate_line(line, buffer2));
-							} else {
-								fprintf(reportout.csv_report, ",,%s,%s,",
-									_core->fill_pstate_name(line, buffer),
-									_core->fill_pstate_line(line, buffer2));
-							}
-						}
+						report.begin_cell(CELL_CORE_HEADER);
+						report.addf(__("Core %i"), _core->get_number());
+					} else {
+						report.begin_cell(CELL_STATE_NAME);
+						report.add(_core->fill_pstate_name(line, buffer));
+						report.begin_cell(CELL_PACKAGE_STATE_VALUE);
+						report.add(_core->fill_pstate_line(line, buffer2));
 					}
 				}
 =

-				if (reporttype)
-					fprintf(reportout.http_report,"<td width=3D\"2%%\">&nbsp;</td>");
+				report.begin_cell(CELL_SEPARATOR);
+				report.add_empty_cell();
 =

 				for (cpu =3D 0; cpu < _core->children.size(); cpu++) {
 					buffer[0] =3D 0;
@@ -762,69 +582,28 @@ void report_display_cpu_pstates(void)
 					if (!_cpu)
 						continue;
 =

+					report.set_cpu_number(cpu);
 					if (line =3D=3D LEVEL_HEADER) {
-						if (reporttype)
-							fprintf(reportout.http_report,
-								"<th colspan=3D2 class=3D\"cpu_header\">%s</th>",
-								_cpu->fill_pstate_line(line, buffer));
-						else
-							fprintf(reportout.csv_report, "%s,",
-								_cpu->fill_pstate_line(line, buffer));
-					} else {
-						if (first =3D=3D 1) {
-							if (reporttype)
-								fprintf(reportout.http_report,
-									"<td class=3D\"%s\" width=3D\"10%%\">%s</td>",
-									freq_class(line),
-									_cpu->fill_pstate_name(line, buffer));
-							else
-								fprintf(reportout.csv_report,"%s,",
-									_cpu->fill_pstate_name(line, buffer));
-
-							first =3D 0;
-							buffer[0] =3D 0;
-
-							if (reporttype)
-								fprintf(reportout.http_report,"<td class=3D\"%s\">%s</td>",
-									cpu_class(line, cpu),
-									_cpu->fill_pstate_line(line, buffer));
-							else
-								fprintf(reportout.csv_report, "%s,",
-									_cpu->fill_pstate_line(line, buffer));
-
-						} else {
-
-							buffer[0] =3D 0;
-
-							if (reporttype)
-								fprintf(reportout.http_report,
-									"<td colspan=3D2 class=3D\"%s\">%s</td>",
-									cpu_class(line, cpu),
-									_cpu->fill_pstate_line(line, buffer));
-							else
-								fprintf(reportout.csv_report,"%s,",
-									_cpu->fill_pstate_line(line, buffer));
-
-						}
+						report.begin_cell(CELL_CPU_PSTATE_HEADER);
+						report.addf(__("CPU %i"), _cpu->get_number());
+						continue;
+					}
+
+					if (first_cpu) {
+						report.begin_cell(CELL_STATE_NAME);
+						report.add(_cpu->fill_pstate_name(line, buffer));
+						first_cpu =3D false;
 					}
-				}
-				if (reporttype)
-					fprintf(reportout.http_report,"</tr>\n");
-				else
-					fprintf(reportout.csv_report, "\n");
 =

+					buffer[0] =3D 0;
+					report.begin_cell(CELL_CPU_STATE_VALUE);
+					report.add(_cpu->fill_pstate_line(line, buffer));
+				}
 			}
 =

-			first_pkg++;
+			first_core =3D false;
 		}
-
-
 	}
-
-	if (reporttype)
-		fprintf(reportout.http_report,"</table></div>");
-	else
-		fprintf(reportout.csv_report, "\n");
 }
 =

 void impl_w_display_cpu_states(int state)
diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index ec9dbfc..13340a2 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -102,6 +102,7 @@ public:
 =

 =

 	void		set_number(int _number, int cpu) {this->number =3D _number; this->f=
irst_cpu =3D cpu;};
+	int		get_number(void) { return number; };
 =

 	virtual void	measurement_start(void);
 	virtual void	measurement_end(void);
@@ -118,6 +119,8 @@ public:
 	virtual int	has_cstate_level(int level);
 =

 	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char *s=
eparator=3D"") { return buffer;};
+	virtual char *  fill_cstate_percentage(int line_nr, char *buffer) { retur=
n buffer; };
+	virtual char *  fill_cstate_time(int line_nr, char *buffer) { return buff=
er; };
 	virtual char *  fill_cstate_name(int line_nr, char *buffer) { return buff=
er;};
 =

 =

@@ -160,6 +163,8 @@ public:
 =

 	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char *s=
eparator=3D"");
 	virtual char *  fill_cstate_name(int line_nr, char *buffer);
+	virtual char *  fill_cstate_percentage(int line_nr, char *buffer);
+	virtual char *  fill_cstate_time(int line_nr, char *buffer);
 =

 	virtual char *  fill_pstate_line(int line_nr, char *buffer);
 	virtual char *  fill_pstate_name(int line_nr, char *buffer);
diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
index 6a48a8a..593d5f6 100644
--- a/src/cpu/cpu_core.cpp
+++ b/src/cpu/cpu_core.cpp
@@ -42,11 +42,6 @@ char * cpu_core::fill_cstate_line(int line_nr, char *buf=
fer, const char *separat
 	unsigned int i;
 	buffer[0] =3D 0;
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("  Core"));
-		return buffer;
-	}
-
 	for (i =3D 0; i < cstates.size(); i++) {
 		if (cstates[i]->line_level !=3D line_nr)
 			continue;
@@ -186,15 +181,9 @@ char * cpu_core::fill_pstate_line(int line_nr, char *b=
uffer)
 			total_stamp =3D 1;
 	}
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("  Core"));
-		return buffer;
-	}
-
 	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

-
 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
 	return buffer;
 }
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index ab37d57..f5e269e 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -227,19 +227,55 @@ char * cpu_linux::fill_cstate_line(int line_nr, char =
*buffer, const char *separa
 	unsigned int i;
 	buffer[0] =3D 0;
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_(" CPU %i"), number);
-		return buffer;
-	}
-
 	for (i =3D 0; i < cstates.size(); i++) {
 		if (cstates[i]->line_level !=3D line_nr)
 			continue;
 =

 		if (line_nr =3D=3D LEVEL_C0)
-			sprintf(buffer,"%5.1f%%%s", percentage(cstates[i]->duration_delta / tim=
e_factor), separator);
+			sprintf(buffer,"%5.1f%%", percentage(cstates[i]->duration_delta / time_=
factor));
 		else
-			sprintf(buffer,"%5.1f%%%s %6.1f ms", percentage(cstates[i]->duration_de=
lta / time_factor), separator, 1.0 * cstates[i]->duration_delta / (1+cstate=
s[i]->usage_delta) / 1000);
+			sprintf(buffer,"%5.1f%%%s %6.1f ms",
+				percentage(cstates[i]->duration_delta / time_factor),
+				separator,
+				1.0 * cstates[i]->duration_delta / (1 + cstates[i]->usage_delta) / 100=
0);
+	}
+
+	return buffer;
+}
+
+char * cpu_linux::fill_cstate_percentage(int line_nr, char *buffer)
+{
+	unsigned int i;
+	buffer[0] =3D 0;
+
+	for (i =3D 0; i < cstates.size(); i++) {
+		if (cstates[i]->line_level !=3D line_nr)
+			continue;
+
+		sprintf(buffer,"%5.1f%%",
+			percentage(cstates[i]->duration_delta / time_factor));
+		break;
+	}
+
+	return buffer;
+}
+
+char * cpu_linux::fill_cstate_time(int line_nr, char *buffer)
+{
+	unsigned int i;
+	buffer[0] =3D 0;
+
+	if (line_nr =3D=3D LEVEL_C0)
+		return buffer;
+
+	for (i =3D 0; i < cstates.size(); i++) {
+		if (cstates[i]->line_level !=3D line_nr)
+			continue;
+
+		sprintf(buffer,"%6.1f ms",
+			1.0 * cstates[i]->duration_delta /
+			(1 + cstates[i]->usage_delta) / 1000);
+		break;
 	}
 =

 	return buffer;
@@ -285,11 +321,6 @@ char * cpu_linux::fill_pstate_line(int line_nr, char *=
buffer)
 			total_stamp =3D 1;
 	}
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_(" CPU %i"), number);
-		return buffer;
-	}
-
 	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
index 71cc7e6..2e2e8a3 100644
--- a/src/cpu/cpu_package.cpp
+++ b/src/cpu/cpu_package.cpp
@@ -42,11 +42,6 @@ char * cpu_package::fill_cstate_line(int line_nr, char *=
buffer, const char *sepa
 	unsigned int i;
 	buffer[0] =3D 0;
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("Package"));
-		return buffer;
-	}
-
 	for (i =3D 0; i < cstates.size(); i++) {
 		if (cstates[i]->line_level !=3D line_nr)
 			continue;
@@ -99,16 +94,9 @@ char * cpu_package::fill_pstate_line(int line_nr, char *=
buffer)
 			total_stamp =3D 1;
 	}
 =

-
-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("  Package"));
-		return buffer;
-	}
-
 	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

-
 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
 	return buffer;
 }
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 3505294..24465a0 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -292,15 +292,9 @@ char * nhm_core::fill_pstate_line(int line_nr, char *b=
uffer)
 			total_stamp =3D 1;
 	}
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("  Core"));
-		return buffer;
-	}
-
 	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

-
 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
 	return buffer;
 }
@@ -317,16 +311,9 @@ char * nhm_package::fill_pstate_line(int line_nr, char=
 *buffer)
 			total_stamp =3D 1;
 	}
 =

-
-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_("  Package"));
-		return buffer;
-	}
-
 	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

-
 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
 	return buffer;
 }
@@ -601,11 +588,6 @@ char * nhm_cpu::fill_pstate_line(int line_nr, char *bu=
ffer)
 			total_stamp =3D 1;
 	}
 =

-	if (line_nr =3D=3D LEVEL_HEADER) {
-		sprintf(buffer,_(" CPU %i"), number);
-		return buffer;
-	}
-
 	if (line_nr =3D=3D LEVEL_C0) {
 		double F;
 		F =3D 1.0 * (tsc_after - tsc_before) * (aperf_after - aperf_before) / (m=
perf_after - mperf_before) / time_factor * 1000;
@@ -615,7 +597,6 @@ char * nhm_cpu::fill_pstate_line(int line_nr, char *buf=
fer)
 	if (line_nr >=3D (int)pstates.size() || line_nr < 0)
 		return buffer;
 =

-
 	sprintf(buffer," %5.1f%% ", percentage(1.0* (pstates[line_nr]->time_after=
) / total_stamp));
 	return buffer;
 =

diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index 2556439..01e37b4 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -48,6 +48,7 @@ using namespace std;
 #include "../display.h"
 #include "../lib.h"
 #include "../report.h"
+#include "../report/report-maker.h"
 #include "../measurement/measurement.h"
 #include "../devlist.h"
 #include <unistd.h>
@@ -213,116 +214,81 @@ void report_devices(void)
 	}
 }
 =

-static const char *line_class(int line)
-{
-	if (line & 1) {
-		return "device_odd";
-	}
-	return "device_even";
-}
-
 void show_report_devices(void)
 {
 	unsigned int i;
 	int show_power;
 	double pw;
 =

-	char util[128];
-	char power[128];
-
-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
-
 	show_power =3D global_power_valid();
-
 	sort(all_devices.begin(), all_devices.end(), power_device_sort);
 =

-	if (reporttype)
-		fprintf(reportout.http_report,
-			"<div id=3D\"device\"><h2>Device Power Report</h2>\n");
-	else
-		fprintf(reportout.csv_report,
-			"**Device Power Report**,\n");
-
-
+	report.begin_section(SECTION_DEVPOWER);
+	report.add_header("Device Power Report");
 =

 	pw =3D global_joules_consumed();
 	if (pw > 0.0001) {
 		char buf[32];
-		if (reporttype)
-			fprintf(reportout.http_report,
-				"<p>The battery reports a discharge rate of %sW</p>\n",
-				fmt_prefix(pw, buf));
-		else
-			fprintf(reportout.csv_report,
-				"The battery reports a discharge rate of:, %sW, \n",
-				fmt_prefix(pw, buf));
+
+		report.begin_paragraph();
+		report.addf("The battery reports a discharge rate of %sW",
+			    fmt_prefix(pw, buf));
 	}
 =

 	if (show_power) {
 		char buf[32];
-		if (reporttype) {
-			fprintf(reportout.http_report,
-				"<p>System baseline power is estimated at %sW</p>\n <table width=3D\"1=
00%%\">\n",
-				fmt_prefix(get_parameter_value("base power"), buf));
-			fprintf(reportout.http_report,
-				"<tr><th width=3D\"10%%\">Power est.</th><th width=3D\"10%%\">Usage</t=
h><th class=3D\"device\">Device name</th></tr>\n");
-		} else {
-			fprintf(reportout.csv_report,
-				"System baseline power is estimated at:,  %sW, \n\n",
-				fmt_prefix(get_parameter_value("base power"), buf));
-			fprintf(reportout.csv_report,
-				"Power est.:, Usage:,  Device name:, \n");
-		}
-	}else {
-		if (reporttype)
-			fprintf(reportout.http_report,
-					" <table width=3D\"100%%\">\n <tr><th width=3D\"10%%\">Usage</th><th =
class=3D\"device\">Device name</th></tr>\n");
-		else
-			fprintf(reportout.csv_report,
-					"Usage:, Device name:, \n");
+
+		report.begin_paragraph();
+		report.addf("System baseline power is estimated at %sW",
+			    fmt_prefix(get_parameter_value("base power"), buf));
 	}
 =

+	report.begin_table(TABLE_WIDE);
+	report.begin_row();
+	if (show_power) {
+		report.begin_cell(CELL_DEVPOWER_HEADER);
+		report.add("Power est.");
+	}
+
+	report.begin_cell(CELL_DEVPOWER_HEADER);
+	report.add("Usage");
+	report.begin_cell(CELL_DEVPOWER_DEV_NAME);
+	report.add("Device name");
+
 	for (i =3D 0; i < all_devices.size(); i++) {
 		double P;
+		char util[128];
+		char power[128];
 =

 		util[0] =3D 0;
-
 		if (all_devices[i]->util_units()) {
 			if (all_devices[i]->utilization() < 1000)
-				sprintf(util, "%5.1f%s",  all_devices[i]->utilization(),  all_devices[=
i]->util_units());
+				sprintf(util, "%5.1f%s",
+					all_devices[i]->utilization(),
+					all_devices[i]->util_units());
 			else
-				sprintf(util, "%5i%s",  (int)all_devices[i]->utilization(),  all_devic=
es[i]->util_units());
+				sprintf(util, "%5i%s",
+					(int)all_devices[i]->utilization(),
+					all_devices[i]->util_units());
 		}
 =

 		P =3D all_devices[i]->power_usage(&all_results, &all_parameters);
-
 		format_watts(P, power, 11);
 =

 		if (!show_power || !all_devices[i]->power_valid())
 			strcpy(power, "           ");
 =

-
-
+		report.begin_row(ROW_DEVPOWER);
 		if (show_power) {
-			if (reporttype)
-				fprintf(reportout.http_report,"<tr class=3D\"%s\"><td class=3D\"device=
_power\">%s</td><td class=3D\"device_util\">%s</td><td>%s</td></tr>\n",
-					line_class(i), power, util, all_devices[i]->human_name());
-			else
-				fprintf(reportout.csv_report,"%s, %s, \"%s\", \n", power, util, all_de=
vices[i]->human_name());
-
-		} else {
-			if (reporttype)
-				fprintf(reportout.http_report,"<tr class=3D\"%s\"><td class=3D\"device=
_util\">%s</td><td>%s</td></tr>\n",
-					line_class(i), util, all_devices[i]->human_name());
-			else
-				fprintf(reportout.csv_report,"%s, \"%s\", \n", util, all_devices[i]->h=
uman_name());
+			report.begin_cell(CELL_DEVPOWER_POWER);
+			report.add(power);
 		}
+
+		report.begin_cell(CELL_DEVPOWER_UTIL);
+		report.add(util);
+		report.begin_cell();
+		report.add(all_devices[i]->human_name());
 	}
-	if (reporttype)
-		fprintf(reportout.http_report, "</table>\n");
-	else
-		fprintf(reportout.csv_report,"\n");
 }
 =

 =

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 71898af..c5d65e6 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -43,6 +43,7 @@ using namespace std;
 #include "devlist.h"
 #include "lib.h"
 #include "report.h"
+#include "report/report-maker.h"
 =

 #include "process/process.h"
 #include "devices/device.h"
@@ -277,23 +278,12 @@ static bool devlist_sort(struct devuser * i, struct d=
evuser * j)
 	return (strcmp(i->device, j->device)< 0);
 }
 =

-static const char *dev_class(int line)
-{
-	if (line & 1) {
-		return "device_odd";
-	}
-	return "device_even";
-}
-
 void report_show_open_devices(void)
 {
 	vector<struct devuser *> *target;
 	unsigned int i;
 	char prev[128], proc[128];
 =

-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
-
 	prev[0] =3D 0;
 =

 	if (phase =3D=3D 1)
@@ -306,13 +296,13 @@ void report_show_open_devices(void)
 =

 	sort(target->begin(), target->end(), devlist_sort);
 =

-	if (reporttype) {
-		fprintf(reportout.http_report,"<h2>Process device activity</h2>\n <table=
 width=3D\"100%%\">\n");
-		fprintf(reportout.http_report,"<tr><th class=3D\"device\" width=3D\"40%%=
\">Process</th><th class=3D\"device\">Device</th></tr>\n");
-	}else {
-		fprintf(reportout.csv_report,"**Process Device Activity**, \n\n");
-		fprintf(reportout.csv_report,"Process, Device, \n");
-	}
+	report.add_header("Process device activity");
+	report.begin_table(TABLE_WIDE);
+	report.begin_row();
+	report.begin_cell(CELL_DEVACTIVITY_PROCESS);
+	report.add("Process");
+	report.begin_cell(CELL_DEVACTIVITY_DEVICE);
+	report.add("Device");
 =

 	for (i =3D 0; i < target->size(); i++) {
 		proc[0] =3D 0;
@@ -320,19 +310,11 @@ void report_show_open_devices(void)
 		if (strcmp(prev, (*target)[i]->comm) !=3D 0)
 			sprintf(proc, "%s", (*target)[i]->comm);
 =

-		if (reporttype)
-			fprintf(reportout.http_report,
-				"<tr class=3D\"%s\"><td>%s</td><td>%s</td></tr>\n",
-				dev_class(i), proc, (*target)[i]->device);
-		 else
-			fprintf(reportout.csv_report,
-				"%s, %s, \n",
-				proc, (*target)[i]->device);
-
+		report.begin_row(ROW_DEVPOWER);
+		report.begin_cell();
+		report.add(proc);
+		report.begin_cell();
+		report.add((*target)[i]->device);
 		sprintf(prev, "%s", (*target)[i]->comm);
 	}
-	if (reporttype)
-		fprintf(reportout.http_report,"</table></div>\n");
-	else
-		fprintf(reportout.csv_report,"\n");
 }
diff --git a/src/main.cpp b/src/main.cpp
index 02e9f63..7971f2b 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -236,7 +236,7 @@ void out_of_memory()
 	abort();
 }
 =

-void report(int time, char *workload, int iterations, char *file)
+void make_report(int time, char *workload, int iterations, char *file)
 {
 =

 	/* one to warm up everything */
@@ -336,7 +336,6 @@ int main(int argc, char **argv)
 {
 	int option_index;
 	int c;
-	bool wantreport =3D false;
 	char filename[4096];
 	char workload[4096] =3D {0,};
 	int  iterations =3D 1;
@@ -374,8 +373,7 @@ int main(int argc, char **argv)
 				break;
 =

 			case 'h': /* html report */
-				wantreport =3D true;
-				reporttype =3D 1;
+				reporttype =3D REPORT_HTML;
 				sprintf(filename, "%s", optarg ? optarg : "powertop.html" );
 				break;
 =

@@ -395,8 +393,7 @@ int main(int argc, char **argv)
 				break;
 =

 			case 'C': /* csv report*/
-				wantreport =3D true;
-				reporttype =3D 0;
+				reporttype =3D REPORT_CSV;
 				sprintf(filename, "%s", optarg ? optarg : "powertop.csv");
 				break;
 			case '?': /* Unknown option */
@@ -408,8 +405,8 @@ int main(int argc, char **argv)
 =

 	powertop_init();
 =

-	if (wantreport)
-		report(time_out, workload, iterations, filename);
+	if (reporttype !=3D REPORT_OFF)
+		make_report(time_out, workload, iterations, filename);
 =

 	if (debug_learning)
 		printf("Learning debugging enabled\n");
diff --git a/src/powertop.css b/src/powertop.css
index 5d303dc..c73d3e2 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -292,6 +292,11 @@ th.process
 	text-align: left;
 }
 =

+th.tunable
+{
+	text-align: left;
+}
+
 td.package_odd
 {
 	background-color: #E0ffE0;
@@ -542,3 +547,8 @@ p.hide {
 </head>
 =

 <body>
+
+<div id=3D'top'>
+<h1><a href=3D'#top'>&nbsp;</a></h1>
+</div>
+
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 238ae59..7c61947 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -29,6 +29,7 @@
 #include "processdevice.h"
 #include "../lib.h"
 #include "../report.h"
+#include "../report/report-maker.h"
 #include "../devlist.h"
 =

 #include <vector>
@@ -894,47 +895,41 @@ void process_update_display(void)
 	}
 }
 =

-static const char *process_class(int line)
-{
-	if (line & 1) {
-		return "process_odd";
-	}
-	return "process_even";
-}
-
 void report_process_update_display(void)
 {
-	unsigned int i, lines =3D 0;
+	unsigned int i;
 	unsigned int total;
 =

 	int show_power;
 =

-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
-
 	sort(all_power.begin(), all_power.end(), power_cpu_sort);
 =

 	show_power =3D global_power_valid();
 =

-	if (reporttype){
-		fprintf(reportout.http_report,
-			"<div id=3D\"software\"><h2>%s</h2>\n <table width=3D\"100%%\">\n",_("O=
verview of Software Power Consumers"));
-		if (show_power)
-			fprintf(reportout.http_report,
-				"<tr><th width=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th><th width=
=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th>=
<th width=3D\"10%%\">%s</th><th width=3D\"10%%\" class=3D\"process\">%s</th=
><th class=3D\"process\">%s</th></tr>\n",_("Power est."), _("Usage"), _("Wa=
keups/s"),_("GPU ops/s"),_("Disk IO/s"), _("GFX Wakeups/s"),_("Category"),_=
("Description"));
-		else
-			fprintf(reportout.http_report,
-				"<tr><th width=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th><th width=
=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th>=
<th width=3D\"10%%\" class=3D\"process\">%s</th><th class=3D\"process\">%s<=
/th></tr>\n",_("Usage"), _("Wakeups/s"),_("GPU ops/s"),_("Disk IO/s"), _("G=
FX Wakeups/s"),_("Category"),_("Description"));
-	}else {
-		fprintf(reportout.csv_report,"**Overview of Software Power Consumers**, =
\n\n");
-		if (show_power)
-			fprintf(reportout.csv_report,
-				"Power est., Usage, Wakeups, GPU ops, Disk IO, GFX Wakeups, Category, =
Description, \n");
-		else
-			fprintf(reportout.csv_report,
-				"Usage,  Wakeups, GPU ops, Disk IO, GFX Wakeups, Category, Description=
, \n");
+	report.begin_section(SECTION_SOFTWARE);
+	report.add_header(__("Overview of Software Power Consumers"));
+	report.begin_table(TABLE_WIDE);
+	report.begin_row();
+	if (show_power) {
+		report.begin_cell(CELL_SOFTWARE_HEADER);
+		report.add(__("Power est."));
 	}
 =

+	report.begin_cell(CELL_SOFTWARE_HEADER);
+	report.add(__("Usage"));
+	report.begin_cell(CELL_SOFTWARE_HEADER);
+	report.add(__("Wakeups/s"));
+	report.begin_cell(CELL_SOFTWARE_HEADER);
+	report.add(__("GPU ops/s"));
+	report.begin_cell(CELL_SOFTWARE_HEADER);
+	report.add(__("Disk IO/s"));
+	report.begin_cell(CELL_SOFTWARE_HEADER);
+	report.add(__("GFX Wakeups/s"));
+	report.begin_cell(CELL_SOFTWARE_PROCESS);
+	report.add(__("Category"));
+	report.begin_cell(CELL_SOFTWARE_DESCRIPTION);
+	report.add(__("Description"));
+
 	total =3D all_power.size();
 =

 	if (total > 100)
@@ -951,7 +946,6 @@ void report_process_update_display(void)
 		char descr[128];
 		format_watts(all_power[i]->Witts(), power, 10);
 =

-
 		if (!show_power)
 			strcpy(power, "          ");
 		sprintf(name, "%s", all_power[i]->type());
@@ -959,8 +953,6 @@ void report_process_update_display(void)
 		if (strcmp(name, "Device") =3D=3D 0)
 			continue;
 =

-		lines++;
-
 		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&=
 all_power[i]->Witts() =3D=3D 0)
 			break;
 =

@@ -975,7 +967,8 @@ void report_process_update_display(void)
 		if (all_power[i]->wake_ups / measurement_time <=3D 0.3)
 			sprintf(wakes, "%5.2f", all_power[i]->wake_ups / measurement_time);
 		sprintf(gpus, "%5.1f", all_power[i]->gpu_ops / measurement_time);
-		sprintf(disks, "%5.1f (%5.1f)", all_power[i]->hard_disk_hits / measureme=
nt_time, all_power[i]->disk_hits / measurement_time);
+		sprintf(disks, "%5.1f (%5.1f)", all_power[i]->hard_disk_hits / measureme=
nt_time,
+			all_power[i]->disk_hits / measurement_time);
 		sprintf(xwakes, "%5.1f", all_power[i]->xwakes / measurement_time);
 		if (!all_power[i]->show_events()) {
 			wakes[0] =3D 0;
@@ -992,74 +985,64 @@ void report_process_update_display(void)
 		if (all_power[i]->xwakes =3D=3D 0)
 			xwakes[0] =3D 0;
 =

+		report.begin_row(ROW_SOFTWARE);
 		if (show_power) {
-			if (reporttype)
-				fprintf(reportout.http_report,"<tr class=3D\"%s\"><td class=3D\"proces=
s_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"process=
_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"process_=
power\">%s</td><td class=3D\"process_power\">%s</td><td>%s</td><td>%s</td><=
/tr>\n",
-					process_class(lines), power, usage, wakes, gpus, disks, xwakes, name,=
 pretty_print(all_power[i]->description(), descr, 128));
-			else
-				fprintf(reportout.csv_report,"%s, %s, %s, %s, %s, %s, %s, %s,\n",
-					power, usage, wakes, gpus, disks, xwakes, name,
-					pretty_print(all_power[i]->description(), descr, 128));
-
-		} else {
-			if (reporttype)
-				fprintf(reportout.http_report,"<tr class=3D\"%s\"><td class=3D\"proces=
s_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"process=
_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"process_=
power\">%s</td><td>%s</td><td>%s</td></tr>\n",
-					process_class(lines), usage, wakes, gpus, disks, xwakes, name, pretty=
_print(all_power[i]->description(), descr, 128));
-			else
-				fprintf(reportout.csv_report,"%s, %s, %s, %s, %s, %s, %s, \n",
-					usage, wakes, gpus, disks, xwakes, name,
-					pretty_print(all_power[i]->description(), descr, 128));
+			report.begin_cell(CELL_SOFTWARE_POWER);
+			report.add(power);
 		}
+		=

+		report.begin_cell(CELL_SOFTWARE_POWER);
+		report.add(usage);
+		report.begin_cell(CELL_SOFTWARE_POWER);
+		report.add(wakes);
+		report.begin_cell(CELL_SOFTWARE_POWER);
+		report.add(gpus);
+		report.begin_cell(CELL_SOFTWARE_POWER);
+		report.add(disks);
+		report.begin_cell(CELL_SOFTWARE_POWER);
+		report.add(xwakes);
+		report.begin_cell();
+		report.add(name);
+		report.begin_cell();
+		report.add(pretty_print(all_power[i]->description(), descr, 128));
 	}
-	if (reporttype)
-		fprintf(reportout.http_report,"</table></div>\n");
-	else
-		fprintf(reportout.csv_report,"\n");
 }
 =

 void report_summary(void)
 {
-	unsigned int i, lines =3D 0;
+	unsigned int i;
 	unsigned int total;
-
 	int show_power;
 =

-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
-
 	sort(all_power.begin(), all_power.end(), power_cpu_sort);
-
 	show_power =3D global_power_valid();
 =

-	if (reporttype) {
-		fprintf(reportout.http_report,
-			"<div id=3D\"summary\"><h2>%s</h2>\n",_("Power Consumption Summary"));
-		fprintf(reportout.http_report,
-			"<p>%3.1f %s,  %3.1f %s, %3.1f %s, %3.1f %s %3.1f%% %s</p>\n <table wid=
th=3D\"100%%\">\n",
-			total_wakeups(), _("wakeups/second"), total_gpu_ops(),_("GPU ops/second=
"), total_disk_hits(),
-			_("VFS ops/sec"), total_xwakes(),_("GFX wakes/sec and"), total_cpu_time=
()*100, _("CPU use"));
-
-		if (show_power)
-			fprintf(reportout.http_report,
-			"<tr><th width=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th><th width=
=3D\"10%%\">%s</th><th width=3D\"10%%\" class=3D\"process\">%s</th><th clas=
s=3D\"process\">%s</th></tr>\n", _("Power est."), _("Usage"), _("Events/s")=
,_("Category"),_("Description"));
-
-		else
-		fprintf(reportout.http_report,
-		"<tr><th width=3D\"10%%\">%s</th><th width=3D\"10%%\">%s</th><th width=
=3D\"10%%\" class=3D\"process\">%s</th><th class=3D\"process\">%s</th></tr>=
\n", _("Usage"), _("Events/s"),_("Category"),_("Description"));
-
-	}else {
-		fprintf(reportout.csv_report,
-			"**Power Consumption Summary** \n");
-		fprintf(reportout.csv_report,
-			"%3.1f wakeups/second,  %3.1f GPU ops/second, %3.1f VFS ops/sec, %3.1f =
GFX wakes/sec and %3.1f%% CPU use \n\n",
-			total_wakeups(), total_gpu_ops(), total_disk_hits(), total_xwakes(), to=
tal_cpu_time()*100);
+	report.begin_section(SECTION_SUMMARY);
+	report.add_header(__("Power Consumption Summary"));
+	report.begin_paragraph();
+	report.addf("%.1f %s, %.1f %s, %.1f %s, %.1f %s %.1f%% %s",
+		    total_wakeups(),	 __("wakeups/second"),
+		    total_gpu_ops(),	 __("GPU ops/second"),
+		    total_disk_hits(),	 __("VFS ops/sec"),
+		    total_xwakes(),	 __("GFX wakes/sec and"),
+		    total_cpu_time() * 100, __("CPU use"));
+
+	report.begin_table(TABLE_WIDE);
+	report.begin_row();
+	if (show_power) {
+		report.begin_cell(CELL_SUMMARY_HEADER);
+		report.add(__("Power est."));
+	}
 =

-		if (show_power)
-			fprintf(reportout.csv_report,"Power est., Usage, Events/s, Category,  D=
escription, \n");
-        else
-			fprintf(reportout.csv_report,"Usage, Events/s, Category, Description, \=
n");
+	report.begin_cell(CELL_SUMMARY_HEADER);
+	report.add(__("Usage"));
+	report.begin_cell(CELL_SUMMARY_HEADER);
+	report.add(__("Events/s"));
+	report.begin_cell(CELL_SUMMARY_CATEGORY);
+	report.add(__("Category"));
+	report.begin_cell(CELL_SUMMARY_DESCRIPTION);
+	report.add(__("Description"));
 =

-	}
 	total =3D all_power.size();
 	if (total > 10)
 		total =3D 10;
@@ -1072,25 +1055,25 @@ void report_summary(void)
 		char descr[128];
 		format_watts(all_power[i]->Witts(), power, 10);
 =

-
 		if (!show_power)
 			strcpy(power, "          ");
 		sprintf(name, "%s", all_power[i]->type());
 =

-		lines++;
-
-		if (lines > total)
+		if (i > total)
 			break;
 =

-		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&=
 all_power[i]->Witts() =3D=3D 0)
+		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&
+		    all_power[i]->Witts() =3D=3D 0)
 			break;
 =

 		usage[0] =3D 0;
 		if (all_power[i]->usage_units()) {
 			if (all_power[i]->usage() < 1000)
-				sprintf(usage, "%5.1f%s", all_power[i]->usage_summary(), all_power[i]-=
>usage_units_summary());
+				sprintf(usage, "%5.1f%s", all_power[i]->usage_summary(),
+					all_power[i]->usage_units_summary());
 			else
-				sprintf(usage, "%5i%s", (int)all_power[i]->usage_summary(), all_power[=
i]->usage_units_summary());
+				sprintf(usage, "%5i%s", (int)all_power[i]->usage_summary(),
+					all_power[i]->usage_units_summary());
 		}
 		sprintf(events, "%5.1f", all_power[i]->events());
 		if (!all_power[i]->show_events())
@@ -1098,27 +1081,21 @@ void report_summary(void)
 		else if (all_power[i]->events() <=3D 0.3)
 			sprintf(events, "%5.2f", all_power[i]->events());
 =

+		report.begin_row(ROW_SUMMARY);
 		if (show_power) {
-			if (reporttype)
-				fprintf(reportout.http_report,"<tr class=3D\"%s\"><td class=3D\"proces=
s_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"process=
_power\">%s</td><td>%s</td><td>%s</td></tr>\n",
-					process_class(lines), power, usage, events, name, pretty_print(all_po=
wer[i]->description(), descr, 128));
-			else
-				fprintf(reportout.csv_report,"%s,%s,%s,%s,%s \n",
-					power, usage, events, name, pretty_print(all_power[i]->description(),=
 descr, 128));
-		} else {
-			if (reporttype)
-				fprintf(reportout.http_report,
-					"<tr class=3D\"%s\"><td class=3D\"process_power\">%s</td><td class=3D=
\"process_power\">%s</td><td>%s</td><td>%s</td></tr>\n",
-					process_class(lines),usage, events, name, pretty_print(all_power[i]->=
description(), descr, 128));
-			else
-				fprintf(reportout.csv_report,"%s,%s,%s,%s, \n",
-					usage, events, name, pretty_print(all_power[i]->description(), descr,=
 128));
+			report.begin_cell(CELL_SUMMARY_ITEM);
+			report.add(power);
 		}
+
+		report.begin_cell(CELL_SUMMARY_ITEM);
+		report.add(usage);
+		report.begin_cell(CELL_SUMMARY_ITEM);
+		report.add(events);
+		report.begin_cell();
+		report.add(name);
+		report.begin_cell();
+		report.add(pretty_print(all_power[i]->description(), descr, 128));
 	}
-	if (reporttype)
-		fprintf(reportout.http_report,"</table></div>\n");
-	else
-		fprintf(reportout.csv_report,"\n");
 }
 =

 =

diff --git a/src/report.cpp b/src/report.cpp
index 6776b30..a2000c9 100644
--- a/src/report.cpp
+++ b/src/report.cpp
@@ -24,9 +24,9 @@
  *  Chris Ferron <chris.e.ferron(a)linux.intel.com>
  */
 =

-#include "css.h"
 #include "lib.h"
 #include "report.h"
+#include "report/report-maker.h"
 #include <errno.h>
 #include <string.h>
 #include <utility>
@@ -39,23 +39,8 @@
 using namespace std;
 =

 struct reportstream reportout;
-bool reporttype;
-
-static void css_header(void)
-{
-	if (!reportout.http_report)
-		return;
-
-
-#ifdef EXTERNAL_CSS_FILE
-	if (reporttype)
-		fprintf(reportout.http_report, "<link rel=3D\"stylesheet\" href=3D\"powe=
rtop.css\">\n");
-#else
-	if (reporttype) {
-		fprintf(reportout.http_report, "%s\n", css);
-	}
-#endif
-}
+report_type reporttype =3D REPORT_OFF;
+report_maker report(REPORT_OFF);
 =

 string cpu_model(void)
 {
@@ -115,46 +100,38 @@ static string read_os_release(const string &filename)
 static void system_info(void)
 {
 	string str, str2, str3;
-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
 =

-	if (reporttype) {
-		fprintf(reportout.http_report, "<div id=3D\"top\">\n<h1><a href=3D\"#top=
\">&nbsp;</a></h1>\n</div>\n<div id=3D\"system\">\n<table>");
-		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td width=3D=
\"20%%\">PowerTOP Version</td><td>%s</td></tr>\n", POWERTOP_VERSION);
-	} else {
-		fprintf(reportout.csv_report, "***PowerTOP Report***, \n");
-		fprintf(reportout.csv_report, "**System Information**, \n");
-		fprintf(reportout.csv_report, "\n");
-		fprintf(reportout.csv_report,  "PowerTOP Version:, \"%s\", \n", POWERTOP=
_VERSION);
-	}
-	str =3D read_sysfs_string("/proc/version");
+	report.begin_section(SECTION_SYSINFO);
+	report.add_header("System Information");
+	report.begin_table();
+	report.begin_row(ROW_SYSINFO);
+	report.begin_cell(CELL_SYSINFO);
+	report.add("PowerTOP Version");
+	report.begin_cell();
+	report.add(POWERTOP_VERSION);
 =

-	if (reporttype)
-		fprintf(reportout.http_report,"<tr class=3D\"system_odd\"><td>Kernel Ver=
sion</td><td>%s</td></tr>\n",
-				str.c_str());
-	else
-		fprintf(reportout.csv_report, "Kernel Version:, \"%s\", \n",
-				str.c_str());
+	str =3D read_sysfs_string("/proc/version");
+	report.begin_row(ROW_SYSINFO);
+	report.begin_cell();
+	report.add("Kernel Version");
+	report.begin_cell();
+	report.add(str.c_str());
 =

-	str =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_vendor");
+	str  =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_vendor");
 	str2 =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_name");
 	str3 =3D read_sysfs_string("/sys/devices/virtual/dmi/id/product_version");
-
-	if (reporttype)
-		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td>System N=
ame</td><td>%s %s %s</td></tr>\n",
-				str.c_str(), str2.c_str(), str3.c_str());
-	else
-		fprintf(reportout.csv_report,"System Name:,\"%s %s %s\", \n",
-				str.c_str(), str2.c_str(), str3.c_str());
+	report.begin_row(ROW_SYSINFO);
+	report.begin_cell();
+	report.add("System Name");
+	report.begin_cell();
+	report.addf("%s %s %s", str.c_str(), str2.c_str(), str3.c_str());
 =

 	str =3D cpu_model();
-
-	if (reporttype)
-		fprintf(reportout.http_report, "<tr class=3D\"system_odd\"><td>CPU Infor=
mation</td><td>%lix %s</td></tr>\n",
-			 sysconf(_SC_NPROCESSORS_ONLN), str.c_str());
-	else
-		fprintf(reportout.csv_report,"CPU Information:, %lix \"%s\", \n",
-			 sysconf(_SC_NPROCESSORS_ONLN), str.c_str());
+	report.begin_row(ROW_SYSINFO);
+	report.begin_cell();
+	report.add("CPU Information");
+	report.begin_cell();
+	report.addf("%lix %s", sysconf(_SC_NPROCESSORS_ONLN), str.c_str());
 =

 	str =3D read_sysfs_string("/etc/system-release");
 	if (str.length() < 1)
@@ -162,28 +139,24 @@ static void system_info(void)
 	if (str.length() < 1)
 		str =3D read_os_release("/etc/os-release");
 =

-	if (reporttype) {
-		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td>OS Infor=
mation</td><td>%s</td></tr>\n",
-				 str.c_str());
-		fprintf(reportout.http_report,"</table></div>\n");
-	} else {
-		fprintf(reportout.csv_report,"OS Information:,\"%s\", \n",
-				 str.c_str());
-		fprintf(reportout.csv_report,"\n");
-	}
+	report.begin_row(ROW_SYSINFO);
+	report.begin_cell();
+	report.add("OS Information");
+	report.begin_cell();
+	report.add(str.c_str());
 }
 =

-
 void init_report_output(char *filename_str, int iterations)
 {
 	size_t period;
-	char file_prefix[256];
+	char file_prefix[4096];
 	char file_postfix[8];
 	time_t stamp;
 	char datestr[200];
 =

 	string mystring =3D string(filename_str);
-	sprintf(file_postfix, "%s", reporttype ? "html":"csv");
+	sprintf(file_postfix, "%s",
+		(reporttype =3D=3D REPORT_HTML ? "html" : "csv"));
 	period=3Dmystring.find_last_of(".");
 	sprintf(file_prefix, "%s",mystring.substr(0,period).c_str());
 	memset(&datestr, 0, 200);
@@ -198,47 +171,25 @@ void init_report_output(char *filename_str, int itera=
tions)
 		sprintf(reportout.filename, "%s.%s",
 			file_prefix, file_postfix);
 =

-	if (reporttype) {
-		reportout.http_report =3D fopen(reportout.filename, "wm");
-		if (!reportout.http_report) {
-			fprintf(stderr, _("Cannot open output file %s (%s)\n"),
-				reportout.filename, strerror(errno));
-		}
-	}else {
-		reportout.csv_report =3D fopen(reportout.filename, "wm");
-		if (!reportout.csv_report) {
-			fprintf(stderr, _("Cannot open output file %s (%s)\n"),
-				reportout.filename, strerror(errno));
-		}
+	reportout.report_file =3D fopen(reportout.filename, "wm");
+	if (!reportout.report_file) {
+		fprintf(stderr, _("Cannot open output file %s (%s)\n"),
+			reportout.filename, strerror(errno));
 	}
 =

-	http_header_output();
+	report.set_type(reporttype);
 	system_info();
 }
 =

-void http_header_output(void) {
-	if (!reportout.http_report)
-		return;
-
-	css_header();
-
-
-}
-
 void finish_report_output(void)
 {
 	fprintf(stderr, _("PowerTOP outputing using base filename %s\n"), reporto=
ut.filename);
+	if (reporttype =3D=3D REPORT_OFF)
+		return;
 =

-	if (reportout.http_report){
-		fprintf(reportout.http_report, "</body>\n\n </html>\n");
-		fflush(reportout.http_report);
-		fdatasync(fileno(reportout.http_report));
-		fclose(reportout.http_report);
-	}
-	if (reportout.csv_report) {
-		fflush(reportout.csv_report);
-		fdatasync(fileno(reportout.csv_report));
-		fclose(reportout.csv_report);
-	}
-
+	report.finish_report();
+	fputs(report.get_result(), reportout.report_file);
+	fdatasync(fileno(reportout.report_file));
+	fclose(reportout.report_file);
+	report.clear_result();
 }
diff --git a/src/report.h b/src/report.h
index 96aef36..bf8f6de 100644
--- a/src/report.h
+++ b/src/report.h
@@ -28,17 +28,17 @@
 #include <string>
 #include <stdio.h>
 =

+#include "report/report-maker.h"
+
 using namespace std;
 =

 struct reportstream {
-	FILE *http_report;
-	FILE *csv_report;
-	char filename[256];
+	FILE *report_file;
+	char filename[4096];
 };
 =

-void http_header_output(void);
-
-extern bool reporttype;
+extern report_type reporttype;
+extern report_maker report;
 extern struct reportstream reportout;
 extern void init_report_output(char *filename_str, int iterations);
 extern void finish_report_output(void);
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 4893597..69f0783 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -40,6 +40,7 @@
 #include "wifi.h"
 #include "../display.h"
 #include "../report.h"
+#include "../report/report-maker.h"
 #include "../lib.h"
 =

 static void sort_tunables(void);
@@ -190,136 +191,74 @@ void tuning_window::expose(void)
 	repaint();
 }
 =

-static const char *tune_class(int line)
-{
-	if (line & 1) {
-		return "tunable_odd";
-	}
-	return "tunable_even";
-}
-
-static const char *tune_class_bad(int line)
-{
-	if (line & 1) {
-		return "tunable_odd_bad";
-	}
-	return "tunable_even_bad";
-}
-
-
 void report_show_tunables(void)
 {
-	unsigned int i, line;
-	/* three sections; bad, unfixable, good */
-
-	if ((!reportout.csv_report)&&(!reportout.http_report))
-		return;
+	unsigned int i;
+	bool is_header;
+	/* three tables; bad, unfixable, good */
 =

 	sort_tunables();
+	report.begin_section(SECTION_TUNING);
 =

-
-	if (reporttype)
-		fprintf(reportout.http_report, "<div id=3D\"tuning\">\n");
-
-	line =3D 0;
-	for (i =3D 0; i < all_tunables.size(); i++) {
+	for (is_header =3D true, i =3D 0; i < all_tunables.size(); i++) {
 		int gb;
 =

 		gb =3D all_tunables[i]->good_bad();
-
 		if (gb !=3D TUNE_BAD)
 			continue;
 =

-		if (line =3D=3D 0) {
-			if(reporttype)
-				fprintf(reportout.http_report,"<h2>Software Settings in need of Tuning=
</h2>\n <table width=3D\"100%%\">\n");
-			else
-				fprintf(reportout.csv_report,"**Software Settings in need of Tuning**,=
 \n\n");
-
+		if (is_header) {
+			report.add_header("Software Settings in need of Tuning");
+			report.begin_table(TABLE_WIDE);
+			report.begin_row();
+			report.begin_cell(CELL_TUNABLE_HEADER);
+			report.add("Description");
+			report.begin_cell(CELL_TUNABLE_HEADER);
+			report.add("Script");
+			is_header =3D false;
 		}
 =

-		line++;
-		if (i < 1 && !reporttype)
-			fprintf(reportout.csv_report, "Description, \n");
-
-		if (reporttype)
-		        fprintf(reportout.http_report, "<tr class=3D\"%s\"><td>%s</td><t=
d>%s</td></tr>\n", tune_class_bad(line), all_tunables[i]->description(), al=
l_tunables[i]->toggle_script());
-		else
-			fprintf(reportout.csv_report, "\"%s\", \n", all_tunables[i]->descriptio=
n());
+		report.begin_row(ROW_TUNABLE_BAD);
+		report.begin_cell();
+		report.add(all_tunables[i]->description());
+		report.begin_cell();
+		report.add(all_tunables[i]->toggle_script());
 	}
 =

-	if (line > 0) {
-		if(reporttype)
-			fprintf(reportout.http_report,"</table>\n");
-		else
-			fprintf(reportout.csv_report, "\n");
-	}
-
-
-	line =3D 0;
-	for (i =3D 0; i < all_untunables.size(); i++) {
-		if (line =3D=3D 0) {
-			if(reporttype)
-				fprintf(reportout.http_report,
-					"<h2>Untunable Software Issues</h2>\n <table width=3D\"100%%\">\n");
-			else
-				fprintf(reportout.csv_report,
-					"**Untunable Software Issues**,\n\n");
+	for (i =3D 0, is_header =3D true; i < all_untunables.size(); i++) {
+		if (is_header) {
+			report.add_header("Untunable Software Issues");
+			report.begin_table(TABLE_WIDE);
+			report.begin_row();
+			report.begin_cell(CELL_TUNABLE_HEADER);
+			report.add("Description");
+			is_header =3D false;
 		}
 =

-		line++;
-		if (i < 1 && !reporttype)
-			fprintf(reportout.csv_report, "Description, \n");
-
-		if (reporttype)
-			fprintf(reportout.http_report,
-					"<tr class=3D\"%s\"><td>%s</td></tr>\n",
-					tune_class_bad(line), all_untunables[i]->description());
-		else
-			fprintf(reportout.csv_report,"\"%s\", \n", all_untunables[i]->descripti=
on());
+		report.begin_row(ROW_TUNABLE_BAD);
+		report.begin_cell();
+		report.add(all_untunables[i]->description());
 	}
 =

-	if (line > 0) {
-		if(reporttype)
-			fprintf(reportout.http_report,"</table>\n");
-		else
-			fprintf(reportout.csv_report,"\n");
-	}
-
-	line =3D 0;
-	for (i =3D 0; i < all_tunables.size(); i++) {
+	for (i =3D 0, is_header =3D true; i < all_tunables.size(); i++) {
 		int gb;
 =

 		gb =3D all_tunables[i]->good_bad();
-
 		if (gb !=3D TUNE_GOOD)
 			continue;
 =

-		if (line =3D=3D 0) {
-			if (reporttype)
-				fprintf(reportout.http_report,
-					"<h2>Optimal Tuned Software Settings</h2>\n <table width=3D\"100%%\">=
\n");
-			else
-				fprintf(reportout.csv_report,
-					"**Optimal Tuned Software Settings**, \n\n");
+		if (is_header) {
+			report.add_header("Optimal Tuned Software Settings");
+			report.begin_table(TABLE_WIDE);
+			report.begin_row();
+			report.begin_cell(CELL_TUNABLE_HEADER);
+			report.add("Description");
+			is_header =3D false;
 		}
 =

-		line++;
-		if (i < 1 && !reporttype)
-			fprintf(reportout.csv_report, "Description, \n");
-
-		if (reporttype)
-			fprintf(reportout.http_report,"<tr class=3D\"%s\"><td>%s</td></tr>\n",
-			tune_class(line), all_tunables[i]->description());
-		else
-			fprintf(reportout.csv_report,"\"%s\", \n", all_tunables[i]->description=
());
-	}
-
-	if (line > 0){
-		if (reporttype)
-			fprintf(reportout.http_report,"</table></div>\n");
-		else
-			fprintf(reportout.csv_report,"\n");
+		report.begin_row(ROW_TUNABLE);
+		report.begin_cell();
+		report.add(all_tunables[i]->description());
 	}
 }
 =

-- =

1.7.5.4


--===============3405960601613543620==--

