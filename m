Content-Type: multipart/mixed; boundary="===============4589403726664675763=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 09/31] report-html: Table generation
Date: Fri, 15 Nov 2013 16:28:56 -0800
Message-ID: <1384561758-21516-10-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4589403726664675763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Generates modular html tables using table_size, css_attributes,
and a set of data. The data is stored in a single dimesional array,
using row major order.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-data-html.h        |   18 +++++++++++
 src/report/report-formatter-html.cpp |   59 ++++++++++++++++++++++++++++++=
+---
 src/report/report-formatter-html.h   |    9 ++++--
 3 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
index 70ccbdb..282d8b5 100644
--- a/src/report/report-data-html.h
+++ b/src/report/report-data-html.h
@@ -2,3 +2,21 @@ struct tag_attr {
 	const char *css_class;
 	const char *css_id;
 };
+/* T:Top, L:Left, TL:Top-Left, TLC: Top-Left-Center */
+enum position { T, L, TL, TC, TLC };
+
+struct table_attributes {
+	const char *table_class;
+	const char *td_class;
+	const char *tr_class;
+	const char *th_class;
+	position pos_table_title;
+	int title_mod;
+};
+
+
+struct table_size {
+	int rows;
+	int cols;
+};
+
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index 8038181..5920d9c 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -420,10 +420,10 @@ report_formatter_html::end_paragraph()
 =

 /* ***********************************************************************=
* */
 =

-std::string
+string
 report_formatter_html::escape_string(const char *str)
 {
-	std::string res;
+	string res;
 =

 	assert(str);
 =

@@ -486,8 +486,8 @@ report_formatter_html::end_hheader()
 void
 report_formatter_html::add_div(struct tag_attr * div_attr)
 {
-	std::string empty=3D"";
-	std::string tmp_str;
+	string empty=3D"";
+	string tmp_str;
 =

 	if (div_attr->css_class =3D=3D empty && div_attr->css_id =3D=3D empty)
 	add_exact("<div>\n");
@@ -521,7 +521,7 @@ report_formatter_html::add_navigation()
 }
 =

 void
-report_formatter_html::add_summary_list(std::string *list, int size)
+report_formatter_html::add_summary_list(string *list, int size)
 {
 	int i;
 	add_exact("<div><br/> <ul>\n");
@@ -532,3 +532,52 @@ report_formatter_html::add_summary_list(std::string *l=
ist, int size)
 	add_exact("</ul> </div> <br />\n");
 }
 =

+
+void
+report_formatter_html::add_table(string *system_data, struct table_size *s=
ize, struct table_attributes* tb_attr)
+{
+	int i, j;
+	int offset=3D0;
+	string  empty=3D"";
+
+	if (tb_attr->table_class =3D=3D empty)
+		add_exact("<table>\n");
+	else
+		addf_exact("<table class=3D\"%s\">\n", tb_attr->table_class);
+
+	for (i=3D0; i < size->rows; i++){
+		if (tb_attr->tr_class =3D=3D empty)
+			add_exact("<tr> ");
+		else
+			addf_exact("<tr class=3D\"%s\"> ", tb_attr->tr_class);
+
+		for (j=3D0; j < size->cols; j++){
+			offset =3D i * (size->cols) + j;
+
+			if (tb_attr->pos_table_title =3D=3D T &&  i=3D=3D0)
+				addf_exact("<th class=3D\"%s\"> %s </th> ",
+				tb_attr->th_class,system_data[offset].c_str());
+			else if (tb_attr->pos_table_title =3D=3D L &&  j=3D=3D0)
+				addf_exact("<th class=3D\"%s\"> %s </th> ",
+				tb_attr->th_class, system_data[offset].c_str());
+			else if (tb_attr->pos_table_title =3D=3D TL && ( i=3D=3D0 || j=3D=3D0 ))
+				addf_exact("<th class=3D\"%s\"> %s </th> ",
+				tb_attr->th_class, system_data[offset].c_str());
+			else if (tb_attr->pos_table_title =3D=3D TC && ((i % tb_attr->title_mod=
 ) =3D=3D 0))
+				addf_exact("<th class=3D\"%s\"> %s </th> ", tb_attr->th_class,
+					system_data[offset].c_str());
+			else if (tb_attr->pos_table_title =3D=3D TLC && ((i % tb_attr->title_mo=
d) =3D=3D 0 || j=3D=3D0))
+				addf_exact("<th class=3D\"%s\"> %s </th> ", tb_attr->th_class,
+				system_data[offset].c_str());
+			else
+				if ( tb_attr->td_class =3D=3D empty)
+					addf_exact("<td > %s </td> ", system_data[offset].c_str());
+				else
+					addf_exact("<td class=3D\"%s\"> %s </td> ", tb_attr->td_class,
+						system_data[offset].c_str());
+		}
+		add_exact("</tr>\n");
+	}
+	add_exact("</table>\n");
+}
+
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index 261e0dd..d625ced 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -30,6 +30,9 @@
 =

 #include "report-formatter-base.h"
 #include "report-data-html.h"
+
+using namespace std;
+
 /* Whether to replace " and ' in HTML by &quot; and &apos; respectively */
 /*#define REPORT_HTML_ESCAPE_QUOTES*/
 =

@@ -90,7 +93,9 @@ public:
 	void end_div();
 	void add_title(struct tag_attr *title_att, const char *title);
 	void add_navigation();
-	void add_summary_list(std::string *list, int size);
+	void add_summary_list(string *list, int size);
+	void add_table(string *system_data, struct table_size *size,
+			struct table_attributes *tb_attr);
 =

 private:
 	/* Document structure related functions */
@@ -113,7 +118,7 @@ private:
 	void add_doc_header();
 	void add_doc_footer();
 =

-	std::string escape_string(const char *str);
+	string escape_string(const char *str);
 =

 	html_section sections[SECTION_MAX];
 	html_table tables[TABLE_MAX];
-- =

1.7.9.5


--===============4589403726664675763==--

