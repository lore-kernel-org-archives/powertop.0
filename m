Content-Type: multipart/mixed; boundary="===============8079268103412374249=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 14/29] report-summary: enable html and csv new
 styles
Date: Wed, 30 Oct 2013 14:21:05 -0700
Message-ID: <1383168080-18233-15-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8079268103412374249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Generates html and csv report with redesign summary.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/process/do_process.cpp          |  122 ++++++++++++++++++++++---------=
----
 src/report/report-data-html.cpp     |   25 +++++++
 src/report/report-data-html.h       |   13 ++++
 src/report/report-formatter-csv.cpp |    4 +-
 4 files changed, 118 insertions(+), 46 deletions(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index d81a2a9..44dd5e0 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -29,6 +29,7 @@
 #include "processdevice.h"
 #include "../lib.h"
 #include "../report/report.h"
+#include "../report/report-data-html.h"
 #include "../report/report-maker.h"
 #include "../devlist.h"
 =

@@ -235,7 +236,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 		field =3D pevent_find_any_field(event, "next_comm");
 		if (!field || !(field->flags & FIELD_IS_STRING))
 			return; /* ?? */
-	=

+
 		next_comm =3D get_pevent_field_str(trace, event, field);
 =

 		ret =3D pevent_get_field_val(NULL, event, "next_pid", &rec, &val, 0);
@@ -294,8 +295,8 @@ void perf_process_bundle::handle_trace_point(void *trac=
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
@@ -324,7 +325,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 		field =3D pevent_find_any_field(event, "comm");
 =

 		if (!field || !(field->flags & FIELD_IS_STRING))
- 			return; =

+ 			return;
 =

 		comm =3D get_pevent_field_str(trace, event, field);
 =

@@ -633,7 +634,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 =

 		ret =3D pevent_get_field_val(NULL, event, "dev", &rec, &val, 0);
 		if (ret < 0)
-			=

+
 			return;
 		dev =3D (int)val;
 =

@@ -787,7 +788,7 @@ void process_update_display(void)
 	WINDOW *win;
 	double pw;
 	int tl;
-	int tlt; =

+	int tlt;
 	int tlr;
 =

 	int show_power;
@@ -979,7 +980,7 @@ void report_process_update_display(void)
 			report.begin_cell(CELL_SOFTWARE_POWER);
 			report.add(power);
 		}
-		=

+
 		report.begin_cell(CELL_SOFTWARE_POWER);
 		report.add(usage);
 		report.begin_cell(CELL_SOFTWARE_POWER);
@@ -1002,39 +1003,61 @@ void report_summary(void)
 	unsigned int i;
 	unsigned int total;
 	int show_power;
+	int rows, cols, idx;
 =

 	sort(all_power.begin(), all_power.end(), power_cpu_sort);
 	show_power =3D global_power_valid();
 =

-	report.begin_section(SECTION_SUMMARY);
-	report.add_header(__("Power Consumption Summary"));
-	report.begin_paragraph();
-	report.addf("%.1f %s, %.1f %s, %.1f %s, %.1f %s %.1f%% %s",
-		    total_wakeups(),	 __("wakeups/second"),
-		    total_gpu_ops(),	 __("GPU ops/second"),
-		    total_disk_hits(),	 __("VFS ops/sec"),
-		    total_xwakes(),	 __("GFX wakes/sec and"),
-		    total_cpu_time() * 100, __("CPU use"));
-
-	report.begin_table(TABLE_WIDE);
-	report.begin_row();
-	if (show_power) {
-		report.begin_cell(CELL_SUMMARY_HEADER);
-		report.add(__("Power est."));
-	}
+	/* div attr css_class and css_id */
+	tag_attr div_attr;
+	init_div(&div_attr, "summary", "");
 =

-	report.begin_cell(CELL_SUMMARY_HEADER);
-	report.add(__("Usage"));
-	report.begin_cell(CELL_SUMMARY_HEADER);
-	report.add(__("Events/s"));
-	report.begin_cell(CELL_SUMMARY_CATEGORY);
-	report.add(__("Category"));
-	report.begin_cell(CELL_SUMMARY_DESCRIPTION);
-	report.add(__("Description"));
 =

+	/* Set table attributes, rows, and cols */
+	cols=3D4;
+	if (show_power)
+		cols=3D5;
+	idx=3Dcols;
 	total =3D all_power.size();
 	if (total > 10)
 		total =3D 10;
+	rows=3Dtotal+1;
+	table_attributes std_table_css;
+	init_std_table_attr(&std_table_css, rows, cols);
+
+	/* Set title attributes */
+	tag_attr title_attr;
+	init_title_attr(&title_attr);
+
+	/* Set array for summary */
+	int summary_size =3D12;
+	string summary[summary_size];
+	summary[0]=3D"Target:";
+	summary[1]=3D"1 units/s";
+	summary[2]=3D"System: ";
+	summary[3]=3D double_to_string(total_wakeups());
+	summary[3].append(" wakeup/s");
+	summary[4]=3D"CPU: ";
+	summary[5]=3D double_to_string(total_cpu_time()*100);
+	summary[5].append("\% usage");
+	summary[6]=3D"GPU:";
+	summary[7]=3Ddouble_to_string(total_gpu_ops());
+	summary[7].append(" ops/s");
+	summary[8]=3D"GFX:";
+	summary[9]=3Ddouble_to_string(total_xwakes());
+	summary[9].append(" wakeups/s");
+	summary[10]=3D"VFS:";
+	summary[11]=3D double_to_string(total_disk_hits());
+	summary[11].append(" ops/s");
+
+	/* Set array of data in row Major order */
+	string summary_data[cols * (rows+1)];
+	summary_data[0]=3D"Usage";
+	summary_data[1]=3D"Events/s";
+	summary_data[2]=3D"Category";
+	summary_data[3]=3D"Description";
+	if (show_power)
+		summary_data[4]=3D"PW Estimate";
 =

 	for (i =3D 0; i < all_power.size(); i++) {
 		char power[16];
@@ -1052,7 +1075,7 @@ void report_summary(void)
 			break;
 =

 		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&
-		    all_power[i]->Witts() =3D=3D 0)
+				all_power[i]->Witts() =3D=3D 0)
 			break;
 =

 		usage[0] =3D 0;
