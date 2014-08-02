Content-Type: multipart/mixed; boundary="===============4864822981651173012=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 04/12] fix clang++ compilation errors
Date: Sat, 02 Aug 2014 12:54:09 +0100
Message-ID: <1406980457-19077-5-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4864822981651173012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The same error was fixed in multiple files to made clang++ work.

error: variable length array of non-POD element type 'string' (aka
'basic_string<char>')

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/cpu/cpu.cpp            | 18 ++++++++++++------
 src/devices/ahci.cpp       |  3 ++-
 src/devices/device.cpp     |  6 ++++--
 src/devlist.cpp            |  3 ++-
 src/process/do_process.cpp |  9 ++++++---
 src/report/report.cpp      |  3 ++-
 src/tuning/tuning.cpp      | 10 ++++++----
 7 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index dbca20c..4e040c1 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -479,12 +479,12 @@ void report_display_cpu_cstates(void)
 		/* Tables for PKG, CORE, CPU */
 		pkg_tbl_size.cols=3D2;
 		pkg_tbl_size.rows=3D ((cstates_num+1)-LEVEL_HEADER)+1;
-		string pkg_data[pkg_tbl_size.cols * pkg_tbl_size.rows];
+		string *pkg_data =3D new string[pkg_tbl_size.cols * pkg_tbl_size.rows];
 =

 		core_tbl_size.cols=3D2;
 		core_tbl_size.rows=3D(cstates_num *_package->children.size())
 				+ _package->children.size();
-		string core_data[core_tbl_size.cols * core_tbl_size.rows];
+		string *core_data =3D new string[core_tbl_size.cols * core_tbl_size.rows=
];
 		int num_cpus=3D0, num_cores=3D0;
 =

 		for (core =3D 0; core < _package->children.size(); core++) {
@@ -506,7 +506,7 @@ void report_display_cpu_cstates(void)
 		cpu_tbl_size.cols=3D(2 * (num_cpus / num_cores)) + 1;
 		cpu_tbl_size.rows =3D ((cstates_num+1-LEVEL_HEADER) * _package->children=
.size())
 				+ _package->children.size();
-		string cpu_data[cpu_tbl_size.cols * cpu_tbl_size.rows];
+		string *cpu_data =3D new string[cpu_tbl_size.cols * cpu_tbl_size.rows];
 =

 		for (core =3D 0; core < _package->children.size(); core++) {
 			cpu_data[idx3]=3D"&nbsp;";
@@ -633,6 +633,9 @@ void report_display_cpu_cstates(void)
 		init_cpu_table_attr(&std_table_css, title+1, cpu_tbl_size.rows,
 				cpu_tbl_size.cols);
 		report.add_table(cpu_data, &std_table_css);
+		delete [] pkg_data;
+		delete [] core_data;
+		delete [] cpu_data;
 	}
 	report.end_div();
 }
@@ -688,11 +691,11 @@ void report_display_cpu_pstates(void)
 		/*  Tables for PKG, CORE, CPU */
 		pkg_tbl_size.cols=3D2;
 		pkg_tbl_size.rows=3D((pstates_num+1)-LEVEL_HEADER)+2;
-		string pkg_data[pkg_tbl_size.cols * pkg_tbl_size.rows];
+		string *pkg_data =3D new string[pkg_tbl_size.cols * pkg_tbl_size.rows];
 =

 		core_tbl_size.cols=3D2;
 		core_tbl_size.rows=3D((pstates_num+2) *_package->children.size());
-		string core_data[core_tbl_size.cols * core_tbl_size.rows];
+		string *core_data =3D new string[core_tbl_size.cols * core_tbl_size.rows=
];
 =

 		/* PKG */
 		num_cpus=3D0;
@@ -717,7 +720,7 @@ void report_display_cpu_pstates(void)
 		cpu_tbl_size.cols=3D (num_cpus/ num_cores) + 1;
 		cpu_tbl_size.rows=3D (pstates_num+2) * _package->children.size()
 				+ _package->children.size();
