Content-Type: multipart/mixed; boundary="===============4486642106724827184=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 08/31] report-csv: Added navigation & summary
 list
Date: Fri, 15 Nov 2013 16:28:55 -0800
Message-ID: <1384561758-21516-9-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4486642106724827184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implements csv report functionality to add navigation and summary on the
csv report.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-csv.cpp |   22 ++++++++++++++++++++--
 src/report/report-formatter-csv.h   |    6 +++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index bd9dfd3..2981940 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -189,10 +189,10 @@ report_formatter_csv::end_paragraph()
 =

 /* ***********************************************************************=
* */
 =

-std::string
+string
 report_formatter_csv::escape_string(const char *str)
 {
-	std::string res;
+	string res;
 =

 	assert(str);
 =

@@ -261,3 +261,21 @@ report_formatter_csv::add_title(struct tag_attr *title=
_att, const char *title)
 	add_exact("______________________________________________________________=
______\n");
 	addf_exact(" *  *  *   %s   *  *  *\n", title);
 }
+
+void
+report_formatter_csv::add_navigation()
+{
+	/* No nav in csv - thinking on table of contents */
+}
+
+void
+report_formatter_csv::add_summary_list(string *list, int size)
+{
+	int i;
+	add_exact("\n");
+	for (i=3D0; i < size; i+=3D2){
+		addf_exact("%s %s,", list[i].c_str(), list[i+1].c_str());
+	}
+	add_exact("\n");
+}
+
diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index 2c1c0fd..daf723e 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -42,6 +42,8 @@
 /* Whether to escape with quotes empty cell values with spaces */
 /*#define REPORT_CSV_SPACE_NEED_QUOTES*/
 =

+using namespace std;
+
 /* ***********************************************************************=
* */
 =

 class report_formatter_csv: public report_formatter_string_base
@@ -78,13 +80,15 @@ public:
 	void add_div(struct tag_attr *div_attr);
 	void end_div();
 	void add_title(struct tag_attr *title_att, const char *title);
+	void add_navigation();
+	void add_summary_list(string *list, int size);
 =

 private:
 	void add_doc_header();
 =

 	void add_quotes();
 =

-	std::string escape_string(const char *str);
+	string escape_string(const char *str);
 =

 	bool csv_need_quotes;
 	size_t table_cell_number, text_start;
-- =

1.7.9.5


--===============4486642106724827184==--

