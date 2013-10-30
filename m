Content-Type: multipart/mixed; boundary="===============8726516973497193088=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 19/29] report: redesign System Information csv and
 html
Date: Wed, 30 Oct 2013 14:21:10 -0700
Message-ID: <1383168080-18233-20-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8726516973497193088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enabled "System Information" section for csv and html report design.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/process/do_process.cpp      |  113 ++++++++++++++++++++++-------------=
----
 src/report/report-data-html.cpp |   11 +++-
 src/report/report-data-html.h   |    2 +
 3 files changed, 77 insertions(+), 49 deletions(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 6708f12..c50fdd3 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -889,42 +889,48 @@ void report_process_update_display(void)
 {
 	unsigned int i;
 	unsigned int total;
+	int show_power, cols, rows, idx;
 =

-	int show_power;
-
-	sort(all_power.begin(), all_power.end(), power_cpu_sort);
-
-	show_power =3D global_power_valid();
+	/* div attr css_class and css_id */
+	tag_attr div_attr;
+	init_div(&div_attr, "clear_block", "software");
 =

-	report.begin_section(SECTION_SOFTWARE);
-	report.add_header(__("Overview of Software Power Consumers"));
-	report.begin_table(TABLE_WIDE);
-	report.begin_row();
-	if (show_power) {
-		report.begin_cell(CELL_SOFTWARE_HEADER);
-		report.add(__("Power est."));
-	}
+	/* Set Table attributes, rows, and cols */
+	cols=3D7;
+	if (show_power)
+		cols=3D8;
 =

-	report.begin_cell(CELL_SOFTWARE_HEADER);
-	report.add(__("Usage"));
-	report.begin_cell(CELL_SOFTWARE_HEADER);
-	report.add(__("Wakeups/s"));
-	report.begin_cell(CELL_SOFTWARE_HEADER);
-	report.add(__("GPU ops/s"));
-	report.begin_cell(CELL_SOFTWARE_HEADER);
-	report.add(__("Disk IO/s"));
-	report.begin_cell(CELL_SOFTWARE_HEADER);
-	report.add(__("GFX Wakeups/s"));
-	report.begin_cell(CELL_SOFTWARE_PROCESS);
-	report.add(__("Category"));
-	report.begin_cell(CELL_SOFTWARE_DESCRIPTION);
-	report.add(__("Description"));
+	idx=3Dcols;
 =

 	total =3D all_power.size();
-
 	if (total > 100)
 		total =3D 100;
 =

+	rows=3Dtotal+1;
+	table_attributes std_table_css;
+	init_nowarp_table_attr(&std_table_css, rows, cols);
+
+
+	/* Set Title attributes */
+	tag_attr title_attr;
+	init_title_attr(&title_attr);
+
+	/* Set array of data in row Major order */
+	string  software_data[cols * rows];
+	software_data[0]=3D"Usage";
+	software_data[1]=3D"Wakeups/s";
+	software_data[2]=3D"GPU ops/s";
+	software_data[3]=3D"Disk IO/s";
+	software_data[4]=3D"GFX Wakeups/s";
+	software_data[5]=3D"Category";
+	software_data[6]=3D"Description";
+
+	if (show_power)
+		software_data[7]=3D"PW Estimate";
+
+	sort(all_power.begin(), all_power.end(), power_cpu_sort);
+	show_power =3D global_power_valid();
+
 	for (i =3D 0; i < total; i++) {
 		char power[16];
 		char name[20];
@@ -943,7 +949,8 @@ void report_process_update_display(void)
 		if (strcmp(name, "Device") =3D=3D 0)
 			continue;
 =

-		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&=
 all_power[i]->Witts() =3D=3D 0)
+		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0
+				&& all_power[i]->Witts() =3D=3D 0)
 			break;
 =

 		usage[0] =3D 0;
@@ -958,7 +965,7 @@ void report_process_update_display(void)
 			sprintf(wakes, "%5.2f", all_power[i]->wake_ups / measurement_time);
 		sprintf(gpus, "%5.1f", all_power[i]->gpu_ops / measurement_time);
 		sprintf(disks, "%5.1f (%5.1f)", all_power[i]->hard_disk_hits / measureme=
nt_time,
-			all_power[i]->disk_hits / measurement_time);
+				all_power[i]->disk_hits / measurement_time);
 		sprintf(xwakes, "%5.1f", all_power[i]->xwakes / measurement_time);
 		if (!all_power[i]->show_events()) {
 			wakes[0] =3D 0;
@@ -975,27 +982,37 @@ void report_process_update_display(void)
 		if (all_power[i]->xwakes =3D=3D 0)
 			xwakes[0] =3D 0;
 =

-		report.begin_row(ROW_SOFTWARE);
+		software_data[idx]=3Dstring(usage);
+		idx+=3D1;
+
+		software_data[idx]=3Dstring(wakes);
+		idx+=3D1;
+
+		software_data[idx]=3Dstring(gpus);
+		idx+=3D1;
+
+		software_data[idx]=3Dstring(disks);
+		idx+=3D1;
+
+		software_data[idx]=3Dstring(xwakes);
+		idx+=3D1;
+
+		software_data[idx]=3Dstring(name);
+		idx+=3D1;
+
+		software_data[idx]=3Dstring(pretty_print(all_power[i]->description(), de=
scr, 128));
+		idx+=3D1;
 		if (show_power) {
-			report.begin_cell(CELL_SOFTWARE_POWER);
-			report.add(power);
+			software_data[idx]=3Dstring(power);
+			idx+=3D1;
 		}
-
-		report.begin_cell(CELL_SOFTWARE_POWER);
-		report.add(usage);
-		report.begin_cell(CELL_SOFTWARE_POWER);
-		report.add(wakes);
-		report.begin_cell(CELL_SOFTWARE_POWER);
-		report.add(gpus);
-		report.begin_cell(CELL_SOFTWARE_POWER);
-		report.add(disks);
-		report.begin_cell(CELL_SOFTWARE_POWER);
-		report.add(xwakes);
-		report.begin_cell();
-		report.add(name);
-		report.begin_cell();
-		report.add(pretty_print(all_power[i]->description(), descr, 128));
 	}