@@ -1070,21 +1093,30 @@ void report_summary(void)
 		else if (all_power[i]->events() <=3D 0.3)
 			sprintf(events, "%5.2f", all_power[i]->events());
 =

-		report.begin_row(ROW_SUMMARY);
-		if (show_power) {
-			report.begin_cell(CELL_SUMMARY_ITEM);
-			report.add(power);
-		}
+		summary_data[idx]=3Dstring(usage);
+		idx+=3D1;
 =

-		report.begin_cell(CELL_SUMMARY_ITEM);
-		report.add(usage);
-		report.begin_cell(CELL_SUMMARY_ITEM);
-		report.add(events);
-		report.begin_cell();
-		report.add(name);
-		report.begin_cell();
-		report.add(pretty_print(all_power[i]->description(), descr, 128));
+		summary_data[idx]=3Dstring(events);
+		idx+=3D1;
+
+		summary_data[idx]=3Dstring(name);
+		idx+=3D1;
+
+		summary_data[idx]=3Dstring(pretty_print(all_power[i]->description(), des=
cr, 128));
+		idx+=3D1;
+
+		if (show_power){
+			summary_data[idx]=3Dpower;
+			idx+=3D1;
+		}
 	}
+
+	/* Report Summary for all */
+	report.add_summary_list(summary, summary_size);
+	report.add_div(&div_attr);
+	report.add_title(&title_attr, "Top 10 Power Consumers");
+	report.add_table(summary_data, &std_table_css);
+	report.end_div();
 }
 =

 =

diff --git a/src/report/report-data-html.cpp b/src/report/report-data-html.=
cpp
index e150961..ed0d692 100644
--- a/src/report/report-data-html.cpp
+++ b/src/report/report-data-html.cpp
@@ -23,3 +23,28 @@ void init_title_attr(struct tag_attr *title_attr)
 	title_attr->css_class=3D"content_title";
 	title_attr->css_id=3D"";
 }
+
+void init_std_table_attr(struct table_attributes *table_css, int rows, int=
 cols){
+	table_css->table_class=3D"emphasis2";
+	table_css->tr_class=3D"emph1";
+	table_css->th_class=3D"emph_title";
+	table_css->td_class=3D"";
+	table_css->pos_table_title=3DT;
+	table_css->title_mod=3D0;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
+
+/* Other Helper Functions */
+string
+double_to_string(double dval)
+{
+	ostringstream dtmp;
+	string str;
+	dtmp << dval;
+	str=3D dtmp.str();
+	str =3D str.substr(0, str.find(".")+2);
+	return str;
+}
+
+
diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
index 7db7d4b..524cd24 100644
--- a/src/report/report-data-html.h
+++ b/src/report/report-data-html.h
@@ -1,3 +1,8 @@
+#include <string>
+#include <sstream>
+
+using namespace std;
+
 struct tag_attr {
 	const char *css_class;
 	const char *css_id;
@@ -28,3 +33,11 @@ init_top_table_attr(struct table_attributes *table_css, =
int rows, int cols);
 =

 void
 init_title_attr(struct tag_attr *title_attr);
+
+void
+init_std_table_attr(struct table_attributes *table_css, int rows, int cols=
);
+
+/* Other helper functions */
+string
+double_to_string(double dval);
+
diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index 086cc79..facdd4d 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -275,7 +275,9 @@ report_formatter_csv::add_summary_list(string *list, in=
t size)
 	int i;
 	add_exact("\n");
 	for (i=3D0; i < size; i+=3D2){
-		addf_exact("%s %s,", list[i].c_str(), list[i+1].c_str());
+		addf_exact("%s %s", list[i].c_str(), list[i+1].c_str());
+		if(i < (size - 1))
+			add_exact(",");
 	}
 	add_exact("\n");
 }
-- =

1.7.9.5


--===============8079268103412374249==--

