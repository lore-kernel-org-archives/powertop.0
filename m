Content-Type: multipart/mixed; boundary="===============6532588542765884003=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 30/31] report-cleanup: removed old table, row,
 & cell.
Date: Mon, 18 Nov 2013 12:27:21 -0800
Message-ID: <1384806442-20294-31-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6532588542765884003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The old add table headder, add row, add cell and add empty cell were
removed since they are replaced by the new add_table function for html
and csv reports.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-csv.cpp  |   66 ---------
 src/report/report-formatter-csv.h    |   12 +-
 src/report/report-formatter-html.cpp |  270 +-----------------------------=
----
 src/report/report-formatter-html.h   |   42 ------
 src/report/report-formatter.h        |   10 --
 src/report/report-maker.cpp          |  118 +--------------
 src/report/report-maker.h            |   10 +-
 7 files changed, 6 insertions(+), 522 deletions(-)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index 0ab1091..941f722 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -91,55 +91,6 @@ report_formatter_csv::end_section()
 }
 =

 /* ***********************************************************************=
* */
-
-void
-report_formatter_csv::begin_table(table_type ttype)
-{
-	add_exact("\n");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::end_table()
-{
-	add_exact("\n");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::begin_row(row_type rtype)
-{
-	table_cell_number =3D 0;
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::end_row()
-{
-	add_exact("\n");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_csv::begin_cell(cell_type ctype)
-{
-	if (table_cell_number > 0) {
-		addf_exact("%c", REPORT_CSV_DELIMITER);
-#ifdef REPORT_CSV_ADD_SPACE
-		add_exact(" ");
-#endif /* !REPORT_CSV_ADD_SPACE */
-	}
-
-	text_start =3D result.length();
-	csv_need_quotes =3D false;
-}
-
-/* ***********************************************************************=
* */
-
 void
 report_formatter_csv::add_quotes()
 {
@@ -156,23 +107,6 @@ report_formatter_csv::add_quotes()
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_csv::end_cell()
-{
-	add_quotes();
-	table_cell_number++;
-}
-
-/* ***********************************************************************=
* */
-
-void
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
diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index 198f597..6336e2c 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -58,16 +58,6 @@ public:
 	void begin_section(section_type stype);
 	void end_section();
 =

-	void begin_table(table_type ttype);
-	void end_table();
-
-	void begin_row(row_type rtype);
-	void end_row();
-
-	void begin_cell(cell_type ctype);
-	void end_cell();
-	void add_empty_cell();
-
 	void begin_paragraph();
 	void end_paragraph();
 =

@@ -92,7 +82,7 @@ private:
 	string escape_string(const char *str);
 =

 	bool csv_need_quotes;
-	size_t table_cell_number, text_start;
+	size_t text_start;
 };
 =

 #endif /* _REPORT_FORMATTER_CSV_H_ */
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index f52408b..af461de 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -61,122 +61,7 @@ static const char report_html_footer[] =3D
 void
 report_formatter_html::init_markup()
 {
-	/*	    stype		id */
-	set_section(SECTION_DEFAULT);
-	set_section(SECTION_SYSINFO,	"system");
-	set_section(SECTION_CPUIDLE,	"cpuidle");
-	set_section(SECTION_CPUFREQ,	"cpufreq");
-	set_section(SECTION_DEVPOWER,	"device");
-	set_section(SECTION_SOFTWARE,	"software");
-	set_section(SECTION_SUMMARY,	"summary");
-	set_section(SECTION_TUNING,	"tuning");
-
-	/*	  ttype		 width */
-	set_table(TABLE_DEFAULT, "");
-	set_table(TABLE_WIDE,    "100%");
-
-	/*	 ctype				is_header, width, colspan */
-	set_cell(CELL_DEFAULT);
-	set_cell(CELL_SEPARATOR,		false,	"2%");
-	set_cell(CELL_SYSINFO,			false,	"20%");
-	set_cell(CELL_FIRST_PACKAGE_HEADER,	true,	"25%",	2);
-	set_cell(CELL_EMPTY_PACKAGE_HEADER,	true,	"",	2);
-	set_cell(CELL_CORE_HEADER,		true,	"25%",	2);
-	set_cell(CELL_CPU_CSTATE_HEADER,	true,	"",	3);
-	set_cell(CELL_CPU_PSTATE_HEADER,	true,	"",	2);
-	set_cell(CELL_STATE_NAME,		false,	"10%");
-	set_cell(CELL_EMPTY_PACKAGE_STATE,	false,	"",	2);
-	set_cell(CELL_PACKAGE_STATE_VALUE);
-	set_cell(CELL_CORE_STATE_VALUE);
-	set_cell(CELL_CPU_STATE_VALUE);
-	set_cell(CELL_DEVPOWER_HEADER,		true,	"10%");
-	set_cell(CELL_DEVPOWER_DEV_NAME,	true);
-	set_cell(CELL_DEVPOWER_POWER);
-	set_cell(CELL_DEVPOWER_UTIL);
-	set_cell(CELL_DEVACTIVITY_PROCESS,	true,	"40%");
-	set_cell(CELL_DEVACTIVITY_DEVICE,	true);
-	set_cell(CELL_SOFTWARE_HEADER,		true,	"10%");
-	set_cell(CELL_SOFTWARE_PROCESS,		true,	"10%");
-	set_cell(CELL_SOFTWARE_DESCRIPTION,	true);
-	set_cell(CELL_SOFTWARE_POWER);
-	set_cell(CELL_SUMMARY_HEADER,		true,	"10%");
-	set_cell(CELL_SUMMARY_CATEGORY,		true,	"10%");
-	set_cell(CELL_SUMMARY_DESCRIPTION,	true);
-	set_cell(CELL_SUMMARY_ITEM);
-	set_cell(CELL_TUNABLE_HEADER,		true);
-}
-
-/* ***********************************************************************=
* */
-
-const char *
-report_formatter_html::get_row_style(row_type rtype)
-{
-	switch (rtype) {
-		case ROW_SYSINFO:
-			return get_style_pair("system_even", "system_odd");
-		case ROW_DEVPOWER:
-			return get_style_pair("device_even", "device_odd");
-		case ROW_SOFTWARE:
-		case ROW_SUMMARY:
-			return get_style_pair("process_even", "process_odd");
-		case ROW_TUNABLE:
-			return get_style_pair("tunable_even", "tunable_odd");
-		case ROW_TUNABLE_BAD:
-			return get_style_pair("tunable_even_bad",
-							   "tunable_odd_bad");
-		default:
-			return "";
-	};
-}
-
-/* ***********************************************************************=
* */
-
-const char *
-report_formatter_html::get_cell_style(cell_type ctype)
-{
-	switch (ctype) {
-		case CELL_FIRST_PACKAGE_HEADER:
-		case CELL_EMPTY_PACKAGE_HEADER:
-			return "package_header";
-		case CELL_CORE_HEADER:
-			return "core_header";
-		case CELL_CPU_CSTATE_HEADER:
-		case CELL_CPU_PSTATE_HEADER:
-			return "cpu_header";
-		case CELL_STATE_NAME:
-			return get_style_pair("cpu_even_freq",
-					      "cpu_odd_freq");
-		case CELL_PACKAGE_STATE_VALUE:
-			return get_style_pair("package_even",
-					      "package_odd");
-		case CELL_CORE_STATE_VALUE:
-			return get_style_pair("core_even",
-					      "core_odd");
-		case CELL_CPU_STATE_VALUE:
-			return get_style_quad("cpu_even_even", "cpu_even_odd",
-					      "cpu_odd_even", "cpu_odd_odd",
-					      cpu_nr);
-		case CELL_DEVPOWER_DEV_NAME:
-		case CELL_DEVACTIVITY_PROCESS:
-		case CELL_DEVACTIVITY_DEVICE:
-			return "device";
-		case CELL_DEVPOWER_POWER:
-			return "device_power";
-		case CELL_DEVPOWER_UTIL:
-			return "device_util";
-		case CELL_SOFTWARE_PROCESS:
-		case CELL_SOFTWARE_DESCRIPTION:
-		case CELL_SUMMARY_CATEGORY:
-		case CELL_SUMMARY_DESCRIPTION:
-			return "process";
-		case CELL_SOFTWARE_POWER:
-		case CELL_SUMMARY_ITEM:
-			return "process_power";
-		case CELL_TUNABLE_HEADER:
-			return "tunable";
-		default:
-			return "";
-	};
+	/*here all html code*/
 }
 =

 /* ***********************************************************************=
* */
@@ -189,45 +74,6 @@ report_formatter_html::report_formatter_html()
 =

 /* ***********************************************************************=
* */
 =

-const char *
-report_formatter_html::get_style_pair(const char *even, const char *odd)
-{
-	if (!(table_row_number & 1) && even)
-		return even;
-
-	if ((table_row_number & 1) && odd)
-		return odd;
-
-	return "";
-}
-
-/* ***********************************************************************=
* */
-
-const char *
-report_formatter_html::get_style_quad(const char *even_even,
-				   const char *even_odd, const char *odd_even,
-				   const char *odd_odd, int alt_cell_number)
-{
-	int cell;
-
-	cell =3D (alt_cell_number !=3D -1 ? alt_cell_number : table_cell_number);
-	if (!(table_row_number & 1) && !(cell & 1) && even_even)
-		return even_even;
-
-	if (!(table_row_number & 1) && (cell & 1) && even_odd)
-		return even_odd;
-
-	if ((table_row_number & 1) && !(cell & 1) && odd_even)
-		return odd_even;
-
-	if ((table_row_number & 1) && (cell & 1) && odd_odd)
-		return odd_odd;
-
-	return "";
-}
-
-/* ***********************************************************************=
* */
-
 void
 report_formatter_html::finish_report()
 {
@@ -245,25 +91,6 @@ report_formatter_html::set_section(section_type stype, =
const char *id)
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_html::set_table(table_type ttype, const char *width)
-{
-	tables[ttype].width =3D width;
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::set_cell(cell_type ctype, bool is_header,
-			     const char *width, int colspan)
-{
-	cells[ctype].is_header =3D is_header;
-	cells[ctype].width     =3D width;
-	cells[ctype].colspan   =3D colspan;
-}
-
-/* ***********************************************************************=
* */
-
-void
 report_formatter_html::add_doc_header()
 {
 #ifdef EXTERNAL_CSS_FILE /* Where is it defined? */
@@ -310,101 +137,6 @@ report_formatter_html::end_section()
 	add_exact("</div>\n\n");
 }
 =

-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::begin_table(table_type ttype)
-{
-	table_row_number =3D 0;
-	add_exact("<table");
-	if (tables[ttype].width[0])
-		addf_exact(" width=3D\"%s\"", tables[ttype].width);
-
-	add_exact(">\n");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::end_table()
-{
-	add_exact("</table>\n\n");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::begin_row(row_type rtype)
-{
-	const char *row_style;
-
-	table_cell_number =3D 0;
-	add_exact("<tr");
-	row_style =3D get_row_style(rtype);
-	if (row_style[0])
-		addf_exact(" class=3D\"%s\"", row_style);
-
-	add_exact(">\n");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::end_row()
-{
-	add_exact("</tr>\n");
-	table_row_number++;
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::begin_cell(cell_type ctype)
-{
-	const char *cell_style;
-
-	current_cell =3D ctype;
-	if (cells[ctype].is_header)
-		add_exact("\t<th");
-	else
-		add_exact("\t<td");
-
-	if (cells[ctype].width[0])
-		addf_exact(" width=3D\"%s\"", cells[ctype].width);
-
-	if (cells[ctype].colspan > 1)
-		addf_exact(" colspan=3D\"%d\"", cells[ctype].colspan);
-
-	cell_style =3D get_cell_style(ctype);
-	if (cell_style[0])
-		addf_exact(" class=3D\"%s\"", cell_style);
-
-	add_exact(">");
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::end_cell()
-{
-	if (!cells[current_cell].is_header)
-		add_exact("</td>\n");
-	else
-		add_exact("</th>\n");
-
-	table_cell_number++;
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_html::add_empty_cell()
-{
-	add_exact("&nbsp;");
-}
-
-/* ***********************************************************************=
* */
-
 void
 report_formatter_html::begin_paragraph()
 {
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index 1ad1c68..9ba3edf 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -44,20 +44,6 @@ struct html_section {
 =

 /* ***********************************************************************=
* */
 =

-struct html_table {
-	const char *width;
-};
-
-/* ***********************************************************************=
* */
-
-struct html_cell {
-	bool is_header;
-	const char *width;
-	int colspan;
-};
-
-/* ***********************************************************************=
* */
-
 class report_formatter_html: public report_formatter_string_base
 {
 public:
@@ -70,16 +56,6 @@ public:
 	void begin_section(section_type stype);
 	void end_section();
 =

-	void begin_table(table_type ttype);
-	void end_table();
-
-	void begin_row(row_type rtype);
-	void end_row();
-
-	void begin_cell(cell_type ctype);
-	void end_cell();
-	void add_empty_cell();
-
 	void begin_paragraph();
 	void end_paragraph();
 =

@@ -100,30 +76,12 @@ private:
 	/* Document structure related functions */
 	void init_markup();
 	void set_section(section_type stype, const char *id =3D "");
-	void set_table(table_type ttype, const char *width =3D "");
-	void set_cell(cell_type ctype, bool is_header =3D false,
-			const char *width =3D "", int colspan =3D 1);
-
-	/* HTML table elements CSS classes */
-	const char *get_cell_style(cell_type ctype);
-	const char *get_row_style(row_type rtype);
-	const char *get_style_pair(const char *even, const char *odd);
-	const char *get_style_quad(const char *even_even,
-				   const char *even_odd,
-				   const char *odd_even,
-				   const char *odd_odd,
-				   int alt_cell_number =3D -1);
-
 	void add_doc_header();
 	void add_doc_footer();
 =

 	string escape_string(const char *str);
 =

 	html_section sections[SECTION_MAX];
-	html_table tables[TABLE_MAX];
-	html_cell cells[CELL_MAX];
-	size_t table_row_number, table_cell_number;
-	cell_type current_cell;
 	int cpu_nr;
 };
 =

diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index 7984dc5..6d31759 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -46,16 +46,6 @@ public:
 	virtual void begin_section(section_type stype) {}
 	virtual void end_section() {}
 =

-	virtual void begin_table(table_type ttype) {}
-	virtual void end_table() {}
-
-	virtual void begin_row(row_type rtype) {}
-	virtual void end_row() {}
-
-	virtual void begin_cell(cell_type ctype) {}
-	virtual void end_cell() {}
-	virtual void add_empty_cell() {}
-
 	virtual void begin_paragraph() {}
 	virtual void end_paragraph() {}
 =

diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index 0fd133c..3de39a5 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -77,9 +77,6 @@ report_maker::clear_result()
 {
 	formatter->clear_result();
 	section_opened	 =3D false;
-	table_opened	 =3D false;
-	cell_opened	 =3D false;
-	row_opened	 =3D false;
 	paragraph_opened =3D false;
 }
 =

@@ -154,9 +151,7 @@ report_maker::add_header(const char *header, int level)
 	assert(section_opened);
 	assert(level > 0 && level < 4);
 =

-	if (table_opened)
-		end_table();
-	else if (paragraph_opened)
+	if (paragraph_opened)
 		end_paragraph();
 =

 	formatter->add_header(header, level);
@@ -183,9 +178,7 @@ report_maker::end_section()
 {
 	assert(section_opened);
 =

-	if (table_opened)
-		end_table();
-	else if (paragraph_opened)
+	if (paragraph_opened)
 		end_paragraph();
 =

 	section_opened =3D false;
@@ -195,109 +188,6 @@ report_maker::end_section()
 /* ***********************************************************************=
* */
 =

 void
-report_maker::begin_table(table_type ttype)
-{
-	assert(ttype >=3D 0 && ttype < TABLE_MAX);
-	assert(section_opened);
-
-	if (table_opened)
-		end_table(); /* Close previous */
-	else if (paragraph_opened)
-		end_paragraph();
-
-	table_opened =3D true;
-	formatter->begin_table(ttype);
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::end_table()
-{
-	assert(section_opened);
-	assert(table_opened);
-
-	if (row_opened)
-		end_row();
-
-	table_opened =3D false;
-	formatter->end_table();
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::begin_row(row_type rtype)
-{
-	assert(section_opened);
-	assert(table_opened);
-	assert(rtype >=3D 0 && rtype < ROW_MAX);
-
-	if (row_opened)
-		end_row(); /* Close previous */
-
-	row_opened =3D true;
-	formatter->begin_row(rtype);
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::end_row()
-{
-	assert(section_opened);
-	assert(table_opened);
-	assert(row_opened);
-
-	if (cell_opened)
-		end_cell();
-
-	row_opened =3D false;
-	formatter->end_row();
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::begin_cell(cell_type ctype)
-{
-	assert(section_opened);
-	assert(table_opened);
-	assert(row_opened);
-	assert(ctype >=3D 0 && ctype < CELL_MAX);
-
-	if (cell_opened)
-		end_cell(); /* Close previous */
-
-	cell_opened =3D true;
-	formatter->begin_cell(ctype);
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::end_cell()
-{
-	assert(section_opened);
-	assert(table_opened);
-	assert(row_opened);
-	assert(cell_opened);
-
-	cell_opened =3D false;
-	formatter->end_cell();
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_maker::add_empty_cell()
-{
-	formatter->add_empty_cell();
-}
-
-/* ***********************************************************************=
* */
-
-void
 report_maker::set_cpu_number(int nr)
 {
 	formatter->set_cpu_number(nr);
@@ -310,9 +200,7 @@ report_maker::begin_paragraph()
 {
 	assert(section_opened);
 =

-	if (table_opened)
-		end_table();
-	else if (paragraph_opened)
+	if (paragraph_opened)
 		end_paragraph(); /* Close previous */
 =

 	paragraph_opened =3D true;
diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index f6897cf..cfa25dd 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -184,10 +184,6 @@ public:
 =

 	void add_header(const char *header, int level =3D 2);
 	void begin_section(section_type stype =3D SECTION_DEFAULT);
-	void begin_table(table_type ttype =3D TABLE_DEFAULT);
-	void begin_row(row_type rtype =3D ROW_DEFAULT);
-	void begin_cell(cell_type ctype =3D CELL_DEFAULT);
-	void add_empty_cell();
 	void begin_paragraph();
 =

 	void set_cpu_number(int nr);
@@ -207,15 +203,11 @@ private:
 	void setup_report_formatter();
 =

 	void end_section();
-	void end_table();
-	void end_row();
-	void end_cell();
 	void end_paragraph();
 =

 	report_type type;
 	report_formatter *formatter;
-	bool cell_opened, row_opened, table_opened, section_opened,
-	     paragraph_opened;
+	bool section_opened, paragraph_opened;
 };
 =

 #endif /* _REPORT_MAKER_H_ */
-- =

1.7.9.5


--===============6532588542765884003==--

