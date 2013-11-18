Content-Type: multipart/mixed; boundary="===============4994146872032370352=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 31/31] report-cleanup: removed html & csv old
 methods
Date: Mon, 18 Nov 2013 12:27:22 -0800
Message-ID: <1384806442-20294-32-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4994146872032370352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Removed old methods that handled adding and removing header,
section, paragraph, quotes, and remaining enums related to the previous
implementation of table, row, cell and its corresponding css formatting.
All these methods were replaced by the previously commited html and csv
design methods.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-csv.cpp  |   87 ++----------------------------
 src/report/report-formatter-csv.h    |   19 +------
 src/report/report-formatter-html.cpp |   64 +---------------------
 src/report/report-formatter-html.h   |   17 +-----
 src/report/report-formatter.h        |   13 +----
 src/report/report-maker.cpp          |   91 +------------------------------
 src/report/report-maker.h            |   97 ++++--------------------------=
----
 src/report/report.cpp                |    2 +-
 8 files changed, 21 insertions(+), 369 deletions(-)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index 941f722..a6787c1 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -35,94 +35,20 @@
 #include "report-formatter-csv.h"
 #include "report-data-html.h"
 =

-static const char report_csv_header[] =3D "PowerTOP Report";
 =

 /* ***********************************************************************=
* */
-
 report_formatter_csv::report_formatter_csv()
 {
-	add_doc_header();
+	/* Do nothing special  */
 }
 =

 /* ***********************************************************************=
* */
-
 void
 report_formatter_csv::finish_report()
 {
 	/* Do nothing special */
 }
 =

