Content-Type: multipart/mixed; boundary="===============5122275946141518517=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 24/29] report-html: fixed not hidding sections
 errors
Date: Wed, 30 Oct 2013 14:21:15 -0700
Message-ID: <1383168080-18233-25-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5122275946141518517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Removed multiple division when displaying more than one table on a
section as it was the case of Device Info and Tuning sections. Now all
sections display accordingly to the selected menu button.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/devices/device.cpp          |    5 ++---
 src/devlist.cpp                 |    5 +----
 src/powertop.css                |   19 +++++++++----------
 src/report/report-data-html.cpp |   11 +++++++++++
 src/report/report-data-html.h   |    4 ++++
 src/tuning/tuning.cpp           |    6 +-----
 6 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index 1d9b1d4..1913604 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -225,7 +225,7 @@ void show_report_devices(void)
 =

 	/* div attr css_class and css_id */
         tag_attr div_attr;
-        init_div(&div_attr, "", "device");
+        init_div(&div_attr, "", "devinfo");
 =

         /* Set Table attributes, rows, and cols */
         table_attributes std_table_css;
@@ -235,7 +235,7 @@ void show_report_devices(void)
 =

 	idx =3D cols;
  	rows=3D all_devices.size() + 1;
-        init_std_table_attr(&std_table_css, rows, cols);
+        init_std_side_table_attr(&std_table_css, rows, cols);
 =

         /* Set Title attributes */
         tag_attr title_attr;
@@ -286,7 +286,6 @@ void show_report_devices(void)
 	report.add_div(&div_attr);
 	report.add_title(&title_attr,"Device Power Report");
 	report.add_table(device_data, &std_table_css);
-	report.end_div();
 }
 =

 =

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 09d256b..cd23969 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -296,9 +296,6 @@ void report_show_open_devices(void)
 	if (target->size() =3D=3D 0)
 		return;
 =

-	/* div attr css_class and css_id */
-	tag_attr div_attr;
-	init_div(&div_attr, "", "device");
 =

 	/* Set Table attributes, rows, and cols */
 	table_attributes std_table_css;
@@ -331,7 +328,7 @@ void report_show_open_devices(void)
 	}
 =

 	/* Report Output */
-	report.add_div(&div_attr);
+	/* No div attribute here inherits from device power report */
 	report.add_title(&title_attr, "Process Device Activity");
 	report.add_table(process_data, &std_table_css);
 	report.end_div();
diff --git a/src/powertop.css b/src/powertop.css
index 97c15cc..0c0f75b 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -12,7 +12,7 @@ var powertop =3D {
   cpuidle: 'CPU Idle',
   cpufreq: 'CPU Frequency',
   software: 'Software Info',
-  device: 'Device Info',
+  devinfo: 'Device Info',
   tuning: 'Tuning'
  },
  cadd: function(idx, c){
@@ -76,6 +76,13 @@ var powertop =3D {
 	padding:0px;
 }
 =

+body {
+	background-color: #eee; /* Background color */
+	color: #222;            /* Font color */
+	font-family: Helvetica;
+	font-size: 14px;
+}
+
 #main_container{
 	width: 960px;
 	margin: 2px auto;
@@ -198,15 +205,7 @@ li.summary_list
 =

 =

 =

-/*menu css*/
-
-body {
-	background-color: #eee; /* Background color */
-	color: #222;            /* Font color */
-	font-family: Helvetica;
-	font-size: 14px;
-}
-
+/* main menu css*/
 #main_menu {
 	display: inline-block;
 	font-weight: bold;
diff --git a/src/report/report-data-html.cpp b/src/report/report-data-html.=
cpp
index 72d2e52..78354c3 100644
--- a/src/report/report-data-html.cpp
+++ b/src/report/report-data-html.cpp
@@ -34,6 +34,17 @@ void init_std_table_attr(struct table_attributes *table_=
css, int rows, int cols)
 	table_css->rows=3Drows;
 	table_css->cols=3Dcols;
 }
+void init_std_side_table_attr(struct table_attributes *table_css, int rows=
, int cols){
+	table_css->table_class=3D"emphasis2 side_by_side_left";
+	table_css->tr_class=3D"emph1";
+	table_css->th_class=3D"emph_title";
+	table_css->td_class=3D"";
+	table_css->pos_table_title=3DT;
+	table_css->title_mod=3D0;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
+
 =

 void init_pkg_table_attr(struct table_attributes *table_css, int rows, int=
 cols){
 	table_css->table_class=3D"emphasis2 side_by_side_left";
diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
index 7e517eb..f16977e 100644
--- a/src/report/report-data-html.h
+++ b/src/report/report-data-html.h
@@ -44,6 +44,10 @@ void
 init_std_table_attr(struct table_attributes *table_css, int rows, int cols=
);
 =

 void
+init_std_side_table_attr(struct table_attributes *table_css, int rows,
+		int cols);
+
+void
 init_pkg_table_attr(struct table_attributes *table_css, int rows, int cols=
);
 =

 void
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index e251f56..4b2588d 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -207,7 +207,7 @@ void report_show_tunables(void)
 =

 	 /* div attr css_class and css_id */
         tag_attr div_attr;
-        init_div(&div_attr, "", "tuning");
+        init_div(&div_attr, "clear_block", "tuning");
 =

 	/* Set Table attributes, rows, and cols */
 	table_attributes tune_table_css;
@@ -242,7 +242,6 @@ void report_show_tunables(void)
 	report.add_div(&div_attr);
 	report.add_title(&title_attr,"Software Settings in Need of Tuning");
 	report.add_table(tunable_data, &tune_table_css);
-	report.end_div();
 =

 	/* Second Table */
 	/* Set Table attributes, rows, and cols */
@@ -258,10 +257,8 @@ void report_show_tunables(void)
 		untunable_data[i+1]=3D string(all_untunables[i]->description());
 =

 	/* Report Output */
-	report.add_div(&div_attr);
 	report.add_title(&title_attr,"Untunable Software Issues");
 	report.add_table(untunable_data, &tune_table_css);
-	report.end_div();
 =

 	/* Third Table */
 	/* Set Table attributes, rows, and cols */
@@ -283,7 +280,6 @@ void report_show_tunables(void)
 		idx+=3D1;
         }
 	/* Report Output */
-	report.add_div(&div_attr);
 	report.add_title(&title_attr,"Optimal Tuned Software Settings");
         report.add_table(tuned_data, &tune_table_css);
         report.end_div();
-- =

1.7.9.5


--===============5122275946141518517==--