-		string cpu_data[cpu_tbl_size.cols * cpu_tbl_size.rows];
+		string *cpu_data =3D new string[cpu_tbl_size.cols * cpu_tbl_size.rows];
 =

 		/* Core */
 		for (core =3D 0; core < _package->children.size(); core++) {
@@ -818,6 +821,9 @@ void report_display_cpu_pstates(void)
 		init_cpu_table_attr(&std_table_css, title,
 				cpu_tbl_size.rows, cpu_tbl_size.cols);
 		report.add_table(cpu_data, &std_table_css);
+		delete [] pkg_data;
+		delete [] core_data;
+		delete [] cpu_data;
 	}
 	report.end_div();
 }
diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index 3b4627a..a0891ae 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -382,7 +382,7 @@ void ahci_create_device_stats_table(void)
 =

 =

 	/* Set array of data in row Major order */
-	string ahci_data[cols * rows];
+	string *ahci_data =3D new string[cols * rows];
 	ahci_data[0]=3D__("Link");
 	ahci_data[1]=3D__("Active");
 	ahci_data[2]=3D__("Partial");
@@ -396,6 +396,7 @@ void ahci_create_device_stats_table(void)
 	report.add_title(&title_attr, __("AHCI ALPM Residency Statistics"));
 	report.add_table(ahci_data, &std_table_css);
 	report.end_div();
+	delete [] ahci_data;
 }
 =

 void ahci::report_device_stats(string *ahci_data, int idx)
diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index da595a8..b4765ef 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -247,7 +247,7 @@ void show_report_devices(void)
 =

 	/* Device Summary */
 	int summary_size=3D2;
-        string summary[summary_size];
+	string *summary =3D new string[summary_size];
 	pw =3D global_joules_consumed();
 	char buf[32];
 	if (pw > 0.0001) {
@@ -263,9 +263,10 @@ void show_report_devices(void)
 		summary[1].append(" W");
 		report.add_summary_list(summary, summary_size);
 	}
+	delete [] summary;
 =

         /* Set array of data in row Major order */
-	string device_data[cols * rows];
+	string *device_data =3D new string[cols * rows];
 	device_data[0]=3D __("Usage");
 	device_data[1]=3D __("Device Name");
 	if (show_power)
@@ -308,6 +309,7 @@ void show_report_devices(void)
 	/* Report Output */
 	report.add_title(&title_attr, __("Device Power Report"));
 	report.add_table(device_data, &std_table_css);
+	delete [] device_data;
 }
 =

 =

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 21b4c1c..20fe5da 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -326,7 +326,7 @@ void report_show_open_devices(void)
 	init_title_attr(&title_attr);
 =

 	/* Set array of data in row Major order */
-	string process_data[cols * rows];
+	string *process_data =3D new string[cols * rows];
 =

 	sort(target->begin(), target->end(), devlist_sort);
 	process_data[0]=3D__("Process");
@@ -348,5 +348,6 @@ void report_show_open_devices(void)
 	/* No div attribute here inherits from device power report */
 	report.add_title(&title_attr, __("Process Device Activity"));
 	report.add_table(process_data, &std_table_css);
+	delete [] process_data;
 	report.end_div();
 }
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index f7f9765..15115c3 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -918,7 +918,7 @@ void report_process_update_display(void)
 	init_title_attr(&title_attr);
 =

 	/* Set array of data in row Major order */
-	string  software_data[cols * rows];
+	string *software_data =3D new string[cols * rows];
 	software_data[0]=3D__("Usage");
 	software_data[1]=3D__("Wakeups/s");
 	software_data[2]=3D__("GPU ops/s");
@@ -1013,6 +1013,7 @@ void report_process_update_display(void)
 	report.add_title(&title_attr, __("Overview of Software Power Consumers"));
 	report.add_table(software_data, &std_table_css);
         report.end_div();
+	delete [] software_data;
 }
 =

 void report_summary(void)