-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::add_doc_header()
-{
-	/*add_header(report_csv_header, 1);*/
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::add_header(const char *header, int level)
-{
-	assert(header);
-
-	text_start =3D result.length();
-	csv_need_quotes =3D false;
-	addf("%.*s%s%.*s", 4 - level, "***", header, 4 - level, "***");
-	add_quotes();
-	add_exact("\n");
-}
-
-/* ***********************************************************************=
* */
-
-void
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
-void
-report_formatter_csv::add_quotes()
-{
-#ifdef REPORT_CSV_ESCAPE_EMPTY
-	if (csv_need_quotes || result.length() =3D=3D text_start) {
-#else /* !REPORT_CSV_ESCAPE_EMPTY */
-	if (csv_need_quotes) {
-#endif /* !REPORT_CSV_ESCAPE_EMPTY */
-		result.insert(text_start, "\"");
-		add_exact("\"");
-	}
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::begin_paragraph()
-{
-	text_start =3D result.length();
-	csv_need_quotes =3D false;
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::end_paragraph()
-{
-	add_quotes();
-	add_exact("\n");
-}
-
-/* ***********************************************************************=
* */
 =

 string
 report_formatter_csv::escape_string(const char *str)
@@ -150,13 +76,8 @@ report_formatter_csv::escape_string(const char *str)
 	return res;
 }
 =

-/* ***********************************************************************=
* */
 =

-void
-report_formatter_csv::set_cpu_number(int nr UNUSED)
-{
-	/* Do nothing */
-}
+
 =

 /* Report Style */
 void
@@ -166,7 +87,7 @@ report_formatter_csv::add_header()
 }
 =

 void
-report_formatter_csv::end_hheader()
+report_formatter_csv::end_header()
 {
 	/* Do nothing */
 }
@@ -174,7 +95,7 @@ report_formatter_csv::end_hheader()
 void
 report_formatter_csv::add_logo()
 {
-	add_exact("\t\t\tP o w e r T o p\n");
+	add_exact("\t\t\tP o w e r T O P\n");
 }
 =

 =

diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index 6336e2c..7edfc01 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -31,7 +31,7 @@
 #include "report-formatter-base.h"
 =

 /* Offices like semicolon separated values instead of comma */
-#define REPORT_CSV_DELIMITER ';'
+#define REPORT_CSV_DELIMITER ','
 =

 /* "a,b,c" vs "a, b, c" */
 /*#define REPORT_CSV_ADD_SPACE*/
@@ -50,23 +50,12 @@ class report_formatter_csv: public report_formatter_str=
ing_base
 {
 public:
 	report_formatter_csv();
-
 	void finish_report();
 =

-	void add_header(const char *header, int level);
-
-	void begin_section(section_type stype);
-	void end_section();
-
-	void begin_paragraph();
-	void end_paragraph();
-
-	void set_cpu_number(int nr);
-
 	/* Report Style */
 	void add_logo();
 	void add_header();
-	void end_hheader();
+	void end_header();
 	void add_div(struct tag_attr *div_attr);
 	void end_div();
 	void add_title(struct tag_attr *title_att, const char *title);
@@ -75,12 +64,8 @@ public:
 	void add_table(string *system_data, struct table_attributes *tb_attr);
 =

 private:
-	void add_doc_header();
-
 	void add_quotes();
-
 	string escape_string(const char *str);
-
 	bool csv_need_quotes;
 	size_t text_start;
 };
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index af461de..8ecc869 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -83,14 +83,6 @@ report_formatter_html::finish_report()
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_html::set_section(section_type stype, const char *id)
-{
-	sections[stype].id =3D id;
-}
-
-/* ***********************************************************************=
* */
-
-void
 report_formatter_html::add_doc_header()
 {
 #ifdef EXTERNAL_CSS_FILE /* Where is it defined? */
@@ -109,50 +101,6 @@ report_formatter_html::add_doc_footer()
 }
 =

 /* ***********************************************************************=
* */
-
-void
-report_formatter_html::add_header(const char *header, int level)
-{
-	addf_exact("<h%d>", level);
-	add(header);
-	addf_exact("</h%d>\n", level);
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::begin_section(section_type stype)
-{
-	if (sections[stype].id[0])
-		addf_exact("<div id=3D\"%s\">", sections[stype].id);
-	else
-		add_exact("<div>");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::end_section()
-{
-	add_exact("</div>\n\n");
-}
-
-void
-report_formatter_html::begin_paragraph()
-{
-	add_exact("<p>");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::end_paragraph()
-{
-	add_exact("</p>\n");
-}
-
-/* ***********************************************************************=
* */
-
 string
 report_formatter_html::escape_string(const char *str)
 {
@@ -187,16 +135,6 @@ report_formatter_html::escape_string(const char *str)
 	return res;
 }
 =

-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::set_cpu_number(int nr)
-{
-	assert(nr >=3D 0);
-
-	cpu_nr =3D nr;
-}
-
 =

 /* Report Style */
 void
@@ -212,7 +150,7 @@ report_formatter_html::add_header()
 }
 =

 void
-report_formatter_html::end_hheader()
+report_formatter_html::end_header()
 {
 	add_exact("</header>\n\n");
 }
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index 9ba3edf..c003fd9 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -48,23 +48,12 @@ class report_formatter_html: public report_formatter_st=
ring_base
 {
 public:
 	report_formatter_html();
-
 	void finish_report();
 =

-	void add_header(const char *header, int level);
-
-	void begin_section(section_type stype);
-	void end_section();
-
-	void begin_paragraph();
-	void end_paragraph();
-
-	void set_cpu_number(int nr);
-
 	/* Report Style */
 	void add_logo();
 	void add_header();
-	void end_hheader();
+	void end_header();
 	void add_div(struct tag_attr *div_attr);
 	void end_div();
 	void add_title(struct tag_attr *title_att, const char *title);
@@ -75,14 +64,10 @@ public:
 private:
 	/* Document structure related functions */
 	void init_markup();
-	void set_section(section_type stype, const char *id =3D "");
 	void add_doc_header();
 	void add_doc_footer();
-
 	string escape_string(const char *str);
 =

-	html_section sections[SECTION_MAX];
-	int cpu_nr;
 };
 =

 #endif /* _REPORT_FORMATTER_HTML_H_ */
diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index 6d31759..940b5cf 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -41,21 +41,10 @@ public:
 	virtual void add(const char *str) {}
 	virtual void addv(const char *fmt, va_list ap) {}
 =

-	virtual void add_header(const char *header, int level) {}
-
-	virtual void begin_section(section_type stype) {}
-	virtual void end_section() {}
-
-	virtual void begin_paragraph() {}
-	virtual void end_paragraph() {}
-
-	/* For quad-colouring CPU tables in HTML */
-	virtual void set_cpu_number(int nr) {}
-
 	/* *** Report Style *** */
 	virtual void add_logo() {}
 	virtual void add_header() {}
-	virtual void end_hheader() {}
+	virtual void end_header() {}
 	virtual void add_div(struct tag_attr *div_attr) {}
 	virtual void end_div() {}
 	virtual void add_title(struct tag_attr *att_title, const char *title) {}
diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index 3de39a5..f2fe522 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -56,9 +56,6 @@ report_maker::~report_maker()
 void
 report_maker::finish_report()
 {
-	if (section_opened)
-		end_section();
-
 	formatter->finish_report();
 }
 =

@@ -76,8 +73,6 @@ void
 report_maker::clear_result()
 {
 	formatter->clear_result();
-	section_opened	 =3D false;
-	paragraph_opened =3D false;
 }
 =

 /* ***********************************************************************=
* */
@@ -122,8 +117,6 @@ void
 report_maker::add(const char *str)
 {
 	assert(str);
-	assert(section_opened);
-
 	formatter->add(str);
 }
 =

@@ -133,92 +126,12 @@ void
 report_maker::addf(const char *fmt, ...)
 {
 	va_list ap;
-
 	assert(fmt);
-	assert(section_opened);
-
 	va_start(ap, fmt);
 	formatter->addv(fmt, ap);
 	va_end(ap);
 }
 =

-/* ***********************************************************************=
* */
-
-void
-report_maker::add_header(const char *header, int level)
-{
-	assert(header);
-	assert(section_opened);
-	assert(level > 0 && level < 4);
-
-	if (paragraph_opened)
-		end_paragraph();
-
-	formatter->add_header(header, level);
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::begin_section(section_type stype)
-{
-	assert(stype >=3D 0 && stype < SECTION_MAX);
-
-	if (section_opened)
-		end_section(); /* Close previous */
-
-	section_opened =3D true;
-	formatter->begin_section(stype);
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::end_section()
-{
-	assert(section_opened);
-
-	if (paragraph_opened)
-		end_paragraph();
-
-	section_opened =3D false;
-	formatter->end_section();
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::set_cpu_number(int nr)
-{
-	formatter->set_cpu_number(nr);
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::begin_paragraph()
-{
-	assert(section_opened);
-
-	if (paragraph_opened)
-		end_paragraph(); /* Close previous */
-
-	paragraph_opened =3D true;
-	formatter->begin_paragraph();
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::end_paragraph()
-{
-	assert(paragraph_opened);
-
-	paragraph_opened =3D false;
-	formatter->end_paragraph();
-}
-
-
 /* *** Report Style *** */
 void
 report_maker::add_logo()
@@ -233,9 +146,9 @@ report_maker::add_header()
 }
 =

 void
-report_maker::end_hheader()
+report_maker::end_header()
 {
-	formatter->end_hheader();
+	formatter->end_header();
 }
 =

 void
diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index cfa25dd..ff5c5e7 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -29,43 +29,31 @@
 /* This report generator implements the following document structure:
  *	body
  *	  \---> section
- *		  |---> header
+ *		  |---> Title
  *		  |---> paragraph
- *		  \---> table
- *			  \---> table row
- *				  \---> table cell
+ *		  |---> table
+ *		  |---> list
  *
  * The report body consists of a number of sections (a.k.a. <div>s,
  * a.k.a. tabs).
- * Each section can contain headers (<h1>, <h2>, <h3>), paragraphs (<p>)
+ * Each section can contain titles (<h2>), paragraphs (<p>)
  * and tables (<table>).
  *
  * A header is a single line of text.
  *
  * Paragraphs can contain only text.
  *
- * A table consists of table rows. A table row consists of table cells.
- * A table cell can contain only text.
  *
  * Each section, table, row or cell could have its own formatting.
- * To distinguish elements from others of its type, each element could have
- * an unique identifier (see enums section_type, table_type, row_type and
- * cell_type below). These identifiers are used in formatter implementatio=
ns
- * to produce special formatting.
  *
  * Example of usage:
  *	report_maker report(REPORT_OFF);
  *
  *	report.set_type(REPORT_HTML);
- *	report.begin_section();
- *		report.add_header("Big report");
- *		report.begin_paragraph("Some text");
- *		report.begin_table();
- *			report.begin_row();
- *				report.begin_cell();
- *					report.add("Something");
- *				report.begin_cell(CELL_SPECIAL);
- *					report.add("Foo bar");
+ *	report.add_div
+ *		report.add_title
+ *		report.add_list
+ *		report.add_table
  *	report.finish_report();
  *	const char *result =3D report.get_result();
  */
@@ -104,61 +92,6 @@ enum section_type {
 	SECTION_MAX /* Must be last in this enum */
 };
 =

-/* ***********************************************************************=
* */
-
-enum table_type {
-	TABLE_DEFAULT,
-	TABLE_WIDE,
-	TABLE_MAX /* Must be last in this enum */
-};
-
-/* ***********************************************************************=
* */
-
-enum row_type {
-	ROW_DEFAULT,
-	ROW_SYSINFO,
-	ROW_DEVPOWER,
-	ROW_SOFTWARE,
-	ROW_SUMMARY,
-	ROW_TUNABLE,
-	ROW_TUNABLE_BAD,
-	ROW_MAX /* Must be last in this enum */
-};
-
-/* ***********************************************************************=
* */
-
-enum cell_type {
-	CELL_DEFAULT,
-	CELL_SYSINFO,
-	CELL_FIRST_PACKAGE_HEADER,
-	CELL_EMPTY_PACKAGE_HEADER,
-	CELL_CORE_HEADER,
-	CELL_CPU_CSTATE_HEADER,
-	CELL_CPU_PSTATE_HEADER,
-	CELL_STATE_NAME,
-	CELL_EMPTY_PACKAGE_STATE,
-	CELL_PACKAGE_STATE_VALUE,
-	CELL_CORE_STATE_VALUE,
-	CELL_CPU_STATE_VALUE,
-	CELL_SEPARATOR,
-	CELL_DEVPOWER_HEADER,
-	CELL_DEVPOWER_DEV_NAME,
-	CELL_DEVPOWER_POWER,
-	CELL_DEVPOWER_UTIL,
-	CELL_DEVACTIVITY_PROCESS,
-	CELL_DEVACTIVITY_DEVICE,
-	CELL_SOFTWARE_HEADER,
-	CELL_SOFTWARE_PROCESS,
-	CELL_SOFTWARE_DESCRIPTION,
-	CELL_SOFTWARE_POWER,
-	CELL_SUMMARY_HEADER,
-	CELL_SUMMARY_CATEGORY,
-	CELL_SUMMARY_DESCRIPTION,
-	CELL_SUMMARY_ITEM,
-	CELL_TUNABLE_HEADER,
-	CELL_UNTUNABLE_HEADER,
-	CELL_MAX /* Must be last in this enum */
-};
 =

 /* ***********************************************************************=
* */
 =

@@ -182,15 +115,9 @@ public:
 =

 	void add(const char *str);
 =

-	void add_header(const char *header, int level =3D 2);
-	void begin_section(section_type stype =3D SECTION_DEFAULT);
-	void begin_paragraph();
-
-	void set_cpu_number(int nr);
-
 	/* *** Report Style *** */
 	void add_header();
-	void end_hheader();
+	void end_header();
 	void add_logo();
 	void add_div(struct tag_attr *div_attr);
 	void end_div();
@@ -201,13 +128,7 @@ public:
 =

 private:
 	void setup_report_formatter();
-
-	void end_section();
-	void end_paragraph();
-
 	report_type type;
 	report_formatter *formatter;
-	bool section_opened, paragraph_opened;
 };
-
 #endif /* _REPORT_MAKER_H_ */
diff --git a/src/report/report.cpp b/src/report/report.cpp
index 56232a6..9e94607 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -155,7 +155,7 @@ static void system_info(void)
 	report.add_title(&title_attr, __("System Information"));
 	report.add_table(system_data, &sys_table);
 	report.end_div();
-	report.end_hheader();
+	report.end_header();
 	report.add_navigation();
 }
 =

-- =

1.7.9.5


--===============4994146872032370352==--

