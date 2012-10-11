Content-Type: multipart/mixed; boundary="===============1812756579481939185=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] clean up csv report formatter
Date: Thu, 11 Oct 2012 15:33:08 -0700
Message-ID: <20121011223308.GA3045@swordfish.datadirect.datadirectnet.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1812756579481939185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[PATCH] clean up csv report formatter

Do not re-define/re-implement unused basic formatter functions in csv repor=
ter
(e.g. report_formatter_csv::finish_report()).


Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/report/report-formatter-csv.cpp | 40 ---------------------------------=
----
 src/report/report-formatter-csv.h   |  8 --------
 2 files changed, 48 deletions(-)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index 9b154b5..37ac86b 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -45,14 +45,6 @@ report_formatter_csv::report_formatter_csv()
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_csv::finish_report()
-{
-	/* Do nothing special */
-}
-
-/* ***********************************************************************=
* */
-
-void
 report_formatter_csv::add_doc_header()
 {
 	add_header(report_csv_header, 1);
@@ -75,22 +67,6 @@ report_formatter_csv::add_header(const char *header, int=
 level)
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_csv::begin_section(section_type stype)
-{
-	/* Do nothing special */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::end_section()
-{
-	/* Do nothing special */
-}
-
-/* ***********************************************************************=
* */
-
-void
 report_formatter_csv::begin_table(table_type ttype)
 {
 	add_exact("\n");
@@ -163,14 +139,6 @@ report_formatter_csv::end_cell()
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_csv::add_empty_cell()
-{
-	/* Do nothing special */
-}
-
-/* ***********************************************************************=
* */
-
-void
 report_formatter_csv::begin_paragraph()
 {
 	text_start =3D result.length();
@@ -213,11 +181,3 @@ report_formatter_csv::escape_string(const char *str)
 =

 	return res;
 }
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::set_cpu_number(int nr UNUSED)
-{
-	/* Do nothing */
-}
diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index 8dd2976..8db9839 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -49,13 +49,8 @@ class report_formatter_csv: public report_formatter_stri=
ng_base
 public:
 	report_formatter_csv();
 =

-	void finish_report();
-
 	void add_header(const char *header, int level);
 =

-	void begin_section(section_type stype);
-	void end_section();
-
 	void begin_table(table_type ttype);
 	void end_table();
 =

@@ -64,13 +59,10 @@ public:
 =

 	void begin_cell(cell_type ctype);
 	void end_cell();
-	void add_empty_cell();
 =

 	void begin_paragraph();
 	void end_paragraph();
 =

-	void set_cpu_number(int nr);
-
 private:
 	void add_doc_header();
 =




--===============1812756579481939185==--

