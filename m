Content-Type: multipart/mixed; boundary="===============2563393669008007933=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 23/31] report: report tuning with new desig html
 & csv
Date: Mon, 18 Nov 2013 12:27:14 -0800
Message-ID: <1384806442-20294-24-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2563393669008007933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Changes tunning reporting calls to use the new design on html
and csv reports, while preserving the translation macros.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-data-html.cpp |    9 +++
 src/report/report-data-html.h   |    2 +
 src/tuning/tuning.cpp           |  125 +++++++++++++++++++++++------------=
----
 3 files changed, 86 insertions(+), 50 deletions(-)

diff --git a/src/report/report-data-html.cpp b/src/report/report-data-html.=
cpp
index f0d536d..72d2e52 100644
--- a/src/report/report-data-html.cpp
+++ b/src/report/report-data-html.cpp
@@ -82,6 +82,15 @@ void init_nowarp_table_attr(struct table_attributes *tab=
le_css, int rows, int co
 	table_css->cols=3Dcols;
 }
 =

+void init_tune_table_attr(struct table_attributes *table_css, int rows, in=
t cols){
+	table_css->table_class=3D"emphasis2";
+	table_css->tr_class=3D"tune";
+	table_css->th_class=3D"emph_title";
+	table_css->td_class=3D"";
+	table_css->pos_table_title=3DT;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
 =

 /* Other Helper Functions */
 string
diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
index d2d782b..7e517eb 100644
--- a/src/report/report-data-html.h
+++ b/src/report/report-data-html.h
@@ -56,6 +56,8 @@ init_cpu_table_attr(struct table_attributes *table_css, i=
nt title_mod,
 void
 init_nowarp_table_attr(struct table_attributes *table_css, int rows, int c=
ols);
 =

+void
+init_tune_table_attr(struct table_attributes *table_css, int rows, int col=
s);
 =

 /* Other helper functions */
 string
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 3d13cc3..8a41114 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -41,6 +41,7 @@
 #include "../display.h"
 #include "../report/report.h"
 #include "../report/report-maker.h"
+#include "../report/report-data-html.h"
 #include "../lib.h"
 =

 static void sort_tunables(void);
@@ -197,72 +198,96 @@ void tuning_window::expose(void)
 void report_show_tunables(void)
 {
 	unsigned int i;
-	bool is_header;
 	/* three tables; bad, unfixable, good */
-
 	sort_tunables();
-	report.begin_section(SECTION_TUNING);
+	string srt_tmp;
+	int idx, rows, cols;
 =

-	for (is_header =3D true, i =3D 0; i < all_tunables.size(); i++) {
-		int gb;
+	/* First Table */
 =

-		gb =3D all_tunables[i]->good_bad();
-		if (gb !=3D TUNE_BAD)
-			continue;
+	 /* div attr css_class and css_id */
+        tag_attr div_attr;
+        init_div(&div_attr, "", "tuning");
 =

-		if (is_header) {
-			report.add_header("Software Settings in need of Tuning");
-			report.begin_table(TABLE_WIDE);
-			report.begin_row();
-			report.begin_cell(CELL_TUNABLE_HEADER);
-			report.add("Description");
-			report.begin_cell(CELL_TUNABLE_HEADER);
-			report.add("Script");
-			is_header =3D false;
-		}
+	/* Set Table attributes, rows, and cols */
+	table_attributes tune_table_css;
+	cols=3D2;
+	idx =3D cols;
+	rows=3D all_tunables.size() + 1;
+	init_tune_table_attr(&tune_table_css, rows, cols);
 =

-		report.begin_row(ROW_TUNABLE_BAD);
-		report.begin_cell();
-		report.add(all_tunables[i]->description());
-		report.begin_cell();
-		report.add(all_tunables[i]->toggle_script());
-	}
+	/* Set Title attributes */
+        tag_attr title_attr;
+        init_title_attr(&title_attr);
 =

-	for (i =3D 0, is_header =3D true; i < all_untunables.size(); i++) {
-		if (is_header) {
-			report.add_header("Untunable Software Issues");
-			report.begin_table(TABLE_WIDE);
-			report.begin_row();
-			report.begin_cell(CELL_TUNABLE_HEADER);
-			report.add("Description");
-			is_header =3D false;
-		}
+	/* Set array of data in row Major order */
+	string tunable_data[cols * rows];
+
+	tunable_data[0]=3D__("Description");
+	tunable_data[1]=3D__("Script");
 =

-		report.begin_row(ROW_TUNABLE_BAD);
-		report.begin_cell();
-		report.add(all_untunables[i]->description());
-	}
 =

-	for (i =3D 0, is_header =3D true; i < all_tunables.size(); i++) {
+	for (i =3D 0; i < all_tunables.size(); i++) {
 		int gb;
+		gb =3D all_tunables[i]->good_bad();
+		if (gb !=3D TUNE_BAD)
+			continue;
+		tunable_data[idx]=3Dstring(all_tunables[i]->description());
+		idx+=3D1;
+		tunable_data[idx]=3Dstring(all_tunables[i]->toggle_script());
+		idx+=3D1;
+	}
 =

+	/* Report Output */
+	report.add_div(&div_attr);
+	report.add_title(&title_attr,__("Software Settings in Need of Tuning"));
+	report.add_table(tunable_data, &tune_table_css);
+	report.end_div();
+
+	/* Second Table */
+	/* Set Table attributes, rows, and cols */
+	cols=3D1;
+	rows=3D all_untunables.size() + 1;
+	init_tune_table_attr(&tune_table_css, rows, cols);
+
+	/* Set array of data in row Major order */
+	string untunable_data[rows];
+	untunable_data[0]=3D__("Description");
+
+	for (i =3D 0; i < all_untunables.size(); i++)
+		untunable_data[i+1]=3D string(all_untunables[i]->description());
+
+	/* Report Output */
+	report.add_div(&div_attr);
+	report.add_title(&title_attr,__("Untunable Software Issues"));
+	report.add_table(untunable_data, &tune_table_css);
+	report.end_div();
+
+	/* Third Table */
+	/* Set Table attributes, rows, and cols */
+	cols=3D1;
+	rows=3D all_tunables.size() + 1;
+	init_std_table_attr(&tune_table_css, rows, cols);
+
+	/* Set array of data in row Major order */
+	string tuned_data[rows];
+	tuned_data[0]=3D__("Description");
+	idx=3Dcols;
+	for (i =3D 0; i < all_tunables.size(); i++) {
+		int gb;
 		gb =3D all_tunables[i]->good_bad();
 		if (gb !=3D TUNE_GOOD)
 			continue;
 =

-		if (is_header) {
-			report.add_header("Optimal Tuned Software Settings");
-			report.begin_table(TABLE_WIDE);
-			report.begin_row();
-			report.begin_cell(CELL_TUNABLE_HEADER);
-			report.add("Description");
-			is_header =3D false;
-		}
+		tuned_data[idx]=3Dstring(all_tunables[i]->description());
+		idx+=3D1;
+        }
+	/* Report Output */
+	report.add_div(&div_attr);
+	report.add_title(&title_attr,__("Optimal Tuned Software Settings"));
+        report.add_table(tuned_data, &tune_table_css);
+        report.end_div();
 =

-		report.begin_row(ROW_TUNABLE);
-		report.begin_cell();
-		report.add(all_tunables[i]->description());
-	}
 }
 =

 void clear_tuning()
-- =

1.7.9.5


--===============2563393669008007933==--