@@ -1048,7 +1049,7 @@ void report_summary(void)
 =

 	/* Set array for summary */
 	int summary_size =3D12;
-	string summary[summary_size];
+	string *summary =3D new string [summary_size];
 	summary[0]=3D__("Target:");
 	summary[1]=3D__("1 units/s");
 	summary[2]=3D__("System: ");
@@ -1068,7 +1069,7 @@ void report_summary(void)
 	summary[11].append(__(" ops/s"));
 =

 	/* Set array of data in row Major order */
-	string summary_data[cols * (rows+1)];
+	string *summary_data =3D new string[cols * (rows+1)];
 	summary_data[0]=3D__("Usage");
 	summary_data[1]=3D__("Events/s");
 	summary_data[2]=3D__("Category");
@@ -1134,6 +1135,8 @@ void report_summary(void)
 	report.add_title(&title_attr, __("Top 10 Power Consumers"));
 	report.add_table(summary_data, &std_table_css);
 	report.end_div();
+	delete [] summary;
+	delete [] summary_data;
 }
 =

 =

diff --git a/src/report/report.cpp b/src/report/report.cpp
index d55531e..981e984 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -115,7 +115,7 @@ static void system_info(void)
         init_title_attr(&title_attr);
 =

 	/* Set array of data in row Major order */
-	string system_data[sys_table.rows * sys_table.cols];
+	string *system_data =3D new string[sys_table.rows * sys_table.cols];
 	system_data[0]=3D__("PowerTOP Version");
 	system_data[1]=3DPOWERTOP_VERSION;
 =

@@ -159,6 +159,7 @@ static void system_info(void)
 	report.end_div();
 	report.end_header();
 	report.add_navigation();
+	delete [] system_data;
 }
 =

 void init_report_output(char *filename_str, int iterations)
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 6367a20..85b80ac 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -230,7 +230,7 @@ void report_show_tunables(void)
 		init_tune_table_attr(&tune_table_css, rows, cols);
 =

 		/* Set array of data in row Major order */
-		string tunable_data[cols * rows];
+		string *tunable_data =3D new string[cols * rows];
 =

 		tunable_data[0]=3D__("Description");
 		tunable_data[1]=3D__("Script");
@@ -249,6 +249,7 @@ void report_show_tunables(void)
 		/* Report Output */
 		report.add_title(&title_attr,__("Software Settings in Need of Tuning"));
 		report.add_table(tunable_data, &tune_table_css);
+		delete [] tunable_data;
 	}
 =

 	/* Second Table */
@@ -258,7 +259,7 @@ void report_show_tunables(void)
 	init_tune_table_attr(&tune_table_css, rows, cols);
 =

 	/* Set array of data in row Major order */
-	string untunable_data[rows];
+	string *untunable_data =3D new string[rows];
 	untunable_data[0]=3D__("Description");
 =

 	for (i =3D 0; i < all_untunables.size(); i++)
@@ -267,6 +268,7 @@ void report_show_tunables(void)
 	/* Report Output */
 	report.add_title(&title_attr,__("Untunable Software Issues"));
 	report.add_table(untunable_data, &tune_table_css);
+	delete [] untunable_data;
 =

 	/* Third Table */
 	/* Set Table attributes, rows, and cols */
@@ -275,7 +277,7 @@ void report_show_tunables(void)
 	init_std_table_attr(&tune_table_css, rows, cols);
 =

 	/* Set array of data in row Major order */
-	string tuned_data[rows];
+	string *tuned_data =3D new string[rows];
 	tuned_data[0]=3D__("Description");
 	idx=3Dcols;
 	for (i =3D 0; i < all_tunables.size(); i++) {
@@ -291,7 +293,7 @@ void report_show_tunables(void)
 	report.add_title(&title_attr,__("Optimal Tuned Software Settings"));
         report.add_table(tuned_data, &tune_table_css);
         report.end_div();
-
+	delete [] tuned_data;
 }
 =

 void clear_tuning()
-- =

2.0.3


--===============4864822981651173012==--