+
+	/* Report Output */
+	report.add_div(&div_attr);
+	report.add_title(&title_attr, "Overview of Software Power Consumers");
+	report.add_table(software_data, &std_table_css);
+        report.end_div();
 }
 =

 void report_summary(void)
diff --git a/src/report/report-data-html.cpp b/src/report/report-data-html.=
cpp
index 28732c9..f0d536d 100644
--- a/src/report/report-data-html.cpp
+++ b/src/report/report-data-html.cpp
@@ -71,7 +71,16 @@ void init_cpu_table_attr(struct table_attributes *table_=
css, int title_mod,
 }
 =

 =

-
+void init_nowarp_table_attr(struct table_attributes *table_css, int rows, =
int cols){
+	table_css->table_class=3D"emphasis2";
+	table_css->tr_class=3D"emph1";
+	table_css->th_class=3D"emph_title";
+	table_css->td_class=3D"no_wrap";
+	table_css->pos_table_title=3DT;
+	table_css->title_mod=3D0;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
 =

 =

 /* Other Helper Functions */
diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
index 61e75c0..d2d782b 100644
--- a/src/report/report-data-html.h
+++ b/src/report/report-data-html.h
@@ -53,6 +53,8 @@ init_core_table_attr(struct table_attributes *table_css, =
int title_mod,
 void
 init_cpu_table_attr(struct table_attributes *table_css, int title_mod,
 		int rows, int cols);
+void
+init_nowarp_table_attr(struct table_attributes *table_css, int rows, int c=
ols);
 =

 =

 /* Other helper functions */
-- =

1.7.9.5


--===============8726516973497193088==--

